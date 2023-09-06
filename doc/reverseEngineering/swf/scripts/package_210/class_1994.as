package package_210
{
   import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;
   
   public class class_1994 extends AsyncMacroCommand
   {
       
      
      public function class_1994()
      {
         super();
      }
      
      override protected function initializeAsyncMacroCommand() : void
      {
         addSubCommand(class_1991);
         addSubCommand(class_2310);
      }
   }
}
