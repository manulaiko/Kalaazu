package mx.filters
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class BaseFilter extends EventDispatcher
   {
      
      public static const CHANGE:String = "change";
       
      
      public function BaseFilter(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public function notifyFilterChanged() : void
      {
         dispatchEvent(new Event(CHANGE));
      }
   }
}
