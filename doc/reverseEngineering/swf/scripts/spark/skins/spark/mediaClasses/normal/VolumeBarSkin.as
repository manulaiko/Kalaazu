package spark.skins.spark.mediaClasses.normal
{
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.PopUpAnchor;
   import spark.components.mediaClasses.MuteButton;
   import spark.components.mediaClasses.VolumeBar;
   import spark.filters.DropShadowFilter;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class VolumeBarSkin extends SparkSkin implements IStateClient2
   {
      
      private static const exclusions:Array = ["muteButton","track","thumb"];
       
      
      private var _433014735dropDown:Group;
      
      private var _783330987muteButton:MuteButton;
      
      private var _106852524popup:PopUpAnchor;
      
      private var _110342614thumb:Button;
      
      private var _110621003track:Button;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:VolumeBar;
      
      public function VolumeBarSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._VolumeBarSkin_MuteButton1_i()];
         this.currentState = "normal";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._VolumeBarSkin_PopUpAnchor1_i,this._VolumeBarSkin_PopUpAnchor1_r);
         states = [new State({
            "name":"normal",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"popup",
               "name":"displayPopUp",
               "value":false
            })]
         }),new State({
            "name":"open",
            "overrides":[new AddItems().initializeFromObject({
               "destructionPolicy":"auto",
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"first"
            }),new SetProperty().initializeFromObject({
               "target":"popup",
               "name":"displayPopUp",
               "value":true
            })]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         })];
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
      
      override public function get colorizeExclusions() : Array
      {
         return exclusions;
      }
      
      override protected function initializationComplete() : void
      {
         useChromeColor = true;
         super.initializationComplete();
      }
      
      private function _VolumeBarSkin_PopUpAnchor1_i() : PopUpAnchor
      {
         var _loc1_:PopUpAnchor = new PopUpAnchor();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.popUpPosition = "above";
         _loc1_.popUp = this._VolumeBarSkin_Group1_i();
         _loc1_.id = "popup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.popup = _loc1_;
         BindingManager.executeBindings(this,"popup",this.popup);
         return _loc1_;
      }
      
      private function _VolumeBarSkin_PopUpAnchor1_r() : void
      {
         var _loc1_:* = null;
         this.popup = null;
         _loc1_ = null;
         this.dropDown = null;
         _loc1_ = null;
         this.track = null;
         _loc1_ = null;
         this.thumb = null;
         _loc1_;
         _loc1_;
         _loc1_;
         _loc1_;
      }
      
      private function _VolumeBarSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.width = 38;
         _loc1_.height = 84;
         _loc1_.horizontalCenter = 0;
         _loc1_.mxmlContent = [this._VolumeBarSkin_Rect1_c(),this._VolumeBarSkin_Rect2_c(),this._VolumeBarSkin_Button1_i(),this._VolumeBarSkin_Button2_i()];
         _loc1_.id = "dropDown";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.dropDown = _loc1_;
         BindingManager.executeBindings(this,"dropDown",this.dropDown);
         return _loc1_;
      }
      
      private function _VolumeBarSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.filters = [this._VolumeBarSkin_DropShadowFilter1_c()];
         _loc1_.fill = this._VolumeBarSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VolumeBarSkin_DropShadowFilter1_c() : DropShadowFilter
      {
         var _loc1_:DropShadowFilter = new DropShadowFilter();
         _loc1_.knockout = true;
         _loc1_.blurX = 20;
         _loc1_.blurY = 20;
         _loc1_.alpha = 0.32;
         _loc1_.distance = 11;
         _loc1_.angle = 90;
         return _loc1_;
      }
      
      private function _VolumeBarSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _VolumeBarSkin_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._VolumeBarSkin_LinearGradient1_c();
         _loc1_.stroke = this._VolumeBarSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VolumeBarSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._VolumeBarSkin_GradientEntry1_c(),this._VolumeBarSkin_GradientEntry2_c()];
         return _loc1_;
      }
      
      private function _VolumeBarSkin_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _VolumeBarSkin_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 14474460;
         return _loc1_;
      }
      
      private function _VolumeBarSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 0;
         return _loc1_;
      }
      
      private function _VolumeBarSkin_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.horizontalCenter = 0;
         _loc1_.top = 6;
         _loc1_.bottom = 7;
         _loc1_.setStyle("skinClass",VolumeBarTrackSkin);
         _loc1_.id = "track";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.track = _loc1_;
         BindingManager.executeBindings(this,"track",this.track);
         return _loc1_;
      }
      
      private function _VolumeBarSkin_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.horizontalCenter = 0;
         _loc1_.width = 11;
         _loc1_.height = 11;
         _loc1_.setStyle("skinClass",VolumeBarThumbSkin);
         _loc1_.id = "thumb";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.thumb = _loc1_;
         BindingManager.executeBindings(this,"thumb",this.thumb);
         return _loc1_;
      }
      
      private function _VolumeBarSkin_MuteButton1_i() : MuteButton
      {
         var _loc1_:MuteButton = new MuteButton();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.focusEnabled = false;
         _loc1_.setStyle("skinClass",MuteButtonSkin);
         _loc1_.id = "muteButton";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.muteButton = _loc1_;
         BindingManager.executeBindings(this,"muteButton",this.muteButton);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get dropDown() : Group
      {
         return this._433014735dropDown;
      }
      
      public function set dropDown(param1:Group) : void
      {
         var _loc2_:Object = this._433014735dropDown;
         if(_loc2_ !== param1)
         {
            this._433014735dropDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"dropDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get muteButton() : MuteButton
      {
         return this._783330987muteButton;
      }
      
      public function set muteButton(param1:MuteButton) : void
      {
         var _loc2_:Object = this._783330987muteButton;
         if(_loc2_ !== param1)
         {
            this._783330987muteButton = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"muteButton",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get popup() : PopUpAnchor
      {
         return this._106852524popup;
      }
      
      public function set popup(param1:PopUpAnchor) : void
      {
         var _loc2_:Object = this._106852524popup;
         if(_loc2_ !== param1)
         {
            this._106852524popup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"popup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get thumb() : Button
      {
         return this._110342614thumb;
      }
      
      public function set thumb(param1:Button) : void
      {
         var _loc2_:Object = this._110342614thumb;
         if(_loc2_ !== param1)
         {
            this._110342614thumb = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumb",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get track() : Button
      {
         return this._110621003track;
      }
      
      public function set track(param1:Button) : void
      {
         var _loc2_:Object = this._110621003track;
         if(_loc2_ !== param1)
         {
            this._110621003track = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"track",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : VolumeBar
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:VolumeBar) : void
      {
         var _loc2_:Object = this._213507019hostComponent;
         if(_loc2_ !== param1)
         {
            this._213507019hostComponent = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hostComponent",_loc2_,param1));
            }
         }
      }
   }
}
