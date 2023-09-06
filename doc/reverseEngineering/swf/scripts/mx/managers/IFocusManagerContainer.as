package mx.managers
{
   import flash.display.DisplayObject;
   import flash.events.IEventDispatcher;
   import mx.core.IFlexDisplayObject;
   
   public interface IFocusManagerContainer extends IEventDispatcher
   {
       
      
      function get focusManager() : IFocusManager;
      
      function set focusManager(param1:IFocusManager) : void;
      
      function get defaultButton() : IFlexDisplayObject;
      
      function set defaultButton(param1:IFlexDisplayObject) : void;
      
      function get systemManager() : ISystemManager;
      
      function contains(param1:DisplayObject) : Boolean;
   }
}
