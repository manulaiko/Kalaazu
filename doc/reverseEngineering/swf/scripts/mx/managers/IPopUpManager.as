package mx.managers
{
   import flash.display.DisplayObject;
   import mx.core.IFlexDisplayObject;
   import mx.core.IFlexModuleFactory;
   
   public interface IPopUpManager
   {
       
      
      function createPopUp(param1:DisplayObject, param2:Class, param3:Boolean = false, param4:String = null, param5:IFlexModuleFactory = null) : IFlexDisplayObject;
      
      function addPopUp(param1:IFlexDisplayObject, param2:DisplayObject, param3:Boolean = false, param4:String = null, param5:IFlexModuleFactory = null) : void;
      
      function centerPopUp(param1:IFlexDisplayObject) : void;
      
      function removePopUp(param1:IFlexDisplayObject) : void;
      
      function bringToFront(param1:IFlexDisplayObject) : void;
   }
}
