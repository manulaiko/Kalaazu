package package_228
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.mvc.gui.model.vo.LogMessageVO;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class class_1310 extends SimpleCommand
   {
       
      
      public function class_1310()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         super.execute(param1);
         sendNotification(GuiNotifications.WRITE_TO_LOG,new LogMessageVO(class_88.getItem("log_msg_not_gather_pet_fuel")));
      }
   }
}
