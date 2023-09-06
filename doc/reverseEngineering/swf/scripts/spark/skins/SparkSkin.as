package spark.skins
{
   import flash.display.DisplayObject;
   import flash.geom.ColorTransform;
   import spark.components.supportClasses.Skin;
   import spark.primitives.supportClasses.GraphicElement;
   
   public class SparkSkin extends Skin
   {
      
      private static const DEFAULT_COLOR_VALUE:uint = 204;
      
      private static const DEFAULT_COLOR:uint = 13421772;
      
      private static const DEFAULT_SYMBOL_COLOR:uint = 0;
      
      private static var colorTransform:ColorTransform = new ColorTransform();
      
      private static var oldContentBackgroundAlpha:Number;
      
      private static var contentBackgroundAlphaSetLocally:Boolean;
       
      
      protected var useChromeColor:Boolean = false;
      
      private var colorized:Boolean = false;
      
      public function SparkSkin()
      {
         super();
      }
      
      public function get colorizeExclusions() : Array
      {
         return null;
      }
      
      public function get symbolItems() : Array
      {
         return null;
      }
      
      public function get contentItems() : Array
      {
         return null;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:int = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:Number = NaN;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc4_:Array;
         if((Boolean(_loc4_ = this.symbolItems)) && _loc4_.length > 0)
         {
            _loc7_ = getStyle("symbolColor");
            _loc3_ = 0;
            while(_loc3_ < _loc4_.length)
            {
               if(this[_loc4_[_loc3_]])
               {
                  this[_loc4_[_loc3_]].color = _loc7_;
               }
               _loc3_++;
            }
         }
         var _loc5_:Array;
         if((Boolean(_loc5_ = this.contentItems)) && _loc5_.length > 0)
         {
            _loc8_ = getStyle("contentBackgroundColor");
            _loc9_ = getStyle("contentBackgroundAlpha");
            _loc3_ = 0;
            while(_loc3_ < _loc5_.length)
            {
               if(this[_loc5_[_loc3_]])
               {
                  this[_loc5_[_loc3_]].color = _loc8_;
                  this[_loc5_[_loc3_]].alpha = _loc9_;
               }
               _loc3_++;
            }
         }
         var _loc6_:uint;
         if(((_loc6_ = getStyle("chromeColor")) != DEFAULT_COLOR || this.colorized) && this.useChromeColor)
         {
            colorTransform.redOffset = ((_loc6_ & 16711680) >> 16) - DEFAULT_COLOR_VALUE;
            colorTransform.greenOffset = ((_loc6_ & 65280) >> 8) - DEFAULT_COLOR_VALUE;
            colorTransform.blueOffset = (_loc6_ & 255) - DEFAULT_COLOR_VALUE;
            colorTransform.alphaMultiplier = alpha;
            transform.colorTransform = colorTransform;
            if((Boolean(_loc10_ = this.colorizeExclusions)) && _loc10_.length > 0)
            {
               colorTransform.redOffset = 0;
               colorTransform.greenOffset = 0;
               colorTransform.blueOffset = 0;
               _loc3_ = 0;
               while(_loc3_ < _loc10_.length)
               {
                  if((Boolean(_loc11_ = this[_loc10_[_loc3_]])) && (_loc11_ is DisplayObject || _loc11_ is GraphicElement))
                  {
                     colorTransform.alphaMultiplier = _loc11_.alpha;
                     _loc11_.transform.colorTransform = colorTransform;
                  }
                  _loc3_++;
               }
            }
            this.colorized = true;
         }
         super.updateDisplayList(param1,param2);
      }
      
      override public function beginHighlightBitmapCapture() : Boolean
      {
         var _loc1_:Boolean = super.beginHighlightBitmapCapture();
         if(getStyle("contentBackgroundAlpha") < 0.5)
         {
            if(Boolean(styleDeclaration) && styleDeclaration.getStyle("contentBackgroundAlpha") !== null)
            {
               contentBackgroundAlphaSetLocally = true;
            }
            else
            {
               contentBackgroundAlphaSetLocally = false;
            }
            oldContentBackgroundAlpha = getStyle("contentBackgroundAlpha");
            setStyle("contentBackgroundAlpha",0.5);
            _loc1_ = true;
         }
         return _loc1_;
      }
      
      override public function endHighlightBitmapCapture() : Boolean
      {
         var _loc1_:Boolean = super.endHighlightBitmapCapture();
         if(!isNaN(oldContentBackgroundAlpha))
         {
            if(contentBackgroundAlphaSetLocally)
            {
               setStyle("contentBackgroundAlpha",oldContentBackgroundAlpha);
            }
            else
            {
               clearStyle("contentBackgroundAlpha");
            }
            _loc1_ = true;
            oldContentBackgroundAlpha = NaN;
         }
         return _loc1_;
      }
   }
}
