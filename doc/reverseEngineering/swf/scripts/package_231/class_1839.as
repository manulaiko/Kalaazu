package package_231
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_328.JackpotBattleNotification;
   
   public class class_1839 extends SimpleCommand
   {
       
      
      public function class_1839()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         if(!facade.hasCommand(JackpotBattleNotification.START_UP))
         {
            facade.registerCommand(JackpotBattleNotification.START_UP,class_2277);
         }
         if(!facade.hasCommand(JackpotBattleNotification.CLEAN_UP))
         {
            facade.registerCommand(JackpotBattleNotification.CLEAN_UP,class_2276);
         }
      }
   }
}
