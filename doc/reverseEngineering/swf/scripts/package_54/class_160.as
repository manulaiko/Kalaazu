package package_54
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
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.VGroup;
   
   public class class_160 extends DOPopUp
   {
      
      public static const EVENT_EXIT_QUEUE_CONFIRMATION:String = "SectorControlLeaveGamePopUp.EVENT_EXIT_QUEUE_CONFIRMATION";
      
      public static const EVENT_EXIT_QUEUE_CANCEL:String = "SectorControlLeaveGamePopUp.EVENT_EXIT_QUEUE_CANCEL";
       
      
      private var _1719531403bigTopLevelHoldingGroupObjectThingy:Group;
      
      private var var_3178:DOButtonBase;
      
      private var _315970861groupDepth1:VGroup;
      
      private var _467213939labelMessage:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      public function class_160()
      {
         super();
         mx_internal::_document = this;
         this.styleName = "battleStationPopup";
         this.title = "";
         this.minHeight = 150;
         this.minWidth = 400;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_3145);
         this.addEventListener("creationComplete",this.method_3156);
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
         this.title = class_88.getItem("teamdeathmatch_popup_level_requirement_title");
         this.confirmationButton.label = class_88.getItem("label_close");
         this.labelMessage.text = class_88.getItem("teamdeathmatch_popup_level_requirement_description");
      }
      
      public function set message(param1:String) : void
      {
         this.labelMessage.text = param1;
      }
      
      override protected function handleCloseButtonClick(param1:MouseEvent = null) : void
      {
         super.handleCloseButtonClick(param1);
      }
      
      private function method_3145() : Array
      {
         return [this.method_6324()];
      }
      
      private function method_6324() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 85;
         _loc1_.mxmlContent = [this.method_5484(),this.method_6070()];
         _loc1_.id = "bigTopLevelHoldingGroupObjectThingy";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.bigTopLevelHoldingGroupObjectThingy = _loc1_;
         BindingManager.executeBindings(this,"bigTopLevelHoldingGroupObjectThingy",this.bigTopLevelHoldingGroupObjectThingy);
         return _loc1_;
      }
      
      private function method_5484() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.horizontalAlign = "center";
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this.method_4908()];
         _loc1_.id = "groupDepth1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.groupDepth1 = _loc1_;
         BindingManager.executeBindings(this,"groupDepth1",this.groupDepth1);
         return _loc1_;
      }
      
      private function method_4908() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.text = "";
         _loc1_.percentWidth = 95;
         _loc1_.height = 100;
         _loc1_.setStyle("textAlign","center");
         _loc1_.setStyle("fontSize",15);
         _loc1_.setStyle("fontFamily","EurostileT");
         _loc1_.setStyle("color",16777215);
         _loc1_.id = "labelMessage";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelMessage = _loc1_;
         BindingManager.executeBindings(this,"labelMessage",this.labelMessage);
         return _loc1_;
      }
      
      private function method_6070() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.bottom = 4;
         _loc1_.percentWidth = 100;
         _loc1_.height = 28;
         _loc1_.horizontalAlign = "center";
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this.method_4160()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function method_4160() : DOButtonBase
      {
         var _loc1_:* = null;
         _loc1_ = new DOButtonBase();
         _loc1_.label = "Cancel";
         _loc1_.styleName = "questWindowAcceptQuest";
         _loc1_.mouseChildren = false;
         _loc1_.buttonMode = true;
         _loc1_.setStyle("fontSize",14);
         _loc1_.setStyle("color",16777215);
         _loc1_.setStyle("skinClass",DOButtonBaseSkin);
         _loc1_.addEventListener("click",this.method_4474);
         _loc1_.id = "confirmationButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.confirmationButton = _loc1_;
         BindingManager.executeBindings(this,"confirmationButton",this.confirmationButton);
         return _loc1_;
      }
      
      public function method_4474(param1:MouseEvent) : void
      {
         this.handleCloseButtonClick(param1);
      }
      
      public function method_3156(param1:FlexEvent) : void
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
      public function get confirmationButton() : DOButtonBase
      {
         return this.var_3178;
      }
      
      public function set confirmationButton(param1:DOButtonBase) : void
      {
         var _loc2_:Object = this.var_3178;
         if(_loc2_ !== param1)
         {
            this.var_3178 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"confirmationButton",_loc2_,param1));
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
      public function get labelMessage() : Label
      {
         return this._467213939labelMessage;
      }
      
      public function set labelMessage(param1:Label) : void
      {
         var _loc2_:Object = this._467213939labelMessage;
         if(_loc2_ !== param1)
         {
            this._467213939labelMessage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelMessage",_loc2_,param1));
            }
         }
      }
   }
}
