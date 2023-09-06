package package_329
{
   import net.bigpoint.darkorbit.gui.class_58;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_65.class_236;
   
   public class class_1974 extends SimpleCommand
   {
       
      
      public function class_1974()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         var _loc2_:class_236 = param1.getBody() as class_236;
         class_58.instance.method_636(_loc2_.id,true);
      }
   }
}
