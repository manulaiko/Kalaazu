package package_212
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_259.class_1658;
   import package_260.class_1659;
   import package_260.class_1660;
   import package_260.class_1661;
   import package_38.class_755;
   
   public class class_1408 extends class_1240
   {
       
      
      public function class_1408()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:class_755 = param1.getBody() as class_755;
         var _loc3_:Vector.<class_1659> = method_4097(_loc2_.var_4859.contacts);
         sendNotification(class_1658.const_2827,new class_1660(_loc3_));
         sendNotification(class_1658.const_18,new class_1661(_loc2_.var_732.var_1258,_loc2_.var_732.var_1684,_loc2_.var_732.showRequests,_loc2_.var_732.var_1401));
         sendNotification(class_1658.const_3277,_loc2_.var_3562.var_2014);
      }
      
      override protected function method_262() : void
      {
      }
   }
}
