package mx.core
{
   import flash.events.IEventDispatcher;
   
   public interface IStateClient2 extends IEventDispatcher, IStateClient
   {
       
      
      function get states() : Array;
      
      function set states(param1:Array) : void;
      
      function get transitions() : Array;
      
      function set transitions(param1:Array) : void;
      
      function hasState(param1:String) : Boolean;
   }
}
