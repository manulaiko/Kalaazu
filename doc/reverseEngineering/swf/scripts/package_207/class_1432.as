package package_207
{
   import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;
   import package_324.class_1813;
   import package_325.class_1848;
   
   public class class_1432 extends AsyncMacroCommand
   {
       
      
      public function class_1432()
      {
         super();
      }
      
      override protected function initializeAsyncMacroCommand() : void
      {
         super.initializeAsyncMacroCommand();
         addSubCommand(class_1813);
         addSubCommand(class_1848);
      }
   }
}
