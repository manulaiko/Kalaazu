package org.osmf.media.pluginClasses
{
   import flash.display.DisplayObject;
   import org.osmf.elements.SWFLoader;
   import org.osmf.elements.loaderClasses.LoaderLoadTrait;
   import org.osmf.events.LoaderEvent;
   import org.osmf.events.MediaErrorEvent;
   import org.osmf.media.MediaFactory;
   import org.osmf.media.MediaResourceBase;
   import org.osmf.media.PluginInfo;
   import org.osmf.traits.LoadState;
   import org.osmf.traits.LoadTrait;
   
   class DynamicPluginLoader extends PluginLoader
   {
      
      private static const PLUGININFO_PROPERTY_NAME:String = "pluginInfo";
       
      
      function DynamicPluginLoader(param1:MediaFactory, param2:String)
      {
         super(param1,param2);
      }
      
      override public function canHandleResource(param1:MediaResourceBase) : Boolean
      {
         return new SWFLoader().canHandleResource(param1);
      }
      
      override protected function executeLoad(param1:LoadTrait) : void
      {
         var swfLoader:SWFLoader = null;
         var loaderLoadTrait:LoaderLoadTrait = null;
         var onSWFLoaderStateChange:Function = null;
         var name_14:Function = null;
         var loadTrait:LoadTrait = param1;
         onSWFLoaderStateChange = function(param1:LoaderEvent):void
         {
            var _loc2_:* = null;
            var _loc3_:* = null;
            if(param1.newState == LoadState.READY)
            {
               swfLoader.removeEventListener(LoaderEvent.LOAD_STATE_CHANGE,onSWFLoaderStateChange);
               loaderLoadTrait.removeEventListener(MediaErrorEvent.MEDIA_ERROR,name_14);
               _loc2_ = loaderLoadTrait.loader.content;
               _loc3_ = _loc2_[PLUGININFO_PROPERTY_NAME] as PluginInfo;
               loadFromPluginInfo(loadTrait,_loc3_,loaderLoadTrait.loader);
            }
            else if(param1.newState == LoadState.LOAD_ERROR)
            {
               swfLoader.removeEventListener(LoaderEvent.LOAD_STATE_CHANGE,onSWFLoaderStateChange);
               updateLoadTrait(loadTrait,param1.newState);
            }
         };
         name_14 = function(param1:MediaErrorEvent):void
         {
            loaderLoadTrait.removeEventListener(MediaErrorEvent.MEDIA_ERROR,name_14);
            loadTrait.dispatchEvent(param1.clone());
         };
         updateLoadTrait(loadTrait,LoadState.LOADING);
         swfLoader = new SWFLoader(true);
         swfLoader.validateLoadedContentFunction = this.validateLoadedContent;
         swfLoader.addEventListener(LoaderEvent.LOAD_STATE_CHANGE,onSWFLoaderStateChange);
         loaderLoadTrait = new LoaderLoadTrait(swfLoader,loadTrait.resource);
         loaderLoadTrait.addEventListener(MediaErrorEvent.MEDIA_ERROR,name_14);
         swfLoader.load(loaderLoadTrait);
      }
      
      override protected function executeUnload(param1:LoadTrait) : void
      {
         updateLoadTrait(param1,LoadState.UNLOADING);
         var _loc2_:PluginLoadTrait = param1 as PluginLoadTrait;
         unloadFromPluginInfo(_loc2_.pluginInfo);
         _loc2_.loader.unloadAndStop();
         updateLoadTrait(param1,LoadState.UNINITIALIZED);
      }
      
      private function validateLoadedContent(param1:DisplayObject) : Boolean
      {
         var _loc2_:Object = param1.hasOwnProperty(PLUGININFO_PROPERTY_NAME) ? param1[PLUGININFO_PROPERTY_NAME] : null;
         return _loc2_ != null ? isPluginCompatible(_loc2_) : false;
      }
   }
}
