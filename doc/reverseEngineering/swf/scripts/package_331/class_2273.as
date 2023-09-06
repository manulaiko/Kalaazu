package package_331
{
   import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;
   
   public class class_2273 extends AsyncMacroCommand
   {
       
      
      public function class_2273()
      {
         super();
      }
      
      override protected function initializeAsyncMacroCommand() : void
      {
         addSubCommand(class_2519);
         addSubCommand(class_2518);
      }
   }
}
