package mx.events
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import mx.core.mx_internal;
   
   public class IndexChangedEvent extends Event
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      public static const CHANGE:String = "change";
      
      public static const CHILD_INDEX_CHANGE:String = "childIndexChange";
      
      public static const HEADER_SHIFT:String = "headerShift";
       
      
      public var newIndex:Number;
      
      public var oldIndex:Number;
      
      public var relatedObject:DisplayObject;
      
      public var triggerEvent:Event;
      
      public function IndexChangedEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:DisplayObject = null, param5:Number = -1, param6:Number = -1, param7:Event = null)
      {
         super(param1,param2,param3);
         this.relatedObject = param4;
         this.oldIndex = param5;
         this.newIndex = param6;
         this.triggerEvent = param7;
      }
      
      override public function clone() : Event
      {
         return new IndexChangedEvent(type,bubbles,cancelable,this.relatedObject,this.oldIndex,this.newIndex,this.triggerEvent);
      }
   }
}
