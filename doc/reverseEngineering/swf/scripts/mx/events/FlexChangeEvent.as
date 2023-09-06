package mx.events
{
   import flash.events.Event;
   import mx.core.mx_internal;
   
   public class FlexChangeEvent extends Event
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      public static const ADD_CHILD_BRIDGE:String = "addChildBridge";
      
      public static const REMOVE_CHILD_BRIDGE:String = "removeChildBridge";
      
      public static const STYLE_MANAGER_CHANGE:String = "styleManagerChange";
       
      
      public var data:Object;
      
      public function FlexChangeEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:Object = null)
      {
         super(param1,param2,param3);
         this.data = param4;
      }
      
      override public function clone() : Event
      {
         return new FlexChangeEvent(type,bubbles,cancelable,this.data);
      }
   }
}
