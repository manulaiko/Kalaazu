package fl.managers
{
   import fl.controls.Button;
   import flash.display.InteractiveObject;
   
   public interface IFocusManager
   {
       
      
      function get defaultButton() : Button;
      
      function set defaultButton(param1:Button) : void;
      
      function get defaultButtonEnabled() : Boolean;
      
      function set defaultButtonEnabled(param1:Boolean) : void;
      
      function get nextTabIndex() : int;
      
      function get showFocusIndicator() : Boolean;
      
      function set showFocusIndicator(param1:Boolean) : void;
      
      function getFocus() : InteractiveObject;
      
      function setFocus(param1:InteractiveObject) : void;
      
      function showFocus() : void;
      
      function hideFocus() : void;
      
      function activate() : void;
      
      function deactivate() : void;
      
      function findFocusManagerComponent(param1:InteractiveObject) : InteractiveObject;
      
      function getNextFocusManagerComponent(param1:Boolean = false) : InteractiveObject;
   }
}
