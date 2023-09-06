package net.bigpoint.darkorbit.mvc.mapElements.common.controller
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_29.class_85;
   import package_84.class_243;
   
   public class MapAssetAttackCommand extends class_243
   {
       
      
      public function MapAssetAttackCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc3_:int = 0;
         super.execute(param1);
         var _loc2_:class_85 = map.method_4929.target;
         if(_loc2_)
         {
            _loc3_ = int(_loc2_.id);
            if(_loc3_ != -1)
            {
               method_1772.method_6517(_loc3_);
            }
         }
      }
   }
}
