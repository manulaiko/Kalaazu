package package_94
{
   import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;
   
   public class class_254 extends AsyncMacroCommand
   {
       
      
      public function class_254()
      {
         super();
      }
      
      override protected function initializeAsyncMacroCommand() : void
      {
         super.initializeAsyncMacroCommand();
         addSubCommand(class_1125);
         addSubCommand(class_1124);
      }
   }
}
