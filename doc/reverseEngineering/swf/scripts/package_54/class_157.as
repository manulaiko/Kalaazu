package package_54
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOPopUp;
   import net.bigpoint.darkorbit.mvc.common.view.skins.DOButtonBaseSkin;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   
   public class class_157 extends DOPopUp
   {
      
      public static const const_2235:String = "timerFinishedEvent";
      
      public static const const_2710:String = "leaveQueue";
      
      public static const const_945:String = "joinMatch";
      
      protected static const PLACEHOLDER:String = "%SECONDS%";
       
      
      private var _1719531403bigTopLevelHoldingGroupObjectThingy:Group;
      
      private var var_4451:DOButtonBase;
      
      private var var_2834:DOButtonBase;
      
      private var _315970861groupDepth1:VGroup;
      
      private var var_4860:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var timer:Timer;
      
      private var timerValue:uint;
      
      public function class_157()
      {
         super();
         mx_internal::_document = this;
         this.styleName = "battleStationPopup";
         this.title = "";
         this.minHeight = 150;
         this.minWidth = 400;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_1577);
         this.addEventListener("creationComplete",this.method_1702);
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      private function handlePopUpReady() : void
      {
         this.title = class_88.getItem("teamdeathmatch_popup_match_participation_title");
         this.buttonConfirm.label = class_88.getItem("teamdeathmatch_popup_match_participation_confirm");
         this.buttonLeave.label = class_88.getItem("teamdeathmatch_popup_match_participation_leave");
      }
      
      override protected function handleCloseButtonClick(param1:MouseEvent = null) : void
      {
         super.handleCloseButtonClick(param1);
      }
      
      private function method_5964(param1:Event) : void
      {
         dispatchEvent(new Event(const_945));
      }
      
      private function method_4250(param1:Event) : void
      {
         dispatchEvent(new Event(const_2710));
      }
      
      private function method_4409() : void
      {
         if(this.timer == null)
         {
            this.timer = new Timer(1000);
            this.timer.addEventListener(TimerEvent.TIMER,this.handleTimerEvent);
         }
      }
      
      public function startTimer(param1:int) : void
      {
         this.timerValue = param1;
         this.method_4409();
         this.timer.start();
         this.method_3734(this.timerValue.toString());
      }
      
      public function method_1026() : void
      {
         if(this.timer)
         {
            this.timer.stop();
         }
      }
      
      public function method_849() : void
      {
         this.method_1026();
         if(this.timer)
         {
            this.timer.removeEventListener(TimerEvent.TIMER,this.handleTimerEvent);
            this.timer = null;
         }
      }
      
      protected function handleTimerEvent(param1:TimerEvent) : void
      {
         if(this.timerValue > 0)
         {
            --this.timerValue;
         }
         else
         {
            this.method_849();
            dispatchEvent(new Event(const_2235));
            closeWindow();
         }
         this.method_3734(this.timerValue.toString());
      }
      
      public function method_3734(param1:String) : void
      {
         var _loc2_:String = class_88.getItem("teamdeathmatch_popup_match_participation_description");
         var _loc3_:String = _loc2_.replace(PLACEHOLDER,param1);
         this.labelCountDownMessage.text = _loc3_;
      }
      
      private function method_1577() : Array
      {
         return [this.method_5019()];
      }
      
      private function method_5019() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 85;
         _loc1_.mxmlContent = [this.method_1036(),this.method_4496()];
         _loc1_.id = "bigTopLevelHoldingGroupObjectThingy";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bigTopLevelHoldingGroupObjectThingy = _loc1_;
         BindingManager.executeBindings(this,"bigTopLevelHoldingGroupObjectThingy",this.bigTopLevelHoldingGroupObjectThingy);
         return _loc1_;
      }
      
      private function method_1036() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this.method_3107()];
         _loc1_.id = "groupDepth1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.groupDepth1 = _loc1_;
         BindingManager.executeBindings(this,"groupDepth1",this.groupDepth1);
         return _loc1_;
      }
      
      private function method_3107() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "";
         _loc1_.percentWidth = 95;
         _loc1_.height = 100;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("fontSize",15);
         _loc1_.setStyle("fontFamily","EurostileT");
         _loc1_.setStyle("color",16777215);
         _loc1_.id = "labelCountDownMessage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelCountDownMessage = _loc1_;
         BindingManager.executeBindings(this,"labelCountDownMessage",this.labelCountDownMessage);
         return _loc1_;
      }
      
      private function method_4496() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.bottom = 4;
         _loc1_.percentWidth = 100;
         _loc1_.height = 28;
         _loc1_.horizontalAlign = "center";
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this.method_5661(),this.method_4947()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_5661() : DOButtonBase
      {
         var _loc1_:DOButtonBase = new DOButtonBase();
         _loc1_.label = "Cancel";
         _loc1_.styleName = "questWindowAcceptQuest";
         _loc1_.mouseChildren = false;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("fontSize",14);
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("skinClass",DOButtonBaseSkin);
         _loc1_.addEventListener("click",this.method_671);
         _loc1_.id = "buttonConfirm";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonConfirm = _loc1_;
         BindingManager.executeBindings(this,"buttonConfirm",this.buttonConfirm);
         return _loc1_;
      }
      
      public function method_671(param1:MouseEvent) : void
      {
         this.method_5964(param1);
      }
      
      private function method_4947() : DOButtonBase
      {
         var _loc1_:DOButtonBase = new DOButtonBase();
         _loc1_.label = "Cancel";
         _loc1_.styleName = "questWindowAcceptQuest";
         _loc1_.mouseChildren = false;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("fontSize",14);
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("skinClass",DOButtonBaseSkin);
         _loc1_.addEventListener("click",this.method_4594);
         _loc1_.id = "buttonLeave";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.buttonLeave = _loc1_;
         BindingManager.executeBindings(this,"buttonLeave",this.buttonLeave);
         return _loc1_;
      }
      
      public function method_4594(param1:MouseEvent) : void
      {
         this.method_4250(param1);
      }
      
      public function method_1702(param1:FlexEvent) : void
      {
         this.handlePopUpReady();
      }
      
      [Bindable(event="propertyChange")]
      public function get bigTopLevelHoldingGroupObjectThingy() : Group
      {
         return this._1719531403bigTopLevelHoldingGroupObjectThingy;
      }
      
      public function set bigTopLevelHoldingGroupObjectThingy(param1:Group) : void
      {
         var _loc2_:Object = this._1719531403bigTopLevelHoldingGroupObjectThingy;
         if(_loc2_ !== param1)
         {
            this._1719531403bigTopLevelHoldingGroupObjectThingy = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bigTopLevelHoldingGroupObjectThingy",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonConfirm() : DOButtonBase
      {
         return this.var_4451;
      }
      
      public function set buttonConfirm(param1:DOButtonBase) : void
      {
         var _loc2_:Object = this.var_4451;
         if(_loc2_ !== param1)
         {
            this.var_4451 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonConfirm",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get buttonLeave() : DOButtonBase
      {
         return this.var_2834;
      }
      
      public function set buttonLeave(param1:DOButtonBase) : void
      {
         var _loc2_:Object = this.var_2834;
         if(_loc2_ !== param1)
         {
            this.var_2834 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"buttonLeave",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get groupDepth1() : VGroup
      {
         return this._315970861groupDepth1;
      }
      
      public function set groupDepth1(param1:VGroup) : void
      {
         var _loc2_:Object = this._315970861groupDepth1;
         if(_loc2_ !== param1)
         {
            this._315970861groupDepth1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"groupDepth1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelCountDownMessage() : Label
      {
         return this.var_4860;
      }
      
      public function set labelCountDownMessage(param1:Label) : void
      {
         var _loc2_:Object = this.var_4860;
         if(_loc2_ !== param1)
         {
            this.var_4860 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelCountDownMessage",_loc2_,param1));
            }
         }
      }
   }
}
