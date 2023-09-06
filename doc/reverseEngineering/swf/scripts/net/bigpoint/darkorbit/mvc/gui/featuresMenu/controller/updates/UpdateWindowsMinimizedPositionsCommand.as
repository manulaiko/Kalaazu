package net.bigpoint.darkorbit.mvc.gui.featuresMenu.controller.updates
{
   import flash.geom.Point;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.FeaturesMenuProxy;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureBarVO;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureItemVO;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.view.FeaturesMenuMediator;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.view.components.FeatureBtn;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_84.class_243;
   
   public class UpdateWindowsMinimizedPositionsCommand extends class_243
   {
       
      
      public function UpdateWindowsMinimizedPositionsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         for each(_loc2_ in this.menuProxy.menuBars)
         {
            _loc3_ = _loc2_.featureItems.length;
            _loc4_ = 0;
            while(_loc4_ != _loc3_)
            {
               if(Boolean((_loc5_ = _loc2_.featureItems[_loc4_]).featureWindowVO) && _loc5_.visible)
               {
                  if(_loc6_ = this.featuresMenuMediator.getGameFeatureBtnById(_loc5_.id))
                  {
                     _loc7_ = _loc6_.localToGlobal(new Point(0,0));
                     _loc5_.featureWindowVO.minimizedPosition = _loc7_;
                  }
               }
               _loc4_++;
            }
         }
      }
      
      private function get featuresMenuMediator() : FeaturesMenuMediator
      {
         return retrieveMediator(FeaturesMenuMediator.NAME) as FeaturesMenuMediator;
      }
      
      protected function get menuProxy() : FeaturesMenuProxy
      {
         return retrieveProxy(FeaturesMenuProxy.NAME) as FeaturesMenuProxy;
      }
   }
}
