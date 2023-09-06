package mx.managers
{
   import flash.display.InteractiveObject;
   import flash.display.Sprite;
   import flash.events.IEventDispatcher;
   import mx.core.IButton;
   
   public interface IFocusManager extends IEventDispatcher
   {
       
      
      function get defaultButton() : IButton;
      
      function set defaultButton(param1:IButton) : void;
      
      function get defaultButtonEnabled() : Boolean;
      
      function set defaultButtonEnabled(param1:Boolean) : void;
      
      function get focusPane() : Sprite;
      
      function set focusPane(param1:Sprite) : void;
      
      function get nextTabIndex() : int;
      
      function get showFocusIndicator() : Boolean;
      
      function set showFocusIndicator(param1:Boolean) : void;
      
      function getFocus() : IFocusManagerComponent;
      
      function setFocus(param1:IFocusManagerComponent) : void;
      
      function showFocus() : void;
      
      function hideFocus() : void;
      
      function activate() : void;
      
      function deactivate() : void;
      
      function findFocusManagerComponent(param1:InteractiveObject) : IFocusManagerComponent;
      
      function getNextFocusManagerComponent(param1:Boolean = false) : IFocusManagerComponent;
   }
}
