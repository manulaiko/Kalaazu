package mx.managers
{
   import flash.events.IEventDispatcher;
   
   public interface ILayoutManagerClient extends IEventDispatcher
   {
       
      
      function get initialized() : Boolean;
      
      function set initialized(param1:Boolean) : void;
      
      function get nestLevel() : int;
      
      function set nestLevel(param1:int) : void;
      
      function get processedDescriptors() : Boolean;
      
      function set processedDescriptors(param1:Boolean) : void;
      
      function get updateCompletePendingFlag() : Boolean;
      
      function set updateCompletePendingFlag(param1:Boolean) : void;
      
      function validateProperties() : void;
      
      function validateSize(param1:Boolean = false) : void;
      
      function validateDisplayList() : void;
   }
}
