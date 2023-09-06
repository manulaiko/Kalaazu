package package_207
{
   import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;
   import package_324.class_1813;
   import package_325.class_1814;
   
   public class class_1329 extends AsyncMacroCommand
   {
       
      
      public function class_1329()
      {
         super();
      }
      
      override protected function initializeAsyncMacroCommand() : void
      {
         super.initializeAsyncMacroCommand();
         addSubCommand(class_1813);
         addSubCommand(class_1814);
      }
   }
}
