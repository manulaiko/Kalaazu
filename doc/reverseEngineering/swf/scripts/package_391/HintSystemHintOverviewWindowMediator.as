package package_391
{
   import com.greensock.TweenLite;
   import flash.display.Sprite;
   import net.bigpoint.darkorbit.fui.system.modules.IUISetupModule;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.mvc.gui.view.GuiMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_31.class_92;
   import package_38.class_595;
   import package_38.class_672;
   import package_388.HintSystemNotifications;
   import package_392.class_2265;
   import package_449.class_2509;
   import package_450.class_2510;
   import package_46.class_131;
   import package_70.SimpleWindowEvent;
   
   public class HintSystemHintOverviewWindowMediator extends class_92
   {
      
      public static const NAME:String = "HintSystemHintOverviewWindowMediator";
       
      
      private var var_3225:IUISetupModule;
      
      public function HintSystemHintOverviewWindowMediator(param1:Object = null)
      {
         super(NAME,param1);
      }
      
      override public function onRegister() : void
      {
         setViewComponent(new class_2508());
      }
      
      override public function onRemove() : void
      {
      }
      
      override public function listNotificationInterests() : Array
      {
         return [HintSystemNotifications.const_382];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:* = null;
         super.handleNotification(param1);
         var _loc2_:String = param1.getName();
         switch(_loc2_)
         {
            case HintSystemNotifications.const_382:
               _loc3_ = param1.getBody() as Vector.<class_2265>;
               this.method_5944(_loc3_);
         }
      }
      
      protected function method_5944(param1:Vector.<class_2265>) : void
      {
         var _loc2_:GuiMediator = retrieveMediator(GuiMediator.NAME) as GuiMediator;
         var _loc3_:class_131 = _loc2_.view.guiManager.method_468(GuiConstants.HELP_WINDOW) as class_131;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:Sprite;
         (_loc4_ = _loc3_.method_3694(0) as Sprite).mouseEnabled = false;
         if(!this.method_649.isInitialized())
         {
            this.method_649.setUp();
            this.overviewWindow.build(_loc4_,this.method_649.uiStructure);
            this.overviewWindow.addEventListener(class_2510.ITEM_CLICKED,this.method_3773);
            this.method_2873(_loc3_);
            _loc3_.addEventListener(SimpleWindowEvent.const_1674,this.method_3313);
            _loc3_.addEventListener(SimpleWindowEvent.const_749,this.method_6434);
            _loc3_.addEventListener(SimpleWindowEvent.const_1979,this.method_884);
         }
         this.overviewWindow.list = param1;
      }
      
      protected function method_3313(param1:SimpleWindowEvent) : void
      {
         var _loc2_:Sprite = param1.target as Sprite;
         TweenLite.killDelayedCallsTo(this.method_2873);
         TweenLite.delayedCall(0.2,this.method_2873,[_loc2_]);
      }
      
      protected function method_6434(param1:SimpleWindowEvent) : void
      {
         this.overviewWindow.deactivate();
      }
      
      protected function method_884(param1:SimpleWindowEvent) : void
      {
         this.overviewWindow.activate();
      }
      
      private function method_2873(param1:Sprite) : void
      {
         this.overviewWindow.setSize(param1.width - 9,param1.height - 29);
      }
      
      private function method_3773(param1:class_2510) : void
      {
         var _loc2_:class_672 = new class_672();
         _loc2_.content = param1.method_6150;
         var _loc3_:class_595 = new class_595(_loc2_,false,class_595.OPEN);
         _loc3_.var_3110 = true;
         sendNotification(HintSystemNotifications.const_888,_loc3_);
      }
      
      public function get overviewWindow() : class_2508
      {
         return getViewComponent() as class_2508;
      }
      
      public function get method_649() : IUISetupModule
      {
         if(this.var_3225 == null)
         {
            this.var_3225 = new class_2509();
         }
         return this.var_3225;
      }
   }
}
