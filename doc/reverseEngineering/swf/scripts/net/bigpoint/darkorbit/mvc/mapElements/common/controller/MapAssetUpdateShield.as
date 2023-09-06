package net.bigpoint.darkorbit.mvc.mapElements.common.controller
{
   import net.bigpoint.darkorbit.map.model.traits.class_308;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_84.class_243;
   
   public class MapAssetUpdateShield extends class_243
   {
       
      
      public function MapAssetUpdateShield()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:int = int(param1.getBody()[0]);
         var _loc3_:class_308 = map.method_5806(_loc2_,class_308) as class_308;
         if(_loc3_)
         {
            _loc3_.shield.value = param1.getBody()[1];
            _loc3_.maxShield.value = param1.getBody()[2];
         }
      }
   }
}
