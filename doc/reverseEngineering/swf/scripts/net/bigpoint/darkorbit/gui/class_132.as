package net.bigpoint.darkorbit.gui
{
   import com.greensock.TweenLite;
   import com.greensock.TweenMax;
   import com.greensock.easing.Quad;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import flash.text.AntiAliasType;
   import flash.text.GridFitType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import net.bigpoint.darkorbit.class_18;
   
   public class class_132 extends Sprite
   {
      
      public static const const_2194:String = "handleFadeOutComplete";
      
      private static const const_237:GlowFilter = new GlowFilter(0,1,4,4,6,1);
       
      
      public function class_132(param1:String, param2:int, param3:int = 4)
      {
         var _loc4_:* = null;
         var _loc6_:* = null;
         super();
         _loc4_ = new TextField();
         var _loc5_:TextFormat;
         (_loc5_ = new TextFormat(class_18.const_639.font,class_18.const_2945)).align = TextFormatAlign.CENTER;
         _loc5_.color = 16777215;
         _loc4_.defaultTextFormat = _loc5_;
         _loc4_.embedFonts = class_18.var_3893;
         _loc4_.text = param1;
         _loc4_.width = param2;
         _loc4_.wordWrap = true;
         _loc4_.gridFitType = GridFitType.SUBPIXEL;
         _loc4_.antiAliasType = AntiAliasType.ADVANCED;
         _loc4_.filters = [const_237];
         _loc4_.autoSize = TextFieldAutoSize.CENTER;
         var _loc7_:int = _loc4_.width;
         _loc6_ = new BitmapData(_loc7_,_loc4_.height + 3,true,0);
         var _loc8_:Matrix = new Matrix();
         _loc6_.draw(_loc4_,_loc8_);
         addChild(new Bitmap(_loc6_));
         alpha = 0;
         TweenLite.to(this,0.1,{"alpha":1});
         TweenMax.delayedCall(param3 - 1,this.method_1983);
      }
      
      public function dispose() : void
      {
         this.removeFromParent();
      }
      
      public function removeFromParent() : void
      {
         if(parent != null && Boolean(parent.contains(this)))
         {
            parent.removeChild(this);
         }
      }
      
      public function moveTo(param1:int) : void
      {
         if(param1 == y)
         {
            return;
         }
         TweenLite.to(this,0.4,{
            "y":param1,
            "ease":Quad.easeOut
         });
      }
      
      private function method_1983() : void
      {
         TweenLite.to(this,0.3,{
            "alpha":0,
            "ease":Quad.easeOut,
            "onComplete":this.handleFadeOutComplete
         });
      }
      
      private function handleFadeOutComplete() : void
      {
         this.removeFromParent();
         dispatchEvent(new Event(const_2194));
      }
   }
}
