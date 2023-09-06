package package_124
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_220.class_1270;
   import package_38.class_816;
   
   public class class_1365 extends class_1270
   {
       
      
      public function class_1365()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:class_816 = param1.getBody() as class_816;
         method_2479.method_2568(_loc2_.var_4575);
      }
   }
}
