package mx.core
{
   import flash.events.IEventDispatcher;
   
   public interface ISWFBridgeProvider
   {
       
      
      function get swfBridge() : IEventDispatcher;
      
      function get childAllowsParent() : Boolean;
      
      function get parentAllowsChild() : Boolean;
   }
}
