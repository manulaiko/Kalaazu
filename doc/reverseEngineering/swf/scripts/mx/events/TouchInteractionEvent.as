package mx.events
{
   import flash.events.Event;
   
   public class TouchInteractionEvent extends Event
   {
      
      public static const TOUCH_INTERACTION_STARTING:String = "touchInteractionStarting";
      
      public static const TOUCH_INTERACTION_START:String = "touchInteractionStart";
      
      public static const TOUCH_INTERACTION_END:String = "touchInteractionEnd";
       
      
      public var reason:String;
      
      public var relatedObject:Object;
      
      public function TouchInteractionEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      override public function clone() : Event
      {
         var _loc1_:TouchInteractionEvent = new TouchInteractionEvent(type,bubbles,cancelable);
         _loc1_.reason = this.reason;
         _loc1_.relatedObject = this.relatedObject;
         return _loc1_;
      }
   }
}
