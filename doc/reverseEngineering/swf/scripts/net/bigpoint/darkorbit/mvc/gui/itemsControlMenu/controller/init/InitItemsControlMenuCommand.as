package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller.init
{
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuNotifications;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller.ManageConfigModeCommand;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller.logic.CheckItemsControlMenuBoundsCommand;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller.logic.ConfigModeCommand;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller.requests.SendHotKeyActionRequestCommand;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller.requests.SendMenuActionRequestCommand;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller.requests.SendSlotBarConfigSetRequestCommand;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller.updates.UpdateItemsControlMenuPositionCommand;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.ItemsControlMenuProxy;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.ItemsControlMenuMediator;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.ItemsControlMenu;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_11.class_39;
   import package_84.class_243;
   import package_9.ResourceManager;
   import package_9.class_50;
   
   public class InitItemsControlMenuCommand extends class_243
   {
       
      
      public function InitItemsControlMenuCommand()
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
         registerProxy(new ItemsControlMenuProxy());
      }
      
      private function initController() : void
      {
         registerCommand(ItemsControlMenuNotifications.UPDATE_MENUS_POSITION,UpdateItemsControlMenuPositionCommand);
         registerCommand(ItemsControlMenuNotifications.CHECK_BOUNDS_AND_SAVE_POS,CheckItemsControlMenuBoundsCommand);
         registerCommand(GuiNotifications.MANAGE_MENUS_CONFIG_MODE,ManageConfigModeCommand);
         registerCommand(GuiNotifications.UPDATE_MENUS_CONFIG_MODE,ConfigModeCommand);
         registerCommand(ItemsControlMenuNotifications.SEND_MENU_ACTION_REQUEST,SendMenuActionRequestCommand);
         registerCommand(ItemsControlMenuNotifications.SEND_HOT_KEY_ACTION_REQUEST,SendHotKeyActionRequestCommand);
         registerCommand(ItemsControlMenuNotifications.SEND_SLOT_BAR_CONFIG_REQUEST,SendSlotBarConfigSetRequestCommand);
      }
      
      private function initView() : void
      {
         var _loc1_:class_39 = ResourceManager.name_15.getFinisher(ItemsControlMenuConstants.MENU_ID) as class_39;
         var _loc2_:ItemsControlMenu = new ItemsControlMenu(_loc1_);
         class_50.getInstance().method_608.addChild(_loc2_);
         registerMediator(new ItemsControlMenuMediator(_loc2_,_loc1_));
      }
      
      protected function get menuProxy() : ItemsControlMenuProxy
      {
         return facade.retrieveProxy(ItemsControlMenuProxy.NAME) as ItemsControlMenuProxy;
      }
   }
}
