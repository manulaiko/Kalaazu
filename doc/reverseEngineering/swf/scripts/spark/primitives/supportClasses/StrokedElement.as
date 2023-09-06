package spark.primitives.supportClasses
{
   import flash.display.Graphics;
   import flash.display.LineScaleMode;
   import flash.display.Sprite;
   import flash.events.EventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.IStroke;
   
   public class StrokedElement extends GraphicElement
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      mx_internal var _stroke:IStroke;
      
      public function StrokedElement()
      {
         super();
      }
      
      [Bindable("propertyChange")]
      public function get stroke() : IStroke
      {
         return this.mx_internal::_stroke;
      }
      
      public function set stroke(param1:IStroke) : void
      {
         var _loc2_:* = null;
         var _loc3_:IStroke = this.mx_internal::_stroke;
         _loc2_ = this.mx_internal::_stroke as EventDispatcher;
         if(_loc2_)
         {
            _loc2_.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.stroke_propertyChangeHandler);
         }
         this.mx_internal::_stroke = param1;
         _loc2_ = this.mx_internal::_stroke as EventDispatcher;
         if(_loc2_)
         {
            _loc2_.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE,this.stroke_propertyChangeHandler);
         }
         mx_internal::dispatchPropertyChangeEvent("stroke",_loc3_,this.mx_internal::_stroke);
         invalidateDisplayList();
         invalidateParentSizeAndDisplayList();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         if(!drawnDisplayObject || !(drawnDisplayObject is Sprite))
         {
            return;
         }
         var _loc3_:Graphics = (drawnDisplayObject as Sprite).graphics;
         this.beginDraw(_loc3_);
         this.draw(_loc3_);
         this.endDraw(_loc3_);
      }
      
      protected function beginDraw(param1:Graphics) : void
      {
         var _loc2_:* = null;
         if(this.stroke)
         {
            _loc2_ = this.getStrokeBounds();
            _loc2_.offset(drawX,drawY);
            this.stroke.apply(param1,_loc2_,new Point(drawX,drawY));
         }
         else
         {
            param1.lineStyle();
         }
         param1.beginFill(0,0);
      }
      
      protected function draw(param1:Graphics) : void
      {
      }
      
      protected function endDraw(param1:Graphics) : void
      {
         param1.endFill();
      }
      
      protected function getStrokeBounds() : Rectangle
      {
         var _loc1_:Rectangle = this.getStrokeExtents(false);
         _loc1_.x += measuredX;
         _loc1_.width += width;
         _loc1_.y += measuredY;
         _loc1_.height += height;
         return _loc1_;
      }
      
      override protected function getStrokeExtents(param1:Boolean = true) : Rectangle
      {
         if(!this.stroke)
         {
            mx_internal::_strokeExtents.x = 0;
            mx_internal::_strokeExtents.y = 0;
            mx_internal::_strokeExtents.width = 0;
            mx_internal::_strokeExtents.height = 0;
            return mx_internal::_strokeExtents;
         }
         var _loc2_:Number = this.stroke.weight;
         if(_loc2_ == 0)
         {
            mx_internal::_strokeExtents.width = 1;
            mx_internal::_strokeExtents.height = 1;
            mx_internal::_strokeExtents.x = -0.5;
            mx_internal::_strokeExtents.y = -0.5;
            return mx_internal::_strokeExtents;
         }
         var _loc3_:String = this.stroke.scaleMode;
         if(!_loc3_ || _loc3_ == LineScaleMode.NONE || !param1)
         {
            mx_internal::_strokeExtents.width = _loc2_;
            mx_internal::_strokeExtents.height = _loc2_;
            mx_internal::_strokeExtents.x = -_loc2_ * 0.5;
            mx_internal::_strokeExtents.y = -_loc2_ * 0.5;
            return mx_internal::_strokeExtents;
         }
         var _loc4_:Number = scaleX;
         var _loc5_:Number = scaleY;
         if(_loc3_ == LineScaleMode.NORMAL)
         {
            if(_loc4_ == _loc5_)
            {
               _loc2_ *= _loc4_;
            }
            else
            {
               _loc2_ *= Math.sqrt(0.5 * (_loc4_ * _loc4_ + _loc5_ * _loc5_));
            }
            mx_internal::_strokeExtents.width = _loc2_;
            mx_internal::_strokeExtents.height = _loc2_;
            mx_internal::_strokeExtents.x = _loc2_ * -0.5;
            mx_internal::_strokeExtents.y = _loc2_ * -0.5;
            return mx_internal::_strokeExtents;
         }
         if(_loc3_ == LineScaleMode.HORIZONTAL)
         {
            mx_internal::_strokeExtents.width = _loc2_ * _loc4_;
            mx_internal::_strokeExtents.height = _loc2_;
            mx_internal::_strokeExtents.x = _loc2_ * _loc4_ * -0.5;
            mx_internal::_strokeExtents.y = _loc2_ * -0.5;
            return mx_internal::_strokeExtents;
         }
         if(_loc3_ == LineScaleMode.VERTICAL)
         {
            mx_internal::_strokeExtents.width = _loc2_;
            mx_internal::_strokeExtents.height = _loc2_ * _loc5_;
            mx_internal::_strokeExtents.x = _loc2_ * -0.5;
            mx_internal::_strokeExtents.y = _loc2_ * _loc5_ * -0.5;
            return mx_internal::_strokeExtents;
         }
         return null;
      }
      
      protected function stroke_propertyChangeHandler(param1:PropertyChangeEvent) : void
      {
         invalidateDisplayList();
         switch(param1.property)
         {
            case "weight":
            case "scaleMode":
               invalidateParentSizeAndDisplayList();
         }
      }
   }
}
