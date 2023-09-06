package package_353
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_317.DominationNotificationNames;
   import package_320.InfluenceWindowNotifications;
   import package_326.PlagueWindowNotifications;
   import package_408.class_2311;
   import package_409.class_2312;
   import package_410.class_2313;
   import package_84.class_243;
   
   public class class_1996 extends class_243
   {
       
      
      public function class_1996()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         registerCommand(InfluenceWindowNotifications.INIT,class_2311);
         registerCommand(PlagueWindowNotifications.INIT,class_2312);
         registerCommand(DominationNotificationNames.INIT,class_2313);
      }
   }
}
