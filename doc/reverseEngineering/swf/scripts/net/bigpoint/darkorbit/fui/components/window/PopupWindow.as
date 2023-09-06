package net.bigpoint.darkorbit.fui.components.window
{
   import flash.display.DisplayObjectContainer;
   import flash.events.MouseEvent;
   
   public class PopupWindow
   {
       
      
      public function PopupWindow(param1:DisplayObjectContainer, param2:Function, param3:Function)
      {
         super();
         var _loc4_:DisplayObjectContainer;
         (_loc4_ = param1.getChildAt(0) as DisplayObjectContainer).getChildByName("okButton").addEventListener(MouseEvent.CLICK,param2);
         _loc4_.getChildByName("cancelButton").addEventListener(MouseEvent.CLICK,param3);
      }
   }
}
