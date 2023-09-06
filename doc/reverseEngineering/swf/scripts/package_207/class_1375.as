package package_207
{
   import org.puremvc.as3.multicore.patterns.command.AsyncMacroCommand;
   import package_324.class_1813;
   import package_324.class_1836;
   import package_331.class_1837;
   
   public class class_1375 extends AsyncMacroCommand
   {
       
      
      public function class_1375()
      {
         super();
      }
      
      override protected function initializeAsyncMacroCommand() : void
      {
         super.initializeAsyncMacroCommand();
         addSubCommand(class_1813);
         addSubCommand(class_1836);
         addSubCommand(class_1837);
      }
   }
}
