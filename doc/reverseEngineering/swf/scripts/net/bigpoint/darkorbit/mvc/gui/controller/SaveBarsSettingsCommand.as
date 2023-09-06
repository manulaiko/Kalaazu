package net.bigpoint.darkorbit.mvc.gui.controller
{
   import net.bigpoint.darkorbit.mvc.gui.abstract.model.vo.AbstractMenuBarVO;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuConstants;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.FeaturesMenuProxy;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.ItemsControlMenuProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_38.class_898;
   import package_84.class_243;
   
   public class SaveBarsSettingsCommand extends class_243
   {
      
      public static const PROPERTY_SEPARTOR:String = ",";
       
      
      public function SaveBarsSettingsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(this.itemsControlMenuProxy && this.itemsControlMenuProxy.menuBars && this.featuresMenuProxy && this.featuresMenuProxy.menuBars && true)
         {
            _loc2_ = this.itemsControlMenuProxy.getMenuBarVOById(ItemsControlMenuConstants.CATEGORY_BAR);
            _loc3_ = this.itemsControlMenuProxy.getMenuBarVOById(ItemsControlMenuConstants.STANDARD_SLOT_BAR);
            _loc4_ = this.itemsControlMenuProxy.getMenuBarVOById(ItemsControlMenuConstants.PREMIUM_SLOT_BAR);
            _loc5_ = this.itemsControlMenuProxy.getMenuBarVOById(ItemsControlMenuConstants.PRO_ACTION_BAR);
            _loc6_ = this.featuresMenuProxy.getMenuBarVOById(FeaturesMenuConstants.GAME_FEATURE_BAR);
            _loc7_ = this.featuresMenuProxy.getMenuBarVOById(FeaturesMenuConstants.GENERIC_FEATURE_BAR);
            if(Boolean(_loc2_) && Boolean(_loc3_) && Boolean(_loc6_) && Boolean(_loc7_))
            {
               (_loc8_ = new class_898()).var_696 = name_47.minimap.scaleFactor;
               _loc8_.hideAllWindows = guiProxy.hideAllWindows;
               _loc8_.var_922 = _loc2_.positionCords;
               _loc8_.var_549 = _loc3_.positionCords;
               _loc8_.var_3567 = _loc3_.layoutType;
               if(_loc4_)
               {
                  _loc8_.var_72 = _loc4_.positionCords;
                  _loc8_.var_4513 = _loc4_.layoutType;
               }
               if(_loc5_)
               {
                  _loc8_.var_3530 = _loc5_.positionCords;
                  _loc8_.var_4309 = _loc5_.layoutType;
               }
               _loc8_.var_1004 = _loc6_.positionCords;
               _loc8_.var_3883 = _loc6_.layoutType;
               _loc8_.var_2927 = _loc7_.positionCords;
               _loc8_.var_352 = _loc7_.layoutType;
               _loc8_.var_3261 = guiProxy.getBarStatesAsString();
               connectionProxy.sendNettyRequest(_loc8_);
            }
         }
      }
      
      protected function get itemsControlMenuProxy() : ItemsControlMenuProxy
      {
         return facade.retrieveProxy(ItemsControlMenuProxy.NAME) as ItemsControlMenuProxy;
      }
      
      protected function get featuresMenuProxy() : FeaturesMenuProxy
      {
         return facade.retrieveProxy(FeaturesMenuProxy.NAME) as FeaturesMenuProxy;
      }
   }
}
