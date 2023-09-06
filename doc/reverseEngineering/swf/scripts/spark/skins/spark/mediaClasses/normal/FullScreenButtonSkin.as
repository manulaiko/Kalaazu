package spark.skins.spark.mediaClasses.normal
{
   import mx.binding.BindingManager;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.LinearGradientStroke;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.Button;
   import spark.components.Group;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class FullScreenButtonSkin extends SparkSkin implements IStateClient2
   {
      
      private static const exclusions:Array = ["fullScreenSymbol"];
      
      private static const symbols:Array = ["fullScreenSymbolFill1","fullScreenSymbolFill2","fullScreenSymbolFill3","fullScreenSymbolTopLeftFill1","fullScreenSymbolTopLeftFill2","fullScreenSymbolTopRightFill1","fullScreenSymbolTopRightFill2","fullScreenSymbolBottomLeftFill1","fullScreenSymbolBottomLeftFill2","fullScreenSymbolBottomRightFill1","fullScreenSymbolBottomRightFill2"];
       
      
      private var _1393743717_FullScreenButtonSkin_GradientEntry1:GradientEntry;
      
      private var _1393743718_FullScreenButtonSkin_GradientEntry2:GradientEntry;
      
      private var _1393743719_FullScreenButtonSkin_GradientEntry3:GradientEntry;
      
      private var _1393743720_FullScreenButtonSkin_GradientEntry4:GradientEntry;
      
      public var _FullScreenButtonSkin_Rect1:Rect;
      
      public var _FullScreenButtonSkin_Rect2:Rect;
      
      public var _FullScreenButtonSkin_Rect3:Rect;
      
      public var _FullScreenButtonSkin_Rect4:Rect;
      
      public var _FullScreenButtonSkin_Rect5:Rect;
      
      public var _FullScreenButtonSkin_Rect6:Rect;
      
      public var _FullScreenButtonSkin_Rect7:Rect;
      
      private var _1597536611_FullScreenButtonSkin_SolidColor1:SolidColor;
      
      private var _2143405741fullScreenSymbol:Group;
      
      private var _224580727fullScreenSymbolBottomLeftFill1:SolidColor;
      
      private var _224580726fullScreenSymbolBottomLeftFill2:SolidColor;
      
      private var _1518768560fullScreenSymbolBottomRightFill1:SolidColor;
      
      private var _1518768559fullScreenSymbolBottomRightFill2:SolidColor;
      
      private var _865374853fullScreenSymbolFill1:SolidColor;
      
      private var _865374852fullScreenSymbolFill2:SolidColor;
      
      private var _865374851fullScreenSymbolFill3:SolidColor;
      
      private var _1738690149fullScreenSymbolTopLeftFill1:SolidColor;
      
      private var _1738690150fullScreenSymbolTopLeftFill2:SolidColor;
      
      private var _786913548fullScreenSymbolTopRightFill1:SolidColor;
      
      private var _786913547fullScreenSymbolTopRightFill2:SolidColor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _213507019hostComponent:Button;
      
      public function FullScreenButtonSkin()
      {
         super();
         mx_internal::_document = this;
         this.mxmlContent = [this._FullScreenButtonSkin_Rect1_i(),this._FullScreenButtonSkin_Rect8_c(),this._FullScreenButtonSkin_Group1_i()];
         this.currentState = "up";
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._FullScreenButtonSkin_Rect2_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._FullScreenButtonSkin_Rect3_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._FullScreenButtonSkin_Rect4_i);
         var _loc4_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._FullScreenButtonSkin_Rect5_i);
         var _loc5_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._FullScreenButtonSkin_Rect6_i);
         var _loc6_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._FullScreenButtonSkin_Rect7_i);
         states = [new State({
            "name":"up",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FullScreenButtonSkin_Rect1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FullScreenButtonSkin_Rect1"]
            })]
         }),new State({
            "name":"over",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FullScreenButtonSkin_Rect1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FullScreenButtonSkin_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"_FullScreenButtonSkin_GradientEntry1",
               "name":"color",
               "value":13290186
            }),new SetProperty().initializeFromObject({
               "target":"_FullScreenButtonSkin_GradientEntry2",
               "name":"color",
               "value":9276813
            }),new SetProperty().initializeFromObject({
               "target":"_FullScreenButtonSkin_GradientEntry3",
               "name":"alpha",
               "value":0.22
            }),new SetProperty().initializeFromObject({
               "target":"_FullScreenButtonSkin_GradientEntry4",
               "name":"alpha",
               "value":0.22
            }),new SetProperty().initializeFromObject({
               "target":"_FullScreenButtonSkin_SolidColor1",
               "name":"alpha",
               "value":0.12
            })]
         }),new State({
            "name":"down",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc6_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FullScreenButtonSkin_Rect1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc5_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FullScreenButtonSkin_Rect1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc4_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FullScreenButtonSkin_Rect1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FullScreenButtonSkin_Rect1"]
            }),new SetProperty().initializeFromObject({
               "target":"_FullScreenButtonSkin_GradientEntry1",
               "name":"color",
               "value":11053224
            }),new SetProperty().initializeFromObject({
               "target":"_FullScreenButtonSkin_GradientEntry2",
               "name":"color",
               "value":7039851
            })]
         }),new State({
            "name":"disabled",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FullScreenButtonSkin_Rect1"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["_FullScreenButtonSkin_Rect1"]
            }),new SetProperty().initializeFromObject({
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
      
      override public function get symbolItems() : Array
      {
         return symbols;
      }
      
      override protected function initializationComplete() : void
      {
         useChromeColor = true;
         super.initializationComplete();
      }
      
      private function _FullScreenButtonSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.fill = this._FullScreenButtonSkin_LinearGradient1_c();
         _loc1_.initialized(this,"_FullScreenButtonSkin_Rect1");
         this._FullScreenButtonSkin_Rect1 = _loc1_;
         BindingManager.executeBindings(this,"_FullScreenButtonSkin_Rect1",this._FullScreenButtonSkin_Rect1);
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
         _loc1_.color = 16777215;
         this._FullScreenButtonSkin_GradientEntry1 = _loc1_;
         BindingManager.executeBindings(this,"_FullScreenButtonSkin_GradientEntry1",this._FullScreenButtonSkin_GradientEntry1);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_GradientEntry2_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 14474460;
         this._FullScreenButtonSkin_GradientEntry2 = _loc1_;
         BindingManager.executeBindings(this,"_FullScreenButtonSkin_GradientEntry2",this._FullScreenButtonSkin_GradientEntry2);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.stroke = this._FullScreenButtonSkin_LinearGradientStroke1_c();
         _loc1_.initialized(this,"_FullScreenButtonSkin_Rect2");
         this._FullScreenButtonSkin_Rect2 = _loc1_;
         BindingManager.executeBindings(this,"_FullScreenButtonSkin_Rect2",this._FullScreenButtonSkin_Rect2);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_LinearGradientStroke1_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.weight = 1;
         _loc1_.entries = [this._FullScreenButtonSkin_GradientEntry3_i(),this._FullScreenButtonSkin_GradientEntry4_i()];
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_GradientEntry3_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16711422;
         this._FullScreenButtonSkin_GradientEntry3 = _loc1_;
         BindingManager.executeBindings(this,"_FullScreenButtonSkin_GradientEntry3",this._FullScreenButtonSkin_GradientEntry3);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_GradientEntry4_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 15395562;
         this._FullScreenButtonSkin_GradientEntry4 = _loc1_;
         BindingManager.executeBindings(this,"_FullScreenButtonSkin_GradientEntry4",this._FullScreenButtonSkin_GradientEntry4);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect3_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.height = 11;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor1_i();
         _loc1_.initialized(this,"_FullScreenButtonSkin_Rect3");
         this._FullScreenButtonSkin_Rect3 = _loc1_;
         BindingManager.executeBindings(this,"_FullScreenButtonSkin_Rect3",this._FullScreenButtonSkin_Rect3);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.3;
         this._FullScreenButtonSkin_SolidColor1 = _loc1_;
         BindingManager.executeBindings(this,"_FullScreenButtonSkin_SolidColor1",this._FullScreenButtonSkin_SolidColor1);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect4_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 1;
         _loc1_.right = 1;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor2_c();
         _loc1_.initialized(this,"_FullScreenButtonSkin_Rect4");
         this._FullScreenButtonSkin_Rect4 = _loc1_;
         BindingManager.executeBindings(this,"_FullScreenButtonSkin_Rect4",this._FullScreenButtonSkin_Rect4);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.4;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect5_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 2;
         _loc1_.right = 1;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor3_c();
         _loc1_.initialized(this,"_FullScreenButtonSkin_Rect5");
         this._FullScreenButtonSkin_Rect5 = _loc1_;
         BindingManager.executeBindings(this,"_FullScreenButtonSkin_Rect5",this._FullScreenButtonSkin_Rect5);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor3_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.12;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect6_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.width = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor4_c();
         _loc1_.initialized(this,"_FullScreenButtonSkin_Rect6");
         this._FullScreenButtonSkin_Rect6 = _loc1_;
         BindingManager.executeBindings(this,"_FullScreenButtonSkin_Rect6",this._FullScreenButtonSkin_Rect6);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor4_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.12;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect7_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.width = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor5_c();
         _loc1_.initialized(this,"_FullScreenButtonSkin_Rect7");
         this._FullScreenButtonSkin_Rect7 = _loc1_;
         BindingManager.executeBindings(this,"_FullScreenButtonSkin_Rect7",this._FullScreenButtonSkin_Rect7);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor5_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 0;
         _loc1_.alpha = 0.12;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect8_c() : Rect
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
         _loc1_.color = 1250067;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 0;
         _loc1_.mxmlContent = [this._FullScreenButtonSkin_Rect9_c(),this._FullScreenButtonSkin_Rect10_c(),this._FullScreenButtonSkin_Rect11_c(),this._FullScreenButtonSkin_Rect12_c(),this._FullScreenButtonSkin_Rect13_c(),this._FullScreenButtonSkin_Rect14_c(),this._FullScreenButtonSkin_Rect15_c(),this._FullScreenButtonSkin_Rect16_c(),this._FullScreenButtonSkin_Rect17_c(),this._FullScreenButtonSkin_Rect18_c(),this._FullScreenButtonSkin_Rect19_c(),this._FullScreenButtonSkin_Rect20_c(),this._FullScreenButtonSkin_Rect21_c(),this._FullScreenButtonSkin_Rect22_c(),this._FullScreenButtonSkin_Rect23_c(),this._FullScreenButtonSkin_Rect24_c(),this._FullScreenButtonSkin_Rect25_c(),this._FullScreenButtonSkin_Rect26_c(),this._FullScreenButtonSkin_Rect27_c(),this._FullScreenButtonSkin_Rect28_c(),this._FullScreenButtonSkin_Rect29_c(),this._FullScreenButtonSkin_Rect30_c()];
         _loc1_.id = "fullScreenSymbol";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.fullScreenSymbol = _loc1_;
         BindingManager.executeBindings(this,"fullScreenSymbol",this.fullScreenSymbol);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect9_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.width = 19;
         _loc1_.height = 14;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor6_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor6_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect10_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 2;
         _loc1_.top = 2;
         _loc1_.right = 2;
         _loc1_.bottom = 2;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor7_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor7_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4144959;
         this.fullScreenSymbolFill1 = _loc1_;
         BindingManager.executeBindings(this,"fullScreenSymbolFill1",this.fullScreenSymbolFill1);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect11_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.bottom = 1;
         _loc1_.left = 2;
         _loc1_.right = 2;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor8_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor8_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect12_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 3;
         _loc1_.top = 3;
         _loc1_.right = 3;
         _loc1_.bottom = 3;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor9_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor9_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16711422;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect13_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 4;
         _loc1_.top = 4;
         _loc1_.right = 4;
         _loc1_.bottom = 4;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor10_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor10_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 4473924;
         this.fullScreenSymbolFill2 = _loc1_;
         BindingManager.executeBindings(this,"fullScreenSymbolFill2",this.fullScreenSymbolFill2);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect14_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 5;
         _loc1_.top = 5;
         _loc1_.right = 5;
         _loc1_.bottom = 5;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor11_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor11_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 6579300;
         this.fullScreenSymbolFill3 = _loc1_;
         BindingManager.executeBindings(this,"fullScreenSymbolFill3",this.fullScreenSymbolFill3);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect15_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.top = 1;
         _loc1_.width = 3;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor12_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor12_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect16_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.top = 2;
         _loc1_.width = 1;
         _loc1_.height = 2;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor13_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor13_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect17_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.top = 0;
         _loc1_.width = 3;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor14_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor14_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3552822;
         this.fullScreenSymbolTopLeftFill1 = _loc1_;
         BindingManager.executeBindings(this,"fullScreenSymbolTopLeftFill1",this.fullScreenSymbolTopLeftFill1);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect18_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.top = 1;
         _loc1_.width = 1;
         _loc1_.height = 2;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor15_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor15_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3552822;
         this.fullScreenSymbolTopLeftFill2 = _loc1_;
         BindingManager.executeBindings(this,"fullScreenSymbolTopLeftFill2",this.fullScreenSymbolTopLeftFill2);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect19_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 0;
         _loc1_.top = 1;
         _loc1_.width = 3;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor16_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor16_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect20_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 0;
         _loc1_.top = 2;
         _loc1_.width = 1;
         _loc1_.height = 2;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor17_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor17_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect21_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.width = 3;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor18_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor18_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3552822;
         this.fullScreenSymbolTopRightFill1 = _loc1_;
         BindingManager.executeBindings(this,"fullScreenSymbolTopRightFill1",this.fullScreenSymbolTopRightFill1);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect22_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 0;
         _loc1_.top = 1;
         _loc1_.width = 1;
         _loc1_.height = 2;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor19_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor19_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3552822;
         this.fullScreenSymbolTopRightFill2 = _loc1_;
         BindingManager.executeBindings(this,"fullScreenSymbolTopRightFill2",this.fullScreenSymbolTopRightFill2);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect23_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.bottom = -1;
         _loc1_.width = 3;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor20_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor20_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect24_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.bottom = 0;
         _loc1_.width = 1;
         _loc1_.height = 2;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor21_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor21_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect25_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.bottom = 0;
         _loc1_.width = 3;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor22_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor22_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3552822;
         this.fullScreenSymbolBottomLeftFill1 = _loc1_;
         BindingManager.executeBindings(this,"fullScreenSymbolBottomLeftFill1",this.fullScreenSymbolBottomLeftFill1);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect26_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.bottom = 1;
         _loc1_.width = 1;
         _loc1_.height = 2;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor23_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor23_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3552822;
         this.fullScreenSymbolBottomLeftFill2 = _loc1_;
         BindingManager.executeBindings(this,"fullScreenSymbolBottomLeftFill2",this.fullScreenSymbolBottomLeftFill2);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect27_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 0;
         _loc1_.bottom = -1;
         _loc1_.width = 3;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor24_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor24_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect28_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.width = 1;
         _loc1_.height = 2;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor25_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor25_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect29_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 0;
         _loc1_.bottom = 0;
         _loc1_.width = 3;
         _loc1_.height = 1;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor26_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor26_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3552822;
         this.fullScreenSymbolBottomRightFill1 = _loc1_;
         BindingManager.executeBindings(this,"fullScreenSymbolBottomRightFill1",this.fullScreenSymbolBottomRightFill1);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_Rect30_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.right = 0;
         _loc1_.bottom = 1;
         _loc1_.width = 1;
         _loc1_.height = 2;
         _loc1_.fill = this._FullScreenButtonSkin_SolidColor27_i();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _FullScreenButtonSkin_SolidColor27_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 3552822;
         this.fullScreenSymbolBottomRightFill2 = _loc1_;
         BindingManager.executeBindings(this,"fullScreenSymbolBottomRightFill2",this.fullScreenSymbolBottomRightFill2);
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
      public function get _FullScreenButtonSkin_GradientEntry3() : GradientEntry
      {
         return this._1393743719_FullScreenButtonSkin_GradientEntry3;
      }
      
      public function set _FullScreenButtonSkin_GradientEntry3(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1393743719_FullScreenButtonSkin_GradientEntry3;
         if(_loc2_ !== param1)
         {
            this._1393743719_FullScreenButtonSkin_GradientEntry3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FullScreenButtonSkin_GradientEntry3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _FullScreenButtonSkin_GradientEntry4() : GradientEntry
      {
         return this._1393743720_FullScreenButtonSkin_GradientEntry4;
      }
      
      public function set _FullScreenButtonSkin_GradientEntry4(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1393743720_FullScreenButtonSkin_GradientEntry4;
         if(_loc2_ !== param1)
         {
            this._1393743720_FullScreenButtonSkin_GradientEntry4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FullScreenButtonSkin_GradientEntry4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _FullScreenButtonSkin_SolidColor1() : SolidColor
      {
         return this._1597536611_FullScreenButtonSkin_SolidColor1;
      }
      
      public function set _FullScreenButtonSkin_SolidColor1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1597536611_FullScreenButtonSkin_SolidColor1;
         if(_loc2_ !== param1)
         {
            this._1597536611_FullScreenButtonSkin_SolidColor1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_FullScreenButtonSkin_SolidColor1",_loc2_,param1));
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
      public function get fullScreenSymbolBottomLeftFill1() : SolidColor
      {
         return this._224580727fullScreenSymbolBottomLeftFill1;
      }
      
      public function set fullScreenSymbolBottomLeftFill1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._224580727fullScreenSymbolBottomLeftFill1;
         if(_loc2_ !== param1)
         {
            this._224580727fullScreenSymbolBottomLeftFill1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fullScreenSymbolBottomLeftFill1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fullScreenSymbolBottomLeftFill2() : SolidColor
      {
         return this._224580726fullScreenSymbolBottomLeftFill2;
      }
      
      public function set fullScreenSymbolBottomLeftFill2(param1:SolidColor) : void
      {
         var _loc2_:Object = this._224580726fullScreenSymbolBottomLeftFill2;
         if(_loc2_ !== param1)
         {
            this._224580726fullScreenSymbolBottomLeftFill2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fullScreenSymbolBottomLeftFill2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fullScreenSymbolBottomRightFill1() : SolidColor
      {
         return this._1518768560fullScreenSymbolBottomRightFill1;
      }
      
      public function set fullScreenSymbolBottomRightFill1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1518768560fullScreenSymbolBottomRightFill1;
         if(_loc2_ !== param1)
         {
            this._1518768560fullScreenSymbolBottomRightFill1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fullScreenSymbolBottomRightFill1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fullScreenSymbolBottomRightFill2() : SolidColor
      {
         return this._1518768559fullScreenSymbolBottomRightFill2;
      }
      
      public function set fullScreenSymbolBottomRightFill2(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1518768559fullScreenSymbolBottomRightFill2;
         if(_loc2_ !== param1)
         {
            this._1518768559fullScreenSymbolBottomRightFill2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fullScreenSymbolBottomRightFill2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fullScreenSymbolFill1() : SolidColor
      {
         return this._865374853fullScreenSymbolFill1;
      }
      
      public function set fullScreenSymbolFill1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._865374853fullScreenSymbolFill1;
         if(_loc2_ !== param1)
         {
            this._865374853fullScreenSymbolFill1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fullScreenSymbolFill1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fullScreenSymbolFill2() : SolidColor
      {
         return this._865374852fullScreenSymbolFill2;
      }
      
      public function set fullScreenSymbolFill2(param1:SolidColor) : void
      {
         var _loc2_:Object = this._865374852fullScreenSymbolFill2;
         if(_loc2_ !== param1)
         {
            this._865374852fullScreenSymbolFill2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fullScreenSymbolFill2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fullScreenSymbolFill3() : SolidColor
      {
         return this._865374851fullScreenSymbolFill3;
      }
      
      public function set fullScreenSymbolFill3(param1:SolidColor) : void
      {
         var _loc2_:Object = this._865374851fullScreenSymbolFill3;
         if(_loc2_ !== param1)
         {
            this._865374851fullScreenSymbolFill3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fullScreenSymbolFill3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fullScreenSymbolTopLeftFill1() : SolidColor
      {
         return this._1738690149fullScreenSymbolTopLeftFill1;
      }
      
      public function set fullScreenSymbolTopLeftFill1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1738690149fullScreenSymbolTopLeftFill1;
         if(_loc2_ !== param1)
         {
            this._1738690149fullScreenSymbolTopLeftFill1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fullScreenSymbolTopLeftFill1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fullScreenSymbolTopLeftFill2() : SolidColor
      {
         return this._1738690150fullScreenSymbolTopLeftFill2;
      }
      
      public function set fullScreenSymbolTopLeftFill2(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1738690150fullScreenSymbolTopLeftFill2;
         if(_loc2_ !== param1)
         {
            this._1738690150fullScreenSymbolTopLeftFill2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fullScreenSymbolTopLeftFill2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fullScreenSymbolTopRightFill1() : SolidColor
      {
         return this._786913548fullScreenSymbolTopRightFill1;
      }
      
      public function set fullScreenSymbolTopRightFill1(param1:SolidColor) : void
      {
         var _loc2_:Object = this._786913548fullScreenSymbolTopRightFill1;
         if(_loc2_ !== param1)
         {
            this._786913548fullScreenSymbolTopRightFill1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fullScreenSymbolTopRightFill1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fullScreenSymbolTopRightFill2() : SolidColor
      {
         return this._786913547fullScreenSymbolTopRightFill2;
      }
      
      public function set fullScreenSymbolTopRightFill2(param1:SolidColor) : void
      {
         var _loc2_:Object = this._786913547fullScreenSymbolTopRightFill2;
         if(_loc2_ !== param1)
         {
            this._786913547fullScreenSymbolTopRightFill2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fullScreenSymbolTopRightFill2",_loc2_,param1));
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
