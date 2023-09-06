package package_50
{
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOPopUp;
   import net.bigpoint.darkorbit.mvc.common.view.skins.DOButtonBaseSkin;
   import package_150.class_988;
   import package_155.class_999;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.SkinnableContainer;
   import spark.components.VGroup;
   
   public class class_148 extends DOPopUp
   {
       
      
      private var var_4431:DOButtonBase;
      
      private var _1990131276cancelButton:DOButtonBase;
      
      private var var_25:Label;
      
      private var var_469:Label;
      
      private var var_3641:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public var moduleType:int;
      
      public var itemId:int;
      
      public var slotId:int;
      
      public var moduleItem:class_999;
      
      public function class_148()
      {
         super();
         mx_internal::_document = this;
         this.styleName = "battleStationPopup";
         this.title = "Do that.";
         this.minHeight = 225;
         this.minWidth = 146;
         this.width = 245;
         this.height = 215;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_4168);
         this.addEventListener("creationComplete",this.method_4881);
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
      
      public function method_4130(param1:String, param2:String) : void
      {
         this.popupTextLabel.text = param1;
         this.topLevelLabel.text = param2;
      }
      
      public function method_4503(param1:String) : void
      {
         this.priceFieldLabel.text = param1;
      }
      
      public function method_5659(param1:String) : void
      {
         this.activateButton.label = param1;
      }
      
      private function method_5562(param1:MouseEvent) : void
      {
         var _loc2_:class_988 = new class_988(class_988.ACTIVATE_BUTTON_CLICKED);
         _loc2_.itemId = this.itemId;
         _loc2_.slotId = this.slotId;
         _loc2_.moduleItem = this.moduleItem;
         dispatchEvent(_loc2_);
         handleCloseButtonClick(null);
      }
      
      private function method_1550(param1:MouseEvent) : void
      {
         handleCloseButtonClick(null);
      }
      
      private function method_453() : void
      {
         this.activateButton.label = class_88.getItem("popup_bswin_activation_btn_repair_module");
         this.cancelButton.label = class_88.getItem("popup_bswin_btn_cancel_module_removal");
      }
      
      private function method_4168() : Array
      {
         return [this.method_1663(),this.method_2388()];
      }
      
      private function method_1663() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.width = 225;
         _loc1_.top = -5;
         _loc1_.mxmlContent = [this.method_5664()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_5664() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "";
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("fontFamily","EurostileTHea");
         _loc1_.setStyle("color",16763904);
         _loc1_.id = "topLevelLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.topLevelLabel = _loc1_;
         BindingManager.executeBindings(this,"topLevelLabel",this.topLevelLabel);
         return _loc1_;
      }
      
      private function method_2388() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.width = 225;
         _loc1_.height = 146;
         _loc1_.mxmlContent = [this.method_2101(),this.method_2636(),this.method_933(),this.method_2434()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_2101() : SkinnableContainer
      {
         var _loc1_:SkinnableContainer = new SkinnableContainer();
         _loc1_.styleName = "emergencyRepairBackground";
         _loc1_.width = 225;
         _loc1_.height = 146;
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_2636() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "";
         _loc1_.horizontalCenter = 0;
         _loc1_.percentWidth = 90;
         _loc1_.percentHeight = 100;
         _loc1_.top = 20;
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("fontFamily","EurostileT");
         _loc1_.setStyle("color",14998949);
         _loc1_.id = "popupTextLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.popupTextLabel = _loc1_;
         BindingManager.executeBindings(this,"popupTextLabel",this.popupTextLabel);
         return _loc1_;
      }
      
      private function method_933() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "-";
         _loc1_.horizontalCenter = 0;
         _loc1_.percentHeight = 100;
         _loc1_.top = 58;
         _loc1_.setStyle("fontSize",11);
         _loc1_.setStyle("fontFamily","EurostileT");
         _loc1_.setStyle("color",16777215);
         _loc1_.id = "priceFieldLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.priceFieldLabel = _loc1_;
         BindingManager.executeBindings(this,"priceFieldLabel",this.priceFieldLabel);
         return _loc1_;
      }
      
      private function method_2434() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.bottom = 4;
         _loc1_.percentWidth = 95;
         _loc1_.horizontalCenter = 0;
         _loc1_.gap = 1;
         _loc1_.mxmlContent = [this.method_796(),this.method_6471()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_796() : DOButtonBase
      {
         var _loc1_:DOButtonBase = new DOButtonBase();
         _loc1_.label = "";
         _loc1_.percentWidth = 100;
         _loc1_.styleName = "scalableGreenConfirmButton";
         _loc1_.mouseChildren = false;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("fontSize",14);
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("skinClass",DOButtonBaseSkin);
         _loc1_.addEventListener("click",this.method_363);
         _loc1_.id = "activateButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.activateButton = _loc1_;
         BindingManager.executeBindings(this,"activateButton",this.activateButton);
         return _loc1_;
      }
      
      public function method_363(param1:MouseEvent) : void
      {
         this.method_5562(param1);
      }
      
      private function method_6471() : DOButtonBase
      {
         var _loc1_:DOButtonBase = new DOButtonBase();
         _loc1_.label = "";
         _loc1_.percentWidth = 100;
         _loc1_.styleName = "scalableBlueCancelButton";
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
         this.method_1550(param1);
      }
      
      public function method_4881(param1:FlexEvent) : void
      {
         this.method_453();
      }
      
      [Bindable(event="propertyChange")]
      public function get activateButton() : DOButtonBase
      {
         return this.var_4431;
      }
      
      public function set activateButton(param1:DOButtonBase) : void
      {
         var _loc2_:Object = this.var_4431;
         if(_loc2_ !== param1)
         {
            this.var_4431 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"activateButton",_loc2_,param1));
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
      public function get popupTextLabel() : Label
      {
         return this.var_25;
      }
      
      public function set popupTextLabel(param1:Label) : void
      {
         var _loc2_:Object = this.var_25;
         if(_loc2_ !== param1)
         {
            this.var_25 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popupTextLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get priceFieldLabel() : Label
      {
         return this.var_469;
      }
      
      public function set priceFieldLabel(param1:Label) : void
      {
         var _loc2_:Object = this.var_469;
         if(_loc2_ !== param1)
         {
            this.var_469 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"priceFieldLabel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get topLevelLabel() : Label
      {
         return this.var_3641;
      }
      
      public function set topLevelLabel(param1:Label) : void
      {
         var _loc2_:Object = this.var_3641;
         if(_loc2_ !== param1)
         {
            this.var_3641 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"topLevelLabel",_loc2_,param1));
            }
         }
      }
   }
}
