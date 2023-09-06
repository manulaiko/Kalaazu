package mx.managers
{
   public interface IActiveWindowManager
   {
       
      
      function get numModalWindows() : int;
      
      function set numModalWindows(param1:int) : void;
      
      function addFocusManager(param1:IFocusManagerContainer) : void;
      
      function removeFocusManager(param1:IFocusManagerContainer) : void;
      
      function activate(param1:Object) : void;
      
      function deactivate(param1:Object) : void;
   }
}
