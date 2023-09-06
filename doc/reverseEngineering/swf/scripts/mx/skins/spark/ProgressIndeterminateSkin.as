package mx.skins.spark
{
   import flash.display.Graphics;
   import mx.skins.Border;
   
   public class ProgressIndeterminateSkin extends Border
   {
      
      private static var colors:Array = [13421772,8421504];
      
      private static var alphas:Array = [0.85,0.85];
      
      private static var ratios:Array = [0,255];
       
      
      public function ProgressIndeterminateSkin()
      {
         super();
      }
      
      override public function get measuredWidth() : Number
      {
         return 195;
      }
      
      override public function get measuredHeight() : Number
      {
         return 6;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         var _loc3_:Number = getStyle("indeterminateMoveInterval");
         if(isNaN(_loc3_))
         {
            _loc3_ = 28;
         }
         var _loc4_:Graphics;
         (_loc4_ = graphics).clear();
         var _loc5_:int = 0;
         while(_loc5_ < param1)
         {
            _loc4_.beginGradientFill("linear",colors,alphas,ratios,verticalGradientMatrix(_loc5_ - 4,2,7,param2 - 4));
            _loc4_.moveTo(_loc5_,2);
            _loc4_.lineTo(Math.min(_loc5_ + 7,param1),2);
            _loc4_.lineTo(Math.min(_loc5_ + 3,param1),param2 - 2);
            _loc4_.lineTo(Math.max(_loc5_ - 4,0),param2 - 2);
            _loc4_.lineTo(_loc5_,2);
            _loc4_.endFill();
            _loc4_.lineStyle(1,0,0.12);
            _loc4_.moveTo(_loc5_,2);
            _loc4_.lineTo(Math.max(_loc5_ - 4,0),param2 - 2);
            _loc4_.moveTo(Math.min(_loc5_ + 7,param1),2);
            _loc4_.lineTo(Math.min(_loc5_ + 3,param1),param2 - 2);
            _loc5_ += _loc3_;
         }
      }
   }
}
