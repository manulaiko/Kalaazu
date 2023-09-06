package package_191
{
   import net.bigpoint.darkorbit.gui.class_58;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import package_17.class_62;
   import package_38.class_652;
   import package_46.class_131;
   
   public class class_1161 implements class_1157
   {
      
      public static const NAME:String = "jump";
       
      
      public function class_1161()
      {
         super();
      }
      
      public function execute(param1:class_90, param2:Vector.<String>) : void
      {
         var _loc3_:class_131 = class_58.instance.method_468(GuiConstants.LOGOUT_WINDOW);
         if(_loc3_.method_2029())
         {
            return;
         }
         class_62.getInstance().sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_652());
      }
   }
}
