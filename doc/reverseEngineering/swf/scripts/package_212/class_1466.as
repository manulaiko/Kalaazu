package package_212
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_259.class_1658;
   import package_38.class_782;
   import package_84.class_243;
   
   public class class_1466 extends class_243
   {
       
      
      public function class_1466()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:class_782 = param1.getBody() as class_782;
         facade.sendNotification(class_1658.const_2389,_loc2_.var_648);
      }
   }
}
