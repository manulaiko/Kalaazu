package mx.skins.spark
{
   import spark.skins.SparkSkin;
   
   public class SparkSkinForHalo extends SparkSkin
   {
       
      
      public function SparkSkinForHalo()
      {
         super();
      }
      
      protected function get borderItems() : Array
      {
         return null;
      }
      
      protected function get defaultBorderItemColor() : uint
      {
         return 0;
      }
      
      protected function get defaultBorderAlpha() : Number
      {
         return NaN;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc4_:Boolean = false;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc3_:Array = this.borderItems;
         if(Boolean(_loc3_) && _loc3_.length > 0)
         {
            _loc4_ = false;
            _loc6_ = getStyle("errorColor");
            _loc7_ = this.defaultBorderAlpha;
            if(getStyle("borderColor") == _loc6_)
            {
               _loc5_ = _loc6_;
            }
            else
            {
               _loc5_ = this.defaultBorderItemColor;
            }
            _loc8_ = 0;
            while(_loc8_ < _loc3_.length)
            {
               if(this[_loc3_[_loc8_]])
               {
                  this[_loc3_[_loc8_]].color = _loc5_;
                  if(!isNaN(_loc7_))
                  {
                     this[_loc3_[_loc8_]].alpha = _loc7_;
                  }
               }
               _loc8_++;
            }
         }
         super.updateDisplayList(param1,param2);
      }
   }
}
