package net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.slotAndItemElement
{
   import com.greensock.TweenMax;
   import com.greensock.easing.Sine;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import package_141.class_969;
   
   public class ProgressBar extends class_969
   {
      
      public static const SCALE_VERTICALLY:String = "scaleVertically";
      
      public static const SCALE_HORIZONTALLY:String = "scaleHorizontally";
      
      private static const COLORIZE_REPEAT_COUNT:int = 3;
      
      private static const BAR:String = "bar";
      
      private static const BORDER:String = "border";
      
      private static const BACKGROUND:String = "background";
       
      
      public var bar:Sprite;
      
      public var border:Sprite;
      
      public var background:Sprite;
      
      private var _lasthighLightColor:Number;
      
      public function ProgressBar(param1:DisplayObjectContainer)
      {
         super(param1);
      }
      
      override public function decorate() : void
      {
         method_4210(this.border = method_4492(BORDER));
         method_4210(this.background = method_4492(BACKGROUND));
         method_4210(this.bar = method_4492(BAR));
         this.background.visible = false;
      }
      
      public function setProgress(param1:Number, param2:Number, param3:Number, param4:Number, param5:String = "scaleHorizontally") : void
      {
         var _loc7_:int = 0;
         var _loc6_:Number = param1 / param2;
         if(param4 != this._lasthighLightColor)
         {
            TweenMax.to(this.bar,0,{"colorMatrixFilter":{"colorize":param3}});
            TweenMax.to(this.border,0,{"colorMatrixFilter":{"colorize":param3}});
            TweenMax.to(this.background,0,{"colorTransform":{
               "tint":param4,
               "tintAmount":0
            }});
            _loc7_ = COLORIZE_REPEAT_COUNT * 2;
            TweenMax.to(this.bar,0,{"colorMatrixFilter":{"colorize":param4}});
            TweenMax.to(this.border,0,{"colorMatrixFilter":{"colorize":param4}});
            this.background.visible = true;
            TweenMax.to(this.background,0,{"colorTransform":{
               "tint":16777215,
               "tintAmount":0.5
            }});
            TweenMax.to(this.background,0,{
               "colorTransform":{
                  "tint":param4,
                  "tintAmount":0.2
               },
               "yoyo":true,
               "repeat":_loc7_,
               "ease":Sine.easeIn
            });
            this._lasthighLightColor = param4;
         }
         if(param5 == SCALE_HORIZONTALLY)
         {
            this.bar.scaleX = _loc6_;
         }
         else
         {
            this.bar.scaleY = _loc6_;
         }
         visible = true;
      }
      
      public function removeHighlight(param1:Number) : void
      {
         TweenMax.to(this.bar,0,{"colorMatrixFilter":{"colorize":param1}});
         TweenMax.to(this.border,0,{"colorMatrixFilter":{"colorize":param1}});
         this._lasthighLightColor = -1;
      }
   }
}
