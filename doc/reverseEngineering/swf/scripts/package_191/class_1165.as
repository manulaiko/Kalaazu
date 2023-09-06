package package_191
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
   import package_17.class_62;
   import package_29.class_85;
   import package_38.class_724;
   
   public class class_1165 implements class_1157
   {
      
      public static const NAME:String = "activateRocket";
       
      
      public function class_1165()
      {
         super();
      }
      
      public function execute(param1:class_90, param2:Vector.<String>) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:class_85 = param1.method_1203().method_3338() as class_85;
         if(_loc3_ != null)
         {
            if((_loc4_ = int(_loc3_.id)) != -1)
            {
               _loc5_ = _loc3_.position;
               (_loc6_ = new class_724(_loc4_)).name_141 = _loc5_.x;
               _loc6_.name_18 = _loc5_.y;
               if((_loc6_.name_141 + _loc6_.name_18) % 3 == 0)
               {
                  ++_loc6_.name_18;
               }
               class_62.getInstance().sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,_loc6_);
            }
         }
      }
   }
}
