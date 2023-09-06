package mx.controls
{
   import mx.controls.sliderClasses.Slider;
   import mx.controls.sliderClasses.SliderDirection;
   import mx.core.mx_internal;
   
   public class HSlider extends Slider
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public function HSlider()
      {
         super();
         direction = SliderDirection.HORIZONTAL;
      }
   }
}
