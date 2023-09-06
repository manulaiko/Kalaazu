package spark.skins.spark
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.RadialGradient;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.primitives.Path;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class ScrollBarUpButtonSkin extends SparkSkin implements IStateClient2
   {
      
      private static const exclusions:Array = ["arrow"];
      
      private static const symbols:Array = ["arrowFill1","arrowFill2"];
       
      
      private var _1938001053_ScrollBarUpButtonSkin_GradientEntry1:GradientEntry;
      
      private var _1938001054_ScrollBarUpButtonSkin_GradientEntry2:GradientEntry;
      
      private var _454127829_ScrollBarUpButtonSkin_SolidColor1:SolidColor;
      
      private var _454127828_ScrollBarUpButtonSkin_SolidColor2:SolidColor;
      
      private var _93090825arrow:Path;
      
      private var _1752992635arrowFill1:GradientEntry;
      
      private var _1752992634arrowFill2:GradientEntry;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:Button;
      
      public function ScrollBarUpButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._ScrollBarUpButtonSkin_Rect1_c(),this._ScrollBarUpButtonSkin_Rect2_c(),this._ScrollBarUpButtonSkin_Rect3_c(),this._ScrollBarUpButtonSkin_Path1_i()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ScrollBarUpButtonSkin_GradientEntry1",
               "name":"color",
               "value":12303291
            }),new SetProperty().initializeFromObject({
               "target":"_ScrollBarUpButtonSkin_GradientEntry2",
               "name":"color",
               "value":10461345
            }),new SetProperty().initializeFromObject({
               "target":"_ScrollBarUpButtonSkin_SolidColor2",
               "name":"alpha",
               "value":0.22
            })]
         }),new State({
            "name":"down",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_ScrollBarUpButtonSkin_SolidColor1",
               "name":"color",
               "value":14609407
            }),new SetProperty().initializeFromObject({
               "target":"_ScrollBarUpButtonSkin_GradientEntry1",
               "name":"color",
               "value":14079702
            }),new SetProperty().initializeFromObject({
               "target":"_ScrollBarUpButtonSkin_GradientEntry1",
               "name":"alpha",
               "value":1
            }),new SetProperty().initializeFromObject({
               "target":"_ScrollBarUpButtonSkin_GradientEntry2",
               "name":"color",
               "value":8947848
            }),new SetProperty().initializeFromObject({
               "target":"_ScrollBarUpButtonSkin_GradientEntry2",
               "name":"alpha",
               "value":1
            }),new SetProperty().initializeFromObject({
               "target":"_ScrollBarUpButtonSkin_SolidColor2",
               "name":"alpha",
               "value":0.22
            })]
         }),new State({
            "name":"disabled",
            "overrides":[]
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
      
      override public function get symbolItems() : Array
      {
         return symbols;
      }
      
      override protected function initializationComplete() : void
      {
         useChromeColor = true;
         super.initializationComplete();
      }
      
      private function _ScrollBarUpButtonSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.minWidth = 14;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.minHeight = 17;
         _loc1_.stroke = this._ScrollBarUpButtonSkin_SolidColorStroke1_c();
         _loc1_.fill = this._ScrollBarUpButtonSkin_SolidColor1_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScrollBarUpButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 6842472;
         _loc1_.weight = 1;
         return _loc1_;
      }
      
      private function _ScrollBarUpButtonSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16382457;
         this._ScrollBarUpButtonSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_ScrollBarUpButtonSkin_SolidColor1",this._ScrollBarUpButtonSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _ScrollBarUpButtonSkin_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.fill = this._ScrollBarUpButtonSkin_LinearGradient1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScrollBarUpButtonSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.entries = [this._ScrollBarUpButtonSkin_GradientEntry1_i(),this._ScrollBarUpButtonSkin_GradientEntry2_i()];
         return _loc1_;
      }
      
      private function _ScrollBarUpButtonSkin_GradientEntry1_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.85;
         this._ScrollBarUpButtonSkin_GradientEntry1 = _loc1_;
         BindingManager.executeBindings(this,"_ScrollBarUpButtonSkin_GradientEntry1",this._ScrollBarUpButtonSkin_GradientEntry1);
         return _loc1_;
      }
      
      private function _ScrollBarUpButtonSkin_GradientEntry2_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 15198183;
         _loc1_.alpha = 0.85;
         this._ScrollBarUpButtonSkin_GradientEntry2 = _loc1_;
         BindingManager.executeBindings(this,"_ScrollBarUpButtonSkin_GradientEntry2",this._ScrollBarUpButtonSkin_GradientEntry2);
         return _loc1_;
      }
      
      private function _ScrollBarUpButtonSkin_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.width = 6;
         _loc1_.fill = this._ScrollBarUpButtonSkin_SolidColor2_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _ScrollBarUpButtonSkin_SolidColor2_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.75;
         this._ScrollBarUpButtonSkin_SolidColor2 = _loc1_;
         BindingManager.executeBindings(this,"_ScrollBarUpButtonSkin_SolidColor2",this._ScrollBarUpButtonSkin_SolidColor2);
         return _loc1_;
      }
      
      private function _ScrollBarUpButtonSkin_Path1_i() : Path
      {
         var _loc1_:Path = new Path();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = -1;
         _loc1_.data = "M 3.5 0.0 L 7.0 7.0 L 0.0 7.0 L 3.5 0.0";
         _loc1_.fill = this._ScrollBarUpButtonSkin_RadialGradient1_c();
         _loc1_.initialized(this,"arrow");
         this.arrow = _loc1_;
         BindingManager.executeBindings(this,"arrow",this.arrow);
         return _loc1_;
      }
      
      private function _ScrollBarUpButtonSkin_RadialGradient1_c() : RadialGradient
      {
         var _loc1_:RadialGradient = new RadialGradient();
         _loc1_.rotation = 90;
         _loc1_.focalPointRatio = 1;
         _loc1_.entries = [this._ScrollBarUpButtonSkin_GradientEntry3_i(),this._ScrollBarUpButtonSkin_GradientEntry4_i()];
         return _loc1_;
      }
      
      private function _ScrollBarUpButtonSkin_GradientEntry3_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.65;
         this.arrowFill1 = _loc1_;
         BindingManager.executeBindings(this,"arrowFill1",this.arrowFill1);
         return _loc1_;
      }
      
      private function _ScrollBarUpButtonSkin_GradientEntry4_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.8;
         this.arrowFill2 = _loc1_;
         BindingManager.executeBindings(this,"arrowFill2",this.arrowFill2);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _ScrollBarUpButtonSkin_GradientEntry1() : GradientEntry
      {
         return this._1938001053_ScrollBarUpButtonSkin_GradientEntry1;
      }
      
      public function set _ScrollBarUpButtonSkin_GradientEntry1(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1938001053_ScrollBarUpButtonSkin_GradientEntry1;
         if(_loc2_ !== param1)
         {
            this._1938001053_ScrollBarUpButtonSkin_GradientEntry1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ScrollBarUpButtonSkin_GradientEntry1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ScrollBarUpButtonSkin_GradientEntry2() : GradientEntry
      {
         return this._1938001054_ScrollBarUpButtonSkin_GradientEntry2;
      }
      
      public function set _ScrollBarUpButtonSkin_GradientEntry2(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1938001054_ScrollBarUpButtonSkin_GradientEntry2;
         if(_loc2_ !== param1)
         {
            this._1938001054_ScrollBarUpButtonSkin_GradientEntry2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ScrollBarUpButtonSkin_GradientEntry2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ScrollBarUpButtonSkin_SolidColor1() : SolidColor
      {
         return this._454127829_ScrollBarUpButtonSkin_SolidColor1;
      }
      
      public function set _ScrollBarUpButtonSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._454127829_ScrollBarUpButtonSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._454127829_ScrollBarUpButtonSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ScrollBarUpButtonSkin_SolidColor1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ScrollBarUpButtonSkin_SolidColor2() : SolidColor
      {
         return this._454127828_ScrollBarUpButtonSkin_SolidColor2;
      }
      
      public function set _ScrollBarUpButtonSkin_SolidColor2(param1:SolidColor) : void
      {
         var _loc2_:Object = this._454127828_ScrollBarUpButtonSkin_SolidColor2;
         if(_loc2_ !== param1)
         {
            this._454127828_ScrollBarUpButtonSkin_SolidColor2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ScrollBarUpButtonSkin_SolidColor2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get arrow() : Path
      {
         return this._93090825arrow;
      }
      
      public function set arrow(param1:Path) : void
      {
         var _loc2_:Object = this._93090825arrow;
         if(_loc2_ !== param1)
         {
            this._93090825arrow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get arrowFill1() : GradientEntry
      {
         return this._1752992635arrowFill1;
      }
      
      public function set arrowFill1(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1752992635arrowFill1;
         if(_loc2_ !== param1)
         {
            this._1752992635arrowFill1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrowFill1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get arrowFill2() : GradientEntry
      {
         return this._1752992634arrowFill2;
      }
      
      public function set arrowFill2(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1752992634arrowFill2;
         if(_loc2_ !== param1)
         {
            this._1752992634arrowFill2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"arrowFill2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : Button
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:Button) : void
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
