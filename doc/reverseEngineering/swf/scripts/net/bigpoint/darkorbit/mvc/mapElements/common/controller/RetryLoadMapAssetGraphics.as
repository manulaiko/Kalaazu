package net.bigpoint.darkorbit.mvc.mapElements.common.controller
{
   import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
   import net.bigpoint.darkorbit.mvc.mapElements.common.model.assetProxy.MapAssetLoaderProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import org.puremvc.as3.multicore.patterns.observer.Notification;
   
   public class RetryLoadMapAssetGraphics extends SimpleCommand
   {
       
      
      public function RetryLoadMapAssetGraphics()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:MapAssetLoaderProxy = facade.retrieveProxy(MapAssetLoaderProxy.NAME) as MapAssetLoaderProxy;
         var _loc3_:String = param1.getBody()[0];
         var _loc4_:String = param1.getBody()[1];
         var _loc5_:Notification = param1.getBody()[2];
         _loc2_.setCallBackPair(_loc5_,_loc3_);
         sendNotification(AssetNotifications.LAZY_LOAD_ASSET,[_loc3_,_loc4_,_loc2_.onComplete,_loc2_.onError]);
      }
   }
}
