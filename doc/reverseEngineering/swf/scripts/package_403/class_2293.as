package package_403
{
   import com.greensock.TweenMax;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.fui.components.buttons.button.Button;
   import net.bigpoint.darkorbit.fui.components.buttons.checkbox.CheckBox;
   import net.bigpoint.darkorbit.fui.components.buttons.checkbox.CheckBoxEvent;
   import net.bigpoint.darkorbit.fui.components.core.InvalidationType;
   import net.bigpoint.darkorbit.fui.components.core.data.VectorCollection;
   import net.bigpoint.darkorbit.fui.components.core.skins.SkinLayerNames;
   import net.bigpoint.darkorbit.fui.components.list.itemlist.ItemList;
   import net.bigpoint.darkorbit.fui.components.list.itemlist.ItemListEvent;
   import net.bigpoint.darkorbit.fui.components.scroll.ScrollEvent;
   import net.bigpoint.darkorbit.fui.components.scroll.Scrollbar;
   import net.bigpoint.darkorbit.fui.components.text.input.Input;
   import net.bigpoint.darkorbit.fui.components.text.input.InputEvent;
   import net.bigpoint.darkorbit.fui.components.text.input.validators.TextLengthValidator;
   import net.bigpoint.darkorbit.fui.components.text.label.Label;
   import net.bigpoint.darkorbit.mvc.gui.interfaces.IWindow;
   import package_260.class_1659;
   import package_260.class_1661;
   import package_455.ContactListItemDataAssignerEvent;
   import package_455.class_2530;
   import package_70.SimpleWindowEvent;
   
   public class class_2293 extends Sprite
   {
       
      
      private var var_3047:IWindow;
      
      private var var_2805:DisplayObjectContainer;
      
      private var var_128:DisplayObjectContainer;
      
      private var var_2623:CheckBox;
      
      private var var_763:Label;
      
      private var var_795:CheckBox;
      
      private var var_215:Label;
      
      private var var_4341:CheckBox;
      
      private var var_3774:Label;
      
      private var var_4283:CheckBox;
      
      private var var_3710:Label;
      
      private var var_2769:Input;
      
      private var var_3054:Button;
      
      private var var_1575:Button;
      
      private var var_3674:Button;
      
      private var var_703:ItemList;
      
      private var _scrollbar:Scrollbar;
      
      private var _slider:Button;
      
      private var var_3153:Vector.<class_1659>;
      
      private var var_845:CheckBox;
      
      private var var_2284:Label;
      
      public function class_2293(param1:IWindow)
      {
         this.var_3153 = new Vector.<class_1659>();
         super();
         this.var_3047 = param1;
      }
      
      public function method_866() : void
      {
         if(this.numChildren > 0)
         {
            this.var_2805 = this.getChildByName("windowContentContainer") as DisplayObjectContainer;
            if(this.var_2805)
            {
               this.var_128 = this.var_2805.getChildByName("contactContentContainer") as DisplayObjectContainer;
               this.var_2623 = this.var_128.getChildByName("showContacts") as CheckBox;
               this.var_763 = this.var_128.getChildByName("showContactsDesc") as Label;
               this.var_763.text = class_88.getItem("display_contacts");
               this.var_2623.addEventListener(CheckBoxEvent.EVENT_SELECTION_CHANGED,this.method_2086);
               this.var_4341 = this.var_128.getChildByName("showRequests") as CheckBox;
               this.var_3774 = this.var_128.getChildByName("showRequestsDesc") as Label;
               this.var_3774.text = class_88.getItem("display_requests");
               this.var_4341.addEventListener(CheckBoxEvent.EVENT_SELECTION_CHANGED,this.method_1102);
               this.var_4283 = this.var_128.getChildByName("showBlacklisted") as CheckBox;
               this.var_3710 = this.var_128.getChildByName("showBlacklistedDesc") as Label;
               this.var_3710.text = class_88.getItem("display_blacklist");
               this.var_4283.addEventListener(CheckBoxEvent.EVENT_SELECTION_CHANGED,this.method_3449);
               this.var_795 = this.var_128.getChildByName("showClanmembers") as CheckBox;
               this.var_215 = this.var_128.getChildByName("showClanmembersDesc") as Label;
               this.var_215.text = "[undefined]";
               this.var_795.addEventListener(CheckBoxEvent.EVENT_SELECTION_CHANGED,this.method_250);
               this.var_2769 = this.var_128.getChildByName("selectedUsername") as Input;
               this.var_2769.addEventListener(Event.CHANGE,this.method_2010);
               this.var_2769.addEventListener(FocusEvent.FOCUS_IN,this.method_6190);
               this.var_2769.addEventListener(FocusEvent.FOCUS_OUT,this.method_921);
               this.var_2769.addEventListener(InputEvent.INPUT_IS_VALID,this.method_5710);
               this.var_2769.addEventListener(InputEvent.INPUT_IS_INVALID,this.method_3750);
               this.var_2769.validator = new TextLengthValidator();
               this.var_3054 = this.var_128.getChildByName("inviteButton") as Button;
               this.var_3054.addEventListener(MouseEvent.CLICK,this.method_5857);
               this.var_1575 = this.var_128.getChildByName("removeButton") as Button;
               this.var_1575.addEventListener(MouseEvent.CLICK,this.method_5923);
               this.var_3674 = this.var_128.getChildByName("blockButton") as Button;
               this.var_3674.addEventListener(MouseEvent.CLICK,this.method_3674);
               this.var_703 = this.var_128.getChildByName("contactItemlist") as ItemList;
               this.var_703.itemDataAssigner = class_2530;
               this.var_703.scrollMouseSpeed = 160;
               this.var_703.addEventListener(ItemListEvent.CLICKED,this.method_600);
               this.var_703.addEventListener(ContactListItemDataAssignerEvent.ICON_CLICKED,this.method_5409);
               this.var_703.addEventListener(ContactListItemDataAssignerEvent.var_4016,this.method_4034);
               this.var_703.addEventListener(ContactListItemDataAssignerEvent.var_1525,this.method_1878);
               this.var_703.addEventListener(ContactListItemDataAssignerEvent.var_3958,this.method_3547);
               this.var_703.addEventListener(ContactListItemDataAssignerEvent.var_995,this.method_1453);
               this.var_703.addEventListener(ContactListItemDataAssignerEvent.var_2264,this.method_1147);
               this.var_703.addEventListener(ScrollEvent.SCROLLCONTAINER_VERTICAL_SIZE_CHANGED,this.method_1209);
               this.var_703.addEventListener(MouseEvent.MOUSE_WHEEL,this.method_3744);
               this.var_703.list = new VectorCollection(this.var_3153);
               this.var_703.forceRedraw(InvalidationType.SIZE);
               this.var_703.forceRedraw(InvalidationType.POSITION);
               this._scrollbar = this.var_128.getChildByName("scrollbar") as Scrollbar;
               this._slider = this._scrollbar.getChildByName("buttonSlider") as Button;
               this._scrollbar.addEventListener(ScrollEvent.SCROLLBAR_POSITION_CHANGED,this.handleScrollbarPositionChangeEvent);
               this.var_845 = this.var_128.getChildByName("hideNotifications") as CheckBox;
               this.var_2284 = this.var_128.getChildByName("hideNotificationsDesc") as Label;
               this.var_2284.text = class_88.getItem("block_all_notifications");
               this.var_845.addEventListener(MouseEvent.CLICK,this.method_716);
            }
            this.method_3366();
         }
         this.var_3047.addEventListener(SimpleWindowEvent.const_1674,this.method_3313);
         this.method_3313();
      }
      
      private function method_3366() : void
      {
         if(this.var_2769.validator.isValid())
         {
            this.var_3054.enabled = true;
            this.var_1575.enabled = true;
            this.var_3674.enabled = true;
            TweenMax.to(this.var_3054,0.5,{"colorMatrixFilter":{"saturation":1}});
            TweenMax.to(this.var_1575,0.5,{"colorMatrixFilter":{"saturation":1}});
            TweenMax.to(this.var_3674,0.5,{"colorMatrixFilter":{"saturation":1}});
         }
         else
         {
            this.var_3054.enabled = false;
            this.var_1575.enabled = false;
            this.var_3674.enabled = false;
            TweenMax.to(this.var_3054,0.5,{"colorMatrixFilter":{"saturation":0.2}});
            TweenMax.to(this.var_1575,0.5,{"colorMatrixFilter":{"saturation":0.2}});
            TweenMax.to(this.var_3674,0.5,{"colorMatrixFilter":{"saturation":0.2}});
         }
      }
      
      private function method_6190(param1:FocusEvent) : void
      {
         dispatchEvent(new class_2292(class_2292.USERNAME_INPUTFIELD_GAINED_FOCUS));
      }
      
      private function method_921(param1:FocusEvent) : void
      {
         dispatchEvent(new class_2292(class_2292.USERNAME_INPUTFIELD_LOST_FOCUS));
      }
      
      private function method_2010(param1:Event) : void
      {
         this.method_3366();
      }
      
      private function method_5710(param1:InputEvent) : void
      {
         var _loc2_:DisplayObject = this.var_2769.skin.getSkinLayer(SkinLayerNames.NORMAL);
         TweenMax.to(_loc2_,0.5,{"colorMatrixFilter":{
            "colorize":16711680,
            "amount":0,
            "contrast":1,
            "brightness":1
         }});
      }
      
      private function method_3750(param1:InputEvent) : void
      {
         var _loc2_:DisplayObject = this.var_2769.skin.getSkinLayer(SkinLayerNames.NORMAL);
         TweenMax.to(_loc2_,0.5,{"colorMatrixFilter":{
            "colorize":16711680,
            "amount":1,
            "contrast":1.1,
            "brightness":1.1
         }});
      }
      
      private function method_716(param1:MouseEvent) : void
      {
         dispatchEvent(new class_2292(class_2292.BLOCK_NOTIFICATIONS_CHECKBOX_STATE_CHANGED,[this.var_845.selection]));
      }
      
      private function method_2086(param1:CheckBoxEvent) : void
      {
         dispatchEvent(new class_2292(class_2292.FILTER_CHECKBOX_STATE_CHANGED,[class_2292.CONTACTS_CHECKBOX,param1.selected]));
      }
      
      private function method_1102(param1:CheckBoxEvent) : void
      {
         dispatchEvent(new class_2292(class_2292.FILTER_CHECKBOX_STATE_CHANGED,[class_2292.REQUESTS_CHECKBOX,param1.selected]));
      }
      
      private function method_250(param1:CheckBoxEvent) : void
      {
         dispatchEvent(new class_2292(class_2292.FILTER_CHECKBOX_STATE_CHANGED,[class_2292.CLANMEMBERS_CHECKBOX,param1.selected]));
      }
      
      private function method_3449(param1:CheckBoxEvent) : void
      {
         dispatchEvent(new class_2292(class_2292.FILTER_CHECKBOX_STATE_CHANGED,[class_2292.BLACKLISTED_CHECKBOX,param1.selected]));
      }
      
      private function method_3744(param1:MouseEvent) : void
      {
         if(this._scrollbar)
         {
            this._scrollbar.updateScrollPositionByScrollDelta(param1.delta);
         }
      }
      
      private function method_1209(param1:ScrollEvent) : void
      {
         var _loc2_:Number = param1.viewSize;
         var _loc3_:Number = param1.contentSize;
         if(this._scrollbar)
         {
            this._scrollbar.updateBySizes(_loc2_,_loc3_);
         }
      }
      
      private function handleScrollbarPositionChangeEvent(param1:ScrollEvent) : void
      {
         var _loc2_:Number = NaN;
         if(this._scrollbar)
         {
            _loc2_ = Number(this._scrollbar.getScrollPositionInPercent());
            this.var_703.setScrollPositionInPercent(_loc2_);
         }
      }
      
      private function method_3313(param1:SimpleWindowEvent = null) : void
      {
         this.var_2805.height = Number(this.var_3047.height) - 10;
         this.var_2805.width = Number(this.var_3047.width) - 4;
      }
      
      private function method_5409(param1:ContactListItemDataAssignerEvent) : void
      {
      }
      
      private function method_5857(param1:Event) : void
      {
         dispatchEvent(new class_2292(class_2292.INVITE_CLICKED));
      }
      
      private function method_5923(param1:Event) : void
      {
         dispatchEvent(new class_2292(class_2292.REMOVE_CLICKED));
      }
      
      private function method_3674(param1:Event) : void
      {
         dispatchEvent(new class_2292(class_2292.BLOCK_CLICKED));
      }
      
      private function method_1453(param1:ContactListItemDataAssignerEvent) : void
      {
         dispatchEvent(new class_2292(class_2292.INVITE_TO_GROUP_CLICKED,[param1.data.userID]));
      }
      
      private function method_1147(param1:ContactListItemDataAssignerEvent) : void
      {
         dispatchEvent(new class_2292(class_2292.REMOVE_OUTGOING_REQUEST_CLICKED,[param1.data.userID]));
      }
      
      private function method_4034(param1:ContactListItemDataAssignerEvent) : void
      {
         dispatchEvent(new class_2292(class_2292.ACCEPT_PENDING_REQUEST_CLICKED,[param1.data.userID]));
      }
      
      private function method_1878(param1:ContactListItemDataAssignerEvent) : void
      {
         dispatchEvent(new class_2292(class_2292.DECLINE_PENDING_REQUEST_CLICKED,[param1.data.userID]));
      }
      
      private function method_3547(param1:ContactListItemDataAssignerEvent) : void
      {
         dispatchEvent(new class_2292(class_2292.UNBLOCK_USER_CLICKED,[param1.data.userID]));
      }
      
      public function method_2903(param1:Vector.<class_1659>) : void
      {
         if(this.var_703)
         {
            this.var_703.list = new VectorCollection(param1);
         }
         else
         {
            this.var_3153 = param1;
         }
      }
      
      protected function method_600(param1:ItemListEvent) : void
      {
         var _loc2_:class_1659 = param1.vo as class_1659;
         dispatchEvent(new class_2292(class_2292.CONTACT_CLICKED,[_loc2_.userID,_loc2_.name_148]));
      }
      
      public function method_4715() : String
      {
         return this.var_2769.getDisplayedText();
      }
      
      public function method_257(param1:class_1661) : void
      {
         this.var_2623.selection = param1.showContacts;
         this.var_795.selection = param1.var_1684;
         this.var_4341.selection = param1.showRequests;
         this.var_4283.selection = param1.name_3;
      }
      
      public function method_5941(param1:Boolean) : void
      {
         this.var_845.selection = param1;
      }
      
      public function method_3683(param1:Array) : void
      {
         this.var_763.text = class_88.getItem("display_contacts") + " " + param1[0] + "/" + param1[1];
         this.var_215.text = "[undefined] " + param1[2] + "/" + param1[3];
         this.var_3774.text = class_88.getItem("display_requests") + " " + param1[4];
         this.var_3710.text = class_88.getItem("display_blacklist") + " " + param1[5];
      }
      
      public function method_1432(param1:String) : void
      {
         this.var_2769.text = param1;
         this.var_2769.forceRedraw();
         this.method_3366();
      }
      
      public function method_2448() : void
      {
         this.var_3047.showInProgressOverlay();
      }
      
      public function method_4037() : void
      {
         this.var_3047.hideInProgressOverlay();
      }
   }
}
