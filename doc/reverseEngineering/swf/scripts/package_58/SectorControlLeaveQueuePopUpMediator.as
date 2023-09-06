package package_58
{
   import flash.events.Event;
   import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.mvc.sectorControlWindow.SectorControlWindowNotifications;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   import package_38.class_938;
   
   public class SectorControlLeaveQueuePopUpMediator extends Mediator
   {
      
      public static const NAME:String = "SectorControlLeaveQueuePopUpMediator";
       
      
      private var var_4948:uint;
      
      public function SectorControlLeaveQueuePopUpMediator(param1:Object = null)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         sendNotification(SectorControlWindowNotifications.SET_UI_INTERACTIVITY,false);
         this.popUp.addEventListener(DOWindow.CLOSE_WINDOW_CLICKED,this.method_234);
         this.popUp.addEventListener(SectorControlLeaveQueuePopUp.EVENT_EXIT_QUEUE_CONFIRMATION,this.method_311);
         this.popUp.addEventListener(SectorControlLeaveQueuePopUp.EVENT_EXIT_QUEUE_CANCEL,this.handleCancelButtonClicked);
      }
      
      private function method_234(param1:Event) : void
      {
         facade.removeMediator(getMediatorName());
      }
      
      private function method_311(param1:Event) : void
      {
         sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_938(this.var_4948));
         facade.removeMediator(getMediatorName());
      }
      
      override public function onRemove() : void
      {
         this.popUp.removeEventListener(DOWindow.CLOSE_WINDOW_CLICKED,this.method_234);
         this.popUp.removeEventListener(SectorControlLeaveQueuePopUp.EVENT_EXIT_QUEUE_CONFIRMATION,this.method_311);
         this.popUp.removeEventListener(SectorControlLeaveQueuePopUp.EVENT_EXIT_QUEUE_CANCEL,this.handleCancelButtonClicked);
         sendNotification(GuiNotifications.CLOSE_WINDOW_BY_TYPE,this.popUp.windowType);
         sendNotification(SectorControlWindowNotifications.SET_UI_INTERACTIVITY,true);
      }
      
      private function handleCancelButtonClicked(param1:Event) : void
      {
         facade.removeMediator(getMediatorName());
      }
      
      protected function get popUp() : SectorControlLeaveQueuePopUp
      {
         return viewComponent as SectorControlLeaveQueuePopUp;
      }
      
      public function set matchID(param1:uint) : void
      {
         this.var_4948 = param1;
      }
   }
}
