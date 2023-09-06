package package_229
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_320.InfluenceWindowNotifications;
   import package_321.InfluenceWindowProxy;
   import package_38.class_581;
   import package_84.class_243;
   
   public class class_1390 extends class_243
   {
       
      
      public function class_1390()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         sendNotification(InfluenceWindowNotifications.INIT);
         var _loc2_:InfluenceWindowProxy = retrieveProxy(InfluenceWindowProxy.NAME) as InfluenceWindowProxy;
         var _loc3_:class_581 = param1.getBody() as class_581;
         _loc2_.method_4202(_loc3_.playerScore);
      }
   }
}
