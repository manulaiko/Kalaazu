package com.greensock.plugins
{
   import com.greensock.TweenLite;
   import flash.display.MovieClip;
   
   public class FrameForwardPlugin extends TweenPlugin
   {
      
      public static const API:Number = 1;
       
      
      protected var _start:int;
      
      protected var _change:int;
      
      protected var _max:uint;
      
      protected var _target:MovieClip;
      
      protected var _backward:Boolean;
      
      public function FrameForwardPlugin()
      {
         super();
         this.propName = "frameForward";
         this.overwriteProps = ["frame","frameLabel","frameForward","frameBackward"];
         this.round = true;
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:TweenLite) : Boolean
      {
         if(!(param1 is MovieClip) || isNaN(param2))
         {
            return false;
         }
         this._target = param1 as MovieClip;
         this._start = this._target.currentFrame;
         this._max = this._target.totalFrames;
         this._change = typeof param2 == "number" ? Number(param2) - this._start : Number(param2);
         if(!this._backward && this._change < 0)
         {
            this._change += this._max;
         }
         else if(this._backward && this._change > 0)
         {
            this._change -= this._max;
         }
         return true;
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         var _loc2_:Number = (this._start + this._change * param1) % this._max;
         if(_loc2_ < 0.5 && _loc2_ >= -0.5)
         {
            _loc2_ = this._max;
         }
         else if(_loc2_ < 0)
         {
            _loc2_ += this._max;
         }
         this._target.gotoAndStop(int(_loc2_ + 0.5));
      }
   }
}
