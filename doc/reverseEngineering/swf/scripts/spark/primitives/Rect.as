package spark.primitives
{
   import flash.display.Graphics;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.core.mx_internal;
   import mx.utils.GraphicsUtil;
   import mx.utils.MatrixUtil;
   import spark.primitives.supportClasses.FilledElement;
   
   public class Rect extends FilledElement
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      private var _bottomLeftRadiusX:Number;
      
      private var _bottomLeftRadiusY:Number;
      
      private var _bottomRightRadiusX:Number;
      
      private var _bottomRightRadiusY:Number;
      
      private var _radiusX:Number = 0;
      
      private var _radiusY:Number = 0;
      
      private var _topLeftRadiusX:Number;
      
      private var _topLeftRadiusY:Number;
      
      private var _topRightRadiusX:Number;
      
      private var _topRightRadiusY:Number;
      
      public function Rect()
      {
         super();
      }
      
      private static function getRoundRectBoundingBox(param1:Number, param2:Number, param3:Rect, param4:Matrix) : Rectangle
      {
         var boundingBox:Rectangle = null;
         var rX:Number = NaN;
         var rY:Number = NaN;
         var width:Number = param1;
         var height:Number = param2;
         var r:Rect = param3;
         var m:Matrix = param4;
         var radiusValue:Function = function(param1:Number, param2:Number, param3:Number):Number
         {
            var _loc4_:Number = isNaN(param2) ? param1 : param2;
            return Math.min(_loc4_,param3);
         };
         var maxRadiusX:Number = width / 2;
         var maxRadiusY:Number = height / 2;
         var radiusX:Number = r.radiusX;
         var radiusY:Number = r.radiusY == 0 ? radiusX : r.radiusY;
         rX = radiusValue(radiusX,r.topLeftRadiusX,maxRadiusX);
         rY = radiusValue(radiusY,r.topLeftRadiusY,maxRadiusY);
         boundingBox = MatrixUtil.getEllipseBoundingBox(rX,rY,rX,rY,m,boundingBox);
         rX = radiusValue(radiusX,r.topRightRadiusX,maxRadiusX);
         rY = radiusValue(radiusY,r.topRightRadiusY,maxRadiusY);
         boundingBox = MatrixUtil.getEllipseBoundingBox(width - rX,rY,rX,rY,m,boundingBox);
         rX = radiusValue(radiusX,r.bottomRightRadiusX,maxRadiusX);
         rY = radiusValue(radiusY,r.bottomRightRadiusY,maxRadiusY);
         boundingBox = MatrixUtil.getEllipseBoundingBox(width - rX,height - rY,rX,rY,m,boundingBox);
         rX = radiusValue(radiusX,r.bottomLeftRadiusX,maxRadiusX);
         rY = radiusValue(radiusY,r.bottomLeftRadiusY,maxRadiusY);
         boundingBox = MatrixUtil.getEllipseBoundingBox(rX,height - rY,rX,rY,m,boundingBox);
         return boundingBox;
      }
      
      public function get bottomLeftRadiusX() : Number
      {
         return this._bottomLeftRadiusX;
      }
      
      public function set bottomLeftRadiusX(param1:Number) : void
      {
         if(param1 != this._bottomLeftRadiusX)
         {
            this._bottomLeftRadiusX = param1;
            invalidateSize();
            invalidateDisplayList();
            invalidateParentSizeAndDisplayList();
         }
      }
      
      public function get bottomLeftRadiusY() : Number
      {
         return this._bottomLeftRadiusY;
      }
      
      public function set bottomLeftRadiusY(param1:Number) : void
      {
         if(param1 != this._bottomLeftRadiusY)
         {
            this._bottomLeftRadiusY = param1;
            invalidateSize();
            invalidateDisplayList();
            invalidateParentSizeAndDisplayList();
         }
      }
      
      public function get bottomRightRadiusX() : Number
      {
         return this._bottomRightRadiusX;
      }
      
      public function set bottomRightRadiusX(param1:Number) : void
      {
         if(param1 != this.bottomRightRadiusX)
         {
            this._bottomRightRadiusX = param1;
            invalidateSize();
            invalidateDisplayList();
            invalidateParentSizeAndDisplayList();
         }
      }
      
      public function get bottomRightRadiusY() : Number
      {
         return this._bottomRightRadiusY;
      }
      
      public function set bottomRightRadiusY(param1:Number) : void
      {
         if(param1 != this._bottomRightRadiusY)
         {
            this._bottomRightRadiusY = param1;
            invalidateSize();
            invalidateDisplayList();
            invalidateParentSizeAndDisplayList();
         }
      }
      
      public function get radiusX() : Number
      {
         return this._radiusX;
      }
      
      public function set radiusX(param1:Number) : void
      {
         if(param1 != this._radiusX)
         {
            this._radiusX = param1;
            invalidateSize();
            invalidateDisplayList();
            invalidateParentSizeAndDisplayList();
         }
      }
      
      public function get radiusY() : Number
      {
         return this._radiusY;
      }
      
      public function set radiusY(param1:Number) : void
      {
         if(param1 != this._radiusY)
         {
            this._radiusY = param1;
            invalidateSize();
            invalidateDisplayList();
            invalidateParentSizeAndDisplayList();
         }
      }
      
      public function get topLeftRadiusX() : Number
      {
         return this._topLeftRadiusX;
      }
      
      public function set topLeftRadiusX(param1:Number) : void
      {
         if(param1 != this._topLeftRadiusX)
         {
            this._topLeftRadiusX = param1;
            invalidateSize();
            invalidateDisplayList();
            invalidateParentSizeAndDisplayList();
         }
      }
      
      public function get topLeftRadiusY() : Number
      {
         return this._topLeftRadiusY;
      }
      
      public function set topLeftRadiusY(param1:Number) : void
      {
         if(param1 != this._topLeftRadiusY)
         {
            this._topLeftRadiusY = param1;
            invalidateSize();
            invalidateDisplayList();
            invalidateParentSizeAndDisplayList();
         }
      }
      
      public function get topRightRadiusX() : Number
      {
         return this._topRightRadiusX;
      }
      
      public function set topRightRadiusX(param1:Number) : void
      {
         if(param1 != this.topRightRadiusX)
         {
            this._topRightRadiusX = param1;
            invalidateSize();
            invalidateDisplayList();
            invalidateParentSizeAndDisplayList();
         }
      }
      
      public function get topRightRadiusY() : Number
      {
         return this._topRightRadiusY;
      }
      
      public function set topRightRadiusY(param1:Number) : void
      {
         if(param1 != this._topRightRadiusY)
         {
            this._topRightRadiusY = param1;
            invalidateSize();
            invalidateDisplayList();
            invalidateParentSizeAndDisplayList();
         }
      }
      
      override protected function draw(param1:Graphics) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(!isNaN(this.topLeftRadiusX) || !isNaN(this.topRightRadiusX) || !isNaN(this.bottomLeftRadiusX) || !isNaN(this.bottomRightRadiusX))
         {
            GraphicsUtil.drawRoundRectComplex2(param1,drawX,drawY,width,height,this.radiusX,this.radiusY,this.topLeftRadiusX,this.topLeftRadiusY,this.topRightRadiusX,this.topRightRadiusY,this.bottomLeftRadiusX,this.bottomLeftRadiusY,this.bottomRightRadiusX,this.bottomRightRadiusY);
         }
         else if(this.radiusX != 0)
         {
            _loc2_ = this.radiusX;
            _loc3_ = this.radiusY == 0 ? this.radiusX : this.radiusY;
            param1.drawRoundRect(drawX,drawY,width,height,_loc2_ * 2,_loc3_ * 2);
         }
         else
         {
            param1.drawRect(drawX,drawY,width,height);
         }
      }
      
      override protected function transformWidthForLayout(param1:Number, param2:Number, param3:Boolean = true) : Number
      {
         if(param3 && hasComplexLayoutMatrix)
         {
            param1 = getRoundRectBoundingBox(param1,param2,this,layoutFeatures.layoutMatrix).width;
         }
         return param1 + getStrokeExtents(param3).width;
      }
      
      override protected function transformHeightForLayout(param1:Number, param2:Number, param3:Boolean = true) : Number
      {
         if(param3 && hasComplexLayoutMatrix)
         {
            param2 = getRoundRectBoundingBox(param1,param2,this,layoutFeatures.layoutMatrix).height;
         }
         return param2 + getStrokeExtents(param3).height;
      }
      
      override public function getBoundsXAtSize(param1:Number, param2:Number, param3:Boolean = true) : Number
      {
         var _loc4_:Rectangle = getStrokeExtents(param3);
         var _loc5_:Matrix;
         if(!(_loc5_ = mx_internal::getComplexMatrix(param3)))
         {
            return _loc4_.left + this.x;
         }
         if(!isNaN(param1))
         {
            param1 -= _loc4_.width;
         }
         if(!isNaN(param2))
         {
            param2 -= _loc4_.height;
         }
         var _loc6_:Point;
         if(!(_loc6_ = MatrixUtil.fitBounds(param1,param2,_loc5_,explicitWidth,explicitHeight,preferredWidthPreTransform(),preferredHeightPreTransform(),minWidth,minHeight,maxWidth,maxHeight)))
         {
            _loc6_ = new Point(minWidth,minHeight);
         }
         return _loc4_.left + getRoundRectBoundingBox(_loc6_.x,_loc6_.y,this,_loc5_).x;
      }
      
      override public function getBoundsYAtSize(param1:Number, param2:Number, param3:Boolean = true) : Number
      {
         var _loc4_:Rectangle = getStrokeExtents(param3);
         var _loc5_:Matrix;
         if(!(_loc5_ = mx_internal::getComplexMatrix(param3)))
         {
            return _loc4_.top + this.y;
         }
         if(!isNaN(param1))
         {
            param1 -= _loc4_.width;
         }
         if(!isNaN(param2))
         {
            param2 -= _loc4_.height;
         }
         var _loc6_:Point;
         if(!(_loc6_ = MatrixUtil.fitBounds(param1,param2,_loc5_,explicitWidth,explicitHeight,preferredWidthPreTransform(),preferredHeightPreTransform(),minWidth,minHeight,maxWidth,maxHeight)))
         {
            _loc6_ = new Point(minWidth,minHeight);
         }
         return _loc4_.top + getRoundRectBoundingBox(_loc6_.x,_loc6_.y,this,_loc5_).y;
      }
      
      override public function getLayoutBoundsX(param1:Boolean = true) : Number
      {
         var _loc2_:Number = getStrokeExtents(param1).left;
         if(param1 && hasComplexLayoutMatrix)
         {
            return _loc2_ + getRoundRectBoundingBox(width,height,this,layoutFeatures.layoutMatrix).x;
         }
         return _loc2_ + this.x;
      }
      
      override public function getLayoutBoundsY(param1:Boolean = true) : Number
      {
         var _loc2_:Number = getStrokeExtents(param1).top;
         if(param1 && hasComplexLayoutMatrix)
         {
            return _loc2_ + getRoundRectBoundingBox(width,height,this,layoutFeatures.layoutMatrix).y;
         }
         return _loc2_ + this.y;
      }
      
      override public function setLayoutBoundsSize(param1:Number, param2:Number, param3:Boolean = true) : void
      {
         super.setLayoutBoundsSize(param1,param2,param3);
         var _loc4_:Boolean;
         if(!(_loc4_ = !isNaN(this.topLeftRadiusX) || !isNaN(this.topRightRadiusX) || !isNaN(this.bottomLeftRadiusX) || !isNaN(this.bottomRightRadiusX) || this.radiusX != 0 || this.radiusY != 0))
         {
            return;
         }
         var _loc5_:Matrix;
         if(!(_loc5_ = mx_internal::getComplexMatrix(param3)))
         {
            return;
         }
         this.setLayoutBoundsTransformed(param1,param2,_loc5_);
      }
      
      private function setLayoutBoundsTransformed(param1:Number, param2:Number, param3:Matrix) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = false;
         var _loc4_:Rectangle = getStrokeExtents(true);
         param1 -= _loc4_.width;
         param2 -= _loc4_.height;
         var _loc5_:Point;
         if(!(_loc5_ = this.fitLayoutBoundsIterative(param1,param2,param3)) && !isNaN(param1) && !isNaN(param2))
         {
            _loc6_ = this.fitLayoutBoundsIterative(NaN,param2,param3);
            _loc7_ = this.fitLayoutBoundsIterative(param1,NaN,param3);
            if(Boolean(_loc6_) && getRoundRectBoundingBox(_loc6_.x,_loc6_.y,this,param3).width > param1)
            {
               _loc6_ = null;
            }
            if(Boolean(_loc7_) && getRoundRectBoundingBox(_loc7_.x,_loc7_.y,this,param3).height > param2)
            {
               _loc7_ = null;
            }
            if(Boolean(_loc6_) && Boolean(_loc7_))
            {
               _loc8_ = Number(_loc6_.x) * Number(_loc6_.y) > Number(_loc7_.x) * Number(_loc7_.y);
               if(Number(_loc6_.x) * Number(_loc6_.y) > Number(_loc7_.x) * Number(_loc7_.y))
               {
                  _loc5_ = _loc6_;
               }
               else
               {
                  _loc5_ = _loc7_;
               }
            }
            else if(_loc6_)
            {
               _loc5_ = _loc6_;
            }
            else
            {
               _loc5_ = _loc7_;
            }
         }
         if(_loc5_)
         {
            mx_internal::setActualSize(_loc5_.x,_loc5_.y);
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
            _loc9_ = getRoundRectBoundingBox(_loc4_,_loc5_,this,param3);
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
   }
}
