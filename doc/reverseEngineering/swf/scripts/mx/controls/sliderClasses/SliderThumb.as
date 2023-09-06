package mx.controls.sliderClasses
{
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   import mx.controls.Button;
   import mx.controls.ButtonPhase;
   import mx.core.FlexVersion;
   import mx.core.mx_internal;
   
   public class SliderThumb extends Button
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      mx_internal var thumbIndex:int;
      
      private var xOffset:Number;
      
      public function SliderThumb()
      {
         super();
         stickyHighlighting = true;
      }
      
      override public function set x(param1:Number) : void
      {
         var _loc2_:Number = this.moveXPos(param1);
         this.updateValue();
         super.x = _loc2_;
      }
      
      public function get xPosition() : Number
      {
         return mx_internal::$x + width / 2;
      }
      
      public function set xPosition(param1:Number) : void
      {
         mx_internal::$x = param1 - width / 2;
         Slider(owner).mx_internal::drawTrackHighlight();
      }
      
      override protected function measure() : void
      {
         super.measure();
         if(false)
         {
            measuredWidth = 12;
            measuredHeight = 12;
         }
      }
      
      override public function drawFocus(param1:Boolean) : void
      {
         mx_internal::phase = param1 ? "null" : ButtonPhase.UP;
      }
      
      override mx_internal function buttonReleased() : void
      {
         super.mx_internal::buttonReleased();
         if(enabled)
         {
            systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler,true);
            systemManager.deployMouseShields(false);
            Slider(owner).mx_internal::onThumbRelease(this);
         }
      }
      
      private function moveXPos(param1:Number, param2:Boolean = false, param3:Boolean = false) : Number
      {
         var _loc4_:Number = this.calculateXPos(param1,param2);
         this.xPosition = _loc4_;
         if(!param3)
         {
            this.updateValue();
         }
         return _loc4_;
      }
      
      private function calculateXPos(param1:Number, param2:Boolean = false) : Number
      {
         var _loc3_:Object = Slider(owner).mx_internal::getXBounds(this.mx_internal::thumbIndex);
         var _loc4_:Number = Math.min(Math.max(param1,_loc3_.min),_loc3_.max);
         if(!param2)
         {
            _loc4_ = Number(Slider(owner).mx_internal::getSnapValue(_loc4_,this));
         }
         return _loc4_;
      }
      
      mx_internal function onTweenUpdate(param1:Number) : void
      {
         this.moveXPos(param1,true,true);
      }
      
      mx_internal function onTweenEnd(param1:Number) : void
      {
         this.moveXPos(param1);
      }
      
      private function updateValue() : void
      {
         Slider(owner).mx_internal::updateThumbValue(this.mx_internal::thumbIndex);
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         var _loc6_:Number = NaN;
         var _loc2_:* = Slider(owner).thumbCount > 1;
         var _loc3_:Number = this.xPosition;
         var _loc4_:Number = Slider(owner).snapInterval > 0 ? Number(Slider(owner).mx_internal::getSnapIntervalWidth()) : 1;
         var _loc5_:* = Slider(owner).direction == SliderDirection.HORIZONTAL;
         var _loc7_:uint;
         if((_loc7_ = uint(mx_internal::mapKeycodeForLayoutDirection(param1))) == Keyboard.DOWN && !_loc5_ || _loc7_ == Keyboard.LEFT && _loc5_)
         {
            _loc6_ = _loc3_ - _loc4_;
         }
         else if(_loc7_ == Keyboard.UP && !_loc5_ || _loc7_ == Keyboard.RIGHT && _loc5_)
         {
            _loc6_ = _loc3_ + _loc4_;
         }
         else if(_loc7_ == Keyboard.PAGE_DOWN && !_loc5_ || _loc7_ == Keyboard.HOME && _loc5_)
         {
            _loc6_ = Number(Slider(owner).mx_internal::getXFromValue(Slider(owner).minimum));
         }
         else if(_loc7_ == Keyboard.PAGE_UP && !_loc5_ || _loc7_ == Keyboard.END && _loc5_)
         {
            _loc6_ = Number(Slider(owner).mx_internal::getXFromValue(Slider(owner).maximum));
         }
         if(!isNaN(_loc6_))
         {
            param1.stopPropagation();
            Slider(owner).mx_internal::keyInteraction = true;
            this.moveXPos(_loc6_);
         }
      }
      
      override protected function mouseDownHandler(param1:MouseEvent) : void
      {
         super.mouseDownHandler(param1);
         if(enabled)
         {
            this.xOffset = param1.localX;
            systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler,true);
            systemManager.deployMouseShields(true);
            Slider(owner).mx_internal::onThumbPress(this);
         }
      }
      
      private function mouseMoveHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(enabled)
         {
            _loc2_ = new Point(param1.stageX,param1.stageY);
            _loc2_ = Slider(owner).mx_internal::innerSlider.globalToLocal(_loc2_);
            this.moveXPos(_loc2_.x - this.xOffset + width / 2,false,true);
            Slider(owner).mx_internal::onThumbMove(this);
         }
      }
   }
}
