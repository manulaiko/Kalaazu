package mx.events
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import mx.core.mx_internal;
   
   public class ChildExistenceChangedEvent extends Event
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      public static const CHILD_ADD:String = "childAdd";
      
      public static const CHILD_REMOVE:String = "childRemove";
      
      public static const OVERLAY_CREATED:String = "overlayCreated";
       
      
      public var relatedObject:DisplayObject;
      
      public function ChildExistenceChangedEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:DisplayObject = null)
      {
         super(param1,param2,param3);
         this.relatedObject = param4;
      }
      
      override public function clone() : Event
      {
         return new ChildExistenceChangedEvent(type,bubbles,cancelable,this.relatedObject);
      }
   }
}
