package package_91
{
   import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;
   
   public class class_251 extends AsyncMacroCommand
   {
       
      
      public function class_251()
      {
         super();
      }
      
      override protected function initializeAsyncMacroCommand() : void
      {
         super.initializeAsyncMacroCommand();
         addSubCommand(class_1119);
         addSubCommand(class_1118);
         addSubCommand(class_1121);
         addSubCommand(class_1120);
      }
   }
}
