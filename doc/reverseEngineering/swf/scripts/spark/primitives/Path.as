package spark.primitives
{
   import flash.display.Graphics;
   import flash.display.GraphicsPath;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.IStroke;
   import mx.utils.MatrixUtil;
   import spark.primitives.supportClasses.FilledElement;
   
   public class Path extends FilledElement
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static var tangent:Point = new Point();
       
      
      private var graphicsPathChanged:Boolean = true;
      
      private var segments:PathSegmentsCollection;
      
      mx_internal var graphicsPath:GraphicsPath;
      
      private var _data:String;
      
      private var _winding:String = "evenOdd";
      
      private var _boundingBoxCached:Rectangle;
      
      private var _boundingBoxMatrixCached:Matrix;
      
      private var _boundingBoxWidthParamCached:Number;
      
      private var _boundingBoxHeightParamCached:Number;
      
      private var _boundingBoxX:Number;
      
      private var _boundingBoxY:Number;
      
      private var _drawBounds:Rectangle;
      
      public function Path()
      {
         this.mx_internal::graphicsPath = new GraphicsPath(new Vector.<int>(),new Vector.<Number>());
         this._drawBounds = new Rectangle();
         super();
      }
      
      public function set data(param1:String) : void
      {
         if(this._data == param1)
         {
            return;
         }
         this.segments = new PathSegmentsCollection(param1);
         this.graphicsPathChanged = true;
         this.clearCachedBoundingBoxWithStroke();
         invalidateSize();
         invalidateDisplayList();
         this._data = param1;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set winding(param1:String) : void
      {
         if(this._winding != param1)
         {
            this._winding = param1;
            this.graphicsPathChanged = true;
            invalidateDisplayList();
         }
      }
      
      public function get winding() : String
      {
         return this._winding;
      }
      
      private function getBounds() : Rectangle
      {
         return !!this.segments ? this.segments.getBounds() : new Rectangle();
      }
      
      override protected function measure() : void
      {
         var _loc1_:* = null;
         _loc1_ = this.getBounds();
         measuredWidth = _loc1_.width;
         measuredHeight = _loc1_.height;
         measuredX = _loc1_.left;
         measuredY = _loc1_.top;
      }
      
      private function getBoundingBoxWithStroke(param1:Number, param2:Number, param3:Matrix) : Rectangle
      {
         if(this._boundingBoxCached && this._boundingBoxWidthParamCached == param1 && this._boundingBoxHeightParamCached == param2)
         {
            if(!param3 && !this._boundingBoxMatrixCached)
            {
               this._boundingBoxCached.x = this._boundingBoxX;
               this._boundingBoxCached.y = this._boundingBoxY;
               return this._boundingBoxCached;
            }
            if(param3 && this._boundingBoxMatrixCached && param3.a == this._boundingBoxMatrixCached.a && param3.b == this._boundingBoxMatrixCached.b && param3.c == this._boundingBoxMatrixCached.c && param3.d == this._boundingBoxMatrixCached.d)
            {
               this._boundingBoxCached.x = this._boundingBoxX + param3.tx;
               this._boundingBoxCached.y = this._boundingBoxY + param3.ty;
               return this._boundingBoxCached;
            }
         }
         if(param3)
         {
            this._boundingBoxMatrixCached = param3.clone();
            this._boundingBoxMatrixCached.tx = 0;
            this._boundingBoxMatrixCached.ty = 0;
         }
         else
         {
            this._boundingBoxMatrixCached = null;
         }
         this._boundingBoxWidthParamCached = param1;
         this._boundingBoxHeightParamCached = param2;
         this._boundingBoxCached = this.mx_internal::computeBoundsWithStroke(this._boundingBoxWidthParamCached,this._boundingBoxHeightParamCached,param3);
         this._boundingBoxX = this._boundingBoxCached.x - (!!param3 ? param3.tx : 0);
         this._boundingBoxY = this._boundingBoxCached.y - (!!param3 ? param3.ty : 0);
         return this._boundingBoxCached;
      }
      
      private function tangentIsValid(param1:PathSegment, param2:PathSegment, param3:Number, param4:Number, param5:Matrix) : Boolean
      {
         param2.getTangent(param1,true,param3,param4,param5,tangent);
         return true || true;
      }
      
      mx_internal function computeBoundsWithStroke(param1:Number, param2:Number, param3:Matrix) : Rectangle
      {
         var _loc7_:* = null;
         var _loc15_:int = 0;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc4_:Rectangle;
         var _loc5_:Number = (_loc4_ = this.getBounds()).width == 0 ? 1 : param1 / _loc4_.width;
         var _loc6_:Number = _loc4_.height == 0 ? 1 : param2 / _loc4_.height;
         if(!param3 || MatrixUtil.isDeltaIdentity(param3) || !this.segments)
         {
            _loc7_ = new Rectangle(_loc4_.x * _loc5_,_loc4_.y * _loc6_,_loc4_.width * _loc5_,_loc4_.height * _loc6_);
            if(param3)
            {
               _loc7_.offset(param3.tx,param3.ty);
            }
         }
         else
         {
            _loc7_ = this.segments.getBoundingBox(param1,param2,param3);
         }
         var _loc8_:IStroke;
         if(!(_loc8_ = this.stroke) || !this.segments)
         {
            return _loc7_;
         }
         var _loc9_:Rectangle = getStrokeExtents();
         _loc7_.inflate(_loc9_.right,_loc9_.bottom);
         var _loc10_:Vector.<PathSegment> = this.segments.data;
         if(_loc8_.joints != "miter" || _loc10_.length < 2)
         {
            return _loc7_;
         }
         var _loc11_:Number = _loc9_.width / 2;
         var _loc12_:Number = Math.max(1,_loc8_.miterLimit);
         var _loc13_:int = _loc10_.length;
         var _loc14_:int = 0;
         var _loc16_:Number = 0;
         var _loc17_:Number = 0;
         var _loc18_:int = 0;
         while(true)
         {
            while(_loc14_ < _loc13_ && !(_loc10_[_loc14_] is MoveSegment))
            {
               _loc21_ = _loc14_ > 0 ? _loc10_[_loc14_ - 1] : null;
               if(this.tangentIsValid(_loc21_,_loc10_[_loc14_],_loc5_,_loc6_,param3))
               {
                  break;
               }
               _loc14_++;
            }
            if(_loc14_ >= _loc13_)
            {
               break;
            }
            if((_loc19_ = _loc10_[_loc14_]) is MoveSegment)
            {
               _loc18_ = _loc14_ + 1;
               _loc16_ = _loc19_.x;
               _loc17_ = _loc19_.y;
               _loc14_++;
            }
            else
            {
               if((_loc14_ == _loc13_ - 1 || _loc10_[_loc14_ + 1] is MoveSegment) && _loc19_.x == _loc16_ && _loc19_.y == _loc17_)
               {
                  _loc15_ = _loc18_;
               }
               else
               {
                  _loc15_ = _loc14_ + 1;
               }
               while(_loc15_ < _loc13_ && !(_loc10_[_loc15_] is MoveSegment))
               {
                  if(this.tangentIsValid(_loc19_,_loc10_[_loc15_],_loc5_,_loc6_,param3))
                  {
                     break;
                  }
                  _loc15_++;
               }
               if(_loc15_ >= _loc13_)
               {
                  break;
               }
               if(!((_loc20_ = _loc10_[_loc15_]) is MoveSegment))
               {
                  this.addMiterLimitStrokeToBounds(_loc14_ > 0 ? _loc10_[_loc14_ - 1] : null,_loc19_,_loc20_,_loc12_,_loc11_,_loc5_,_loc6_,param3,_loc7_);
               }
               _loc14_ = _loc14_ > _loc15_ ? _loc14_ + 1 : _loc15_;
            }
         }
         return _loc7_;
      }
      
      override protected function getStrokeBounds() : Rectangle
      {
         return this.getBoundingBoxWithStroke(width,height,null);
      }
      
      override protected function get needsDisplayObject() : Boolean
      {
         return super.needsDisplayObject || Boolean(stroke) && false;
      }
      
      private function addMiterLimitStrokeToBounds(param1:PathSegment, param2:PathSegment, param3:PathSegment, param4:Number, param5:Number, param6:Number, param7:Number, param8:Matrix, param9:Rectangle) : void
      {
         var _loc10_:* = null;
         var _loc18_:Number = NaN;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc11_:Number = (_loc10_ = MatrixUtil.transformPoint(param2.x * param6,param2.y * param7,param8).clone()).x;
         var _loc12_:Number = _loc10_.y;
         var _loc13_:Point = new Point();
         param2.getTangent(param1,false,param6,param7,param8,_loc13_);
         var _loc14_:Point = new Point();
         param3.getTangent(param2,true,param6,param7,param8,_loc14_);
         if(_loc13_.length == 0 || _loc14_.length == 0)
         {
            return;
         }
         _loc13_.normalize(1);
         _loc13_.x = -_loc13_.x;
         _loc13_.y = -_loc13_.y;
         _loc14_.normalize(1);
         var _loc15_:Point;
         var _loc16_:Number = (_loc15_ = new Point((_loc14_.x - _loc13_.x) * 0.5,(_loc14_.y - _loc13_.y) * 0.5)).length;
         if(Math.abs(_loc16_) < 1e-9)
         {
            return;
         }
         var _loc17_:Point;
         if((_loc17_ = new Point(-0.5 * (_loc13_.x + _loc14_.x),-0.5 * (_loc13_.y + _loc14_.y))).length == 0)
         {
            return;
         }
         if(_loc16_ == 0 || param4 < 1 / _loc16_)
         {
            _loc18_ = _loc17_.length;
            _loc17_.normalize(1);
            _loc15_.normalize((param5 - param4 * param5 * _loc16_) / _loc18_);
            _loc19_ = new Point(_loc11_ + param4 * param5 * _loc17_.x + _loc15_.x,_loc12_ + param4 * param5 * _loc17_.y + _loc15_.y);
            _loc20_ = new Point(_loc11_ + param4 * param5 * _loc17_.x - _loc15_.x,_loc12_ + param4 * param5 * _loc17_.y - _loc15_.y);
            MatrixUtil.rectUnion(_loc19_.x,_loc19_.y,_loc19_.x,_loc19_.y,param9);
            MatrixUtil.rectUnion(_loc20_.x,_loc20_.y,_loc20_.x,_loc20_.y,param9);
         }
         else
         {
            _loc17_.normalize(1);
            _loc21_ = new Point(_loc11_ + _loc17_.x * param5 / _loc16_,_loc12_ + _loc17_.y * param5 / _loc16_);
            MatrixUtil.rectUnion(_loc21_.x,_loc21_.y,_loc21_.x,_loc21_.y,param9);
         }
      }
      
      override protected function transformWidthForLayout(param1:Number, param2:Number, param3:Boolean = true) : Number
      {
         var _loc4_:Matrix;
         if(!(_loc4_ = mx_internal::getComplexMatrix(param3)) && !stroke)
         {
            return param1;
         }
         return this.getBoundingBoxWithStroke(param1,param2,_loc4_).width;
      }
      
      override protected function transformHeightForLayout(param1:Number, param2:Number, param3:Boolean = true) : Number
      {
         var _loc4_:Matrix;
         if(!(_loc4_ = mx_internal::getComplexMatrix(param3)) && !stroke)
         {
            return param2;
         }
         return this.getBoundingBoxWithStroke(param1,param2,_loc4_).height;
      }
      
      private function getBoundsAtSize(param1:Number, param2:Number, param3:Matrix) : Rectangle
      {
         var _loc7_:* = null;
         var _loc4_:* = null;
         if(!isNaN(param1))
         {
            _loc4_ = getStrokeExtents(true);
            param1 -= _loc4_.width;
         }
         if(!isNaN(param2))
         {
            if(!_loc4_)
            {
               _loc4_ = getStrokeExtents(true);
            }
            param2 -= _loc4_.height;
         }
         var _loc5_:Number = preferredWidthPreTransform();
         var _loc6_:Number = preferredHeightPreTransform();
         if(param3)
         {
            if(_loc7_ = MatrixUtil.fitBounds(param1,param2,param3,explicitWidth,explicitHeight,_loc5_,_loc6_,minWidth,minHeight,maxWidth,maxHeight))
            {
               _loc5_ = _loc7_.x;
               _loc6_ = _loc7_.y;
            }
            else
            {
               _loc5_ = minWidth;
               _loc6_ = minHeight;
            }
         }
         return this.getBoundingBoxWithStroke(_loc5_,_loc6_,param3);
      }
      
      override public function getBoundsXAtSize(param1:Number, param2:Number, param3:Boolean = true) : Number
      {
         var _loc4_:Matrix = mx_internal::getComplexMatrix(param3);
         return this.getBoundsAtSize(param1,param2,_loc4_).x + (!!_loc4_ ? 0 : this.x);
      }
      
      override public function getBoundsYAtSize(param1:Number, param2:Number, param3:Boolean = true) : Number
      {
         var _loc4_:Matrix = mx_internal::getComplexMatrix(param3);
         return this.getBoundsAtSize(param1,param2,_loc4_).y + (!!_loc4_ ? 0 : this.y);
      }
      
      override public function getLayoutBoundsX(param1:Boolean = true) : Number
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc2_:Matrix = mx_internal::getComplexMatrix(param1);
         if(!_loc2_ && !stroke)
         {
            if(measuredX == 0)
            {
               return this.x;
            }
            _loc3_ = this.getBounds();
            _loc4_ = _loc3_.width == 0 || mx_internal::_width == 0 ? 1 : Number(mx_internal::_width) / _loc3_.width;
            return this.x + measuredX * _loc4_;
         }
         return this.getBoundingBoxWithStroke(mx_internal::_width,mx_internal::_height,_loc2_).x + (!!_loc2_ ? 0 : this.x);
      }
      
      override public function getLayoutBoundsY(param1:Boolean = true) : Number
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc2_:Matrix = mx_internal::getComplexMatrix(param1);
         if(!_loc2_ && !stroke)
         {
            if(measuredY == 0)
            {
               return this.y;
            }
            _loc3_ = this.getBounds();
            _loc4_ = _loc3_.height == 0 || mx_internal::_height == 0 ? 1 : Number(mx_internal::_height) / _loc3_.height;
            return this.y + measuredY * _loc4_;
         }
         return this.getBoundingBoxWithStroke(mx_internal::_width,mx_internal::_height,_loc2_).y + (!!_loc2_ ? 0 : this.y);
      }
      
      private function setLayoutBoundsTransformed(param1:Number, param2:Number, param3:Matrix) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = false;
         var _loc4_:Point;
         if(!(_loc4_ = this.fitLayoutBoundsIterative(param1,param2,param3)) && !isNaN(param1) && !isNaN(param2))
         {
            _loc5_ = this.fitLayoutBoundsIterative(NaN,param2,param3);
            _loc6_ = this.fitLayoutBoundsIterative(param1,NaN,param3);
            if(Boolean(_loc5_) && this.getBoundingBoxWithStroke(_loc5_.x,_loc5_.y,param3).width > param1)
            {
               _loc5_ = null;
            }
            if(Boolean(_loc6_) && this.getBoundingBoxWithStroke(_loc6_.x,_loc6_.y,param3).height > param2)
            {
               _loc6_ = null;
            }
            if(Boolean(_loc5_) && Boolean(_loc6_))
            {
               _loc7_ = this.getBounds().size;
               _loc8_ = Math.abs(_loc7_.x * Number(_loc5_.y) - _loc7_.y * Number(_loc5_.x)) * Number(_loc6_.y) < Math.abs(_loc7_.x * Number(_loc6_.y) - _loc7_.y * Number(_loc6_.x)) * Number(_loc5_.y);
               if(Math.abs(_loc7_.x * Number(_loc5_.y) - _loc7_.y * Number(_loc5_.x)) * Number(_loc6_.y) < Math.abs(_loc7_.x * Number(_loc6_.y) - _loc7_.y * Number(_loc6_.x)) * Number(_loc5_.y))
               {
                  _loc4_ = _loc5_;
               }
               else
               {
                  _loc4_ = _loc6_;
               }
            }
            else if(_loc5_)
            {
               _loc4_ = _loc5_;
            }
            else
            {
               _loc4_ = _loc6_;
            }
         }
         if(_loc4_)
         {
            mx_internal::setActualSize(_loc4_.x,_loc4_.y);
         }
         else
         {
            mx_internal::setActualSize(minWidth,minHeight);
         }
      }
      
      private function fitLayoutBoundsIterative(param1:Number, param2:Number, param3:Matrix) : Point
      {
         var _loc9_:* = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:* = null;
         var _loc4_:Number = this.preferredWidthPreTransform();
         var _loc5_:Number = this.preferredHeightPreTransform();
         var _loc6_:Number = MatrixUtil.transformBounds(_loc4_,_loc5_,param3).x;
         var _loc7_:Number = MatrixUtil.transformBounds(_loc4_,_loc5_,param3).y;
         if(isNaN(param1))
         {
            _loc6_ = NaN;
         }
         if(isNaN(param2))
         {
            _loc7_ = NaN;
         }
         var _loc8_:int = 0;
         while(_loc8_++ < 150)
         {
            _loc9_ = this.getBoundingBoxWithStroke(_loc4_,_loc5_,param3);
            _loc10_ = isNaN(param1) ? 0 : param1 - _loc9_.width;
            _loc11_ = isNaN(param2) ? 0 : param2 - _loc9_.height;
            if(Math.abs(_loc10_) < 0.1 && Math.abs(_loc11_) < 0.1)
            {
               return new Point(_loc4_,_loc5_);
            }
            _loc6_ += _loc10_ * 0.5;
            _loc7_ += _loc11_ * 0.5;
            if(!(_loc12_ = MatrixUtil.fitBounds(_loc6_,_loc7_,param3,explicitWidth,explicitHeight,preferredWidthPreTransform(),preferredHeightPreTransform(),minWidth,minHeight,maxWidth,maxHeight)))
            {
               break;
            }
            _loc4_ = _loc12_.x;
            _loc5_ = _loc12_.y;
         }
         return null;
      }
      
      override public function setLayoutBoundsSize(param1:Number, param2:Number, param3:Boolean = true) : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:* = null;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         if(isNaN(param1) && isNaN(param2))
         {
            super.setLayoutBoundsSize(param1,param2,param3);
            return;
         }
         var _loc4_:Matrix;
         if(_loc4_ = mx_internal::getComplexMatrix(param3))
         {
            this.setLayoutBoundsTransformed(param1,param2,_loc4_);
            return;
         }
         if(!stroke || true)
         {
            super.setLayoutBoundsSize(param1,param2,param3);
            return;
         }
         var _loc5_:Number = preferredWidthPreTransform();
         var _loc6_:Number = preferredHeightPreTransform();
         if(!isNaN(param1) && !isNaN(param2))
         {
            if(_loc11_ = this.fitLayoutBoundsIterative(param1,param2,new Matrix()))
            {
               mx_internal::setActualSize(_loc11_.x,_loc11_.y);
               return;
            }
            _loc5_ = this.getBounds().width;
            _loc6_ = this.getBounds().height;
            _loc7_ = this.minWidth;
            _loc8_ = this.minHeight;
            _loc9_ = (param1 - _loc7_) * (param1 - _loc7_) + (param2 - _loc8_) * (param2 - _loc8_);
         }
         var _loc10_:int = 0;
         while(_loc10_++ < 150)
         {
            _loc12_ = this.getBoundingBoxWithStroke(_loc5_,_loc6_,null);
            _loc13_ = 0;
            _loc14_ = 0;
            if(!isNaN(param1))
            {
               _loc13_ = Math.abs(param1 - _loc12_.width);
            }
            if(!isNaN(param2))
            {
               _loc14_ = Math.abs(param2 - _loc12_.height);
            }
            if(!isNaN(param1) && !isNaN(param2))
            {
               _loc18_ = (param1 - _loc12_.width) * (param1 - _loc12_.width) + (param2 - _loc12_.height) * (param2 - _loc12_.height);
               if(!isNaN(_loc18_) && _loc18_ < _loc9_ && _loc12_.width <= param1 && _loc12_.height <= param2)
               {
                  _loc9_ = _loc18_;
                  _loc7_ = _loc5_;
                  _loc8_ = _loc6_;
               }
            }
            if(_loc13_ < 0.00001 && _loc14_ < 0.00001)
            {
               mx_internal::setActualSize(_loc5_,_loc6_);
               return;
            }
            _loc15_ = this.segments.getBoundingBox(_loc5_,_loc6_,null);
            _loc16_ = _loc12_.width - _loc15_.width;
            _loc17_ = _loc12_.height - _loc15_.height;
            if(!isNaN(param1))
            {
               _loc5_ = param1 - _loc16_;
            }
            if(!isNaN(param2))
            {
               _loc6_ = param2 - _loc17_;
            }
         }
         mx_internal::setActualSize(_loc7_,_loc8_);
      }
      
      override protected function beginDraw(param1:Graphics) : void
      {
         var _loc7_:* = null;
         var _loc2_:Rectangle = this.getBounds();
         var _loc3_:Number = _loc2_.width == 0 ? 1 : width / _loc2_.width;
         var _loc4_:Number = _loc2_.height == 0 ? 1 : height / _loc2_.height;
         var _loc5_:Point = new Point(drawX,drawY);
         var _loc6_:Rectangle = new Rectangle(drawX + measuredX * _loc3_,drawY + measuredY * _loc4_,width,height);
         if(stroke)
         {
            (_loc7_ = this.getStrokeBounds()).offsetPoint(_loc5_);
            stroke.apply(param1,_loc7_,_loc5_);
         }
         else
         {
            param1.lineStyle();
         }
         if(fill)
         {
            fill.begin(param1,_loc6_,_loc5_);
         }
      }
      
      override protected function draw(param1:Graphics) : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(drawX != this._drawBounds.x || drawY != this._drawBounds.y || width != this._drawBounds.width || height != this._drawBounds.height)
         {
            this.graphicsPathChanged = true;
            this._drawBounds.x = drawX;
            this._drawBounds.y = drawY;
            this._drawBounds.width = width;
            this._drawBounds.height = height;
         }
         if(this.graphicsPathChanged)
         {
            _loc2_ = this.getBounds();
            _loc3_ = _loc2_.width == 0 ? 1 : width / _loc2_.width;
            _loc4_ = _loc2_.height == 0 ? 1 : height / _loc2_.height;
            if(this.segments)
            {
               this.segments.generateGraphicsPath(this.mx_internal::graphicsPath,drawX,drawY,_loc3_,_loc4_);
            }
            this.graphicsPathChanged = false;
         }
         param1.drawPath(this.mx_internal::graphicsPath.commands,this.mx_internal::graphicsPath.data,this.winding);
      }
      
      override protected function endDraw(param1:Graphics) : void
      {
         param1.lineStyle();
         super.endDraw(param1);
      }
      
      override protected function invalidateDisplayObjectSharing() : void
      {
         this.graphicsPathChanged = true;
         super.invalidateDisplayObjectSharing();
      }
      
      private function clearCachedBoundingBoxWithStroke() : void
      {
         this._boundingBoxCached = null;
         this._boundingBoxMatrixCached = null;
      }
      
      override protected function stroke_propertyChangeHandler(param1:PropertyChangeEvent) : void
      {
         super.stroke_propertyChangeHandler(param1);
         switch(param1.property)
         {
            case "weight":
            case "scaleMode":
            case "joints":
            case "miterLimit":
               this.clearCachedBoundingBoxWithStroke();
               invalidateParentSizeAndDisplayList();
         }
      }
      
      override public function set stroke(param1:IStroke) : void
      {
         super.stroke = param1;
         this.clearCachedBoundingBoxWithStroke();
      }
   }
}

import flash.display.GraphicsPath;
import flash.geom.Matrix;
import flash.geom.Rectangle;

class PathSegmentsCollection
{
    
   
   private var _segments:Vector.<PathSegment>;
   
   private var _bounds:Rectangle;
   
   private var _charPos:int = 0;
   
   private var _dataLength:int = 0;
   
   function PathSegmentsCollection(param1:String)
   {
      var _loc2_:* = null;
      var _loc4_:Number = NaN;
      var _loc5_:Boolean = false;
      var _loc11_:Number = NaN;
      var _loc12_:Number = NaN;
      var _loc13_:Number = NaN;
      var _loc14_:Number = NaN;
      var _loc15_:Number = NaN;
      var _loc16_:Number = NaN;
      var _loc18_:int = 0;
      super();
      if(!param1)
      {
         this._segments = new Vector.<PathSegment>();
         return;
      }
      _loc2_ = new Vector.<PathSegment>();
      var _loc3_:int = param1.length;
      var _loc6_:Number = 0;
      var _loc7_:Number = 0;
      var _loc8_:Number = 0;
      var _loc9_:Number = 0;
      var _loc10_:Number = 0;
      var _loc17_:int = -1;
      this._dataLength = _loc3_;
      this._charPos = 0;
      while(true)
      {
         this.skipWhiteSpace(param1);
         if(this._charPos >= _loc3_)
         {
            break;
         }
         if((_loc4_ = param1.charCodeAt(this._charPos++)) >= 48 && _loc4_ < 58 || (_loc4_ == 43 || _loc4_ == 45) || _loc4_ == 46)
         {
            _loc4_ = _loc6_;
            --this._charPos;
         }
         else if(_loc4_ >= 65 && _loc4_ <= 86)
         {
            _loc5_ = false;
         }
         else if(_loc4_ >= 97 && _loc4_ <= 122)
         {
            _loc5_ = true;
         }
         switch(_loc4_)
         {
            case 99:
            case 67:
               _loc13_ = Number(this.getNumber(_loc5_,_loc7_,param1));
               _loc14_ = Number(this.getNumber(_loc5_,_loc8_,param1));
               _loc15_ = Number(this.getNumber(_loc5_,_loc7_,param1));
               _loc16_ = Number(this.getNumber(_loc5_,_loc8_,param1));
               _loc11_ = Number(this.getNumber(_loc5_,_loc7_,param1));
               _loc12_ = Number(this.getNumber(_loc5_,_loc8_,param1));
               _loc2_.push(new CubicBezierSegment(_loc13_,_loc14_,_loc15_,_loc16_,_loc11_,_loc12_));
               _loc7_ = _loc11_;
               _loc8_ = _loc12_;
               _loc6_ = 99;
               break;
            case 109:
            case 77:
               _loc11_ = Number(this.getNumber(_loc5_,_loc7_,param1));
               _loc12_ = Number(this.getNumber(_loc5_,_loc8_,param1));
               _loc2_.push(new MoveSegment(_loc11_,_loc12_));
               _loc7_ = _loc11_;
               _loc8_ = _loc12_;
               _loc6_ = _loc4_ == 109 ? 108 : 76;
               _loc18_ = _loc2_.length - 1;
               if(_loc17_ + 2 == _loc18_ && _loc2_[_loc17_ + 1] is QuadraticBezierSegment)
               {
                  _loc2_.splice(_loc17_ + 1,0,new LineSegment(_loc9_,_loc10_));
                  _loc18_++;
               }
               _loc17_ = _loc18_;
               _loc9_ = _loc11_;
               _loc10_ = _loc12_;
               break;
            case 108:
            case 76:
               _loc11_ = Number(this.getNumber(_loc5_,_loc7_,param1));
               _loc12_ = Number(this.getNumber(_loc5_,_loc8_,param1));
               _loc2_.push(new LineSegment(_loc11_,_loc12_));
               _loc7_ = _loc11_;
               _loc8_ = _loc12_;
               _loc6_ = 108;
               break;
            case 104:
            case 72:
               _loc11_ = Number(this.getNumber(_loc5_,_loc7_,param1));
               _loc12_ = _loc8_;
               _loc2_.push(new LineSegment(_loc11_,_loc12_));
               _loc7_ = _loc11_;
               _loc8_ = _loc12_;
               _loc6_ = 104;
               break;
            case 118:
            case 86:
               _loc11_ = _loc7_;
               _loc12_ = Number(this.getNumber(_loc5_,_loc8_,param1));
               _loc2_.push(new LineSegment(_loc11_,_loc12_));
               _loc7_ = _loc11_;
               _loc8_ = _loc12_;
               _loc6_ = 118;
               break;
            case 113:
            case 81:
               _loc13_ = Number(this.getNumber(_loc5_,_loc7_,param1));
               _loc14_ = Number(this.getNumber(_loc5_,_loc8_,param1));
               _loc11_ = Number(this.getNumber(_loc5_,_loc7_,param1));
               _loc12_ = Number(this.getNumber(_loc5_,_loc8_,param1));
               _loc2_.push(new QuadraticBezierSegment(_loc13_,_loc14_,_loc11_,_loc12_));
               _loc7_ = _loc11_;
               _loc8_ = _loc12_;
               _loc6_ = 113;
               break;
            case 116:
            case 84:
               if(_loc6_ == 116 || _loc6_ == 113)
               {
                  _loc13_ = _loc7_ + (_loc7_ - _loc13_);
                  _loc14_ = _loc8_ + (_loc8_ - _loc14_);
               }
               else
               {
                  _loc13_ = _loc7_;
                  _loc14_ = _loc8_;
               }
               _loc11_ = Number(this.getNumber(_loc5_,_loc7_,param1));
               _loc12_ = Number(this.getNumber(_loc5_,_loc8_,param1));
               _loc2_.push(new QuadraticBezierSegment(_loc13_,_loc14_,_loc11_,_loc12_));
               _loc7_ = _loc11_;
               _loc8_ = _loc12_;
               _loc6_ = 116;
               break;
            case 115:
            case 83:
               if(_loc6_ == 115 || _loc6_ == 99)
               {
                  _loc13_ = _loc7_ + (_loc7_ - _loc15_);
                  _loc14_ = _loc8_ + (_loc8_ - _loc16_);
               }
               else
               {
                  _loc13_ = _loc7_;
                  _loc14_ = _loc8_;
               }
               _loc15_ = Number(this.getNumber(_loc5_,_loc7_,param1));
               _loc16_ = Number(this.getNumber(_loc5_,_loc8_,param1));
               _loc11_ = Number(this.getNumber(_loc5_,_loc7_,param1));
               _loc12_ = Number(this.getNumber(_loc5_,_loc8_,param1));
               _loc2_.push(new CubicBezierSegment(_loc13_,_loc14_,_loc15_,_loc16_,_loc11_,_loc12_));
               _loc7_ = _loc11_;
               _loc8_ = _loc12_;
               _loc6_ = 115;
               break;
            case 122:
            case 90:
               _loc11_ = _loc9_;
               _loc12_ = _loc10_;
               _loc2_.push(new LineSegment(_loc11_,_loc12_));
               _loc7_ = _loc11_;
               _loc8_ = _loc12_;
               _loc6_ = 122;
               break;
            default:
               this._segments = new Vector.<PathSegment>();
               return;
         }
      }
      _loc18_ = _loc2_.length;
      if(_loc17_ + 2 == _loc18_ && _loc2_[_loc17_ + 1] is QuadraticBezierSegment)
      {
         _loc2_.splice(_loc17_ + 1,0,new LineSegment(_loc9_,_loc10_));
         _loc18_++;
      }
      this._segments = _loc2_;
   }
   
   public function get data() : Vector.<PathSegment>
   {
      return this._segments;
   }
   
   public function getBounds() : Rectangle
   {
      if(this._bounds)
      {
         return this._bounds;
      }
      this._bounds = new Rectangle(0,0,1,1);
      this._bounds = this.getBoundingBox(1,1,null);
      return this._bounds;
   }
   
   public function getBoundingBox(param1:Number, param2:Number, param3:Matrix) : Rectangle
   {
      var _loc7_:* = null;
      var _loc8_:* = null;
      var _loc11_:* = null;
      var _loc12_:Number = NaN;
      var _loc13_:Number = NaN;
      var _loc4_:Rectangle;
      var _loc5_:Number = (_loc4_ = this.getBounds()).width == 0 ? 1 : param1 / _loc4_.width;
      var _loc6_:Number = _loc4_.height == 0 ? 1 : param2 / _loc4_.height;
      var _loc9_:int = int(this._segments.length);
      var _loc10_:int = 0;
      while(_loc10_ < _loc9_)
      {
         _loc8_ = (_loc11_ = this._segments[_loc10_]).getBoundingBox(_loc7_,_loc5_,_loc6_,param3,_loc8_);
         _loc7_ = _loc11_;
         _loc10_++;
      }
      if(!_loc8_)
      {
         _loc12_ = !!param3 ? param3.tx : 0;
         _loc13_ = !!param3 ? param3.ty : 0;
         _loc8_ = new Rectangle(_loc12_,_loc13_);
      }
      return _loc8_;
   }
   
   public function generateGraphicsPath(param1:GraphicsPath, param2:Number, param3:Number, param4:Number, param5:Number) : void
   {
      var _loc6_:* = null;
      var _loc7_:* = null;
      param1.commands = null;
      param1.data = null;
      param1.moveTo(param2,param3);
      var _loc8_:int = int(this._segments.length);
      var _loc9_:int = 0;
      while(_loc9_ < _loc8_)
      {
         _loc7_ = _loc6_;
         (_loc6_ = this._segments[_loc9_]).draw(param1,param2,param3,param4,param5,_loc7_);
         _loc9_++;
      }
   }
   
   private function skipWhiteSpace(param1:String) : void
   {
      var _loc2_:Number = NaN;
      while(this._charPos < this._dataLength)
      {
         _loc2_ = param1.charCodeAt(this._charPos);
         if(_loc2_ != 32 && _loc2_ != 44 && _loc2_ != 13 && _loc2_ != 9 && _loc2_ != 10)
         {
            break;
         }
         ++this._charPos;
      }
   }
   
   private function getNumber(param1:Boolean, param2:Number, param3:String) : Number
   {
      var _loc12_:int = 0;
      this.skipWhiteSpace(param3);
      if(this._charPos >= this._dataLength)
      {
         return NaN;
      }
      var _loc4_:int = int(this._charPos);
      var _loc5_:Boolean = false;
      var _loc6_:Boolean = false;
      var _loc7_:Number;
      if((_loc7_ = param3.charCodeAt(this._charPos)) == 43 || _loc7_ == 45)
      {
         _loc5_ = true;
         ++this._charPos;
      }
      var _loc8_:int = -1;
      while(this._charPos < this._dataLength)
      {
         if((_loc7_ = param3.charCodeAt(this._charPos)) >= 48 && _loc7_ < 58)
         {
            _loc6_ = true;
         }
         else
         {
            if(!(_loc7_ == 46 && _loc8_ == -1))
            {
               break;
            }
            _loc8_ = int(this._charPos);
         }
         ++this._charPos;
      }
      if(!_loc6_)
      {
         this._charPos = this._dataLength;
         return NaN;
      }
      if(_loc7_ == 46)
      {
         --this._charPos;
      }
      var _loc9_:int = int(this._charPos);
      if(_loc7_ == 69 || _loc7_ == 101)
      {
         ++this._charPos;
         if(this._charPos < this._dataLength)
         {
            if((_loc7_ = param3.charCodeAt(this._charPos)) == 43 || _loc7_ == 45)
            {
               ++this._charPos;
            }
         }
         _loc12_ = int(this._charPos);
         while(this._charPos < this._dataLength)
         {
            if(!((_loc7_ = param3.charCodeAt(this._charPos)) >= 48 && _loc7_ < 58))
            {
               break;
            }
            ++this._charPos;
         }
         if(_loc12_ < this._charPos)
         {
            _loc9_ = int(this._charPos);
         }
         else
         {
            this._charPos = _loc9_;
         }
      }
      var _loc10_:String = param3.substr(_loc4_,_loc9_ - _loc4_);
      var _loc11_:Number = parseFloat(_loc10_);
      if(isNaN(_loc11_))
      {
         this._charPos = this._dataLength;
         return NaN;
      }
      this._charPos = _loc9_;
      return param1 ? _loc11_ + param2 : _loc11_;
   }
}

import flash.display.GraphicsPath;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;

class PathSegment
{
    
   
   public var x:Number = 0;
   
   public var y:Number = 0;
   
   function PathSegment(param1:Number = 0, param2:Number = 0)
   {
      super();
      this.x = param1;
      this.y = param2;
   }
   
   public function draw(param1:GraphicsPath, param2:Number, param3:Number, param4:Number, param5:Number, param6:PathSegment) : void
   {
   }
   
   public function getBoundingBox(param1:PathSegment, param2:Number, param3:Number, param4:Matrix, param5:Rectangle) : Rectangle
   {
      return param5;
   }
   
   public function getTangent(param1:PathSegment, param2:Boolean, param3:Number, param4:Number, param5:Matrix, param6:Point) : void
   {
      param6.x = 0;
      param6.y = 0;
   }
}

import flash.display.GraphicsPath;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;
import mx.utils.MatrixUtil;

class LineSegment extends PathSegment
{
    
   
   function LineSegment(param1:Number = 0, param2:Number = 0)
   {
      super(param1,param2);
   }
   
   override public function draw(param1:GraphicsPath, param2:Number, param3:Number, param4:Number, param5:Number, param6:PathSegment) : void
   {
      param1.lineTo(param2 + Number(x) * param4,param3 + Number(y) * param5);
   }
   
   override public function getBoundingBox(param1:PathSegment, param2:Number, param3:Number, param4:Matrix, param5:Rectangle) : Rectangle
   {
      var _loc8_:* = null;
      var _loc6_:Number = (_loc8_ = MatrixUtil.transformPoint(Number(x) * param2,Number(y) * param3,param4)).x;
      var _loc7_:Number = _loc8_.y;
      if(param1 != null && !(param1 is MoveSegment))
      {
         return MatrixUtil.rectUnion(_loc6_,_loc7_,_loc6_,_loc7_,param5);
      }
      var _loc9_:Number = (_loc8_ = MatrixUtil.transformPoint(!!param1 ? param1.x * param2 : 0,!!param1 ? param1.y * param3 : 0,param4)).x;
      var _loc10_:Number = _loc8_.y;
      return MatrixUtil.rectUnion(Math.min(_loc6_,_loc9_),Math.min(_loc7_,_loc10_),Math.max(_loc6_,_loc9_),Math.max(_loc7_,_loc10_),param5);
   }
   
   override public function getTangent(param1:PathSegment, param2:Boolean, param3:Number, param4:Number, param5:Matrix, param6:Point) : void
   {
      var _loc7_:Point = MatrixUtil.transformPoint(!!param1 ? param1.x * param3 : 0,!!param1 ? param1.y * param4 : 0,param5).clone();
      var _loc8_:Point = MatrixUtil.transformPoint(Number(x) * param3,Number(y) * param4,param5);
      param6.x = _loc8_.x - _loc7_.x;
      param6.y = _loc8_.y - _loc7_.y;
   }
}

import flash.display.GraphicsPath;

class MoveSegment extends PathSegment
{
    
   
   function MoveSegment(param1:Number = 0, param2:Number = 0)
   {
      super(param1,param2);
   }
   
   override public function draw(param1:GraphicsPath, param2:Number, param3:Number, param4:Number, param5:Number, param6:PathSegment) : void
   {
      param1.moveTo(param2 + Number(x) * param4,param3 + Number(y) * param5);
   }
}

import flash.display.GraphicsPath;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;
import mx.utils.MatrixUtil;

class CubicBezierSegment extends PathSegment
{
    
   
   private var _qPts:QuadraticPoints;
   
   public var control1X:Number = 0;
   
   public var control1Y:Number = 0;
   
   public var control2X:Number = 0;
   
   public var control2Y:Number = 0;
   
   function CubicBezierSegment(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0, param6:Number = 0)
   {
      super(param5,param6);
      this.control1X = param1;
      this.control1Y = param2;
      this.control2X = param3;
      this.control2Y = param4;
   }
   
   override public function draw(param1:GraphicsPath, param2:Number, param3:Number, param4:Number, param5:Number, param6:PathSegment) : void
   {
      var _loc7_:QuadraticPoints = this.getQuadraticPoints(param6);
      param1.curveTo(param2 + _loc7_.control1.x * param4,param3 + _loc7_.control1.y * param5,param2 + _loc7_.anchor1.x * param4,param3 + _loc7_.anchor1.y * param5);
      param1.curveTo(param2 + _loc7_.control2.x * param4,param3 + _loc7_.control2.y * param5,param2 + _loc7_.anchor2.x * param4,param3 + _loc7_.anchor2.y * param5);
      param1.curveTo(param2 + _loc7_.control3.x * param4,param3 + _loc7_.control3.y * param5,param2 + _loc7_.anchor3.x * param4,param3 + _loc7_.anchor3.y * param5);
      param1.curveTo(param2 + _loc7_.control4.x * param4,param3 + _loc7_.control4.y * param5,param2 + _loc7_.anchor4.x * param4,param3 + _loc7_.anchor4.y * param5);
   }
   
   override public function getBoundingBox(param1:PathSegment, param2:Number, param3:Number, param4:Matrix, param5:Rectangle) : Rectangle
   {
      var _loc6_:QuadraticPoints = this.getQuadraticPoints(param1);
      param5 = MatrixUtil.getQBezierSegmentBBox(!!param1 ? param1.x : 0,!!param1 ? param1.y : 0,_loc6_.control1.x,_loc6_.control1.y,_loc6_.anchor1.x,_loc6_.anchor1.y,param2,param3,param4,param5);
      param5 = MatrixUtil.getQBezierSegmentBBox(_loc6_.anchor1.x,_loc6_.anchor1.y,_loc6_.control2.x,_loc6_.control2.y,_loc6_.anchor2.x,_loc6_.anchor2.y,param2,param3,param4,param5);
      param5 = MatrixUtil.getQBezierSegmentBBox(_loc6_.anchor2.x,_loc6_.anchor2.y,_loc6_.control3.x,_loc6_.control3.y,_loc6_.anchor3.x,_loc6_.anchor3.y,param2,param3,param4,param5);
      return MatrixUtil.getQBezierSegmentBBox(_loc6_.anchor3.x,_loc6_.anchor3.y,_loc6_.control4.x,_loc6_.control4.y,_loc6_.anchor4.x,_loc6_.anchor4.y,param2,param3,param4,param5);
   }
   
   override public function getTangent(param1:PathSegment, param2:Boolean, param3:Number, param4:Number, param5:Matrix, param6:Point) : void
   {
      var _loc7_:QuadraticPoints = this.getQuadraticPoints(param1);
      var _loc8_:Point = MatrixUtil.transformPoint(!!param1 ? param1.x * param3 : 0,!!param1 ? param1.y * param4 : 0,param5).clone();
      var _loc9_:Point = MatrixUtil.transformPoint(_loc7_.control1.x * param3,_loc7_.control1.y * param4,param5).clone();
      var _loc10_:Point = MatrixUtil.transformPoint(_loc7_.anchor1.x * param3,_loc7_.anchor1.y * param4,param5).clone();
      var _loc11_:Point = MatrixUtil.transformPoint(_loc7_.control2.x * param3,_loc7_.control2.y * param4,param5).clone();
      var _loc12_:Point = MatrixUtil.transformPoint(_loc7_.anchor2.x * param3,_loc7_.anchor2.y * param4,param5).clone();
      var _loc13_:Point = MatrixUtil.transformPoint(_loc7_.control3.x * param3,_loc7_.control3.y * param4,param5).clone();
      var _loc14_:Point = MatrixUtil.transformPoint(_loc7_.anchor3.x * param3,_loc7_.anchor3.y * param4,param5).clone();
      var _loc15_:Point = MatrixUtil.transformPoint(_loc7_.control4.x * param3,_loc7_.control4.y * param4,param5).clone();
      var _loc16_:Point = MatrixUtil.transformPoint(_loc7_.anchor4.x * param3,_loc7_.anchor4.y * param4,param5).clone();
      if(param2)
      {
         QuadraticBezierSegment.getQTangent(_loc8_.x,_loc8_.y,_loc9_.x,_loc9_.y,_loc10_.x,_loc10_.y,param2,param6);
         if(param6.x == 0 && param6.y == 0)
         {
            QuadraticBezierSegment.getQTangent(_loc8_.x,_loc8_.y,_loc11_.x,_loc11_.y,_loc12_.x,_loc12_.y,param2,param6);
            if(param6.x == 0 && param6.y == 0)
            {
               QuadraticBezierSegment.getQTangent(_loc8_.x,_loc8_.y,_loc13_.x,_loc13_.y,_loc14_.x,_loc14_.y,param2,param6);
               if(param6.x == 0 && param6.y == 0)
               {
                  QuadraticBezierSegment.getQTangent(_loc8_.x,_loc8_.y,_loc15_.x,_loc15_.y,_loc16_.x,_loc16_.y,param2,param6);
               }
            }
         }
      }
      else
      {
         QuadraticBezierSegment.getQTangent(_loc14_.x,_loc14_.y,_loc15_.x,_loc15_.y,_loc16_.x,_loc16_.y,param2,param6);
         if(param6.x == 0 && param6.y == 0)
         {
            QuadraticBezierSegment.getQTangent(_loc12_.x,_loc12_.y,_loc13_.x,_loc13_.y,_loc16_.x,_loc16_.y,param2,param6);
            if(param6.x == 0 && param6.y == 0)
            {
               QuadraticBezierSegment.getQTangent(_loc10_.x,_loc10_.y,_loc11_.x,_loc11_.y,_loc16_.x,_loc16_.y,param2,param6);
               if(param6.x == 0 && param6.y == 0)
               {
                  QuadraticBezierSegment.getQTangent(_loc8_.x,_loc8_.y,_loc9_.x,_loc9_.y,_loc16_.x,_loc16_.y,param2,param6);
               }
            }
         }
      }
   }
   
   private function getQuadraticPoints(param1:PathSegment) : QuadraticPoints
   {
      if(this._qPts)
      {
         return this._qPts;
      }
      var _loc2_:Point = new Point(!!param1 ? param1.x : 0,!!param1 ? param1.y : 0);
      var _loc3_:Point = new Point(x,y);
      var _loc4_:Point = new Point(this.control1X,this.control1Y);
      var _loc5_:Point = new Point(this.control2X,this.control2Y);
      var _loc6_:Point = Point.interpolate(_loc4_,_loc2_,0.75);
      var _loc7_:Point = Point.interpolate(_loc5_,_loc3_,0.75);
      var _loc8_:Number = (_loc3_.x - _loc2_.x) / 16;
      var _loc9_:Number = (_loc3_.y - _loc2_.y) / 16;
      this._qPts = new QuadraticPoints();
      this._qPts.control1 = Point.interpolate(_loc4_,_loc2_,0.375);
      this._qPts.control2 = Point.interpolate(_loc7_,_loc6_,0.375);
      this._qPts.control2.x -= _loc8_;
      this._qPts.control2.y -= _loc9_;
      this._qPts.control3 = Point.interpolate(_loc6_,_loc7_,0.375);
      this._qPts.control3.x += _loc8_;
      this._qPts.control3.y += _loc9_;
      this._qPts.control4 = Point.interpolate(_loc5_,_loc3_,0.375);
      this._qPts.anchor1 = Point.interpolate(this._qPts.control1,this._qPts.control2,0.5);
      this._qPts.anchor2 = Point.interpolate(_loc6_,_loc7_,0.5);
      this._qPts.anchor3 = Point.interpolate(this._qPts.control3,this._qPts.control4,0.5);
      this._qPts.anchor4 = _loc3_;
      return this._qPts;
   }
}

import flash.geom.Point;

class QuadraticPoints
{
    
   
   public var control1:Point;
   
   public var anchor1:Point;
   
   public var control2:Point;
   
   public var anchor2:Point;
   
   public var control3:Point;
   
   public var anchor3:Point;
   
   public var control4:Point;
   
   public var anchor4:Point;
   
   function QuadraticPoints()
   {
      super();
   }
}

import flash.display.GraphicsPath;
import flash.geom.Matrix;
import flash.geom.Point;
import flash.geom.Rectangle;
import mx.utils.MatrixUtil;

class QuadraticBezierSegment extends PathSegment
{
    
   
   public var control1X:Number = 0;
   
   public var control1Y:Number = 0;
   
   function QuadraticBezierSegment(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0)
   {
      super(param3,param4);
      this.control1X = param1;
      this.control1Y = param2;
   }
   
   public static function getQTangent(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Boolean, param8:Point) : void
   {
      if(param7)
      {
         if(param1 == param3 && param2 == param4)
         {
            param8.x = param5 - param1;
            param8.y = param6 - param2;
         }
         else
         {
            param8.x = param3 - param1;
            param8.y = param4 - param2;
         }
      }
      else if(param5 == param3 && param6 == param4)
      {
         param8.x = param5 - param1;
         param8.y = param6 - param2;
      }
      else
      {
         param8.x = param5 - param3;
         param8.y = param6 - param4;
      }
   }
   
   override public function draw(param1:GraphicsPath, param2:Number, param3:Number, param4:Number, param5:Number, param6:PathSegment) : void
   {
      param1.curveTo(param2 + Number(this.control1X) * param4,param3 + Number(this.control1Y) * param5,param2 + Number(x) * param4,param3 + Number(y) * param5);
   }
   
   override public function getTangent(param1:PathSegment, param2:Boolean, param3:Number, param4:Number, param5:Matrix, param6:Point) : void
   {
      var _loc7_:Point = MatrixUtil.transformPoint(!!param1 ? param1.x * param3 : 0,!!param1 ? param1.y * param4 : 0,param5).clone();
      var _loc8_:Point = MatrixUtil.transformPoint(Number(this.control1X) * param3,Number(this.control1Y) * param4,param5).clone();
      var _loc9_:Point = MatrixUtil.transformPoint(Number(x) * param3,Number(y) * param4,param5).clone();
      getQTangent(_loc7_.x,_loc7_.y,_loc8_.x,_loc8_.y,_loc9_.x,_loc9_.y,param2,param6);
   }
   
   override public function getBoundingBox(param1:PathSegment, param2:Number, param3:Number, param4:Matrix, param5:Rectangle) : Rectangle
   {
      return MatrixUtil.getQBezierSegmentBBox(!!param1 ? param1.x : 0,!!param1 ? param1.y : 0,this.control1X,this.control1Y,x,y,param2,param3,param4,param5);
   }
}
