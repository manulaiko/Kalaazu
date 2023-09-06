package package_91
{
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.mvc.gui.model.GuiProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.AsyncCommand;
   import package_261.TDMStatusUiMediator;
   import package_262.class_1665;
   import package_263.TDMStatusProxy;
   import package_263.class_1666;
   import package_46.class_131;
   
   public class class_1118 extends AsyncCommand
   {
       
      
      public function class_1118()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         super.execute(param1);
         var _loc2_:TDMStatusUiMediator = facade.retrieveMediator(TDMStatusUiMediator.NAME) as TDMStatusUiMediator;
         if(!_loc2_)
         {
            if(!(_loc5_ = (_loc4_ = facade.retrieveProxy(GuiProxy.NAME) as GuiProxy).getWindowById(GuiConstants.TDM_STATUS_UI_WINDOW)))
            {
               sendNotification(GuiNotifications.CREATE_WINDOW,GuiConstants.TDM_STATUS_UI_WINDOW);
               _loc5_ = _loc4_.getWindowById(GuiConstants.TDM_STATUS_UI_WINDOW);
            }
            _loc5_.maximize();
            _loc2_ = new TDMStatusUiMediator(new class_1665(_loc5_));
            facade.registerMediator(_loc2_);
         }
         var _loc3_:TDMStatusProxy = facade.retrieveProxy(TDMStatusProxy.NAME) as TDMStatusProxy;
         if(!_loc3_)
         {
            _loc6_ = new class_1666();
            facade.registerProxy(new TDMStatusProxy(_loc6_));
         }
         commandComplete();
      }
   }
}
