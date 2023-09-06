package package_50
{
   import com.bigpoint.utils.class_129;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase;
   import net.bigpoint.darkorbit.mvc.common.view.components.DOPopUp;
   import net.bigpoint.darkorbit.mvc.common.view.skins.DOButtonBaseSkin;
   import package_150.class_988;
   import package_154.DOHSliderSkin;
   import spark.components.Group;
   import spark.components.HSlider;
   import spark.components.Label;
   import spark.components.SkinnableContainer;
   import spark.components.VGroup;
   
   public class class_144 extends DOPopUp
   {
       
      
      private var _236983790confirmButton:DOButtonBase;
      
      private var var_25:Label;
      
      private var var_3718:HSlider;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function class_144()
      {
         super();
         mx_internal::_document = this;
         this.styleName = "battleStationPopup";
         this.title = "-";
         this.width = 250;
         this.minHeight = 190;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_1570);
         this.addEventListener("creationComplete",this.method_3806);
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
      
      private function handleConfirmButtonClick(param1:MouseEvent) : void
      {
         var _loc2_:class_988 = new class_988(class_988.const_1634);
         _loc2_.var_381 = this.selectionSlider.value;
         dispatchEvent(_loc2_);
         handleCloseButtonClick(null);
      }
      
      public function method_4130(param1:String) : void
      {
         this.popupTextLabel.text = param1;
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
      }
      
      public function method_5659(param1:String, param2:String) : void
      {
         this.confirmButton.label = param1;
      }
      
      private function method_6117(param1:Number) : String
      {
         return class_129.method_3157(param1);
      }
      
      public function method_442(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.selectionSlider.minimum = param1;
         this.selectionSlider.maximum = param2;
         this.selectionSlider.value = param3;
         this.selectionSlider.stepSize = param4;
         DOHSliderSkin(this.selectionSlider.skin).minVal.text = class_129.method_3157(param1);
         DOHSliderSkin(this.selectionSlider.skin).maxVal.text = class_129.method_3157(param2);
      }
      
      private function creationCompleteHandler() : void
      {
         this.selectionSlider.addEventListener(DOHSliderSkin.const_368,this.method_2083);
         this.selectionSlider.addEventListener(DOHSliderSkin.const_966,this.method_2083);
      }
      
      private function method_2083(param1:Event) : void
      {
         this.selectionSlider.changeValueByStep(param1.type == DOHSliderSkin.const_966);
      }
      
      private function method_1570() : Array
      {
         return [this.method_4752()];
      }
      
      private function method_4752() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this.method_3630()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_3630() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this.method_40(),this.method_3951()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_40() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.width = 240;
         _loc1_.verticalCenter = 0;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("fontFamily","EurostileTHea");
         _loc1_.setStyle("color",16763904);
         _loc1_.id = "popupTextLabel";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.popupTextLabel = _loc1_;
         BindingManager.executeBindings(this,"popupTextLabel",this.popupTextLabel);
         return _loc1_;
      }
      
      private function method_3951() : SkinnableContainer
      {
         var _loc1_:SkinnableContainer = new SkinnableContainer();
         _loc1_.styleName = "selectionSliderPopupBg";
         _loc1_.height = 96;
         _loc1_.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_3989);
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_3989() : Array
      {
         return [this.method_1814(),this.method_3457()];
      }
      
      private function method_1814() : HSlider
      {
         var _loc1_:HSlider = new HSlider();
         _loc1_.horizontalCenter = 0;
         _loc1_.width = 210;
         _loc1_.top = 28;
         _loc1_.showDataTip = true;
         _loc1_.dataTipFormatFunction = this.method_6117;
         _loc1_.styleName = "clanBattleStationPopupHSlider";
         _loc1_.setStyle("liveDragging",true);
         _loc1_.setStyle("skinClass",DOHSliderSkin);
         _loc1_.id = "selectionSlider";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.selectionSlider = _loc1_;
         BindingManager.executeBindings(this,"selectionSlider",this.selectionSlider);
         return _loc1_;
      }
      
      private function method_3457() : DOButtonBase
      {
         var _loc1_:DOButtonBase = new DOButtonBase();
         _loc1_.label = "-";
         _loc1_.top = 64;
         _loc1_.left = 3;
         _loc1_.right = 3;
         _loc1_.bottom = 2;
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
      
      public function method_3806(param1:FlexEvent) : void
      {
         this.creationCompleteHandler();
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
      public function get selectionSlider() : HSlider
      {
         return this.var_3718;
      }
      
      public function set selectionSlider(param1:HSlider) : void
      {
         var _loc2_:Object = this.var_3718;
         if(_loc2_ !== param1)
         {
            this.var_3718 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectionSlider",_loc2_,param1));
            }
         }
      }
   }
}
