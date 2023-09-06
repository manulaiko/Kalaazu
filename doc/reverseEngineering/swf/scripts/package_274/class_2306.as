package package_274
{
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import org.puremvc.as3.multicore.interfaces.ICommand;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   import package_135.class_391;
   import package_267.SectorControlProxy;
   import package_351.SectorControlUiMediator;
   
   public class class_2306 extends SimpleCommand implements ICommand
   {
       
      
      public function class_2306()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.sendNotification(GuiNotifications.CLOSE_WINDOW_BY_ID,GuiConstants.SECTOR_CONTROL_WINDOW);
         facade.sendNotification(class_391.const_1421,null);
         (facade.retrieveProxy(SectorControlProxy.NAME) as SectorControlProxy).reset();
         facade.removeMediator(SectorControlUiMediator.NAME);
      }
   }
}
