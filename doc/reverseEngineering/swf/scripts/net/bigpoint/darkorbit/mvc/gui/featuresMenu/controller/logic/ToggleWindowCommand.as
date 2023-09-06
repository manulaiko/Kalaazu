package net.bigpoint.darkorbit.mvc.gui.featuresMenu.controller.logic
{
   import flash.geom.Point;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureWindowVO;
   import net.bigpoint.darkorbit.mvc.gui.interfaces.IWindow;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_84.class_243;
   
   public class ToggleWindowCommand extends class_243
   {
       
      
      public function ToggleWindowCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:ToggleWindowVO = param1.getBody() as ToggleWindowVO;
         var _loc3_:IWindow = guiProxy.getWindowById(_loc2_.featureId);
         var _loc4_:FeatureWindowVO = guiProxy.getFeatureWindowById(_loc2_.featureId);
         if(_loc2_.isNewWindow)
         {
            _loc4_.maximized = true;
            if(!_loc3_.maximized)
            {
               this.openWindow(_loc3_,_loc4_.saveSettingsOnServer,_loc2_.menuBtnPosition);
            }
         }
         else
         {
            _loc4_.maximized = !_loc4_.maximized;
            if(_loc3_.maximized)
            {
               this.closeWindow(_loc3_,_loc4_.saveSettingsOnServer);
            }
            else
            {
               this.openWindow(_loc3_,_loc4_.saveSettingsOnServer,_loc2_.menuBtnPosition);
            }
         }
      }
      
      private function openWindow(param1:IWindow, param2:Boolean, param3:Point) : void
      {
         if(param3)
         {
            param1.x = param3.x;
            param1.y = param3.y;
         }
         param1.maximize(param2);
      }
      
      private function closeWindow(param1:IWindow, param2:Boolean) : void
      {
         param1.minimize(param2);
      }
   }
}
