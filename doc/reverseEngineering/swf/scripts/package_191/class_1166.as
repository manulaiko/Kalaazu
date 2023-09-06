package package_191
{
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuNotifications;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_17.class_62;
   
   public class class_1166 implements class_1157
   {
      
      public static const NAME:String = "toggleProActionBarCommand";
       
      
      public function class_1166()
      {
         super();
      }
      
      public function execute(param1:class_90, param2:Vector.<String>) : void
      {
         if(Settings.proActionBarEnabled.value)
         {
            class_62.getInstance().sendNotification(ItemsControlMenuNotifications.TOGGLE_PRO_ACTION_BUTTON);
         }
      }
   }
}
