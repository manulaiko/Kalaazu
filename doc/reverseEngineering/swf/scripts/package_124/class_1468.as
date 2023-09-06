package package_124
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_220.class_1270;
   import package_38.class_953;
   
   public class class_1468 extends class_1270
   {
       
      
      public function class_1468()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_953 = param1.getBody() as class_953;
         method_2479.method_6350(_loc2_.var_3814,_loc2_.var_5058,_loc2_.reason);
      }
   }
}
