package org.osmf.media.pluginClasses
{
   import flash.display.Loader;
   import org.osmf.events.MediaError;
   import org.osmf.events.MediaErrorCodes;
   import org.osmf.events.MediaErrorEvent;
   import org.osmf.media.MediaFactory;
   import org.osmf.media.MediaFactoryItem;
   import org.osmf.media.PluginInfo;
   import org.osmf.traits.LoadState;
   import org.osmf.traits.LoadTrait;
   import org.osmf.traits.LoaderBase;
   import org.osmf.utils.Version;
   
   class PluginLoader extends LoaderBase
   {
      
      private static const FRAMEWORK_VERSION_PROPERTY_NAME:String = "frameworkVersion";
      
      private static const IS_FRAMEWORK_VERSION_SUPPORTED_PROPERTY_NAME:String = "isFrameworkVersionSupported";
       
      
      private var minimumSupportedFrameworkVersion:String;
      
      private var mediaFactory:MediaFactory;
      
      function PluginLoader(param1:MediaFactory, param2:String)
      {
         super();
         this.mediaFactory = param1;
         this.minimumSupportedFrameworkVersion = param2;
      }
      
      protected function unloadFromPluginInfo(param1:PluginInfo) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 != null)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.numMediaFactoryItems)
            {
               _loc3_ = param1.getMediaFactoryItemAt(_loc2_);
               if((_loc4_ = this.mediaFactory.getItemById(_loc3_.id)) != null)
               {
                  this.mediaFactory.removeItem(_loc4_);
               }
               _loc2_++;
            }
         }
      }
      
      protected function loadFromPluginInfo(param1:LoadTrait, param2:PluginInfo, param3:Loader = null) : void
      {
         var passedMediaFactory:MediaFactory = null;
         var var_1:int = 0;
         var pluginLoadTrait:PluginLoadTrait = null;
         var item:MediaFactoryItem = null;
         var loadTrait:LoadTrait = param1;
         var pluginInfo:PluginInfo = param2;
         var var_338:Loader = param3;
         var invalidImplementation:Boolean = false;
         if(pluginInfo != null)
         {
            if(this.isPluginCompatible(pluginInfo))
            {
               try
               {
                  passedMediaFactory = loadTrait.resource.getMetadataValue(PluginInfo.PLUGIN_MEDIAFACTORY_NAMESPACE) as MediaFactory;
                  if(passedMediaFactory == null)
                  {
                     loadTrait.resource.addMetadataValue(PluginInfo.PLUGIN_MEDIAFACTORY_NAMESPACE,this.mediaFactory);
                  }
                  pluginInfo.initializePlugin(loadTrait.resource);
                  var_1 = 0;
                  while(var_1 < pluginInfo.numMediaFactoryItems)
                  {
                     item = pluginInfo.getMediaFactoryItemAt(var_1);
                     if(item == null)
                     {
                        throw new RangeError();
                     }
                     this.mediaFactory.addItem(item);
                     var_1++;
                  }
                  pluginLoadTrait = loadTrait as PluginLoadTrait;
                  pluginLoadTrait.pluginInfo = pluginInfo;
                  pluginLoadTrait.loader = var_338;
                  updateLoadTrait(pluginLoadTrait,LoadState.READY);
               }
               catch(error:RangeError)
               {
                  invalidImplementation = true;
               }
            }
            else
            {
               updateLoadTrait(loadTrait,LoadState.LOAD_ERROR);
               loadTrait.dispatchEvent(new MediaErrorEvent(MediaErrorEvent.MEDIA_ERROR,false,false,new MediaError(MediaErrorCodes.PLUGIN_VERSION_INVALID)));
            }
         }
         else
         {
            invalidImplementation = true;
         }
         if(invalidImplementation)
         {
            updateLoadTrait(loadTrait,LoadState.LOAD_ERROR);
            loadTrait.dispatchEvent(new MediaErrorEvent(MediaErrorEvent.MEDIA_ERROR,false,false,new MediaError(MediaErrorCodes.PLUGIN_IMPLEMENTATION_INVALID)));
         }
      }
      
      protected function isPluginCompatible(param1:Object) : Boolean
      {
         var versionSupportedFunction:Function = null;
         var pluginInfo:Object = param1;
         var isCompatible:Boolean = false;
         var version:String = pluginInfo.hasOwnProperty(FRAMEWORK_VERSION_PROPERTY_NAME) ? pluginInfo[FRAMEWORK_VERSION_PROPERTY_NAME] : null;
         var isSupported:Boolean = this.isPluginVersionSupported(version);
         if(isSupported)
         {
            versionSupportedFunction = pluginInfo.hasOwnProperty(IS_FRAMEWORK_VERSION_SUPPORTED_PROPERTY_NAME) ? pluginInfo[IS_FRAMEWORK_VERSION_SUPPORTED_PROPERTY_NAME] as Function : null;
            if(versionSupportedFunction != null)
            {
               try
               {
                  isCompatible = versionSupportedFunction(Version.version);
               }
               catch(error:Error)
               {
               }
            }
         }
         return isCompatible;
      }
      
      private function isPluginVersionSupported(param1:String) : Boolean
      {
         if(param1 == null || param1.length == 0)
         {
            return false;
         }
         var _loc2_:Object = VersionUtils.parseVersionString(this.minimumSupportedFrameworkVersion);
         var _loc3_:Object = VersionUtils.parseVersionString(param1);
         return _loc3_.major > _loc2_.major || _loc3_.major == _loc2_.major && _loc3_.minor >= _loc2_.minor;
      }
   }
}
