package spark.skins.spark.mediaClasses.fullScreen
{
   import mx.binding.BindingManager;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.LinearGradientStroke;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.components.supportClasses.Skin;
   import spark.primitives.Rect;
   
   public class FullScreenButtonSkin extends Skin implements IStateClient2
   {
       
      
      private var _1393743717_FullScreenButtonSkin_GradientEntry1:GradientEntry;
      
      private var _1393743718_FullScreenButtonSkin_GradientEntry2:GradientEntry;
      
      private var _2143405741fullScreenSymbol:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:Button;
      
      public function FullScreenButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._FullScreenButtonSkin_Rect1_c(),this._FullScreenButtonSkin_Rect2_c(),this._FullScreenButtonSkin_Rect3_c(),this._FullScreenButtonSkin_Group1_i()];
         this.currentState = "up";
         states = [new State({
            "name":"up",
            "overrides":[]
         }),new State({
            "name":"over",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_FullScreenButtonSkin_GradientEntry1",
               "name":"color",
               "value":6776679
            }),new SetProperty().initializeFromObject({
               "target":"_FullScreenButtonSkin_GradientEntry2",
               "name":"color",
               "value":3552822
            })]
         }),new State({
            "name":"down",
            "overrides":[new SetProperty().initializeFromObject({
               "target":"_FullScreenButtonSkin_GradientEntry1",
               "name":"color",
               "value":2894892
            }),new SetProperty().initializeFromObject({
               "target":"_FullScreenButtonSkin_GradientEntry2",
               "name":"color",
               "value":5789784
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
      
      private function _FullScreenButtonSkin_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.fill = this._FullScreenButtonSkin_LinearGradient1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._FullScreenButtonSkin_GradientEntry1_i(),this._FullScreenButtonSkin_GradientEntry2_i()];
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_GradientEntry1_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 5789784;
         _loc1_.alpha = 0.55;
         this._FullScreenButtonSkin_GradientEntry1 = _loc1_;
         BindingManager.executeBindings(this,"_FullScreenButtonSkin_GradientEntry1",this._FullScreenButtonSkin_GradientEntry1);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_GradientEntry2_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 1973790;
         _loc1_.alpha = 0.55;
         this._FullScreenButtonSkin_GradientEntry2 = _loc1_;
         BindingManager.executeBindings(this,"_FullScreenButtonSkin_GradientEntry2",this._FullScreenButtonSkin_GradientEntry2);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.stroke = this._FullScreenButtonSkin_LinearGradientStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_LinearGradientStroke1_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.weight = 1;
         _loc1_.rotation = 90;
         _loc1_.entries = [this._FullScreenButtonSkin_GradientEntry3_c(),this._FullScreenButtonSkin_GradientEntry4_c()];
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_GradientEntry3_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.12;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_GradientEntry4_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.09;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect3_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.width = 38;
         _loc1_.height = 24;
         _loc1_.stroke = this._FullScreenButtonSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 2236962;
         _loc1_.alpha = 0.66;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = -1;
         _loc1_.mxmlContent = [this._FullScreenButtonSkin_Rect4_c(),this._FullScreenButtonSkin_Rect5_c(),this._FullScreenButtonSkin_Rect6_c(),this._FullScreenButtonSkin_Rect7_c(),this._FullScreenButtonSkin_Rect8_c(),this._FullScreenButtonSkin_Rect9_c(),this._FullScreenButtonSkin_Rect10_c(),this._FullScreenButtonSkin_Rect11_c(),this._FullScreenButtonSkin_Rect12_c(),this._FullScreenButtonSkin_Rect13_c(),this._FullScreenButtonSkin_Rect14_c(),this._FullScreenButtonSkin_Rect15_c(),this._FullScreenButtonSkin_Rect16_c(),this._FullScreenButtonSkin_Rect17_c(),this._FullScreenButtonSkin_Rect18_c(),this._FullScreenButtonSkin_Rect19_c(),this._FullScreenButtonSkin_Rect20_c(),this._FullScreenButtonSkin_Rect21_c(),this._FullScreenButtonSkin_Rect22_c(),this._FullScreenButtonSkin_Rect23_c(),this._FullScreenButtonSkin_Rect24_c()];
         _loc1_.id = "fullScreenSymbol";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fullScreenSymbol = _loc1_;
         BindingManager.executeBindings(this,"fullScreenSymbol",this.fullScreenSymbol);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect4_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.width = 26;
         _loc1_.height = 17;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect5_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 5;
         _loc1_.top = 3;
         _loc1_.right = 5;
         _loc1_.bottom = 3;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.8;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect6_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.bottom = 2;
         _loc1_.left = 5;
         _loc1_.right = 5;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor3_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.8;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect7_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 6;
         _loc1_.top = 4;
         _loc1_.right = 6;
         _loc1_.bottom = 4;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor4_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.6;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect8_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 7;
         _loc1_.top = 5;
         _loc1_.right = 7;
         _loc1_.bottom = 5;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor5_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor5_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3355443;
         _loc1_.alpha = 0.6;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect9_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.top = 3;
         _loc1_.width = 3;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor6_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor6_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.75;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect10_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.top = 2;
         _loc1_.width = 3;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor7_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor7_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.75;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect11_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 2;
         _loc1_.top = 0;
         _loc1_.width = 1;
         _loc1_.height = 2;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor8_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor8_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.75;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect12_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 0;
         _loc1_.top = 3;
         _loc1_.width = 3;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor9_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor9_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.75;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect13_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 0;
         _loc1_.top = 2;
         _loc1_.width = 3;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor10_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor10_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.75;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect14_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 2;
         _loc1_.top = 0;
         _loc1_.width = 1;
         _loc1_.height = 2;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor11_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor11_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.75;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect15_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.bottom = 2;
         _loc1_.width = 2;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor12_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor12_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.75;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect16_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 2;
         _loc1_.bottom = 0;
         _loc1_.width = 1;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor13_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor13_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.75;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect17_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.bottom = 3;
         _loc1_.width = 3;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor14_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor14_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.75;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect18_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 2;
         _loc1_.bottom = 1;
         _loc1_.width = 1;
         _loc1_.height = 2;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor15_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor15_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.75;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect19_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 0;
         _loc1_.bottom = 2;
         _loc1_.width = 2;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor16_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor16_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.75;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect20_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 2;
         _loc1_.bottom = 0;
         _loc1_.width = 1;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor17_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor17_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.75;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect21_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 0;
         _loc1_.bottom = 3;
         _loc1_.width = 3;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor18_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor18_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.75;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect22_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 2;
         _loc1_.bottom = 1;
         _loc1_.width = 1;
         _loc1_.height = 2;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor19_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor19_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.75;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect23_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 10;
         _loc1_.bottom = 1;
         _loc1_.right = 10;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor20_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor20_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.75;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect24_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 10;
         _loc1_.bottom = 0;
         _loc1_.right = 10;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor21_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor21_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.8;
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _FullScreenButtonSkin_GradientEntry1() : GradientEntry
      {
         return this._1393743717_FullScreenButtonSkin_GradientEntry1;
      }
      
      public function set _FullScreenButtonSkin_GradientEntry1(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1393743717_FullScreenButtonSkin_GradientEntry1;
         if(_loc2_ !== param1)
         {
            this._1393743717_FullScreenButtonSkin_GradientEntry1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FullScreenButtonSkin_GradientEntry1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _FullScreenButtonSkin_GradientEntry2() : GradientEntry
      {
         return this._1393743718_FullScreenButtonSkin_GradientEntry2;
      }
      
      public function set _FullScreenButtonSkin_GradientEntry2(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1393743718_FullScreenButtonSkin_GradientEntry2;
         if(_loc2_ !== param1)
         {
            this._1393743718_FullScreenButtonSkin_GradientEntry2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FullScreenButtonSkin_GradientEntry2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fullScreenSymbol() : Group
      {
         return this._2143405741fullScreenSymbol;
      }
      
      public function set fullScreenSymbol(param1:Group) : void
      {
         var _loc2_:Object = this._2143405741fullScreenSymbol;
         if(_loc2_ !== param1)
         {
            this._2143405741fullScreenSymbol = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fullScreenSymbol",_loc2_,param1));
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
