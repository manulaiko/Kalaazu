package spark.effects.easing
{
   public class Power extends EaseInOutBase
   {
       
      
      private var _exponent:Number;
      
      public function Power(param1:Number = 0.5, param2:Number = 2)
      {
         super(param1);
         this.exponent = param2;
      }
      
      public function get exponent() : Number
      {
         return this._exponent;
      }
      
      public function set exponent(param1:Number) : void
      {
         this._exponent = param1;
      }
      
      override protected function easeIn(param1:Number) : Number
      {
         return Math.pow(param1,this._exponent);
      }
      
      override protected function easeOut(param1:Number) : Number
      {
         return 1 - Math.pow(1 - param1,this._exponent);
      }
   }
}
