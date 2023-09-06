package mx.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   public class StateChangeEvent extends Event
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      public static const CURRENT_STATE_CHANGE:String = "currentStateChange";
      
      public static const CURRENT_STATE_CHANGING:String = "currentStateChanging";
       
      
      public var newState:String;
      
      public var oldState:String;
      
      public function StateChangeEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:String = null, param5:String = null)
      {
         super(param1,param2,param3);
         this.oldState = param4;
         this.newState = param5;
      }
      
      override public function clone() : Event
      {
         return new StateChangeEvent(type,bubbles,cancelable,this.oldState,this.newState);
      }
   }
}
