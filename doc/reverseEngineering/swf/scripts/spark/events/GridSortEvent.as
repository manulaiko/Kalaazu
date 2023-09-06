package spark.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   public class GridSortEvent extends Event
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      public static const SORT_CHANGE:String = "sortChange";
      
      public static const SORT_CHANGING:String = "sortChanging";
       
      
      public var columnIndices:Vector.<int>;
      
      public var newSortFields:Array;
      
      private var _oldSortFields:Array;
      
      public function GridSortEvent(param1:String, param2:Boolean, param3:Boolean, param4:Vector.<int>, param5:Array, param6:Array)
      {
         super(param1,param2,param3);
         this.columnIndices = !!param4 ? param4.concat() : null;
         this._oldSortFields = !!param5 ? param5.concat() : null;
         this.newSortFields = !!param6 ? param6.concat() : null;
      }
      
      public function get oldSortFields() : Array
      {
         return this._oldSortFields;
      }
      
      override public function toString() : String
      {
         return formatToString("GridSortEvent","type","bubbles","cancelable","eventPhase","columnIndices");
      }
      
      override public function clone() : Event
      {
         return new GridSortEvent(type,bubbles,cancelable,this.columnIndices,this.oldSortFields,this.newSortFields);
      }
   }
}
