package package_178
{
   import flash.utils.setTimeout;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class class_1097 extends SimpleCommand
   {
       
      
      public function class_1097()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         setTimeout(this.method_4637,1);
      }
      
      private function method_4637() : void
      {
         throw new Error("Dennis is geil. g-g-g-g-geil");
      }
   }
}
