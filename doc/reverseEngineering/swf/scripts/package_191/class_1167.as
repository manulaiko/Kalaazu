package package_191
{
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
   import net.bigpoint.darkorbit.net.class_113;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_17.class_62;
   
   public class class_1167 implements class_1157
   {
      
      public static const NAME:String = "changeConfing";
       
      
      public function class_1167()
      {
         super();
      }
      
      public function execute(param1:class_90, param2:Vector.<String>) : void
      {
         var _loc3_:int = 0;
         if(_loc3_ == 1)
         {
            _loc3_ = 2;
         }
         else if(_loc3_ == 2)
         {
            _loc3_ = 1;
         }
         class_62.getInstance().sendNotification(ConnectionNotifications.SEND_COMMAND,[class_113.SELECT,[class_113.const_1193,_loc3_.toString(),class_81.userID.toString(),class_81.sessionID.toString()]]);
      }
   }
}
