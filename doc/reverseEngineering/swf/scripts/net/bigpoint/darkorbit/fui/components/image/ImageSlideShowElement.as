package net.bigpoint.darkorbit.fui.components.image
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import net.bigpoint.darkorbit.fui.components.core.transitions.AbstractTransitionEffect;
   import net.bigpoint.darkorbit.fui.components.core.transitions.ITransitionEffect;
   
   public class ImageSlideShowElement extends Sprite
   {
       
      
      protected const DEFAULT_MINIMUM_DURATION:uint = 500;
      
      protected var _duration:uint = 500;
      
      protected var _target:DisplayObject;
      
      protected var _transitionEffect:ITransitionEffect;
      
      protected var _timer:Timer;
      
      protected var _goOn:Boolean;
      
      public function ImageSlideShowElement()
      {
         super();
      }
      
      public function play(param1:Boolean = true) : void
      {
         this._goOn = param1;
         this._transitionEffect.init();
         this._transitionEffect.addEventListener(AbstractTransitionEffect.FADE_IN_COMPLETE,this.handleFadedInEvent);
         this._transitionEffect.fadeIn();
      }
      
      public function dispose() : void
      {
         if(this._timer)
         {
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.handleTimerEventComplete);
            this._timer = null;
         }
         if(this._transitionEffect)
         {
            this._transitionEffect.removeEventListener(AbstractTransitionEffect.FADE_OUT_COMPLETE,this.handleFadedOutEvent);
            this._transitionEffect.dispose();
         }
      }
      
      protected function startDisplayTimer() : void
      {
         if(this._timer)
         {
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.handleTimerEventComplete);
            this._timer = null;
         }
         this._timer = new Timer(this._duration,1);
         this._timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.handleTimerEventComplete);
         this._timer.start();
      }
      
      protected function handleFadedInEvent(param1:Event) : void
      {
         dispatchEvent(new ImageSlideShowElementEvent(ImageSlideShowElementEvent.FADED_IN));
         this.startDisplayTimer();
      }
      
      protected function handleTimerEventComplete(param1:TimerEvent) : void
      {
         if(this._goOn)
         {
            dispatchEvent(new ImageSlideShowElementEvent(ImageSlideShowElementEvent.PLAYBACKTIME_OVER));
            this._transitionEffect.fadeOut();
         }
      }
      
      protected function handleFadedOutEvent(param1:Event) : void
      {
         dispatchEvent(new ImageSlideShowElementEvent(ImageSlideShowElementEvent.FADED_OUT));
      }
      
      public function get duration() : uint
      {
         return this._duration;
      }
      
      public function set duration(param1:uint) : void
      {
         if(param1 < 500)
         {
            param1 = 500;
         }
         this._duration = param1;
      }
      
      public function get target() : DisplayObject
      {
         return this._target;
      }
      
      public function set target(param1:DisplayObject) : void
      {
         if(contains(param1))
         {
            removeChild(param1);
         }
         if(this._transitionEffect)
         {
            this._transitionEffect.target = param1;
         }
         this._target = param1;
         addChild(this._target);
      }
      
      public function get transitionEffect() : ITransitionEffect
      {
         return this._transitionEffect;
      }
      
      public function set transitionEffect(param1:ITransitionEffect) : void
      {
         this._transitionEffect = param1;
         if(this._target)
         {
            this._transitionEffect.target = this.target;
         }
      }
   }
}
