package package_207
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_311.TeamDeathMatchPopupNotifications;
   import package_38.class_661;
   
   public class class_1227 extends SimpleCommand
   {
       
      
      public function class_1227()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:class_661 = param1.getBody() as class_661;
         var _loc3_:int = int(_loc2_.seconds);
         sendNotification(TeamDeathMatchPopupNotifications.const_1063,_loc3_);
      }
   }
}
