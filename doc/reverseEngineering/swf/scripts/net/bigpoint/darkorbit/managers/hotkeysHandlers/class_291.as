package net.bigpoint.darkorbit.managers.hotkeysHandlers
{
   import flash.events.KeyboardEvent;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.mvc.gui.model.vo.LogMessageVO;
   import package_106.class_290;
   import package_17.class_62;
   import package_38.class_390;
   
   public class class_291 extends class_290
   {
      
      public static const instance:class_291 = new class_291();
      
      private static var var_3205:int = 0;
       
      
      private const const_350:String = "iwantrainbows";
      
      public function class_291()
      {
         super();
      }
      
      override public function method_1553(param1:KeyboardEvent) : void
      {
         if(String.fromCharCode(param1.charCode) == "iwantrainbows".charAt(var_3205))
         {
            ++var_3205;
            if(var_3205 == 13)
            {
               name_20.sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_390(class_390.const_385));
               class_62.getInstance().sendNotification(GuiNotifications.WRITE_TO_LOG,new LogMessageVO(class_88.getItem("msg_easter_egg_found")));
               var_3205 = 0;
            }
         }
         else
         {
            var_3205 = 0;
         }
      }
   }
}
