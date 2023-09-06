package package_45
{
   import com.bigpoint.utils.class_1469;
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
   import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;
   import package_100.class_270;
   import package_17.class_62;
   import package_19.class_68;
   import package_19.class_70;
   import package_29.class_85;
   import package_38.class_652;
   
   public class class_366 extends class_85
   {
      
      public static const const_946:int = 14;
      
      public static const const_2703:int = 15;
      
      public static const const_77:int = 72;
       
      
      public const const_381:class_68 = new class_70(Number);
      
      public const text:class_1469 = new class_1469();
      
      private var var_4485:int;
      
      public function class_366(param1:int, param2:class_73, param3:int, param4:Boolean = true, param5:Boolean = true)
      {
         super(param1,param2);
         this.var_4485 = param3;
         UberAssetsLib.instance.fillTraits(this,param3.toString(),UberAssetsLib.LIB_PORTALS,param4 ? this.method_1071 : null);
         if(!param5)
         {
            method_2049(class_270);
         }
      }
      
      public function get name_164() : int
      {
         return this.var_4485;
      }
      
      public function jump(param1:Number = 0) : void
      {
         this.const_381.dispatch(param1);
      }
      
      private function method_1071() : void
      {
         class_62.getInstance().sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_652());
      }
   }
}
