package package_191
{
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuNotifications;
   import package_17.class_62;
   
   public class ToggleCategoryBarCommand implements class_1157
   {
      
      public static const NAME:String = "ToggleCategoryBarCommand";
       
      
      public function ToggleCategoryBarCommand()
      {
         super();
      }
      
      public function execute(param1:class_90, param2:Vector.<String>) : void
      {
         class_62.getInstance().sendNotification(ItemsControlMenuNotifications.TOGGLE_CATEGORY_BUTTON);
      }
   }
}
