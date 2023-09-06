package package_86
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_259.class_1658;
   import package_260.class_1660;
   
   public class class_1959 extends class_245
   {
       
      
      public function class_1959()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_1660 = param1.getBody() as class_1660;
         method_435.method_789(_loc2_);
         sendNotification(class_1658.CREATE_WINDOW);
      }
   }
}
