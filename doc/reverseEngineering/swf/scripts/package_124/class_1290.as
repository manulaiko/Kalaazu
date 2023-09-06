package package_124
{
   import net.bigpoint.darkorbit.class_81;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_38.class_608;
   
   public class class_1290 extends SimpleCommand
   {
       
      
      public function class_1290()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_608 = param1.getBody() as class_608;
         class_81.premium.value = _loc2_.premium;
      }
   }
}
