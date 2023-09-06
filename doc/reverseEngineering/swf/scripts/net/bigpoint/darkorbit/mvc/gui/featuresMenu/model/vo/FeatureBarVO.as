package net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.mvc.gui.abstract.model.vo.AbstractMenuBarVO;
   
   public class FeatureBarVO extends AbstractMenuBarVO
   {
       
      
      private var _featureItems:Vector.<FeatureItemVO>;
      
      public function FeatureBarVO(param1:String, param2:String, param3:class_73, param4:Vector.<FeatureItemVO>)
      {
         super(param1,param2,param3);
         this._featureItems = param4;
      }
      
      public function get featureItems() : Vector.<FeatureItemVO>
      {
         return this._featureItems;
      }
   }
}
