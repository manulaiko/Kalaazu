package package_191
{
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuNotifications;
   import net.bigpoint.darkorbit.mvc.gui.model.GuiProxy;
   import package_17.class_62;
   
   public class class_1170 implements class_1157
   {
      
      public static const NAME:String = "ToggleWindowsCommand";
       
      
      public function class_1170()
      {
         super();
      }
      
      public function execute(param1:class_90, param2:Vector.<String>) : void
      {
         this.guiProxy.hideAllWindows = !this.guiProxy.hideAllWindows;
         this.name_20.sendNotification(GuiNotifications.TOGGLE_ALL_WINDOWS);
         this.name_20.sendNotification(FeaturesMenuNotifications.UPDATE_BTNS_SELECTIONS);
         this.name_20.sendNotification(GuiNotifications.SAVE_BARS_SETTINGS);
      }
      
      private function get guiProxy() : GuiProxy
      {
         return this.name_20.retrieveProxy(GuiProxy.NAME) as GuiProxy;
      }
      
      private function get name_20() : class_62
      {
         return class_62.getInstance();
      }
   }
}
