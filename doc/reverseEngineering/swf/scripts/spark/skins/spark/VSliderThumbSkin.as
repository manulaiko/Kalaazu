package spark.skins.spark
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.LinearGradientStroke;
   import mx.graphics.SolidColor;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class VSliderThumbSkin extends SparkSkin implements IStateClient2
   {
       
      
      private var _414776291_VSliderThumbSkin_GradientEntry10:GradientEntry;
      
      private var _956451450_VSliderThumbSkin_GradientEntry8:GradientEntry;
      
      private var _956451451_VSliderThumbSkin_GradientEntry9:GradientEntry;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:Button;
      
      public function VSliderThumbSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._VSliderThumbSkin_Rect1_c(),this._VSliderThumbSkin_Rect2_c(),this._VSliderThumbSkin_Rect3_c(),this._VSliderThumbSkin_Rect4_c(),this._VSliderThumbSkin_Rect5_c()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_VSliderThumbSkin_GradientEntry8",
               "name":"color",
               "value":15066597
            }),new SetProperty().initializeFromObject({
               "target":"_VSliderThumbSkin_GradientEntry9",
               "name":"color",
               "value":8224125
            }),new SetProperty().initializeFromObject({
               "target":"_VSliderThumbSkin_GradientEntry10",
               "name":"alpha",
               "value":0
            })]
         }),new State({
            "name":"down",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_VSliderThumbSkin_GradientEntry8",
               "name":"color",
               "value":10066329
            }),new SetProperty().initializeFromObject({
               "target":"_VSliderThumbSkin_GradientEntry9",
               "name":"color",
               "value":5592405
            }),new SetProperty().initializeFromObject({
               "target":"_VSliderThumbSkin_GradientEntry10",
               "name":"alpha",
               "value":0
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
      
      override protected function initializationComplete() : void
      {
         useChromeColor = true;
         super.initializationComplete();
      }
      
      private function _VSliderThumbSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = -2;
         _loc1_.top = -2;
         _loc1_.right = -2;
         _loc1_.bottom = -2;
         _loc1_.radiusX = 8.5;
         _loc1_.radiusY = 8.5;
         _loc1_.stroke = this._VSliderThumbSkin_LinearGradientStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_LinearGradientStroke1_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.weight = 1;
         _loc1_.entries = [this._VSliderThumbSkin_GradientEntry1_c(),this._VSliderThumbSkin_GradientEntry2_c(),this._VSliderThumbSkin_GradientEntry3_c()];
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_GradientEntry1_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_GradientEntry2_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_GradientEntry3_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.03;
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = -1;
         _loc1_.top = -1;
         _loc1_.right = -1;
         _loc1_.bottom = -1;
         _loc1_.radiusX = 7.5;
         _loc1_.radiusY = 7.5;
         _loc1_.stroke = this._VSliderThumbSkin_LinearGradientStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_LinearGradientStroke2_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.weight = 1;
         _loc1_.entries = [this._VSliderThumbSkin_GradientEntry4_c(),this._VSliderThumbSkin_GradientEntry5_c()];
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_GradientEntry4_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.011;
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_GradientEntry5_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.121;
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 7;
         _loc1_.radiusY = 7;
         _loc1_.fill = this._VSliderThumbSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 5197647;
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_Rect4_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0.5;
         _loc1_.right = 0.5;
         _loc1_.top = 0.5;
         _loc1_.bottom = 0.5;
         _loc1_.radiusX = 6;
         _loc1_.radiusY = 6;
         _loc1_.stroke = this._VSliderThumbSkin_LinearGradientStroke3_c();
         _loc1_.fill = this._VSliderThumbSkin_LinearGradient1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_LinearGradientStroke3_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.weight = 1;
         _loc1_.entries = [this._VSliderThumbSkin_GradientEntry6_c(),this._VSliderThumbSkin_GradientEntry7_c()];
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_GradientEntry6_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_GradientEntry7_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.33;
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._VSliderThumbSkin_GradientEntry8_i(),this._VSliderThumbSkin_GradientEntry9_i()];
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_GradientEntry8_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         this._VSliderThumbSkin_GradientEntry8 = _loc1_;
         BindingManager.executeBindings(this,"_VSliderThumbSkin_GradientEntry8",this._VSliderThumbSkin_GradientEntry8);
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_GradientEntry9_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 14211288;
         this._VSliderThumbSkin_GradientEntry9 = _loc1_;
         BindingManager.executeBindings(this,"_VSliderThumbSkin_GradientEntry9",this._VSliderThumbSkin_GradientEntry9);
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_Rect5_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.radiusX = 3;
         _loc1_.radiusY = 3;
         _loc1_.fill = this._VSliderThumbSkin_LinearGradient2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_LinearGradient2_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._VSliderThumbSkin_GradientEntry10_i(),this._VSliderThumbSkin_GradientEntry11_c(),this._VSliderThumbSkin_GradientEntry12_c()];
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_GradientEntry10_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         this._VSliderThumbSkin_GradientEntry10 = _loc1_;
         BindingManager.executeBindings(this,"_VSliderThumbSkin_GradientEntry10",this._VSliderThumbSkin_GradientEntry10);
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_GradientEntry11_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _VSliderThumbSkin_GradientEntry12_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _VSliderThumbSkin_GradientEntry10() : GradientEntry
      {
         return this._414776291_VSliderThumbSkin_GradientEntry10;
      }
      
      public function set _VSliderThumbSkin_GradientEntry10(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._414776291_VSliderThumbSkin_GradientEntry10;
         if(_loc2_ !== param1)
         {
            this._414776291_VSliderThumbSkin_GradientEntry10 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_VSliderThumbSkin_GradientEntry10",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _VSliderThumbSkin_GradientEntry8() : GradientEntry
      {
         return this._956451450_VSliderThumbSkin_GradientEntry8;
      }
      
      public function set _VSliderThumbSkin_GradientEntry8(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._956451450_VSliderThumbSkin_GradientEntry8;
         if(_loc2_ !== param1)
         {
            this._956451450_VSliderThumbSkin_GradientEntry8 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_VSliderThumbSkin_GradientEntry8",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _VSliderThumbSkin_GradientEntry9() : GradientEntry
      {
         return this._956451451_VSliderThumbSkin_GradientEntry9;
      }
      
      public function set _VSliderThumbSkin_GradientEntry9(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._956451451_VSliderThumbSkin_GradientEntry9;
         if(_loc2_ !== param1)
         {
            this._956451451_VSliderThumbSkin_GradientEntry9 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_VSliderThumbSkin_GradientEntry9",_loc2_,param1));
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
