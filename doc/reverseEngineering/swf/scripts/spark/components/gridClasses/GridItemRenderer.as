package spark.components.gridClasses
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.core.IToolTip;
   import mx.core.IUIComponent;
   import mx.core.LayoutDirection;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.ToolTipEvent;
   import mx.managers.IToolTipManagerClient;
   import mx.managers.ToolTipManager;
   import mx.utils.PopUpUtil;
   import spark.components.Grid;
   import spark.components.Group;
   import spark.components.supportClasses.TextBase;
   
   public class GridItemRenderer extends Group implements IGridItemRenderer
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      private var setCurrentStateNeeded:Boolean = false;
      
      mx_internal var playTransitions:Boolean = false;
      
      private var _column:GridColumn = null;
      
      private var _data:Object = null;
      
      private var _down:Boolean = false;
      
      private var _hovered:Boolean = false;
      
      private var _rowIndex:int = -1;
      
      private var _showsCaret:Boolean = false;
      
      private var _selected:Boolean = false;
      
      private var _dragging:Boolean = false;
      
      private var _label:String = "";
      
      private var _labelDisplay:TextBase = null;
      
      public function GridItemRenderer()
      {
         super();
         this.setCurrentStateNeeded = true;
         accessibilityEnabled = false;
         addEventListener(ToolTipEvent.TOOL_TIP_SHOW,GridItemRenderer.mx_internal::toolTipShowHandler);
      }
      
      mx_internal static function initializeRendererToolTip(param1:IGridItemRenderer) : void
      {
         var _loc2_:IToolTipManagerClient = param1 as IToolTipManagerClient;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:Boolean = param1.rowIndex != -1 && Boolean(param1.column) && param1.column.mx_internal::getShowDataTips();
         var _loc4_:String;
         if(!(_loc4_ = _loc2_.toolTip) && _loc3_)
         {
            _loc2_.toolTip = "<dataTip>";
         }
         else if(Boolean(_loc4_) && !_loc3_)
         {
            _loc2_.toolTip = null;
         }
      }
      
      mx_internal static function toolTipShowHandler(param1:ToolTipEvent) : void
      {
         var _loc7_:* = false;
         var _loc2_:IToolTip = param1.toolTip;
         var _loc3_:IGridItemRenderer = param1.currentTarget as IGridItemRenderer;
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:IUIComponent;
         if(!(_loc4_ = param1.currentTarget as IUIComponent))
         {
            return;
         }
         var _loc5_:Rectangle = new Rectangle(_loc3_.getLayoutBoundsX(),_loc3_.getLayoutBoundsY(),_loc3_.getLayoutBoundsWidth(),_loc3_.getLayoutBoundsHeight());
         var _loc6_:Rectangle;
         if(_loc6_ = _loc3_.grid.scrollRect)
         {
            _loc5_ = _loc5_.intersection(_loc6_);
         }
         if(_loc5_.height == 0 || _loc5_.width == 0)
         {
            return;
         }
         _loc7_ = _loc3_.layoutDirection == LayoutDirection.RTL;
         _loc2_.text = _loc3_.column.itemToDataTip(_loc3_.data);
         ToolTipManager.mx_internal::sizeTip(_loc2_);
         var _loc8_:int = _loc7_ ? Number(_loc3_.width) - Number(_loc2_.width) : _loc5_.x - Number(_loc3_.getLayoutBoundsX());
         var _loc9_:int = _loc5_.y - Number(_loc3_.getLayoutBoundsY()) + (_loc5_.height - Number(_loc2_.height)) / 2;
         var _loc10_:Point = PopUpUtil.positionOverComponent(DisplayObject(_loc4_),_loc4_.systemManager,_loc2_.width,_loc2_.height,NaN,null,new Point(_loc8_,_loc9_));
         _loc2_.move(_loc10_.x,_loc10_.y);
      }
      
      private function dispatchChangeEvent(param1:String) : void
      {
         if(hasEventListener(param1))
         {
            dispatchEvent(new Event(param1));
         }
      }
      
      override public function get baselinePosition() : Number
      {
         if(!mx_internal::validateBaselinePosition() || !this.labelDisplay)
         {
            return super.baselinePosition;
         }
         var _loc1_:Point = globalToLocal(this.labelDisplay.parent.localToGlobal(new Point(this.labelDisplay.x,this.labelDisplay.y)));
         return _loc1_.y + this.labelDisplay.baselinePosition;
      }
      
      [Bindable("columnChanged")]
      public function get column() : GridColumn
      {
         return this._column;
      }
      
      public function set column(param1:GridColumn) : void
      {
         if(this._column == param1)
         {
            return;
         }
         this._column = param1;
         this.dispatchChangeEvent("columnChanged");
      }
      
      public function get columnIndex() : int
      {
         return !!this.column ? this.column.columnIndex : -1;
      }
      
      [Bindable("dataChange")]
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         if(this._data == param1)
         {
            return;
         }
         this._data = param1;
         if(hasEventListener("dataChange"))
         {
            dispatchEvent(new FlexEvent("dataChange"));
         }
      }
      
      public function get down() : Boolean
      {
         return this._down;
      }
      
      public function set down(param1:Boolean) : void
      {
         if(param1 == this._down)
         {
            return;
         }
         this._down = param1;
         setCurrentState(this.getCurrentRendererState(),this.mx_internal::playTransitions);
      }
      
      public function get grid() : Grid
      {
         return !!this.column ? this.column.grid : null;
      }
      
      public function get hovered() : Boolean
      {
         return this._hovered;
      }
      
      public function set hovered(param1:Boolean) : void
      {
         if(param1 == this._hovered)
         {
            return;
         }
         this._hovered = param1;
         setCurrentState(this.getCurrentRendererState(),this.mx_internal::playTransitions);
      }
      
      [Bindable("rowIndexChanged")]
      public function get rowIndex() : int
      {
         return this._rowIndex;
      }
      
      public function set rowIndex(param1:int) : void
      {
         if(this._rowIndex == param1)
         {
            return;
         }
         this._rowIndex = param1;
         this.dispatchChangeEvent("rowIndexChanged");
      }
      
      [Bindable("showsCaretChanged")]
      public function get showsCaret() : Boolean
      {
         return this._showsCaret;
      }
      
      public function set showsCaret(param1:Boolean) : void
      {
         if(this._showsCaret == param1)
         {
            return;
         }
         this._showsCaret = param1;
         setCurrentState(this.getCurrentRendererState(),this.mx_internal::playTransitions);
         this.dispatchChangeEvent("labelDisplayChanged");
      }
      
      [Bindable("selectedChanged")]
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         if(this._selected == param1)
         {
            return;
         }
         this._selected = param1;
         setCurrentState(this.getCurrentRendererState(),this.mx_internal::playTransitions);
         this.dispatchChangeEvent("selectedChanged");
      }
      
      [Bindable("draggingChanged")]
      public function get dragging() : Boolean
      {
         return this._dragging;
      }
      
      public function set dragging(param1:Boolean) : void
      {
         if(this._dragging == param1)
         {
            return;
         }
         this._dragging = param1;
         setCurrentState(this.getCurrentRendererState(),this.mx_internal::playTransitions);
         this.dispatchChangeEvent("draggingChanged");
      }
      
      [Bindable("labelChanged")]
      public function get label() : String
      {
         return this._label;
      }
      
      public function set label(param1:String) : void
      {
         if(this._label == param1)
         {
            return;
         }
         this._label = param1;
         if(this.labelDisplay)
         {
            this.labelDisplay.text = this._label;
         }
         this.dispatchChangeEvent("labelChanged");
      }
      
      [Bindable("labelDisplayChanged")]
      public function get labelDisplay() : TextBase
      {
         return this._labelDisplay;
      }
      
      public function set labelDisplay(param1:TextBase) : void
      {
         if(this._labelDisplay == param1)
         {
            return;
         }
         this._labelDisplay = param1;
         this.dispatchChangeEvent("labelDisplayChanged");
      }
      
      protected function getCurrentRendererState() : String
      {
         if(this.dragging && hasState("dragging"))
         {
            return "dragging";
         }
         if(this.selected && this.down && hasState("downAndSelected"))
         {
            return "downAndSelected";
         }
         if(this.selected && this.showsCaret && hasState("selectedAndShowsCaret"))
         {
            return "selectedAndShowsCaret";
         }
         if(this.hovered && this.showsCaret && hasState("hoveredAndShowsCaret"))
         {
            return "hoveredAndShowsCaret";
         }
         if(this.showsCaret && hasState("normalAndShowsCaret"))
         {
            return "normalAndShowsCaret";
         }
         if(this.down && hasState("down"))
         {
            return "down";
         }
         if(this.selected && hasState("selected"))
         {
            return "selected";
         }
         if(this.hovered && hasState("hovered"))
         {
            return "hovered";
         }
         if(hasState("normal"))
         {
            return "normal";
         }
         return null;
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(this.setCurrentStateNeeded)
         {
            setCurrentState(this.getCurrentRendererState(),this.mx_internal::playTransitions);
            this.setCurrentStateNeeded = false;
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(width,height);
         mx_internal::initializeRendererToolTip(this);
      }
      
      public function prepare(param1:Boolean) : void
      {
      }
      
      public function discard(param1:Boolean) : void
      {
      }
   }
}
