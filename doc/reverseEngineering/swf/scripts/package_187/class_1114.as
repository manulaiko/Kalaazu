package package_187
{
   import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;
   
   public class class_1114 extends AsyncMacroCommand
   {
       
      
      public function class_1114()
      {
         super();
      }
      
      override protected function initializeAsyncMacroCommand() : void
      {
         addSubCommand(class_1663);
         addSubCommand(class_1662);
         addSubCommand(class_1664);
      }
   }
}
