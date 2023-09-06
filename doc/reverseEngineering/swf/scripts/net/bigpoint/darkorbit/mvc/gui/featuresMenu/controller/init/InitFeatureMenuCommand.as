package net.bigpoint.darkorbit.mvc.gui.featuresMenu.controller.init
{
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuConstants;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuNotifications;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.controller.logic.CheckFeaturesMenuBoundsCommand;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.controller.logic.FeatureMenuActionCommand;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.controller.updates.UpdateFeaturesMenuPositionCommand;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.controller.updates.UpdateMenuItemsVisibilityCommand;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.controller.updates.UpdateWindowsMinimizedPositionsCommand;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.FeaturesMenuProxy;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.view.FeaturesMenuMediator;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.view.components.FeaturesMenu;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.ItemsControlMenuProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_11.class_39;
   import package_84.class_243;
   import package_9.ResourceManager;
   import package_9.class_50;
   
   public class InitFeatureMenuCommand extends class_243
   {
       
      
      public function InitFeatureMenuCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         this.initModel();
         this.initView();
         this.initController();
      }
      
      private function initModel() : void
      {
         registerProxy(new FeaturesMenuProxy());
      }
      
      private function initController() : void
      {
         registerCommand(FeaturesMenuNotifications.UPDATE_POSITION,UpdateFeaturesMenuPositionCommand);
         registerCommand(FeaturesMenuNotifications.UPDATE_ITEMS_VISIBILITY,UpdateMenuItemsVisibilityCommand);
         registerCommand(FeaturesMenuNotifications.UPDATE_WINDOWS_MINIMIZED_POSITIONS,UpdateWindowsMinimizedPositionsCommand);
         registerCommand(FeaturesMenuNotifications.CHECK_BOUNDS_AND_SAVE_POS,CheckFeaturesMenuBoundsCommand);
         registerCommand(FeaturesMenuNotifications.ACTION_TRIGERRED,FeatureMenuActionCommand);
      }
      
      private function initView() : void
      {
         var _loc1_:class_39 = ResourceManager.name_15.getFinisher(FeaturesMenuConstants.MENU_ID) as class_39;
         var _loc2_:FeaturesMenu = new FeaturesMenu(_loc1_);
         class_50.getInstance().method_608.addChild(_loc2_);
         registerMediator(new FeaturesMenuMediator(_loc2_,_loc1_));
      }
      
      protected function get featuresMenuProxy() : ItemsControlMenuProxy
      {
         return facade.retrieveProxy(ItemsControlMenuProxy.NAME) as ItemsControlMenuProxy;
      }
   }
}
