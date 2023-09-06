package package_87
{
   import net.bigpoint.darkorbit.class_9;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
   import package_110.Version;
   
   public class class_1142 extends AsyncCommand
   {
       
      
      public function class_1142()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:Version = new Version();
         class_9.VERSION = _loc2_.method_422();
         commandComplete();
      }
   }
}
