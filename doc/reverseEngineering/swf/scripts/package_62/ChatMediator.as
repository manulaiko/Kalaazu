package package_62
{
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.mvc.gui.interfaces.IWindow;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_170.class_1040;
   import package_30.class_91;
   import package_31.class_92;
   import package_33.class_93;
   import package_46.class_131;
   import package_63.ChatNotifications;
   import package_70.SimpleWindowEvent;
   import package_9.class_50;
   
   public class ChatMediator extends class_92
   {
      
      public static const NAME:String = "ChatMediator";
      
      public static const const_801:String = "leaveGroupRoom";
      
      public static const const_2685:String = "initChatSecure";
      
      public static const const_2314:String = "setSize";
      
      public static const const_887:String = "resizeDimension";
      
      public static const const_1762:String = "getChat";
      
      public static const const_1646:String = "getTextInput";
       
      
      private var var_3423:Boolean;
      
      private var var_253:IWindow;
      
      public function ChatMediator(param1:Object)
      {
         super(NAME,param1);
         this.method_3177(null);
      }
      
      public function method_3233() : void
      {
         if(Boolean(this.method_1106) && Boolean(this.method_1106["focusManager"]))
         {
            this.method_1106["focusManager"]["deactivate"]();
            this.method_1106.addEventListener(FocusEvent.FOCUS_IN,this.method_5528);
            this.method_1106.addEventListener(FocusEvent.FOCUS_OUT,this.method_3068);
            Object(this.method_1106).setStyle("focusRectSkin",{});
            Object(this.method_1106).setStyle("upSkin",{});
            Object(this.method_1106).setStyle("disabledSkin",{});
         }
      }
      
      private function method_3068(param1:FocusEvent) : void
      {
         this.var_3423 = false;
      }
      
      private function method_5528(param1:FocusEvent) : void
      {
         this.var_3423 = true;
      }
      
      private function get chat() : DisplayObject
      {
         return viewComponent as DisplayObject;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ChatNotifications.const_2266,ChatNotifications.const_2630,ChatNotifications.const_99];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case ChatNotifications.const_2266:
               this.joinGroupChat(int(param1.getBody()));
               break;
            case ChatNotifications.const_2630:
               this.method_1824();
               break;
            case ChatNotifications.const_99:
               this.method_2633();
         }
      }
      
      private function method_2633() : void
      {
         var _loc1_:class_131 = guiProxy.getWindowById(GuiConstants.CHAT_WINDOW);
         if(_loc1_)
         {
            if(!_loc1_.maximized)
            {
               _loc1_.toggleVisibility();
               this.setFocus();
            }
            else if(!this.method_5413)
            {
               _loc1_.toggleVisibility();
            }
         }
      }
      
      private function joinGroupChat(param1:int) : void
      {
         if(this.chat != null)
         {
            if(!this.chat.hasEventListener(MouseEvent.CLICK))
            {
               this.chat.addEventListener(MouseEvent.CLICK,this.handleClick);
            }
            if(!this.chat["getRoom"](param1))
            {
               this.chat["createGroupRoom"](param1,class_88.getItem("title_group"));
            }
         }
      }
      
      public function get method_5413() : Boolean
      {
         return this.var_3423;
      }
      
      public function setFocus() : void
      {
         this.chat.stage.focus = this.method_1106 as InteractiveObject;
      }
      
      private function handleClick(param1:MouseEvent) : void
      {
         this.chat.stage.focus = param1.target as InteractiveObject;
      }
      
      private function get method_1106() : DisplayObject
      {
         var _loc1_:DisplayObject = viewComponent[const_1762]() as DisplayObject;
         return _loc1_[const_1646]() as DisplayObject;
      }
      
      private function method_1824() : void
      {
         if(this.chat != null)
         {
            this.chat[const_801]();
         }
      }
      
      public function method_3297(param1:IWindow) : void
      {
         if(param1)
         {
            param1.removeEventListener(SimpleWindowEvent.const_1674,this.method_3968);
            param1.removeEventListener(SimpleWindowEvent.const_2430,this.method_4456);
            param1.removeEventListener(SimpleWindowEvent.const_940,this.method_806);
         }
         param1.addEventListener(SimpleWindowEvent.const_1674,this.method_3968);
         param1.addEventListener(SimpleWindowEvent.const_2430,this.method_4456);
         param1.addEventListener(SimpleWindowEvent.const_940,this.method_806);
         this.var_253 = param1;
         if(!this.var_253.maximized)
         {
            this.chat.visible = false;
         }
         var _loc2_:class_93 = new class_93(guiManager,class_93.const_284);
         var _loc3_:class_91 = new class_91(class_91.const_552);
         _loc3_.addChild(this.chat);
         _loc2_.addElement(_loc3_,class_93.const_2374);
         var _loc4_:class_131;
         (_loc4_ = param1 as class_131).method_1655(_loc2_);
      }
      
      public function method_3071(param1:class_1040) : void
      {
         this.chat[const_2685](param1.name_148,param1.userID,param1.sessionID,param1.instanceID,param1.language,param1.name_145,param1.factionID,new Point(14,30),new Rectangle(0,0,class_50.method_6533(),class_50.method_1269()),false,param1.method_263,0,false,0,0,false,param1.method_5735);
      }
      
      private function method_4456(param1:Event) : void
      {
         if(this.chat != null)
         {
            this.chat.visible = false;
         }
      }
      
      private function method_806(param1:Event) : void
      {
         if(this.chat != null)
         {
            this.chat.visible = true;
         }
      }
      
      private function method_3968(param1:SimpleWindowEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(this.chat != null && this.var_253 != null)
         {
            _loc2_ = Number(this.var_253[const_887].x) - 10;
            _loc3_ = Number(this.var_253[const_887].y) - 20;
            this.chat[const_2314](_loc2_,_loc3_);
         }
      }
      
      private function method_3177(param1:Event) : void
      {
         this.method_3233();
         this.method_3968(null);
      }
      
      private function method_751(param1:Event) : void
      {
      }
   }
}
