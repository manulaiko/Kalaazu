package mx.automation
{
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   
   public interface IAutomationObject
   {
       
      
      function get automationDelegate() : Object;
      
      function set automationDelegate(param1:Object) : void;
      
      function get automationName() : String;
      
      function set automationName(param1:String) : void;
      
      function get automationValue() : Array;
      
      function get numAutomationChildren() : int;
      
      function get showInAutomationHierarchy() : Boolean;
      
      function set showInAutomationHierarchy(param1:Boolean) : void;
      
      function get automationTabularData() : Object;
      
      function get automationOwner() : DisplayObjectContainer;
      
      function get automationParent() : DisplayObjectContainer;
      
      function get automationEnabled() : Boolean;
      
      function get automationVisible() : Boolean;
      
      function createAutomationIDPart(param1:IAutomationObject) : Object;
      
      function createAutomationIDPartWithRequiredProperties(param1:IAutomationObject, param2:Array) : Object;
      
      function resolveAutomationIDPart(param1:Object) : Array;
      
      function getAutomationChildAt(param1:int) : IAutomationObject;
      
      function getAutomationChildren() : Array;
      
      function replayAutomatableEvent(param1:Event) : Boolean;
   }
}
