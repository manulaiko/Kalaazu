package net.bigpoint.darkorbit.mvc.gui.featuresMenu.controller.logic
{
   import flash.geom.Point;
   import net.bigpoint.darkorbit.gui.class_194;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuConstants;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuNotifications;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.FeaturesMenuProxy;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureItemVO;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.view.components.FeatureBtn;
   import net.bigpoint.darkorbit.mvc.gui.interfaces.IWindow;
   import net.bigpoint.darkorbit.net.class_59;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_38.class_665;
   import package_84.class_243;
   
   public class FeatureMenuActionCommand extends class_243
   {
       
      
      public function FeatureMenuActionCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc7_:Boolean = false;
         var _loc8_:* = false;
         var _loc2_:FeatureBtn = param1.getBody() as FeatureBtn;
         var _loc3_:String = param1.getType();
         var _loc4_:FeatureItemVO = this.featuresMenuProxy.getFeatureItemVOById(_loc3_);
         var _loc5_:IWindow;
         if(!(_loc5_ = guiManager.method_468(_loc4_.id)))
         {
            _loc5_ = guiManager.createWindow(_loc4_.id);
            _loc7_ = true;
         }
         var _loc6_:Point = _loc2_.localToGlobal(new Point(0,0));
         if(_loc4_.barId == FeaturesMenuConstants.GAME_FEATURE_BAR)
         {
            _loc8_ = FeaturesMenuConstants.SPECIAL_WINDOWS.indexOf(_loc4_.id) != -1;
            if(FeaturesMenuConstants.SPECIAL_WINDOWS.indexOf(_loc4_.id) != -1)
            {
               this.openCustomWindow(_loc4_);
            }
            else if(Boolean(_loc5_) && Boolean(_loc4_.featureWindowVO))
            {
               sendNotification(GuiNotifications.TOGGLE_WINDOW_BY_ID,new ToggleWindowVO(_loc6_,_loc3_,_loc7_));
            }
            this.sendButtonTriggerRequest(_loc4_.id);
         }
         else if(_loc4_.barId == FeaturesMenuConstants.GENERIC_FEATURE_BAR)
         {
            this.runGenericAction(_loc4_,_loc5_,_loc6_,_loc2_);
         }
         sendNotification(FeaturesMenuNotifications.UPDATE_BTNS_SELECTIONS);
      }
      
      private function openCustomWindow(param1:FeatureItemVO) : void
      {
         var _loc2_:* = null;
         switch(param1.id)
         {
            case GuiConstants.SHIP_WARP_WINDOW:
               _loc2_ = class_194.getInstance();
               if(!_loc2_.method_977())
               {
                  _loc2_.method_12(true);
                  break;
               }
               _loc2_.closeWindow();
               break;
         }
      }
      
      private function runGenericAction(param1:FeatureItemVO, param2:IWindow, param3:Point, param4:FeatureBtn) : void
      {
         switch(param1.id)
         {
            case FeaturesMenuConstants.LOGOUT:
               if(param2.maximized)
               {
                  guiManager.method_3738();
               }
               else
               {
                  name_47.method_1772.method_2112();
                  this.sendButtonTriggerRequest(param1.id);
               }
            case FeaturesMenuConstants.SETTINGS:
               sendNotification(GuiNotifications.TOGGLE_WINDOW_BY_ID,new ToggleWindowVO(param3,param1.id,false));
               break;
            case FeaturesMenuConstants.FULLSCREEN:
               name_47.method_3501();
               break;
            case FeaturesMenuConstants.HELP:
               sendNotification(GuiNotifications.TOGGLE_WINDOW_BY_ID,new ToggleWindowVO(param3,param1.id,false));
               break;
            case FeaturesMenuConstants.SHOP:
               this.sendButtonTriggerRequest(param1.id);
               class_59.referToURL("internalDock",null,"internalDockShips&checkOffer",true);
               class_59.call(class_59.const_1892,["uridium"]);
         }
      }
      
      private function sendButtonTriggerRequest(param1:String) : void
      {
         var _loc2_:class_665 = new class_665(param1);
         connectionProxy.connectionManager.sendRequest(_loc2_);
      }
      
      private function get featuresMenuProxy() : FeaturesMenuProxy
      {
         return retrieveProxy(FeaturesMenuProxy.NAME) as FeaturesMenuProxy;
      }
   }
}
