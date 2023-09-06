package net.bigpoint.darkorbit.fui.builder.xml.creators
{
   import net.bigpoint.darkorbit.fui.components.bars.ProgressBar;
   import net.bigpoint.darkorbit.fui.components.core.ICoreponent;
   
   public class ProgressBarCreator extends AbstractCreator
   {
       
      
      public function ProgressBarCreator()
      {
         super();
      }
      
      public function create(param1:XML) : ICoreponent
      {
         var _loc2_:ICoreponent = new ProgressBar();
         mapXMLNodeAttributes(_loc2_,param1);
         return _loc2_;
      }
   }
}
