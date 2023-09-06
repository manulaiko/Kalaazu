package spark.skins.spark
{
   import flash.filters.GlowFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.core.mx_internal;
   
   public class FocusSkin extends HighlightBitmapCaptureSkin
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static var colorTransform:ColorTransform = new ColorTransform(1.01,1.01,1.01,2);
      
      private static var glowFilter:GlowFilter = new GlowFilter(7385838,0.85,5,5,3,1,false,true);
      
      private static var rect:Rectangle = new Rectangle();
      
      private static var filterPt:Point = new Point();
       
      
      private const BLUR_MULTIPLIER:Number = 2.5;
      
      private const ALPHA_MULTIPLIER:Number = 1.5454;
      
      public function FocusSkin()
      {
         super();
      }
      
      override protected function get borderWeight() : Number
      {
         if(target)
         {
            return target.getStyle("focusThickness");
         }
         return getStyle("focusThickness");
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         if(target)
         {
            blendMode = target.getStyle("focusBlendMode");
         }
      }
      
      override protected function processBitmap() : void
      {
         rect.x = rect.y = 0;
         rect.width = bitmap.width;
         rect.height = bitmap.height;
         if(false && target.getStyle("showErrorSkin"))
         {
            glowFilter.color = target.getStyle("errorColor");
         }
         else
         {
            glowFilter.color = target.getStyle("focusColor");
         }
         var _loc1_:* = this.borderWeight * this.BLUR_MULTIPLIER;
         glowFilter.blurY = this.borderWeight * this.BLUR_MULTIPLIER;
         glowFilter.blurX = _loc1_;
         glowFilter.alpha = target.getStyle("focusAlpha") * this.ALPHA_MULTIPLIER;
         bitmap.bitmapData.applyFilter(bitmap.bitmapData,rect,filterPt,glowFilter);
      }
   }
}
