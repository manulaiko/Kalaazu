package net.bigpoint.darkorbit.mvc.gui.controller.updates
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuNotifications;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureWindowVO;
   import net.bigpoint.darkorbit.mvc.gui.interfaces.IWindow;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_38.class_865;
   import package_84.class_243;
   
   public class UpdateWindowItemCommand extends class_243
   {
       
      
      public function UpdateWindowItemCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc4_:* = null;
         var _loc2_:class_865 = param1.getBody() as class_865;
         var _loc3_:FeatureWindowVO = guiProxy.getFeatureWindowById(_loc2_.itemId);
         if(_loc3_)
         {
            _loc3_.update(new class_73(_loc2_.var_4787,_loc2_.var_2295),new class_73(_loc2_.width,_loc2_.height),_loc2_.maximized,_loc2_.var_1711,_loc2_.helpText,_loc2_.toolTip);
            sendNotification(GuiNotifications.TOGGLE_ALL_WINDOWS,_loc3_);
            if(_loc4_ = guiManager.method_468(_loc3_.id))
            {
               _loc4_.update(_loc3_,_loc2_.visible);
            }
            sendNotification(FeaturesMenuNotifications.UPDATE_ITEMS_VISIBILITY,_loc2_);
            sendNotification(FeaturesMenuNotifications.UPDATE_BTNS_SELECTIONS);
         }
      }
   }
}
