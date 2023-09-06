package spark.skins.spark
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.geom.ColorTransform;
   import mx.binding.BindingManager;
   import mx.core.ClassFactory;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFactory;
   import mx.core.IFlexModuleFactory;
   import mx.core.IStateClient2;
   import mx.core.IVisualElement;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.GradientEntry;
   import mx.graphics.LinearGradient;
   import mx.graphics.LinearGradientStroke;
   import mx.states.AddItems;
   import mx.states.SetProperty;
   import mx.states.State;
   import spark.components.DataGrid;
   import spark.components.GridColumnHeaderGroup;
   import spark.components.Group;
   import spark.components.HGroup;
   import spark.components.Label;
   import spark.components.gridClasses.GridColumn;
   import spark.components.gridClasses.GridItemRenderer;
   import spark.components.gridClasses.IGridVisualElement;
   import spark.primitives.Rect;
   import spark.primitives.supportClasses.GraphicElement;
   
   public class DefaultGridHeaderRenderer extends GridItemRenderer implements IStateClient2
   {
      
      private static const DEFAULT_COLOR_VALUE:uint = 204;
      
      private static const DEFAULT_COLOR:uint = 13421772;
      
      private static const DEFAULT_SYMBOL_COLOR:uint = 0;
      
      private static var colorTransform:ColorTransform = new ColorTransform();
       
      
      private var _1552947018_DefaultGridHeaderRenderer_GradientEntry1:GradientEntry;
      
      private var _896717253_DefaultGridHeaderRenderer_GradientEntry11:GradientEntry;
      
      private var _896717252_DefaultGridHeaderRenderer_GradientEntry12:GradientEntry;
      
      private var _1552947017_DefaultGridHeaderRenderer_GradientEntry2:GradientEntry;
      
      private var _1552947016_DefaultGridHeaderRenderer_GradientEntry3:GradientEntry;
      
      private var _1552947015_DefaultGridHeaderRenderer_GradientEntry4:GradientEntry;
      
      private var _1552947011_DefaultGridHeaderRenderer_GradientEntry8:GradientEntry;
      
      private var _1552947010_DefaultGridHeaderRenderer_GradientEntry9:GradientEntry;
      
      private var _783637168defaultSortIndicator:ClassFactory;
      
      private var _3143043fill:Rect;
      
      private var _681210700highlight:Rect;
      
      private var _1507289076highlightStroke:Rect;
      
      private var _1472494227hldownstroke1:Rect;
      
      private var _1472494228hldownstroke2:Rect;
      
      private var _175381489labelDisplayGroup:Group;
      
      private var _1811511742lowlight:Rect;
      
      private var _903579360shadow:Rect;
      
      private var _668643602sortIndicatorGroup:Group;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _maxDisplayedLines:int = 1;
      
      private var _sortIndicator:IFactory;
      
      private var sortIndicatorInstance:IVisualElement;
      
      private var chromeColorChanged:Boolean = false;
      
      private var colorized:Boolean = false;
      
      public function DefaultGridHeaderRenderer()
      {
         super();
         mx_internal::_document = this;
         this.minWidth = 21;
         this.minHeight = 21;
         this.mxmlContent = [this._DefaultGridHeaderRenderer_Rect1_i(),this._DefaultGridHeaderRenderer_Rect2_i(),this._DefaultGridHeaderRenderer_Rect3_i(),this._DefaultGridHeaderRenderer_Rect4_i(),this._DefaultGridHeaderRenderer_HGroup1_c()];
         this.currentState = "normal";
         this._DefaultGridHeaderRenderer_ClassFactory1_i();
         this._DefaultGridHeaderRenderer_Label1_i();
         var _loc1_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._DefaultGridHeaderRenderer_Rect5_i);
         var _loc2_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._DefaultGridHeaderRenderer_Rect6_i);
         var _loc3_:DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this._DefaultGridHeaderRenderer_Rect7_i);
         states = [new State({
            "name":"normal",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["highlight"]
            })]
         }),new State({
            "name":"hovered",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc1_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["highlight"]
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultGridHeaderRenderer_GradientEntry3",
               "name":"color",
               "value":12303805
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultGridHeaderRenderer_GradientEntry4",
               "name":"color",
               "value":10461345
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultGridHeaderRenderer_GradientEntry8",
               "name":"alpha",
               "value":0.22
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultGridHeaderRenderer_GradientEntry9",
               "name":"alpha",
               "value":0.22
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultGridHeaderRenderer_GradientEntry11",
               "name":"alpha",
               "value":0.22
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultGridHeaderRenderer_GradientEntry12",
               "name":"alpha",
               "value":0.22
            })]
         }),new State({
            "name":"down",
            "overrides":[new AddItems().initializeFromObject({
               "itemsFactory":_loc3_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["highlight"]
            }),new AddItems().initializeFromObject({
               "itemsFactory":_loc2_,
               "destination":null,
               "propertyName":"mxmlContent",
               "position":"after",
               "relativeTo":["highlight"]
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultGridHeaderRenderer_GradientEntry1",
               "name":"color",
               "value":16777215
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultGridHeaderRenderer_GradientEntry1",
               "name":"alpha",
               "value":0
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultGridHeaderRenderer_GradientEntry2",
               "name":"color",
               "value":16777215
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultGridHeaderRenderer_GradientEntry2",
               "name":"alpha",
               "value":0.5
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultGridHeaderRenderer_GradientEntry3",
               "name":"color",
               "value":11184810
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultGridHeaderRenderer_GradientEntry4",
               "name":"color",
               "value":9606294
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultGridHeaderRenderer_GradientEntry8",
               "name":"alpha",
               "value":0.12
            }),new SetProperty().initializeFromObject({
               "target":"_DefaultGridHeaderRenderer_GradientEntry9",
               "name":"alpha",
               "value":0.12
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
      
      private function dispatchChangeEvent(param1:String) : void
      {
         if(hasEventListener(param1))
         {
            dispatchEvent(new Event(param1));
         }
      }
      
      [Bindable("maxDisplayedLinesChanged")]
      public function get maxDisplayedLines() : int
      {
         return this._maxDisplayedLines;
      }
      
      public function set maxDisplayedLines(param1:int) : void
      {
         if(param1 == this._maxDisplayedLines)
         {
            return;
         }
         this._maxDisplayedLines = param1;
         if(labelDisplay)
         {
            labelDisplay.maxDisplayedLines = param1;
         }
         invalidateSize();
         invalidateDisplayList();
         this.dispatchChangeEvent("maxDisplayedLinesChanged");
      }
      
      [Bindable("sortIndicatorChanged")]
      public function get sortIndicator() : IFactory
      {
         return !!this._sortIndicator ? this._sortIndicator : this.defaultSortIndicator;
      }
      
      public function set sortIndicator(param1:IFactory) : void
      {
         if(this._sortIndicator == param1)
         {
            return;
         }
         this._sortIndicator = param1;
         if(this.sortIndicatorInstance)
         {
            this.sortIndicatorGroup.includeInLayout = false;
            this.sortIndicatorGroup.removeElement(this.sortIndicatorInstance);
            this.sortIndicatorInstance = null;
         }
         invalidateDisplayList();
         this.dispatchChangeEvent("sortIndicatorChanged");
      }
      
      override public function prepare(param1:Boolean) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         super.prepare(param1);
         if(labelDisplay && this.labelDisplayGroup && labelDisplay.parent != this.labelDisplayGroup)
         {
            this.labelDisplayGroup.removeAllElements();
            this.labelDisplayGroup.addElement(labelDisplay);
         }
         var _loc2_:GridColumn = this.column;
         if(this.sortIndicator && _loc2_ && _loc2_.grid && _loc2_.grid.dataGrid && Boolean(_loc2_.grid.dataGrid.columnHeaderGroup))
         {
            _loc3_ = _loc2_.grid.dataGrid;
            if((_loc4_ = _loc3_.columnHeaderGroup).isSortIndicatorVisible(_loc2_.columnIndex))
            {
               if(!this.sortIndicatorInstance)
               {
                  this.sortIndicatorInstance = this.sortIndicator.newInstance();
                  this.sortIndicatorGroup.addElement(this.sortIndicatorInstance);
                  this.chromeColorChanged = true;
                  invalidateDisplayList();
               }
               this.sortIndicatorInstance.visible = true;
               if(_loc5_ = this.sortIndicatorInstance as IGridVisualElement)
               {
                  _loc5_.prepareGridVisualElement(_loc2_.grid,-1,_loc2_.columnIndex);
               }
               this.sortIndicatorGroup.includeInLayout = true;
               this.sortIndicatorGroup.scaleY = _loc2_.sortDescending ? 1 : -1;
            }
            else if(this.sortIndicatorInstance)
            {
               this.sortIndicatorGroup.removeElement(this.sortIndicatorInstance);
               this.sortIndicatorGroup.includeInLayout = false;
               this.sortIndicatorInstance = null;
            }
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:* = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         if(this.chromeColorChanged)
         {
            _loc3_ = getStyle("chromeColor");
            if(_loc3_ != DEFAULT_COLOR || this.colorized)
            {
               colorTransform.redOffset = ((_loc3_ & 16711680) >> 16) - DEFAULT_COLOR_VALUE;
               colorTransform.greenOffset = ((_loc3_ & 65280) >> 8) - DEFAULT_COLOR_VALUE;
               colorTransform.blueOffset = (_loc3_ & 255) - DEFAULT_COLOR_VALUE;
               colorTransform.alphaMultiplier = alpha;
               transform.colorTransform = colorTransform;
               if((Boolean(_loc4_ = [labelDisplay,this.sortIndicatorInstance])) && _loc4_.length > 0)
               {
                  colorTransform.redOffset = 0;
                  colorTransform.greenOffset = 0;
                  colorTransform.blueOffset = 0;
                  _loc5_ = 0;
                  while(_loc5_ < _loc4_.length)
                  {
                     if((Boolean(_loc6_ = _loc4_[_loc5_])) && (_loc6_ is DisplayObject || _loc6_ is GraphicElement))
                     {
                        colorTransform.alphaMultiplier = _loc6_.alpha;
                        _loc6_.transform.colorTransform = colorTransform;
                     }
                     _loc5_++;
                  }
               }
               this.colorized = true;
            }
            this.chromeColorChanged = false;
         }
         super.updateDisplayList(param1,param2);
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc2_:Boolean = !param1 || param1 == "styleName";
         super.styleChanged(param1);
         if(_loc2_ || param1 == "chromeColor")
         {
            this.chromeColorChanged = true;
            invalidateDisplayList();
         }
      }
      
      private function _DefaultGridHeaderRenderer_ClassFactory1_i() : ClassFactory
      {
         var _loc1_:ClassFactory = new ClassFactory();
         _loc1_.generator = DefaultGridHeaderRendererInnerClass0;
         _loc1_.properties = {"outerDocument":this};
         this.defaultSortIndicator = _loc1_;
         BindingManager.executeBindings(this,"defaultSortIndicator",this.defaultSortIndicator);
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.verticalCenter = 1;
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.maxDisplayedLines = 1;
         _loc1_.showTruncationTip = true;
         _loc1_.setStyle("textAlign","start");
         _loc1_.setStyle("fontWeight","bold");
         _loc1_.setStyle("verticalAlign","middle");
         _loc1_.id = "labelDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         labelDisplay = _loc1_;
         BindingManager.executeBindings(this,"labelDisplay",labelDisplay);
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_Rect1_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = -1;
         _loc1_.right = -1;
         _loc1_.top = -1;
         _loc1_.bottom = -1;
         _loc1_.radiusX = 2;
         _loc1_.fill = this._DefaultGridHeaderRenderer_LinearGradient1_c();
         _loc1_.initialized(this,"shadow");
         this.shadow = _loc1_;
         BindingManager.executeBindings(this,"shadow",this.shadow);
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_LinearGradient1_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._DefaultGridHeaderRenderer_GradientEntry1_i(),this._DefaultGridHeaderRenderer_GradientEntry2_i()];
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_GradientEntry1_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.01;
         this._DefaultGridHeaderRenderer_GradientEntry1 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultGridHeaderRenderer_GradientEntry1",this._DefaultGridHeaderRenderer_GradientEntry1);
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_GradientEntry2_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.07;
         this._DefaultGridHeaderRenderer_GradientEntry2 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultGridHeaderRenderer_GradientEntry2",this._DefaultGridHeaderRenderer_GradientEntry2);
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_Rect2_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._DefaultGridHeaderRenderer_LinearGradient2_c();
         _loc1_.initialized(this,"fill");
         this.fill = _loc1_;
         BindingManager.executeBindings(this,"fill",this.fill);
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_LinearGradient2_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._DefaultGridHeaderRenderer_GradientEntry3_i(),this._DefaultGridHeaderRenderer_GradientEntry4_i()];
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_GradientEntry3_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         _loc1_.alpha = 0.85;
         this._DefaultGridHeaderRenderer_GradientEntry3 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultGridHeaderRenderer_GradientEntry3",this._DefaultGridHeaderRenderer_GradientEntry3);
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_GradientEntry4_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 14211288;
         _loc1_.alpha = 0.85;
         this._DefaultGridHeaderRenderer_GradientEntry4 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultGridHeaderRenderer_GradientEntry4",this._DefaultGridHeaderRenderer_GradientEntry4);
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_Rect3_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._DefaultGridHeaderRenderer_LinearGradient3_c();
         _loc1_.initialized(this,"lowlight");
         this.lowlight = _loc1_;
         BindingManager.executeBindings(this,"lowlight",this.lowlight);
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_LinearGradient3_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 270;
         _loc1_.entries = [this._DefaultGridHeaderRenderer_GradientEntry5_c(),this._DefaultGridHeaderRenderer_GradientEntry6_c(),this._DefaultGridHeaderRenderer_GradientEntry7_c()];
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_GradientEntry5_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.ratio = 0;
         _loc1_.alpha = 0.0627;
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_GradientEntry6_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.ratio = 0.48;
         _loc1_.alpha = 0.0099;
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_GradientEntry7_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.ratio = 0.48001;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_Rect4_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.fill = this._DefaultGridHeaderRenderer_LinearGradient4_c();
         _loc1_.initialized(this,"highlight");
         this.highlight = _loc1_;
         BindingManager.executeBindings(this,"highlight",this.highlight);
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_LinearGradient4_c() : LinearGradient
      {
         var _loc1_:LinearGradient = new LinearGradient();
         _loc1_.rotation = 90;
         _loc1_.entries = [this._DefaultGridHeaderRenderer_GradientEntry8_i(),this._DefaultGridHeaderRenderer_GradientEntry9_i(),this._DefaultGridHeaderRenderer_GradientEntry10_c()];
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_GradientEntry8_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         _loc1_.ratio = 0;
         _loc1_.alpha = 0.33;
         this._DefaultGridHeaderRenderer_GradientEntry8 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultGridHeaderRenderer_GradientEntry8",this._DefaultGridHeaderRenderer_GradientEntry8);
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_GradientEntry9_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         _loc1_.ratio = 0.48;
         _loc1_.alpha = 0.33;
         this._DefaultGridHeaderRenderer_GradientEntry9 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultGridHeaderRenderer_GradientEntry9",this._DefaultGridHeaderRenderer_GradientEntry9);
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_GradientEntry10_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         _loc1_.ratio = 0.48001;
         _loc1_.alpha = 0;
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_Rect5_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._DefaultGridHeaderRenderer_LinearGradientStroke1_c();
         _loc1_.initialized(this,"highlightStroke");
         this.highlightStroke = _loc1_;
         BindingManager.executeBindings(this,"highlightStroke",this.highlightStroke);
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_LinearGradientStroke1_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.weight = 1;
         _loc1_.entries = [this._DefaultGridHeaderRenderer_GradientEntry11_i(),this._DefaultGridHeaderRenderer_GradientEntry12_i()];
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_GradientEntry11_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 16777215;
         this._DefaultGridHeaderRenderer_GradientEntry11 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultGridHeaderRenderer_GradientEntry11",this._DefaultGridHeaderRenderer_GradientEntry11);
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_GradientEntry12_i() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 14211288;
         this._DefaultGridHeaderRenderer_GradientEntry12 = _loc1_;
         BindingManager.executeBindings(this,"_DefaultGridHeaderRenderer_GradientEntry12",this._DefaultGridHeaderRenderer_GradientEntry12);
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_Rect6_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.stroke = this._DefaultGridHeaderRenderer_LinearGradientStroke2_c();
         _loc1_.initialized(this,"hldownstroke1");
         this.hldownstroke1 = _loc1_;
         BindingManager.executeBindings(this,"hldownstroke1",this.hldownstroke1);
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_LinearGradientStroke2_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.weight = 1;
         _loc1_.entries = [this._DefaultGridHeaderRenderer_GradientEntry13_c(),this._DefaultGridHeaderRenderer_GradientEntry14_c(),this._DefaultGridHeaderRenderer_GradientEntry15_c(),this._DefaultGridHeaderRenderer_GradientEntry16_c(),this._DefaultGridHeaderRenderer_GradientEntry17_c()];
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_GradientEntry13_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.25;
         _loc1_.ratio = 0;
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_GradientEntry14_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.25;
         _loc1_.ratio = 0.001;
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_GradientEntry15_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.07;
         _loc1_.ratio = 0.0011;
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_GradientEntry16_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.07;
         _loc1_.ratio = 0.965;
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_GradientEntry17_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0;
         _loc1_.ratio = 0.9651;
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_Rect7_i() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 1;
         _loc1_.right = 1;
         _loc1_.top = 1;
         _loc1_.bottom = 1;
         _loc1_.stroke = this._DefaultGridHeaderRenderer_LinearGradientStroke3_c();
         _loc1_.initialized(this,"hldownstroke2");
         this.hldownstroke2 = _loc1_;
         BindingManager.executeBindings(this,"hldownstroke2",this.hldownstroke2);
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_LinearGradientStroke3_c() : LinearGradientStroke
      {
         var _loc1_:LinearGradientStroke = new LinearGradientStroke();
         _loc1_.rotation = 90;
         _loc1_.weight = 1;
         _loc1_.entries = [this._DefaultGridHeaderRenderer_GradientEntry18_c(),this._DefaultGridHeaderRenderer_GradientEntry19_c()];
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_GradientEntry18_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0.09;
         _loc1_.ratio = 0;
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_GradientEntry19_c() : GradientEntry
      {
         var _loc1_:GradientEntry = new GradientEntry();
         _loc1_.color = 0;
         _loc1_.alpha = 0;
         _loc1_.ratio = 0.0001;
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_HGroup1_c() : HGroup
      {
         var _loc1_:HGroup = new HGroup();
         _loc1_.left = 7;
         _loc1_.right = 7;
         _loc1_.top = 5;
         _loc1_.bottom = 5;
         _loc1_.gap = 2;
         _loc1_.verticalAlign = "middle";
         _loc1_.mxmlContent = [this._DefaultGridHeaderRenderer_Group1_i(),this._DefaultGridHeaderRenderer_Group2_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_Group1_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.id = "labelDisplayGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.labelDisplayGroup = _loc1_;
         BindingManager.executeBindings(this,"labelDisplayGroup",this.labelDisplayGroup);
         return _loc1_;
      }
      
      private function _DefaultGridHeaderRenderer_Group2_i() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.includeInLayout = false;
         _loc1_.id = "sortIndicatorGroup";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sortIndicatorGroup = _loc1_;
         BindingManager.executeBindings(this,"sortIndicatorGroup",this.sortIndicatorGroup);
         return _loc1_;
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultGridHeaderRenderer_GradientEntry1() : GradientEntry
      {
         return this._1552947018_DefaultGridHeaderRenderer_GradientEntry1;
      }
      
      public function set _DefaultGridHeaderRenderer_GradientEntry1(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1552947018_DefaultGridHeaderRenderer_GradientEntry1;
         if(_loc2_ !== param1)
         {
            this._1552947018_DefaultGridHeaderRenderer_GradientEntry1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultGridHeaderRenderer_GradientEntry1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultGridHeaderRenderer_GradientEntry11() : GradientEntry
      {
         return this._896717253_DefaultGridHeaderRenderer_GradientEntry11;
      }
      
      public function set _DefaultGridHeaderRenderer_GradientEntry11(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._896717253_DefaultGridHeaderRenderer_GradientEntry11;
         if(_loc2_ !== param1)
         {
            this._896717253_DefaultGridHeaderRenderer_GradientEntry11 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultGridHeaderRenderer_GradientEntry11",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultGridHeaderRenderer_GradientEntry12() : GradientEntry
      {
         return this._896717252_DefaultGridHeaderRenderer_GradientEntry12;
      }
      
      public function set _DefaultGridHeaderRenderer_GradientEntry12(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._896717252_DefaultGridHeaderRenderer_GradientEntry12;
         if(_loc2_ !== param1)
         {
            this._896717252_DefaultGridHeaderRenderer_GradientEntry12 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultGridHeaderRenderer_GradientEntry12",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultGridHeaderRenderer_GradientEntry2() : GradientEntry
      {
         return this._1552947017_DefaultGridHeaderRenderer_GradientEntry2;
      }
      
      public function set _DefaultGridHeaderRenderer_GradientEntry2(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1552947017_DefaultGridHeaderRenderer_GradientEntry2;
         if(_loc2_ !== param1)
         {
            this._1552947017_DefaultGridHeaderRenderer_GradientEntry2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultGridHeaderRenderer_GradientEntry2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultGridHeaderRenderer_GradientEntry3() : GradientEntry
      {
         return this._1552947016_DefaultGridHeaderRenderer_GradientEntry3;
      }
      
      public function set _DefaultGridHeaderRenderer_GradientEntry3(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1552947016_DefaultGridHeaderRenderer_GradientEntry3;
         if(_loc2_ !== param1)
         {
            this._1552947016_DefaultGridHeaderRenderer_GradientEntry3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultGridHeaderRenderer_GradientEntry3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultGridHeaderRenderer_GradientEntry4() : GradientEntry
      {
         return this._1552947015_DefaultGridHeaderRenderer_GradientEntry4;
      }
      
      public function set _DefaultGridHeaderRenderer_GradientEntry4(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1552947015_DefaultGridHeaderRenderer_GradientEntry4;
         if(_loc2_ !== param1)
         {
            this._1552947015_DefaultGridHeaderRenderer_GradientEntry4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultGridHeaderRenderer_GradientEntry4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultGridHeaderRenderer_GradientEntry8() : GradientEntry
      {
         return this._1552947011_DefaultGridHeaderRenderer_GradientEntry8;
      }
      
      public function set _DefaultGridHeaderRenderer_GradientEntry8(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1552947011_DefaultGridHeaderRenderer_GradientEntry8;
         if(_loc2_ !== param1)
         {
            this._1552947011_DefaultGridHeaderRenderer_GradientEntry8 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultGridHeaderRenderer_GradientEntry8",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _DefaultGridHeaderRenderer_GradientEntry9() : GradientEntry
      {
         return this._1552947010_DefaultGridHeaderRenderer_GradientEntry9;
      }
      
      public function set _DefaultGridHeaderRenderer_GradientEntry9(param1:GradientEntry) : void
      {
         var _loc2_:Object = this._1552947010_DefaultGridHeaderRenderer_GradientEntry9;
         if(_loc2_ !== param1)
         {
            this._1552947010_DefaultGridHeaderRenderer_GradientEntry9 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_DefaultGridHeaderRenderer_GradientEntry9",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get defaultSortIndicator() : ClassFactory
      {
         return this._783637168defaultSortIndicator;
      }
      
      public function set defaultSortIndicator(param1:ClassFactory) : void
      {
         var _loc2_:Object = this._783637168defaultSortIndicator;
         if(_loc2_ !== param1)
         {
            this._783637168defaultSortIndicator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"defaultSortIndicator",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get fill() : Rect
      {
         return this._3143043fill;
      }
      
      public function set fill(param1:Rect) : void
      {
         var _loc2_:Object = this._3143043fill;
         if(_loc2_ !== param1)
         {
            this._3143043fill = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"fill",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get highlight() : Rect
      {
         return this._681210700highlight;
      }
      
      public function set highlight(param1:Rect) : void
      {
         var _loc2_:Object = this._681210700highlight;
         if(_loc2_ !== param1)
         {
            this._681210700highlight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"highlight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get highlightStroke() : Rect
      {
         return this._1507289076highlightStroke;
      }
      
      public function set highlightStroke(param1:Rect) : void
      {
         var _loc2_:Object = this._1507289076highlightStroke;
         if(_loc2_ !== param1)
         {
            this._1507289076highlightStroke = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"highlightStroke",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hldownstroke1() : Rect
      {
         return this._1472494227hldownstroke1;
      }
      
      public function set hldownstroke1(param1:Rect) : void
      {
         var _loc2_:Object = this._1472494227hldownstroke1;
         if(_loc2_ !== param1)
         {
            this._1472494227hldownstroke1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hldownstroke1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get hldownstroke2() : Rect
      {
         return this._1472494228hldownstroke2;
      }
      
      public function set hldownstroke2(param1:Rect) : void
      {
         var _loc2_:Object = this._1472494228hldownstroke2;
         if(_loc2_ !== param1)
         {
            this._1472494228hldownstroke2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"hldownstroke2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get labelDisplayGroup() : Group
      {
         return this._175381489labelDisplayGroup;
      }
      
      public function set labelDisplayGroup(param1:Group) : void
      {
         var _loc2_:Object = this._175381489labelDisplayGroup;
         if(_loc2_ !== param1)
         {
            this._175381489labelDisplayGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"labelDisplayGroup",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lowlight() : Rect
      {
         return this._1811511742lowlight;
      }
      
      public function set lowlight(param1:Rect) : void
      {
         var _loc2_:Object = this._1811511742lowlight;
         if(_loc2_ !== param1)
         {
            this._1811511742lowlight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lowlight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get shadow() : Rect
      {
         return this._903579360shadow;
      }
      
      public function set shadow(param1:Rect) : void
      {
         var _loc2_:Object = this._903579360shadow;
         if(_loc2_ !== param1)
         {
            this._903579360shadow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"shadow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sortIndicatorGroup() : Group
      {
         return this._668643602sortIndicatorGroup;
      }
      
      public function set sortIndicatorGroup(param1:Group) : void
      {
         var _loc2_:Object = this._668643602sortIndicatorGroup;
         if(_loc2_ !== param1)
         {
            this._668643602sortIndicatorGroup = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sortIndicatorGroup",_loc2_,param1));
            }
         }
      }
   }
}
