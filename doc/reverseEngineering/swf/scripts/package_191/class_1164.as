package package_191
{
   import net.bigpoint.darkorbit.gui.class_58;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuNotifications;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.view.FeaturesMenuMediator;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.view.components.FeatureBtn;
   import package_17.class_62;
   import package_46.class_131;
   
   public class class_1164 implements class_1157
   {
      
      public static const NAME:String = "logout";
       
      
      public function class_1164()
      {
         super();
      }
      
      public function execute(param1:class_90, param2:Vector.<String>) : void
      {
         var _loc3_:class_131 = class_58.instance.method_468(GuiConstants.LOGOUT_WINDOW) as class_131;
         var _loc4_:FeaturesMenuMediator;
         var _loc5_:FeatureBtn = (_loc4_ = this.name_20.retrieveMediator(FeaturesMenuMediator.NAME) as FeaturesMenuMediator).getGameFeatureBtnById(GuiConstants.LOGOUT_WINDOW);
         if(!_loc3_.isLocked())
         {
            this.name_20.sendNotification(FeaturesMenuNotifications.ACTION_TRIGERRED,_loc5_,GuiConstants.LOGOUT_WINDOW);
         }
      }
      
      private function get name_20() : class_62
      {
         return class_62.getInstance();
      }
   }
}
