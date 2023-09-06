package package_205
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_38.class_884;
   import package_84.class_243;
   
   public class class_1367 extends class_243
   {
       
      
      public function class_1367()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_884 = param1.getBody() as class_884;
         method_4159.method_5721(_loc2_);
      }
   }
}
