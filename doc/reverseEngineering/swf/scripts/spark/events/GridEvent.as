package spark.events
{
   import flash.display.InteractiveObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.core.mx_internal;
   import spark.components.Grid;
   import spark.components.gridClasses.GridColumn;
   import spark.components.gridClasses.IDataGridElement;
   import spark.components.gridClasses.IGridItemRenderer;
   
   public class GridEvent extends MouseEvent
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      public static const GRID_MOUSE_DOWN:String = "gridMouseDown";
      
      public static const GRID_MOUSE_DRAG:String = "gridMouseDrag";
      
      public static const GRID_MOUSE_UP:String = "gridMouseUp";
      
      public static const GRID_CLICK:String = "gridClick";
      
      public static const GRID_DOUBLE_CLICK:String = "gridDoubleClick";
      
      public static const GRID_ROLL_OVER:String = "gridRollOver";
      
      public static const GRID_ROLL_OUT:String = "gridRollOut";
      
      public static const SEPARATOR_MOUSE_DRAG:String = "separatorMouseDrag";
      
      public static const SEPARATOR_CLICK:String = "separatorClick";
      
      public static const SEPARATOR_DOUBLE_CLICK:String = "separatorDoubleClick";
      
      public static const SEPARATOR_MOUSE_DOWN:String = "separatorMouseDown";
      
      public static const SEPARATOR_MOUSE_UP:String = "separatorMouseUp";
      
      public static const SEPARATOR_ROLL_OUT:String = "separatorRollOut";
      
      public static const SEPARATOR_ROLL_OVER:String = "separatorRollOver";
       
      
      public var rowIndex:int;
      
      public var columnIndex:int;
      
      public var column:GridColumn;
      
      public var item:Object;
      
      public var itemRenderer:IGridItemRenderer;
      
      public function GridEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Number = NaN, param5:Number = NaN, param6:InteractiveObject = null, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:int = 0, param12:int = -1, param13:int = -1, param14:GridColumn = null, param15:Object = null, param16:IGridItemRenderer = null)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         this.rowIndex = param12;
         this.columnIndex = param13;
         this.column = param14;
         this.item = param15;
         this.itemRenderer = param16;
      }
      
      public function get grid() : Grid
      {
         if(this.column)
         {
            return this.column.grid;
         }
         if(target is Grid)
         {
            return Grid(target);
         }
         var _loc1_:IDataGridElement = target as IDataGridElement;
         if(Boolean(_loc1_) && Boolean(_loc1_.dataGrid))
         {
            return _loc1_.dataGrid.grid;
         }
         return null;
      }
      
      override public function clone() : Event
      {
         var _loc1_:GridEvent = new GridEvent(type,bubbles,cancelable,localX,localY,relatedObject,ctrlKey,altKey,shiftKey,buttonDown,delta,this.rowIndex,this.columnIndex,this.column,this.item,this.itemRenderer);
         _loc1_.relatedObject = this.relatedObject;
         return _loc1_;
      }
      
      override public function toString() : String
      {
         return "GridEvent{type=\"" + type + "\"" + " localX,Y=" + localX + "," + localY + " rowIndex,columnIndex=" + this.rowIndex + "," + this.columnIndex + "}";
      }
   }
}
