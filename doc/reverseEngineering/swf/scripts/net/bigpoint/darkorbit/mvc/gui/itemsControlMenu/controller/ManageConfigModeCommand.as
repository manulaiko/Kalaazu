package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.controller
{
   import flash.display.Shape;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.ItemsControlMenuProxy;
   import net.bigpoint.darkorbit.settings.Settings;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_46.class_131;
   import package_84.class_243;
   import package_9.class_50;
   
   public class ManageConfigModeCommand extends class_243
   {
       
      
      public function ManageConfigModeCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc3_:* = param1.getBody() as Boolean;
         this.menuProxy.configMode = param1.getBody() as Boolean;
         var _loc2_:Boolean = _loc3_;
         this.manageConfigMode(_loc2_);
      }
      
      protected function manageConfigMode(param1:Boolean) : void
      {
         sendNotification(GuiNotifications.ADD_REMOVE_MENUS_CONFIG_GRID,param1 ? this.grid : null);
         this.windowsTint = param1;
      }
      
      private function get grid() : Shape
      {
         var _loc1_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_loc1_ == null || _loc1_.parent == null)
         {
            _loc1_ = new Shape();
            _loc1_.graphics.lineStyle(1,16777215,0.2);
            _loc3_ = 0;
            while(_loc3_ < Number(class_50.method_1269()) / 0)
            {
               _loc1_.graphics.moveTo(0,_loc3_ * 0);
               _loc1_.graphics.lineTo(class_50.method_6533(),_loc3_ * 0);
               _loc3_++;
            }
            _loc4_ = 0;
            while(_loc4_ < Number(class_50.method_6533()) / 0)
            {
               _loc1_.graphics.moveTo(_loc4_ * 0,0);
               _loc1_.graphics.lineTo(_loc4_ * 0,class_50.method_1269());
               _loc4_++;
            }
            _loc1_.cacheAsBitmap = true;
         }
         return _loc1_;
      }
      
      protected function set windowsTint(param1:Boolean) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         for(_loc2_ in guiManager.windows)
         {
            _loc3_ = guiManager.windows[_loc2_] as class_131;
            if(param1)
            {
               _loc3_.method_3599();
            }
            else
            {
               _loc3_.method_6446();
            }
         }
      }
      
      protected function get menuProxy() : ItemsControlMenuProxy
      {
         return retrieveProxy(ItemsControlMenuProxy.NAME) as ItemsControlMenuProxy;
      }
   }
}
