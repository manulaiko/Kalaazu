package package_229
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_320.InfluenceWindowNotifications;
   import package_321.InfluenceWindowProxy;
   import package_38.class_491;
   import package_84.class_243;
   
   public class class_1320 extends class_243
   {
       
      
      public function class_1320()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         sendNotification(InfluenceWindowNotifications.INIT);
         var _loc2_:class_491 = param1.getBody() as class_491;
         var _loc3_:InfluenceWindowProxy = retrieveProxy(InfluenceWindowProxy.NAME) as InfluenceWindowProxy;
         _loc3_.method_4461(_loc2_.name_107,_loc2_.name_139,_loc2_.name_27);
      }
   }
}
