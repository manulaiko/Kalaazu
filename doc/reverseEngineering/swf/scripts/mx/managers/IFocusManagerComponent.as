package mx.managers
{
   public interface IFocusManagerComponent
   {
       
      
      function get focusEnabled() : Boolean;
      
      function set focusEnabled(param1:Boolean) : void;
      
      function get hasFocusableChildren() : Boolean;
      
      function set hasFocusableChildren(param1:Boolean) : void;
      
      function get mouseFocusEnabled() : Boolean;
      
      function get tabFocusEnabled() : Boolean;
      
      function get tabIndex() : int;
      
      function set tabIndex(param1:int) : void;
      
      function setFocus() : void;
      
      function drawFocus(param1:Boolean) : void;
   }
}
