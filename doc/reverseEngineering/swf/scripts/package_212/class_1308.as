package package_212
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_259.class_1658;
   import package_38.class_885;
   import package_84.class_243;
   
   public class class_1308 extends class_243
   {
       
      
      public function class_1308()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:class_885 = param1.getBody() as class_885;
         sendNotification(class_1658.const_3277,_loc2_.var_2014);
      }
   }
}
