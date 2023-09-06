package net.bigpoint.darkorbit.mvc.common.controller.assets.init
{
   import net.bigpoint.as3toolbox.filecollection.class_66;
   import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
   import net.bigpoint.darkorbit.settings.Settings;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_23.FileCollectionEvent;
   
   public class InitLocalFileCollectionCommand extends InitFileCollectionBaseCommand
   {
       
      
      public function InitLocalFileCollectionCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc3_:String = "null";
         _loc3_ = _loc3_.replace("dev","en");
         var _loc4_:* = "undefineddo_img/" + _loc3_ + "/";
         var _loc5_:class_66;
         (_loc5_ = new class_66(_loc4_,true)).addEventListener(FileCollectionEvent.RESOURCE_FILE_LOADED,this.handleResourceFileLoaded);
         _loc5_.method_2661("xml/resource_localized.xml");
         assetsProxy.addFileCollection(_loc5_,AssetsProxy.LOCALIZED);
      }
      
      private function handleResourceFileLoaded(param1:FileCollectionEvent) : void
      {
         (param1.target as class_66).removeEventListener(FileCollectionEvent.RESOURCE_FILE_LOADED,this.handleResourceFileLoaded);
         commandComplete();
      }
   }
}
