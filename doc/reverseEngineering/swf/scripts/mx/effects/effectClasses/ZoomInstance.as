package mx.effects.effectClasses
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.core.mx_internal;
   import mx.effects.EffectManager;
   import mx.events.FlexEvent;
   
   public class ZoomInstance extends TweenEffectInstance
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      private var origScaleX:Number;
      
      private var origScaleY:Number;
      
      private var origX:Number;
      
      private var origY:Number;
      
      private var newX:Number;
      
      private var newY:Number;
      
      private var scaledOriginX:Number;
      
      private var scaledOriginY:Number;
      
      private var origPercentWidth:Number;
      
      private var origPercentHeight:Number;
      
      private var _mouseHasMoved:Boolean = false;
      
      private var show:Boolean = true;
      
      public var captureRollEvents:Boolean;
      
      public var originX:Number;
      
      public var originY:Number;
      
      public var zoomHeightFrom:Number;
      
      public var zoomHeightTo:Number;
      
      public var zoomWidthFrom:Number;
      
      public var zoomWidthTo:Number;
      
      public function ZoomInstance(param1:Object)
      {
         super(param1);
      }
      
      override public function initEffect(param1:Event) : void
      {
         super.initEffect(param1);
         if(param1.type == FlexEvent.HIDE || param1.type == Event.REMOVED)
         {
            this.show = false;
         }
      }
      
      override public function play() : void
      {
         super.play();
         this.applyPropertyChanges();
         if(isNaN(this.zoomWidthFrom) && isNaN(this.zoomWidthTo) && isNaN(this.zoomHeightFrom) && isNaN(this.zoomHeightTo))
         {
            if(this.show)
            {
               this.zoomWidthFrom = this.zoomHeightFrom = 0;
               this.zoomWidthTo = target.scaleX;
               this.zoomHeightTo = target.scaleY;
            }
            else
            {
               this.zoomWidthFrom = target.scaleX;
               this.zoomHeightFrom = target.scaleY;
               this.zoomWidthTo = this.zoomHeightTo = 0;
            }
         }
         else
         {
            if(isNaN(this.zoomWidthFrom) && isNaN(this.zoomWidthTo))
            {
               this.zoomWidthFrom = this.zoomWidthTo = target.scaleX;
            }
            else if(isNaN(this.zoomHeightFrom) && isNaN(this.zoomHeightTo))
            {
               this.zoomHeightFrom = this.zoomHeightTo = target.scaleY;
            }
            if(isNaN(this.zoomWidthFrom))
            {
               this.zoomWidthFrom = target.scaleX;
            }
            else if(isNaN(this.zoomWidthTo))
            {
               this.zoomWidthTo = this.zoomWidthFrom == 1 ? 0 : 1;
            }
            if(isNaN(this.zoomHeightFrom))
            {
               this.zoomHeightFrom = target.scaleY;
            }
            else if(isNaN(this.zoomHeightTo))
            {
               this.zoomHeightTo = this.zoomHeightFrom == 1 ? 0 : 1;
            }
         }
         if(this.zoomWidthFrom < 0.01)
         {
            this.zoomWidthFrom = 0.01;
         }
         if(this.zoomWidthTo < 0.01)
         {
            this.zoomWidthTo = 0.01;
         }
         if(this.zoomHeightFrom < 0.01)
         {
            this.zoomHeightFrom = 0.01;
         }
         if(this.zoomHeightTo < 0.01)
         {
            this.zoomHeightTo = 0.01;
         }
         this.origScaleX = target.scaleX;
         this.origScaleY = target.scaleY;
         this.newX = this.origX = target.x;
         this.newY = this.origY = target.y;
         if(isNaN(this.originX))
         {
            this.scaledOriginX = 0;
         }
         else
         {
            this.scaledOriginX = this.originX * this.origScaleX;
         }
         if(isNaN(this.originY))
         {
            this.scaledOriginY = 0;
         }
         else
         {
            this.scaledOriginY = this.originY * this.origScaleY;
         }
         this.scaledOriginX = Number(this.scaledOriginX.toFixed(1));
         this.scaledOriginY = Number(this.scaledOriginY.toFixed(1));
         this.origPercentWidth = target.percentWidth;
         if(!isNaN(this.origPercentWidth))
         {
            target.width = target.width;
         }
         this.origPercentHeight = target.percentHeight;
         if(!isNaN(this.origPercentHeight))
         {
            target.height = target.height;
         }
         tween = createTween(this,[this.zoomWidthFrom,this.zoomHeightFrom],[this.zoomWidthTo,this.zoomHeightTo],duration);
         if(this.captureRollEvents)
         {
            target.addEventListener(MouseEvent.ROLL_OVER,this.mouseEventHandler,false);
            target.addEventListener(MouseEvent.ROLL_OUT,this.mouseEventHandler,false);
            target.addEventListener(MouseEvent.MOUSE_MOVE,this.mouseEventHandler,false);
         }
      }
      
      override public function onTweenUpdate(param1:Object) : void
      {
         EffectManager.suspendEventHandling();
         if(Math.abs(this.newX - 0) > 0.1)
         {
            this.origX += Number(target.x.toFixed(1)) - this.newX;
         }
         if(Math.abs(this.newY - 0) > 0.1)
         {
            this.origY += Number(target.y.toFixed(1)) - this.newY;
         }
         target.scaleX = param1[0];
         target.scaleY = param1[1];
         var _loc2_:Number = Number(param1[0]) / this.origScaleX;
         var _loc3_:Number = Number(param1[1]) / this.origScaleY;
         var _loc4_:Number = this.scaledOriginX * _loc2_;
         var _loc5_:Number = this.scaledOriginY * _loc3_;
         this.newX = this.scaledOriginX - _loc4_ + this.origX;
         this.newY = this.scaledOriginY - _loc5_ + this.origY;
         this.newX = Number(this.newX.toFixed(1));
         this.newY = Number(this.newY.toFixed(1));
         target.move(this.newX,this.newY);
         if(tween)
         {
            tween.mx_internal::needToLayout = true;
         }
         else
         {
            mx_internal::needToLayout = true;
         }
         EffectManager.resumeEventHandling();
      }
      
      override public function onTweenEnd(param1:Object) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(!isNaN(this.origPercentWidth))
         {
            _loc2_ = 0;
            target.percentWidth = this.origPercentWidth;
            if(false && target.parent.autoLayout == false)
            {
               target._width = _loc2_;
            }
         }
         if(!isNaN(this.origPercentHeight))
         {
            _loc3_ = 0;
            target.percentHeight = this.origPercentHeight;
            if(false && target.parent.autoLayout == false)
            {
               target._height = _loc3_;
            }
         }
         super.onTweenEnd(param1);
         if(mx_internal::hideOnEffectEnd)
         {
            EffectManager.suspendEventHandling();
            target.scaleX = this.origScaleX;
            target.scaleY = this.origScaleY;
            target.move(this.origX,this.origY);
            EffectManager.resumeEventHandling();
         }
      }
      
      override public function finishEffect() : void
      {
         if(this.captureRollEvents)
         {
            target.removeEventListener(MouseEvent.ROLL_OVER,this.mouseEventHandler,false);
            target.removeEventListener(MouseEvent.ROLL_OUT,this.mouseEventHandler,false);
            target.removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseEventHandler,false);
         }
         super.finishEffect();
      }
      
      private function applyPropertyChanges() : void
      {
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc1_:PropertyChanges = propertyChanges;
         if(_loc1_)
         {
            _loc2_ = false;
            _loc3_ = false;
            if(_loc1_.end["scaleX"] !== undefined)
            {
               this.zoomWidthFrom = isNaN(this.zoomWidthFrom) ? 0 : this.zoomWidthFrom;
               this.zoomWidthTo = isNaN(this.zoomWidthTo) ? Number(_loc1_.end["scaleX"]) : this.zoomWidthTo;
               _loc3_ = true;
            }
            if(_loc1_.end["scaleY"] !== undefined)
            {
               this.zoomHeightFrom = isNaN(this.zoomHeightFrom) ? 0 : this.zoomHeightFrom;
               this.zoomHeightTo = isNaN(this.zoomHeightTo) ? Number(_loc1_.end["scaleY"]) : this.zoomHeightTo;
               _loc3_ = true;
            }
            if(_loc3_)
            {
               return;
            }
            if(_loc1_.end["width"] !== undefined)
            {
               this.zoomWidthFrom = isNaN(this.zoomWidthFrom) ? this.getScaleFromWidth(target.width) : this.zoomWidthFrom;
               this.zoomWidthTo = isNaN(this.zoomWidthTo) ? this.getScaleFromWidth(_loc1_.end["width"]) : this.zoomWidthTo;
               _loc2_ = true;
            }
            if(_loc1_.end["height"] !== undefined)
            {
               this.zoomHeightFrom = isNaN(this.zoomHeightFrom) ? this.getScaleFromHeight(target.height) : this.zoomHeightFrom;
               this.zoomHeightTo = isNaN(this.zoomHeightTo) ? this.getScaleFromHeight(_loc1_.end["height"]) : this.zoomHeightTo;
               _loc2_ = true;
            }
            if(_loc2_)
            {
               return;
            }
            if(_loc1_.end["visible"] !== undefined)
            {
               this.show = _loc1_.end["visible"];
            }
         }
      }
      
      private function getScaleFromWidth(param1:Number) : Number
      {
         return param1 / (0 / Math.abs(target.scaleX));
      }
      
      private function getScaleFromHeight(param1:Number) : Number
      {
         return param1 / (0 / Math.abs(target.scaleY));
      }
      
      private function mouseEventHandler(param1:MouseEvent) : void
      {
         if(param1.type == MouseEvent.MOUSE_MOVE)
         {
            this._mouseHasMoved = true;
         }
         else if(param1.type == MouseEvent.ROLL_OUT || param1.type == MouseEvent.ROLL_OVER)
         {
            if(!this._mouseHasMoved)
            {
               param1.stopImmediatePropagation();
            }
            this._mouseHasMoved = false;
         }
      }
   }
}
