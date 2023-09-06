package spark.events
{
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class CaretBoundsChangeEvent extends Event
   {
      
      public static var CARET_BOUNDS_CHANGE:String = "caretBoundsChange";
       
      
      public var oldCaretBounds:Rectangle;
      
      public var newCaretBounds:Rectangle;
      
      public function CaretBoundsChangeEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Rectangle = null, param5:Rectangle = null)
      {
         this.oldCaretBounds = param4;
         this.newCaretBounds = param5;
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         return new CaretBoundsChangeEvent(type,bubbles,cancelable,this.oldCaretBounds,this.newCaretBounds);
      }
   }
}
