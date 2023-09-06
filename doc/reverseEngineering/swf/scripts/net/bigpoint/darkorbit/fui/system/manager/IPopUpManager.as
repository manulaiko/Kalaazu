package net.bigpoint.darkorbit.fui.system.manager
{
   import flash.display.DisplayObject;
   
   public interface IPopUpManager
   {
       
      
      function add(param1:DisplayObject) : void;
      
      function remove(param1:DisplayObject) : void;
      
      function removeAll() : void;
      
      function getCurrentPopup() : DisplayObject;
   }
}
