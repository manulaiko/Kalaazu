package net.bigpoint.darkorbit.mvc.common.controller.assets.init
{
   import net.bigpoint.as3toolbox.filecollection.class_66;
   import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
   import net.bigpoint.darkorbit.settings.Settings;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_23.FileCollectionEvent;
   
   public class InitItemFileCollectionCommand extends InitFileCollectionBaseCommand
   {
       
      
      public function InitItemFileCollectionCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:String = "null";
         var _loc3_:* = _loc2_ + "do_img/global/";
         var _loc4_:class_66;
         (_loc4_ = new class_66(_loc3_,true)).addEventListener(FileCollectionEvent.RESOURCE_FILE_LOADED,this.handleLoaded);
         _loc4_.method_2661("xml/resource_items.xml");
         assetsProxy.addFileCollection(_loc4_,AssetsProxy.ITEMS);
      }
      
      private function handleLoaded(param1:FileCollectionEvent) : void
      {
         (param1.target as class_66).removeEventListener(FileCollectionEvent.RESOURCE_FILE_LOADED,this.handleLoaded);
         commandComplete();
      }
   }
}
