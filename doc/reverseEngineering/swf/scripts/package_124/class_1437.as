package package_124
{
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_43.class_121;
   
   public class class_1437 extends SimpleCommand
   {
       
      
      public function class_1437()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         class_121.instance.method_3868();
      }
   }
}
