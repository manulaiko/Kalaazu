package package_410
{
   import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;
   
   public class class_2313 extends AsyncMacroCommand
   {
       
      
      public function class_2313()
      {
         super();
      }
      
      override protected function initializeAsyncMacroCommand() : void
      {
         addSubCommand(class_2546);
         addSubCommand(class_2547);
      }
   }
}
