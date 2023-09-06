package package_9
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.mvc.gui.model.vo.LogMessageVO;
   import package_17.class_62;
   import package_37.class_363;
   import package_38.class_390;
   import package_38.class_641;
   
   public class class_302
   {
      
      private static var _instance:class_302 = null;
       
      
      private var var_4175:Boolean = false;
      
      private var var_2222:Boolean = false;
      
      private var var_4082:Boolean = false;
      
      private var var_2926:Boolean = false;
      
      public function class_302()
      {
         super();
      }
      
      public static function getInstance() : class_302
      {
         if(_instance == null)
         {
            _instance = new class_302();
         }
         return _instance;
      }
      
      public function method_6002(param1:class_73, param2:class_90) : void
      {
         if(param1.x < Number(param2.method_5076) * 0.1 && param1.y < Number(param2.method_1901) * 0.1)
         {
            this.var_4175 = true;
         }
         else if(param1.x < Number(param2.method_5076) * 0.1 && param1.y > Number(param2.method_1901) * 0.9)
         {
            this.var_4082 = true;
         }
         else if(param1.x > Number(param2.method_5076) * 0.9 && param1.y > Number(param2.method_1901) * 0.9)
         {
            this.var_2926 = true;
         }
         else if(param1.x > Number(param2.method_5076) * 0.9 && param1.y < Number(param2.method_1901) * 0.1)
         {
            this.var_2222 = true;
         }
         else
         {
            this.reset();
         }
         if(Boolean(this.var_4175) && Boolean(this.var_2222) && Boolean(this.var_4082) && Boolean(this.var_2926))
         {
            class_62.getInstance().sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_390(class_390.const_1478));
            class_62.getInstance().sendNotification(GuiNotifications.WRITE_TO_LOG,new LogMessageVO(class_88.getItem("msg_easter_egg_found")));
            class_363.execute(new class_641(Number(param2.method_5076) * 0.3,Number(param2.method_1901) * 0.2));
            class_363.execute(new class_641(Number(param2.method_5076) * 0.7,Number(param2.method_1901) * 0.2));
            class_363.execute(new class_641(Number(param2.method_5076) * 0.5,Number(param2.method_1901) * 0.4));
            class_363.execute(new class_641(Number(param2.method_5076) * 0.5,Number(param2.method_1901) * 0.5));
            class_363.execute(new class_641(Number(param2.method_5076) * 0.5,Number(param2.method_1901) * 0.6));
            class_363.execute(new class_641(Number(param2.method_5076) * 0.2,Number(param2.method_1901) * 0.6));
            class_363.execute(new class_641(Number(param2.method_5076) * 0.3,Number(param2.method_1901) * 0.7));
            class_363.execute(new class_641(Number(param2.method_5076) * 0.4,Number(param2.method_1901) * 0.8));
            class_363.execute(new class_641(Number(param2.method_5076) * 0.5,Number(param2.method_1901) * 0.8));
            class_363.execute(new class_641(Number(param2.method_5076) * 0.6,Number(param2.method_1901) * 0.8));
            class_363.execute(new class_641(Number(param2.method_5076) * 0.7,Number(param2.method_1901) * 0.7));
            class_363.execute(new class_641(Number(param2.method_5076) * 0.8,Number(param2.method_1901) * 0.6));
            this.reset();
         }
      }
      
      private function reset() : void
      {
         this.var_4175 = false;
         this.var_2222 = false;
         this.var_4082 = false;
         this.var_2926 = false;
      }
   }
}
