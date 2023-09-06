package package_277
{
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import net.bigpoint.darkorbit.gui.windows.class_57;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOWindow;
   import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.IResultWindowMediator;
   import net.bigpoint.darkorbit.mvc.common.view.components.resultHeader.model.StatsHeaderLableTweenVo;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   import package_152.class_990;
   import package_51.class_141;
   import package_92.TDMResultWindowNotifications;
   
   public class TDMResultWindowMediator extends Mediator implements IResultWindowMediator
   {
      
      public static const NAME:String = "TDMResultWindowMediator";
       
      
      public function TDMResultWindowMediator(param1:class_141)
      {
         super(NAME,param1);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [GuiNotifications.CLOSE_WINDOW_BY_TYPE,TDMResultWindowNotifications.SET_DATA];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         super.handleNotification(param1);
         switch(param1.getName())
         {
            case GuiNotifications.CLOSE_WINDOW_BY_TYPE:
               if(param1.getBody() as String == class_57.const_3194)
               {
                  this.method_2519();
                  break;
               }
               break;
            case TDMResultWindowNotifications.SET_DATA:
               this.view.method_1027 = param1.getBody() as class_990;
         }
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         this.view.addEventListener(DOWindow.CLOSE_WINDOW_CLICKED,this.method_2519);
      }
      
      override public function onRemove() : void
      {
         if(this.view)
         {
            sendNotification(GuiNotifications.CLOSE_WINDOW_BY_TYPE,this.view.windowType);
         }
         super.onRemove();
      }
      
      private function get view() : class_141
      {
         return viewComponent as class_141;
      }
      
      private function method_2519(param1:Event = null) : void
      {
         facade.removeMediator(getMediatorName());
      }
      
      public function set headerText(param1:String) : void
      {
         this.view.victoryLabel.headerText = param1;
      }
      
      public function setHeaderImage(param1:Bitmap) : void
      {
         this.view.setHeaderImage(param1);
      }
      
      public function setGradient(param1:Bitmap) : void
      {
         this.view.victoryLabel.gradient = param1;
      }
      
      public function set title(param1:String) : void
      {
         this.view.title = param1;
      }
      
      public function setEffectImg(param1:DisplayObject) : void
      {
         this.view.victoryLabel.effectImg = param1;
      }
      
      public function setTexture(param1:DisplayObject) : void
      {
         this.view.victoryLabel.texture = param1;
      }
      
      public function setBackground(param1:DisplayObject) : void
      {
         this.view.victoryLabel.backGround = param1;
      }
      
      public function updateWindowTweens(param1:StatsHeaderLableTweenVo) : void
      {
         this.view.victoryLabel.tweenVo = param1;
      }
   }
}
