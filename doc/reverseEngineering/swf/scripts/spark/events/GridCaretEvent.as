package spark.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   public class GridCaretEvent extends Event
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      public static const CARET_CHANGE:String = "caretChange";
       
      
      public var oldRowIndex:int;
      
      public var oldColumnIndex:int;
      
      public var newRowIndex:int;
      
      public var newColumnIndex:int;
      
      public function GridCaretEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:int = -1, param5:int = -1, param6:int = -1, param7:int = -1)
      {
         super(param1,param2,param3);
         this.oldRowIndex = param4;
         this.oldColumnIndex = param5;
         this.newRowIndex = param6;
         this.newColumnIndex = param7;
      }
      
      override public function toString() : String
      {
         return formatToString("GridCaretEvent","type","bubbles","cancelable","eventPhase","oldRowIndex","oldColumnIndex","newRowIndex","newColumnIndex");
      }
      
      override public function clone() : Event
      {
         return new GridCaretEvent(type,bubbles,cancelable,this.oldRowIndex,this.oldColumnIndex,this.newRowIndex,this.newColumnIndex);
      }
   }
}
