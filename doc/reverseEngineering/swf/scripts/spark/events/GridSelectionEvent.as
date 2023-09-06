package spark.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   import spark.components.gridClasses.CellRegion;
   
   public class GridSelectionEvent extends Event
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      public static const SELECTION_CHANGE:String = "selectionChange";
      
      public static const SELECTION_CHANGING:String = "selectionChanging";
       
      
      public var kind:String;
      
      public var selectionChange:CellRegion;
      
      public function GridSelectionEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:String = null, param5:CellRegion = null)
      {
         super(param1,param2,param3);
         this.kind = param4;
         this.selectionChange = param5;
      }
      
      override public function toString() : String
      {
         return formatToString("GridSelectionEvent","type","bubbles","cancelable","eventPhase","kind","selectionChange");
      }
      
      override public function clone() : Event
      {
         return new GridSelectionEvent(type,bubbles,cancelable,this.kind,this.selectionChange);
      }
   }
}
