package net.bigpoint.darkorbit.fui.system.modules
{
   public interface IUISetupModule
   {
       
      
      function setUp() : void;
      
      function isInitialized() : Boolean;
      
      function set templatesStructure(param1:Object) : void;
      
      function set skinsStructure(param1:Object) : void;
      
      function set textStylesStructure(param1:Object) : void;
      
      function set uiStructure(param1:Object) : void;
      
      function get uiStructure() : Object;
   }
}
