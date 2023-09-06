package package_221
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_220.class_1270;
   import package_38.class_515;
   
   public class class_1347 extends class_1270
   {
       
      
      public function class_1347()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_515 = param1.getBody() as class_515;
         method_2479.method_6470(_loc2_.var_2241,_loc2_.reason);
      }
   }
}
