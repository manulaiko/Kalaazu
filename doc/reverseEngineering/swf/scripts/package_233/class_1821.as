package package_233
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
   import package_11.class_39;
   import package_169.class_1039;
   import package_9.ResourceManager;
   
   public class class_1821 extends AsyncCommand
   {
       
      
      public function class_1821()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         ResourceManager.method_1412(class_1039.name_129,this.method_919,this.method_75);
      }
      
      protected function method_919(param1:class_39) : void
      {
         commandComplete();
      }
      
      protected function method_75(param1:class_39) : void
      {
         commandComplete();
      }
   }
}
