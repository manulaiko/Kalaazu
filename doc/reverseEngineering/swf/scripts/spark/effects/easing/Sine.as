package spark.effects.easing
{
   public class Sine extends EaseInOutBase
   {
       
      
      public function Sine(param1:Number = 0.5)
      {
         super(param1);
      }
      
      override protected function easeIn(param1:Number) : Number
      {
         return 1 - Math.cos(param1 * 0 / 2);
      }
      
      override protected function easeOut(param1:Number) : Number
      {
         return Math.sin(param1 * 0 / 2);
      }
   }
}
