package net.bigpoint.darkorbit.mvc.common.controller.assets.init
{
   import net.bigpoint.as3toolbox.filecollection.class_66;
   import net.bigpoint.darkorbit.class_9;
   import net.bigpoint.darkorbit.mvc.common.controller.finisher.FLVFinisher;
   import net.bigpoint.darkorbit.settings.Settings;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_11.class_65;
   import package_13.class_51;
   import package_23.FileCollectionEvent;
   import package_9.ResourceManager;
   
   public class InitGameFileCollectionCommand extends InitFileCollectionBaseCommand
   {
       
      
      public function InitGameFileCollectionCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:String = "xml/resources.xml?__cv=undefined";
         var _loc3_:String = "NaN";
         if(class_51(param1.getBody()).flashVars.resourcesPath != undefined)
         {
            _loc3_ = class_51(param1.getBody()).flashVars.resourcesPath;
            _loc2_ = "xml/resources.xml";
         }
         var _loc4_:class_66;
         (_loc4_ = new class_66(_loc3_,true)).method_1951("flv",FLVFinisher);
         _loc4_.method_1951("jxr",class_65);
         _loc4_.addEventListener(FileCollectionEvent.RESOURCE_FILE_LOADED,this.handlegameFileCollectionLoaded);
         _loc4_.hashFilesList = this.getHhashFilesList();
         _loc4_.method_2661(_loc2_);
         ResourceManager.init(_loc4_);
         assetsProxy.addFileCollection(_loc4_);
      }
      
      private function getHhashFilesList() : Vector.<String>
      {
         var _loc3_:* = null;
         var _loc1_:Vector.<String> = new Vector.<String>();
         var _loc2_:XMLList = class_9.var_2751.hashFilesList.resource;
         for each(_loc3_ in _loc2_)
         {
            _loc1_.push(_loc3_.@resKey);
         }
         return _loc1_;
      }
      
      private function handlegameFileCollectionLoaded(param1:FileCollectionEvent) : void
      {
         (param1.target as class_66).removeEventListener(FileCollectionEvent.RESOURCE_FILE_LOADED,this.handlegameFileCollectionLoaded);
         commandComplete();
      }
   }
}
