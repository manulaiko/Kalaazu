package mx.utils
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   
   public class OnDemandEventDispatcher implements IEventDispatcher
   {
       
      
      private var _dispatcher:EventDispatcher;
      
      public function OnDemandEventDispatcher()
      {
         super();
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         if(this._dispatcher == null)
         {
            this._dispatcher = new EventDispatcher(this);
         }
         this._dispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         if(this._dispatcher != null)
         {
            return this._dispatcher.dispatchEvent(param1);
         }
         return true;
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         if(this._dispatcher != null)
         {
            return this._dispatcher.hasEventListener(param1);
         }
         return false;
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         if(this._dispatcher != null)
         {
            this._dispatcher.removeEventListener(param1,param2,param3);
         }
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         if(this._dispatcher != null)
         {
            return this._dispatcher.willTrigger(param1);
         }
         return false;
      }
   }
}
