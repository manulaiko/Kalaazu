package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.abstract
{
   import com.bigpoint.utils.class_968;
   import com.greensock.TweenMax;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import package_11.class_39;
   import package_142.class_970;
   
   public class AbstractMenuElement extends class_970
   {
      
      private static const DEFAULT_HEIGHT:int = 50;
      
      private static const ICON_CONTAINER:String = "iconContainer";
       
      
      public var iconContainer:Sprite;
      
      protected var _bitmapFontsAtlas:class_968;
      
      protected var _duringHighlight:Boolean;
      
      public function AbstractMenuElement(param1:class_39, param2:String)
      {
         _swfFinisher = param1;
         super(_swfFinisher.method_2545(param2) as DisplayObjectContainer);
      }
      
      override public function decorate() : void
      {
         super.decorate();
         method_4210(this.iconContainer = method_4492(ICON_CONTAINER));
      }
      
      protected function initLabels(param1:String) : void
      {
         labelF.autoSize = TextFieldAutoSize.CENTER;
         labelF.multiline = true;
         labelF.htmlText = param1;
      }
      
      protected function placeIcon(param1:BitmapData) : void
      {
         while(this.iconContainer.numChildren)
         {
            this.iconContainer.removeChildAt(0);
         }
         var _loc2_:Bitmap = new Bitmap(param1);
         this.iconContainer.addChild(_loc2_);
      }
      
      override public function updateLayout() : void
      {
         if(labelF)
         {
            labelF.y = DEFAULT_HEIGHT - 0 >> 1;
         }
      }
      
      public function highlight(param1:Number = 0.4) : void
      {
         if(!this._duringHighlight)
         {
            this._duringHighlight = true;
            this.doHighlite(param1);
         }
      }
      
      private function doHighlite(param1:Number) : void
      {
         if(this._duringHighlight)
         {
            TweenMax.to(this,param1,{
               "colorMatrixFilter":{
                  "brightness":1.5,
                  "contrast":1.5,
                  "saturation":1.5
               },
               "yoyo":true,
               "repeat":1,
               "onComplete":this.doHighlite,
               "onCompleteParams":[param1]
            });
         }
      }
      
      public function stopHighlight() : void
      {
         this._duringHighlight = false;
      }
      
      protected function getBitmapNumber(param1:int) : Bitmap
      {
         return new Bitmap(this._bitmapFontsAtlas.method_4093(String(param1)));
      }
   }
}
