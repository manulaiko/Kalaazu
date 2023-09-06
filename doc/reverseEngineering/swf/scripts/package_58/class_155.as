package package_58
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
   
   public class class_155 extends DOPopUp
   {
      
      public static const const_2235:String = "timerFinishedEvent";
      
      public static const EVENT_ACCEPT_DRAFT_CONFIRMATION:String = "EVENT_ACCEPT_DRAFT_CONFIRMATION";
      
      public static const EVENT_REFUSE_DRAFT_CONFIRMATION:String = "EVENT_REFUSE_DRAFT_CONFIRMATION";
      
      public static const PLACEHOLDER:String = "%SECONDS%";
       
      
      private var _1719531403bigTopLevelHoldingGroupObjectThingy:Group;
      
      private var _1990131276cancelButton:DOButtonBase;
      
      private var _236983790confirmButton:DOButtonBase;
      
      private var var_4504:Label;
      
      private var _315970861groupDepth1:VGroup;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var countDownText:String;
      
      protected var timer:Timer;
      
      protected var timerValue:int;
      
      public function class_155()
      {
         super();
         mx_internal::_document = this;
         this.styleName = "battleStationPopup";
         this.title = "";
         this.minHeight = 150;
         this.minWidth = 400;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_5434);
         this.addEventListener("creationComplete",this.method_1751);
         this.addEventListener("preinitialize",this.method_3695);
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
      
      private function method_5302() : void
      {
         this.timer = new Timer(1000);
         this.timer.addEventListener(TimerEvent.TIMER,this.handleTimerEvent);
      }
      
      private function handlePopUpReady() : void
      {
         this.confirmButton.label = class_88.getItem("label_yes");
         this.cancelButton.label = class_88.getItem("label_no");
      }
      
      public function startTimer(param1:int) : void
      {
         this.timerValue = param1;
         if(this.timer)
         {
            this.timer.start();
         }
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
         }
         this.method_3734(this.timerValue.toString());
      }
      
      public function method_3734(param1:String) : void
      {
         var _loc2_:String = this.countDownText.replace(PLACEHOLDER,param1);
         this.countDownTextLabel.text = _loc2_;
      }
      
      public function set method_5816(param1:String) : void
      {
         this.cancelButton.label = param1;
      }
      
      public function set method_6357(param1:String) : void
      {
         this.confirmButton.label = param1;
      }
      
      protected function handleCancelButtonClicked(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(class_155.EVENT_REFUSE_DRAFT_CONFIRMATION));
      }
      
      protected function handleConfirmButtonClick(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(class_155.EVENT_ACCEPT_DRAFT_CONFIRMATION));
      }
      
      private function method_5434() : Array
      {
         return [this.method_5079()];
      }
      
      private function method_5079() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 85;
         _loc1_.mxmlContent = [this.method_2194(),this.method_3049()];
         _loc1_.id = "bigTopLevelHoldingGroupObjectThingy";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bigTopLevelHoldingGroupObjectThingy = _loc1_;
         BindingManager.executeBindings(this,"bigTopLevelHoldingGroupObjectThingy",this.bigTopLevelHoldingGroupObjectThingy);
         return _loc1_;
      }
      
      private function method_2194() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this.method_5750()];
         _loc1_.id = "groupDepth1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.groupDepth1 = _loc1_;
         BindingManager.executeBindings(this,"groupDepth1",this.groupDepth1);
         return _loc1_;
      }
      
      private function method_5750() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "";
         _loc1_.percentWidth = 95;
         _loc1_.height = 100;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("fontSize",15);
         _loc1_.setStyle("fontFamily","EurostileT");
         _loc1_.setStyle("color",16777215);
         _loc1_.id = "countDownTextLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.countDownTextLabel = _loc1_;
         BindingManager.executeBindings(this,"countDownTextLabel",this.countDownTextLabel);
         return _loc1_;
      }
      
      private function method_3049() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.bottom = 4;
         _loc1_.percentWidth = 100;
         _loc1_.height = 28;
         _loc1_.horizontalAlign = "center";
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this.method_6519(),this.method_5774()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_6519() : DOButtonBase
      {
         var _loc1_:DOButtonBase = new DOButtonBase();
         _loc1_.label = "Confirm";
         _loc1_.styleName = "questWindowAcceptQuest";
         _loc1_.mouseChildren = false;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("fontSize",14);
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("skinClass",DOButtonBaseSkin);
         _loc1_.addEventListener("click",this.__confirmButton_click);
         _loc1_.id = "confirmButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.confirmButton = _loc1_;
         BindingManager.executeBindings(this,"confirmButton",this.confirmButton);
         return _loc1_;
      }
      
      public function __confirmButton_click(param1:MouseEvent) : void
      {
         this.handleConfirmButtonClick(param1);
      }
      
      private function method_5774() : DOButtonBase
      {
         var _loc1_:DOButtonBase = new DOButtonBase();
         _loc1_.label = "Cancel";
         _loc1_.styleName = "questWindowAbortQuest";
         _loc1_.mouseChildren = false;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("fontSize",14);
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("skinClass",DOButtonBaseSkin);
         _loc1_.addEventListener("click",this.__cancelButton_click);
         _loc1_.id = "cancelButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.cancelButton = _loc1_;
         BindingManager.executeBindings(this,"cancelButton",this.cancelButton);
         return _loc1_;
      }
      
      public function __cancelButton_click(param1:MouseEvent) : void
      {
         this.handleCancelButtonClicked(param1);
      }
      
      public function method_1751(param1:FlexEvent) : void
      {
         this.handlePopUpReady();
      }
      
      public function method_3695(param1:FlexEvent) : void
      {
         this.method_5302();
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
      public function get cancelButton() : DOButtonBase
      {
         return this._1990131276cancelButton;
      }
      
      public function set cancelButton(param1:DOButtonBase) : void
      {
         var _loc2_:Object = this._1990131276cancelButton;
         if(_loc2_ !== param1)
         {
            this._1990131276cancelButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cancelButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get confirmButton() : DOButtonBase
      {
         return this._236983790confirmButton;
      }
      
      public function set confirmButton(param1:DOButtonBase) : void
      {
         var _loc2_:Object = this._236983790confirmButton;
         if(_loc2_ !== param1)
         {
            this._236983790confirmButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"confirmButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get countDownTextLabel() : Label
      {
         return this.var_4504;
      }
      
      public function set countDownTextLabel(param1:Label) : void
      {
         var _loc2_:Object = this.var_4504;
         if(_loc2_ !== param1)
         {
            this.var_4504 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"countDownTextLabel",_loc2_,param1));
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
   }
}
