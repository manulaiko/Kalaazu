package package_37
{
   import org.puremvc.as3.multicore.patterns.observer.Notification;
   
   public class ServerCommandNotification extends Notification
   {
      
      private static const const_939:String = "ServerCommandNotification";
       
      
      public function ServerCommandNotification(param1:ICommand)
      {
         super(ServerCommandNotification.const_939 + param1.method_1330(),param1);
      }
   }
}
