package fl.managers
{
   public interface IFocusManagerComponent
   {
       
      
      function get focusEnabled() : Boolean;
      
      function set focusEnabled(param1:Boolean) : void;
      
      function get mouseFocusEnabled() : Boolean;
      
      function get tabEnabled() : Boolean;
      
      function get tabIndex() : int;
      
      function setFocus() : void;
      
      function drawFocus(param1:Boolean) : void;
   }
}
