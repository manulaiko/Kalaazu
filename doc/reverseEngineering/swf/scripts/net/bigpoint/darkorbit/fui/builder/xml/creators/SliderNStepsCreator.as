package net.bigpoint.darkorbit.fui.builder.xml.creators
{
   import net.bigpoint.darkorbit.fui.components.bars.SliderNSteps;
   import net.bigpoint.darkorbit.fui.components.core.ICoreponent;
   
   public class SliderNStepsCreator extends AbstractCreator
   {
       
      
      public function SliderNStepsCreator()
      {
         super();
      }
      
      public function create(param1:XML) : ICoreponent
      {
         var _loc2_:SliderNSteps = new SliderNSteps();
         mapXMLNodeAttributes(_loc2_,param1);
         param1.attribute("steps");
         return _loc2_;
      }
   }
}
