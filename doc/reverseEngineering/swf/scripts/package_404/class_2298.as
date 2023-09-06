package package_404
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_406.SettingsWindowFUIProxy;
   import package_84.class_243;
   
   public class class_2298 extends class_243
   {
       
      
      public function class_2298()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         this.method_959.method_1536(param1.getBody() as int);
      }
      
      private function get method_959() : SettingsWindowFUIProxy
      {
         return facade.retrieveProxy(SettingsWindowFUIProxy.NAME) as SettingsWindowFUIProxy;
      }
   }
}
