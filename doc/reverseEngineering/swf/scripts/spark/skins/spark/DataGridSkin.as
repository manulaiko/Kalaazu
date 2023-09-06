package spark.skins.spark
{
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.ClassFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.DataGrid;
   import spark.components.Grid;
   import spark.components.GridColumnHeaderGroup;
   import spark.components.Group;
   import spark.components.Scroller;
   import spark.components.VGroup;
   import spark.components.gridClasses.GridLayer;
   import spark.primitives.Line;
   import spark.primitives.Rect;
   import spark.skins.SparkSkin;
   
   public class DataGridSkin extends SparkSkin implements IBindingClient, IStateClient2
   {
      
      private static const exclusions:Array = ["scroller","background","columnHeaderGroup"];
      
      private static const contentFill:Array = ["bgFill"];
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _1277490047alternatingRowColorsBackground:ClassFactory;
      
      private var _1332194002background:Rect;
      
      private var _1391998104bgFill:SolidColor;
      
      private var _1383304148border:Rect;
      
      private var _1395787140borderStroke:SolidColorStroke;
      
      private var _502679092caretIndicator:ClassFactory;
      
      private var _1482148164columnHeaderGroup:GridColumnHeaderGroup;
      
      private var _237342767columnSeparator:ClassFactory;
      
      private var _1555036382editorIndicator:ClassFactory;
      
      private var _3181382grid:Grid;
      
      private var _1346001378headerColumnSeparator:ClassFactory;
      
      private var _1027582576headerRenderer:ClassFactory;
      
      private var _1683467992headerSeparator:Line;
      
      private var _1933789133hoverIndicator:ClassFactory;
      
      private var _1763950123rowSeparator:ClassFactory;
      
      private var _402164678scroller:Scroller;
      
      private var _627206627selectionIndicator:ClassFactory;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      private var _213507019hostComponent:DataGrid;
      
      public function DataGridSkin()
      {
         var watchers:Array;
         var var_1:uint;
         var bindings:Array = null;
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this.mx_internal::_bindings = [];
         this.mx_internal::_watchers = [];
         this.mx_internal::_bindingsByDestination = {};
         this.mx_internal::_bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         bindings = this._DataGridSkin_bindingsSetup();
         watchers = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_spark_skins_spark_DataGridSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return DataGridSkin[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.minWidth = 89;
         this.minHeight = 84;
         this.mxmlContent = [this._DataGridSkin_VGroup1_c(),this._DataGridSkin_Rect2_i()];
         this.currentState = "normal";
         this._DataGridSkin_ClassFactory1_i();
         this._DataGridSkin_ClassFactory2_i();
         this._DataGridSkin_ClassFactory3_i();
         this._DataGridSkin_ClassFactory9_i();
         this._DataGridSkin_ClassFactory4_i();
         this._DataGridSkin_ClassFactory5_i();
         this._DataGridSkin_ClassFactory6_i();
         this._DataGridSkin_ClassFactory7_i();
         this._DataGridSkin_ClassFactory8_i();
         states = [new State({
            "name":"normal",
            "overrides":[]
         }),new State({
            "name":"disabled",
            "overrides":[new SetProperty().initializeFromObject({
               "name":"alpha",
               "value":0.5
            })]
         })];
         var_1 = 0;
         while(var_1 < bindings.length)
         {
            Binding(bindings[var_1]).execute();
            var_1++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         DataGridSkin._watcherSetupUtil = param1;
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
      
      override public function get contentItems() : Array
      {
         return contentFill;
      }
      
      override protected function initializationComplete() : void
      {
         useChromeColor = true;
         super.initializationComplete();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         if(getStyle("borderVisible") == true)
         {
            this.border.visible = true;
            this.background.left = this.background.top = this.background.right = this.background.bottom = 1;
            this.scroller.minViewportInset = 1;
         }
         else
         {
            this.border.visible = false;
            this.background.left = this.background.top = this.background.right = this.background.bottom = 0;
            this.scroller.minViewportInset = 0;
         }
         this.borderStroke.color = getStyle("borderColor");
         this.borderStroke.alpha = getStyle("borderAlpha");
         super.updateDisplayList(param1,param2);
      }
      
      private function _DataGridSkin_ClassFactory1_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = DataGridSkinInnerClass0;
         _loc1_.properties = {"outerDocument":this};
         this.alternatingRowColorsBackground = _loc1_;
         BindingManager.executeBindings(this,"alternatingRowColorsBackground",this.alternatingRowColorsBackground);
         return _loc1_;
      }
      
      private function _DataGridSkin_ClassFactory2_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = DataGridSkinInnerClass1;
         _loc1_.properties = {"outerDocument":this};
         this.caretIndicator = _loc1_;
         BindingManager.executeBindings(this,"caretIndicator",this.caretIndicator);
         return _loc1_;
      }
      
      private function _DataGridSkin_ClassFactory3_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = DataGridSkinInnerClass2;
         _loc1_.properties = {"outerDocument":this};
         this.columnSeparator = _loc1_;
         BindingManager.executeBindings(this,"columnSeparator",this.columnSeparator);
         return _loc1_;
      }
      
      private function _DataGridSkin_ClassFactory9_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = DataGridSkinInnerClass8;
         _loc1_.properties = {"outerDocument":this};
         this.editorIndicator = _loc1_;
         BindingManager.executeBindings(this,"editorIndicator",this.editorIndicator);
         return _loc1_;
      }
      
      private function _DataGridSkin_ClassFactory4_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = DataGridSkinInnerClass3;
         _loc1_.properties = {"outerDocument":this};
         this.headerColumnSeparator = _loc1_;
         BindingManager.executeBindings(this,"headerColumnSeparator",this.headerColumnSeparator);
         return _loc1_;
      }
      
      private function _DataGridSkin_ClassFactory5_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = DataGridSkinInnerClass4;
         _loc1_.properties = {"outerDocument":this};
         this.headerRenderer = _loc1_;
         BindingManager.executeBindings(this,"headerRenderer",this.headerRenderer);
         return _loc1_;
      }
      
      private function _DataGridSkin_ClassFactory6_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = DataGridSkinInnerClass5;
         _loc1_.properties = {"outerDocument":this};
         this.hoverIndicator = _loc1_;
         BindingManager.executeBindings(this,"hoverIndicator",this.hoverIndicator);
         return _loc1_;
      }
      
      private function _DataGridSkin_ClassFactory7_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = DataGridSkinInnerClass6;
         _loc1_.properties = {"outerDocument":this};
         this.rowSeparator = _loc1_;
         BindingManager.executeBindings(this,"rowSeparator",this.rowSeparator);
         return _loc1_;
      }
      
      private function _DataGridSkin_ClassFactory8_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = DataGridSkinInnerClass7;
         _loc1_.properties = {"outerDocument":this};
         this.selectionIndicator = _loc1_;
         BindingManager.executeBindings(this,"selectionIndicator",this.selectionIndicator);
         return _loc1_;
      }
      
      private function _DataGridSkin_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalAlign = "justify";
         _loc1_.gap = 0;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.mxmlContent = [this._DataGridSkin_GridColumnHeaderGroup1_i(),this._DataGridSkin_Group1_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DataGridSkin_GridColumnHeaderGroup1_i() : GridColumnHeaderGroup
      {
         var _loc1_:GridColumnHeaderGroup = new GridColumnHeaderGroup();
         _loc1_.minHeight = 21;
         _loc1_.setStyle("paddingLeft",1);
         _loc1_.setStyle("paddingTop",1);
         _loc1_.setStyle("paddingRight",1);
         _loc1_.id = "columnHeaderGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.columnHeaderGroup = _loc1_;
         BindingManager.executeBindings(this,"columnHeaderGroup",this.columnHeaderGroup);
         return _loc1_;
      }
      
      private function _DataGridSkin_Group1_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._DataGridSkin_Rect1_i(),this._DataGridSkin_VGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DataGridSkin_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.fill = this._DataGridSkin_SolidColor1_i();
         _loc1_.initialized(this,"background");
         this.background = _loc1_;
         BindingManager.executeBindings(this,"background",this.background);
         return _loc1_;
      }
      
      private function _DataGridSkin_SolidColor1_i() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         this.bgFill = _loc1_;
         BindingManager.executeBindings(this,"bgFill",this.bgFill);
         return _loc1_;
      }
      
      private function _DataGridSkin_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.horizontalAlign = "justify";
         _loc1_.percentHeight = 100;
         _loc1_.percentWidth = 100;
         _loc1_.gap = -1;
         _loc1_.mxmlContent = [this._DataGridSkin_Line1_i(),this._DataGridSkin_Scroller1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DataGridSkin_Line1_i() : Line
      {
         var _loc1_:Line = new Line();
         _loc1_.stroke = this._DataGridSkin_SolidColorStroke1_c();
         _loc1_.initialized(this,"headerSeparator");
         this.headerSeparator = _loc1_;
         BindingManager.executeBindings(this,"headerSeparator",this.headerSeparator);
         return _loc1_;
      }
      
      private function _DataGridSkin_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 6908265;
         _loc1_.weight = 1;
         _loc1_.caps = "square";
         return _loc1_;
      }
      
      private function _DataGridSkin_Scroller1_i() : Scroller
      {
         var _loc1_:Scroller = new Scroller();
         _loc1_.minViewportInset = 1;
         _loc1_.hasFocusableChildren = false;
         _loc1_.percentHeight = 100;
         _loc1_.viewport = this._DataGridSkin_Grid1_i();
         _loc1_.id = "scroller";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.scroller = _loc1_;
         BindingManager.executeBindings(this,"scroller",this.scroller);
         return _loc1_;
      }
      
      private function _DataGridSkin_Grid1_i() : Grid
      {
         var _loc1_:Grid = new Grid();
         _loc1_.itemRenderer = this._DataGridSkin_ClassFactory10_c();
         _loc1_.mxmlContent = [this._DataGridSkin_GridLayer1_c(),this._DataGridSkin_GridLayer2_c(),this._DataGridSkin_GridLayer3_c(),this._DataGridSkin_GridLayer4_c(),this._DataGridSkin_GridLayer5_c()];
         _loc1_.id = "grid";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.grid = _loc1_;
         BindingManager.executeBindings(this,"grid",this.grid);
         return _loc1_;
      }
      
      private function _DataGridSkin_ClassFactory10_c() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = DefaultGridItemRenderer;
         return _loc1_;
      }
      
      private function _DataGridSkin_GridLayer1_c() : GridLayer
      {
         var _loc1_:GridLayer = new GridLayer();
         _loc1_.name = "backgroundLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DataGridSkin_GridLayer2_c() : GridLayer
      {
         var _loc1_:GridLayer = new GridLayer();
         _loc1_.name = "selectionLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DataGridSkin_GridLayer3_c() : GridLayer
      {
         var _loc1_:GridLayer = new GridLayer();
         _loc1_.name = "editorIndicatorLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DataGridSkin_GridLayer4_c() : GridLayer
      {
         var _loc1_:GridLayer = new GridLayer();
         _loc1_.name = "rendererLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DataGridSkin_GridLayer5_c() : GridLayer
      {
         var _loc1_:GridLayer = new GridLayer();
         _loc1_.name = "overlayLayer";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DataGridSkin_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._DataGridSkin_SolidColorStroke2_i();
         _loc1_.initialized(this,"border");
         this.border = _loc1_;
         BindingManager.executeBindings(this,"border",this.border);
         return _loc1_;
      }
      
      private function _DataGridSkin_SolidColorStroke2_i() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.weight = 1;
         this.borderStroke = _loc1_;
         BindingManager.executeBindings(this,"borderStroke",this.borderStroke);
         return _loc1_;
      }
      
      private function _DataGridSkin_bindingsSetup() : Array
      {
         var _loc1_:* = [];
         _loc1_[0] = new Binding(this,null,null,"columnHeaderGroup.columnSeparator","headerColumnSeparator");
         _loc1_[1] = new Binding(this,null,null,"columnHeaderGroup.headerRenderer","headerRenderer");
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get alternatingRowColorsBackground() : ClassFactory
      {
         return this._1277490047alternatingRowColorsBackground;
      }
      
      public function set alternatingRowColorsBackground(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1277490047alternatingRowColorsBackground;
         if(_loc2_ !== param1)
         {
            this._1277490047alternatingRowColorsBackground = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"alternatingRowColorsBackground",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get background() : Rect
      {
         return this._1332194002background;
      }
      
      public function set background(param1:Rect) : void
      {
         var _loc2_:Object = this._1332194002background;
         if(_loc2_ !== param1)
         {
            this._1332194002background = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"background",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgFill() : SolidColor
      {
         return this._1391998104bgFill;
      }
      
      public function set bgFill(param1:SolidColor) : void
      {
         var _loc2_:Object = this._1391998104bgFill;
         if(_loc2_ !== param1)
         {
            this._1391998104bgFill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgFill",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get border() : Rect
      {
         return this._1383304148border;
      }
      
      public function set border(param1:Rect) : void
      {
         var _loc2_:Object = this._1383304148border;
         if(_loc2_ !== param1)
         {
            this._1383304148border = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"border",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get borderStroke() : SolidColorStroke
      {
         return this._1395787140borderStroke;
      }
      
      public function set borderStroke(param1:SolidColorStroke) : void
      {
         var _loc2_:Object = this._1395787140borderStroke;
         if(_loc2_ !== param1)
         {
            this._1395787140borderStroke = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"borderStroke",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get caretIndicator() : ClassFactory
      {
         return this._502679092caretIndicator;
      }
      
      public function set caretIndicator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._502679092caretIndicator;
         if(_loc2_ !== param1)
         {
            this._502679092caretIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"caretIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get columnHeaderGroup() : GridColumnHeaderGroup
      {
         return this._1482148164columnHeaderGroup;
      }
      
      public function set columnHeaderGroup(param1:GridColumnHeaderGroup) : void
      {
         var _loc2_:Object = this._1482148164columnHeaderGroup;
         if(_loc2_ !== param1)
         {
            this._1482148164columnHeaderGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"columnHeaderGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get columnSeparator() : ClassFactory
      {
         return this._237342767columnSeparator;
      }
      
      public function set columnSeparator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._237342767columnSeparator;
         if(_loc2_ !== param1)
         {
            this._237342767columnSeparator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"columnSeparator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get editorIndicator() : ClassFactory
      {
         return this._1555036382editorIndicator;
      }
      
      public function set editorIndicator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1555036382editorIndicator;
         if(_loc2_ !== param1)
         {
            this._1555036382editorIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"editorIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get grid() : Grid
      {
         return this._3181382grid;
      }
      
      public function set grid(param1:Grid) : void
      {
         var _loc2_:Object = this._3181382grid;
         if(_loc2_ !== param1)
         {
            this._3181382grid = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"grid",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get headerColumnSeparator() : ClassFactory
      {
         return this._1346001378headerColumnSeparator;
      }
      
      public function set headerColumnSeparator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1346001378headerColumnSeparator;
         if(_loc2_ !== param1)
         {
            this._1346001378headerColumnSeparator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headerColumnSeparator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get headerRenderer() : ClassFactory
      {
         return this._1027582576headerRenderer;
      }
      
      public function set headerRenderer(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1027582576headerRenderer;
         if(_loc2_ !== param1)
         {
            this._1027582576headerRenderer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headerRenderer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get headerSeparator() : Line
      {
         return this._1683467992headerSeparator;
      }
      
      public function set headerSeparator(param1:Line) : void
      {
         var _loc2_:Object = this._1683467992headerSeparator;
         if(_loc2_ !== param1)
         {
            this._1683467992headerSeparator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headerSeparator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hoverIndicator() : ClassFactory
      {
         return this._1933789133hoverIndicator;
      }
      
      public function set hoverIndicator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1933789133hoverIndicator;
         if(_loc2_ !== param1)
         {
            this._1933789133hoverIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hoverIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rowSeparator() : ClassFactory
      {
         return this._1763950123rowSeparator;
      }
      
      public function set rowSeparator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._1763950123rowSeparator;
         if(_loc2_ !== param1)
         {
            this._1763950123rowSeparator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rowSeparator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get scroller() : Scroller
      {
         return this._402164678scroller;
      }
      
      public function set scroller(param1:Scroller) : void
      {
         var _loc2_:Object = this._402164678scroller;
         if(_loc2_ !== param1)
         {
            this._402164678scroller = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"scroller",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get selectionIndicator() : ClassFactory
      {
         return this._627206627selectionIndicator;
      }
      
      public function set selectionIndicator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._627206627selectionIndicator;
         if(_loc2_ !== param1)
         {
            this._627206627selectionIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"selectionIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hostComponent() : DataGrid
      {
         return this._213507019hostComponent;
      }
      
      public function set hostComponent(param1:DataGrid) : void
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
