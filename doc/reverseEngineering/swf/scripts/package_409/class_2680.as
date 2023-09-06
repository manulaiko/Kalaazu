package package_409
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_326.PlagueWindowNotifications;
   import package_327.PlagueWindowProxy;
   import package_84.class_243;
   
   public class class_2680 extends class_243
   {
       
      
      public function class_2680()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.removeProxy(PlagueWindowProxy.NAME);
         registerCommand(PlagueWindowNotifications.INIT,class_2312);
      }
   }
}
