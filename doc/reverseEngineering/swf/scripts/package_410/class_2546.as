package package_410
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_318.class_1796;
   
   public class class_2546 extends SimpleCommand
   {
       
      
      public function class_2546()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new class_1796());
      }
   }
}
