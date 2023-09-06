package package_91
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_83.TDMStatusNotification;
   
   public class class_1120 extends SimpleCommand
   {
       
      
      public function class_1120()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         facade.removeCommand(TDMStatusNotification.UPDATE);
         facade.registerCommand(TDMStatusNotification.UPDATE,class_1121);
         facade.registerCommand(TDMStatusNotification.CLEANUP,class_1667);
      }
   }
}
