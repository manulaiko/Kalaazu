package net.bigpoint.darkorbit.mvc.gui.featuresMenu.model
{
   import net.bigpoint.darkorbit.mvc.gui.abstract.model.AbstractMenuProxy;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureBarVO;
   import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureItemVO;
   import org.puremvc.as3.multicore.interfaces.IProxy;
   
   public class FeaturesMenuProxy extends AbstractMenuProxy implements IProxy
   {
      
      public static const NAME:String = "FeaturesMenuProxy";
       
      
      public function FeaturesMenuProxy()
      {
         super(NAME);
      }
      
      public function getFeatureItemVOById(param1:String) : FeatureItemVO
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         for each(_loc2_ in _menuBars)
         {
            _loc3_ = _loc2_.featureItems.length;
            _loc4_ = 0;
            while(_loc4_ != _loc3_)
            {
               if((_loc5_ = _loc2_.featureItems[_loc4_]).id == param1)
               {
                  return _loc5_;
               }
               _loc4_++;
            }
         }
         return null;
      }
   }
}
