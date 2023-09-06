package mx.managers
{
   import flash.events.IEventDispatcher;
   
   public interface ILayoutManager extends IEventDispatcher
   {
       
      
      function get usePhasedInstantiation() : Boolean;
      
      function set usePhasedInstantiation(param1:Boolean) : void;
      
      function invalidateProperties(param1:ILayoutManagerClient) : void;
      
      function invalidateSize(param1:ILayoutManagerClient) : void;
      
      function invalidateDisplayList(param1:ILayoutManagerClient) : void;
      
      function validateNow() : void;
      
      function validateClient(param1:ILayoutManagerClient, param2:Boolean = false) : void;
      
      function isInvalid() : Boolean;
   }
}
