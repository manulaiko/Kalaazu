package package_64
{
   import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.model.ItemsControlMenuProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_38.class_829;
   import package_84.class_243;
   
   public class class_1298 extends class_243
   {
       
      
      public function class_1298()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:class_829 = param1.getBody() as class_829;
         name_47.minimap.scaleFactor = _loc2_.var_1562;
         guiProxy.hideAllWindows = _loc2_.hideAllWindows;
         guiProxy.setBarStatesFromString(_loc2_.var_3261);
      }
      
      protected function get menuProxy() : ItemsControlMenuProxy
      {
         return facade.retrieveProxy(ItemsControlMenuProxy.NAME) as ItemsControlMenuProxy;
      }
   }
}
