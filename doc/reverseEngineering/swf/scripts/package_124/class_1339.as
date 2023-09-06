package package_124
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_327.PlagueWindowProxy;
   import package_38.class_856;
   import package_84.class_243;
   
   public class class_1339 extends class_243
   {
       
      
      public function class_1339()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_856 = param1.getBody() as class_856;
         var _loc3_:PlagueWindowProxy = facade.retrieveProxy(PlagueWindowProxy.NAME) as PlagueWindowProxy;
         _loc3_.method_2659(new <class_856>[_loc2_]);
      }
   }
}
