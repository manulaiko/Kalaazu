package net.bigpoint.darkorbit.mvc.gui.highlights.view
{
   import com.greensock.TweenMax;
   import flash.display.DisplayObject;
   import flash.utils.getTimer;
   import net.bigpoint.darkorbit.mvc.gui.highlights.model.HighlightItemVO;
   
   public class FlashWindowHighlight implements IHighLighter, IHighlightActivate
   {
       
      
      private var _element:DisplayObject;
      
      private var _running:Boolean;
      
      private var _vo:HighlightItemVO;
      
      private var _tween:TweenMax;
      
      private var _tweenStartTime:Number;
      
      public function FlashWindowHighlight()
      {
         super();
      }
      
      private function createTween() : void
      {
         TweenMax.killTweensOf(this._element,true);
         this._tween = TweenMax.to(this._element,0.5,{
            "colorMatrixFilter":{
               "brightness":1.2,
               "contrast":1.2,
               "saturation":1.4
            },
            "glowFilter":{
               "inner":false,
               "color":12710399,
               "alpha":0.7,
               "blurX":6,
               "blurY":6,
               "strength":1
            },
            "yoyo":true,
            "repeat":1,
            "onComplete":this.doHighlight
         });
      }
      
      public function decorateUiElement(param1:Object, param2:HighlightItemVO) : void
      {
         this._vo = param2;
         this._running = true;
         this._element = param1 as DisplayObject;
         this._tweenStartTime = getTimer();
         this.createTween();
      }
      
      private function doHighlight() : void
      {
         var _loc1_:Number = NaN;
         if(this._vo.displayTime > 0)
         {
            _loc1_ = (getTimer() - this._tweenStartTime) / 1000;
            if(_loc1_ >= this._vo.displayTime)
            {
               this._running = false;
            }
         }
         if(this._running)
         {
            this._tween.restart();
         }
         else
         {
            this._tween.kill();
         }
      }
      
      public function remove() : void
      {
         this._running = false;
      }
      
      public function get vo() : HighlightItemVO
      {
         return this._vo;
      }
      
      public function get expectedClass() : Class
      {
         return DisplayObject;
      }
      
      public function isRunning() : Boolean
      {
         return this._running;
      }
   }
}
