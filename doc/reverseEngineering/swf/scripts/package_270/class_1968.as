package package_270
{
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_133.class_383;
   import package_29.class_85;
   import package_35.class_338;
   import package_75.class_379;
   import package_84.class_243;
   
   public class class_1968 extends class_243
   {
       
      
      public function class_1968()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:class_383 = param1.getBody() as class_383;
         var _loc3_:Vector.<class_85> = map.method_1792;
         for each(_loc5_ in _loc3_)
         {
            if(_loc4_ = _loc5_ as class_86)
            {
               if(Boolean(_loc2_.isActive) && _loc4_.info.factionID.value == _loc2_.method_3098)
               {
                  map.effects.method_5565(new class_379(_loc4_));
               }
               else
               {
                  map.effects.method_3217(_loc4_.id,class_338.const_25);
               }
            }
         }
      }
   }
}
