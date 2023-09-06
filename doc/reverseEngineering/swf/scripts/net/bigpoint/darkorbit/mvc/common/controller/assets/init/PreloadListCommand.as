package net.bigpoint.darkorbit.mvc.common.controller.assets.init
{
   import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_22.class_198;
   import package_84.class_243;
   
   public class PreloadListCommand extends class_243
   {
       
      
      public function PreloadListCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         super.execute(param1);
         switch(param1.getType())
         {
            case AssetNotifications.TYPE_PRELOAD_LIST_TYPE_PATTERN_KEY:
               _loc2_ = class_198.method_3347(param1.getBody() as String);
               break;
            default:
               _loc2_ = param1.getBody() as Vector.<String>;
         }
         if(_loc2_)
         {
            _loc3_ = _loc2_.length;
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               assetsProxy.addToPreloadList(_loc2_[_loc4_]);
               _loc4_++;
            }
         }
      }
   }
}
