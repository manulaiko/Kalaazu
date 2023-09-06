package starling.display
{
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.system.Capabilities;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.getQualifiedClassName;
   import starling.core.RenderSupport;
   import starling.core.Starling;
   import starling.errors.AbstractClassError;
   import starling.errors.AbstractMethodError;
   import starling.events.Event;
   import starling.events.EventDispatcher;
   import starling.events.TouchEvent;
   import starling.filters.FragmentFilter;
   import starling.utils.HAlign;
   import starling.utils.MatrixUtil;
   import starling.utils.VAlign;
   
   public class DisplayObject extends EventDispatcher
   {
      
      private static const TWO_PI:Number = 6.283185307179586;
      
      private static var sAncestors:Vector.<DisplayObject> = new Vector.<DisplayObject>(0);
      
      private static var sHelperRect:Rectangle = new Rectangle();
      
      private static var sHelperMatrix:Matrix = new Matrix();
       
      
      private var mX:Number;
      
      private var mY:Number;
      
      private var mPivotX:Number;
      
      private var mPivotY:Number;
      
      private var mScaleX:Number;
      
      private var mScaleY:Number;
      
      private var mSkewX:Number;
      
      private var mSkewY:Number;
      
      private var mRotation:Number;
      
      private var mAlpha:Number;
      
      private var mVisible:Boolean;
      
      private var mTouchable:Boolean;
      
      private var mBlendMode:String;
      
      private var mName:String;
      
      private var mUseHandCursor:Boolean;
      
      private var mParent:DisplayObjectContainer;
      
      private var mTransformationMatrix:Matrix;
      
      private var mOrientationChanged:Boolean;
      
      private var mFilter:FragmentFilter;
      
      public function DisplayObject()
      {
         super();
         if(false && getQualifiedClassName(this) == "starling.display::DisplayObject")
         {
            throw new AbstractClassError();
         }
         this.mX = this.mY = this.mPivotX = this.mPivotY = this.mRotation = this.mSkewX = this.mSkewY = 0;
         this.mScaleX = this.mScaleY = this.mAlpha = 1;
         this.mVisible = this.mTouchable = true;
         this.mBlendMode = BlendMode.AUTO;
         this.mTransformationMatrix = new Matrix();
         this.mOrientationChanged = this.mUseHandCursor = false;
      }
      
      public function dispose() : void
      {
         if(this.mFilter)
         {
            this.mFilter.dispose();
         }
         this.removeEventListeners();
      }
      
      public function removeFromParent(param1:Boolean = false) : void
      {
         if(this.mParent)
         {
            this.mParent.removeChild(this,param1);
         }
         else if(param1)
         {
            this.dispose();
         }
      }
      
      public function getTransformationMatrix(param1:DisplayObject, param2:Matrix = null) : Matrix
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param2)
         {
            param2.identity();
         }
         else
         {
            param2 = new Matrix();
         }
         if(param1 == this)
         {
            return param2;
         }
         if(param1 == this.mParent || param1 == null && this.mParent == null)
         {
            param2.copyFrom(this.transformationMatrix);
            return param2;
         }
         if(param1 == null || param1 == this.base)
         {
            _loc4_ = {};
            while(_loc4_ != param1)
            {
               param2.concat(_loc4_.transformationMatrix);
               _loc4_ = _loc4_.mParent;
            }
            return param2;
         }
         if(param1.mParent == this)
         {
            param1.getTransformationMatrix(this,param2);
            param2.invert();
            return param2;
         }
         _loc3_ = null;
         _loc4_ = {};
         while(_loc4_)
         {
            sAncestors[sAncestors.length] = _loc4_;
            _loc4_ = _loc4_.mParent;
         }
         _loc4_ = param1;
         while(Boolean(_loc4_) && sAncestors.indexOf(_loc4_) == -1)
         {
            _loc4_ = _loc4_.mParent;
         }
         sAncestors.length = 0;
         if(_loc4_)
         {
            _loc3_ = _loc4_;
            _loc4_ = {};
            while(_loc4_ != _loc3_)
            {
               param2.concat(_loc4_.transformationMatrix);
               _loc4_ = _loc4_.mParent;
            }
            if(_loc3_ == param1)
            {
               return param2;
            }
            sHelperMatrix.identity();
            _loc4_ = param1;
            while(_loc4_ != _loc3_)
            {
               sHelperMatrix.concat(_loc4_.transformationMatrix);
               _loc4_ = _loc4_.mParent;
            }
            sHelperMatrix.invert();
            param2.concat(sHelperMatrix);
            return param2;
         }
         throw new ArgumentError("Object not connected to target");
      }
      
      public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         throw new AbstractMethodError();
      }
      
      public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
      {
         if(param2 && (!this.mVisible || !this.mTouchable))
         {
            return null;
         }
         if(this.getBounds(this,sHelperRect).containsPoint(param1))
         {
            return this;
         }
         return null;
      }
      
      public function localToGlobal(param1:Point, param2:Point = null) : Point
      {
         this.getTransformationMatrix(this.base,sHelperMatrix);
         return MatrixUtil.transformCoords(sHelperMatrix,param1.x,param1.y,param2);
      }
      
      public function globalToLocal(param1:Point, param2:Point = null) : Point
      {
         this.getTransformationMatrix(this.base,sHelperMatrix);
         sHelperMatrix.invert();
         return MatrixUtil.transformCoords(sHelperMatrix,param1.x,param1.y,param2);
      }
      
      public function render(param1:RenderSupport, param2:Number) : void
      {
         throw new AbstractMethodError();
      }
      
      public function get hasVisibleArea() : Boolean
      {
         return this.mAlpha != 0 && this.mVisible && this.mScaleX != 0 && this.mScaleY != 0;
      }
      
      public function alignPivot(param1:String = "center", param2:String = "center") : void
      {
         var _loc3_:Rectangle = this.getBounds(this);
         this.mOrientationChanged = true;
         if(param1 == HAlign.LEFT)
         {
            this.mPivotX = _loc3_.x;
         }
         else if(param1 == HAlign.CENTER)
         {
            this.mPivotX = _loc3_.x + _loc3_.width / 2;
         }
         else
         {
            if(param1 != HAlign.RIGHT)
            {
               throw new ArgumentError("Invalid horizontal alignment: " + param1);
            }
            this.mPivotX = _loc3_.x + _loc3_.width;
         }
         if(param2 == VAlign.TOP)
         {
            this.mPivotY = _loc3_.y;
         }
         else if(param2 == VAlign.CENTER)
         {
            this.mPivotY = _loc3_.y + _loc3_.height / 2;
         }
         else
         {
            if(param2 != VAlign.BOTTOM)
            {
               throw new ArgumentError("Invalid vertical alignment: " + param2);
            }
            this.mPivotY = _loc3_.y + _loc3_.height;
         }
      }
      
      function setParent(param1:DisplayObjectContainer) : void
      {
         var _loc2_:DisplayObject = param1;
         while(_loc2_ != this && _loc2_ != null)
         {
            _loc2_ = _loc2_.mParent;
         }
         if(_loc2_ == this)
         {
            throw new ArgumentError("An object cannot be added as a child to itself or one of its children (or children\'s children, etc.)");
         }
         this.mParent = param1;
      }
      
      private final function isEquivalent(param1:Number, param2:Number, param3:Number = 0.0001) : Boolean
      {
         return param1 - param3 < param2 && param1 + param3 > param2;
      }
      
      private final function normalizeAngle(param1:Number) : Number
      {
         param1 %= TWO_PI;
         if(param1 < 0)
         {
            param1 += TWO_PI;
         }
         if(param1 > Math.PI)
         {
            param1 -= TWO_PI;
         }
         return param1;
      }
      
      override public function dispatchEvent(param1:Event) : void
      {
         if(param1.type == Event.REMOVED_FROM_STAGE && this.stage == null)
         {
            return;
         }
         super.dispatchEvent(param1);
      }
      
      override public function addEventListener(param1:String, param2:Function) : void
      {
         if(param1 == Event.ENTER_FRAME && !hasEventListener(param1))
         {
            this.addEventListener(Event.ADDED_TO_STAGE,this.addEnterFrameListenerToStage);
            this.addEventListener(Event.REMOVED_FROM_STAGE,this.removeEnterFrameListenerFromStage);
            if(this.stage)
            {
               this.addEnterFrameListenerToStage();
            }
         }
         super.addEventListener(param1,param2);
      }
      
      override public function removeEventListener(param1:String, param2:Function) : void
      {
         super.removeEventListener(param1,param2);
         if(param1 == Event.ENTER_FRAME && !hasEventListener(param1))
         {
            this.removeEventListener(Event.ADDED_TO_STAGE,this.addEnterFrameListenerToStage);
            this.removeEventListener(Event.REMOVED_FROM_STAGE,this.removeEnterFrameListenerFromStage);
            this.removeEnterFrameListenerFromStage();
         }
      }
      
      override public function removeEventListeners(param1:String = null) : void
      {
         super.removeEventListeners(param1);
         if(param1 == null || param1 == Event.ENTER_FRAME)
         {
            this.removeEventListener(Event.ADDED_TO_STAGE,this.addEnterFrameListenerToStage);
            this.removeEventListener(Event.REMOVED_FROM_STAGE,this.removeEnterFrameListenerFromStage);
            this.removeEnterFrameListenerFromStage();
         }
      }
      
      private function addEnterFrameListenerToStage() : void
      {
         Starling.current.stage.addEnterFrameListener(this);
      }
      
      private function removeEnterFrameListenerFromStage() : void
      {
         Starling.current.stage.removeEnterFrameListener(this);
      }
      
      public function get transformationMatrix() : Matrix
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(this.mOrientationChanged)
         {
            this.mOrientationChanged = false;
            if(this.mSkewX == 0 && this.mSkewY == 0)
            {
               if(this.mRotation == 0)
               {
                  this.mTransformationMatrix.setTo(this.mScaleX,0,0,this.mScaleY,this.mX - this.mPivotX * this.mScaleX,this.mY - this.mPivotY * this.mScaleY);
               }
               else
               {
                  _loc1_ = Math.cos(this.mRotation);
                  _loc2_ = Math.sin(this.mRotation);
                  _loc3_ = this.mScaleX * _loc1_;
                  _loc4_ = this.mScaleX * _loc2_;
                  _loc5_ = this.mScaleY * -_loc2_;
                  _loc6_ = this.mScaleY * _loc1_;
                  _loc7_ = this.mX - this.mPivotX * _loc3_ - this.mPivotY * _loc5_;
                  _loc8_ = this.mY - this.mPivotX * _loc4_ - this.mPivotY * _loc6_;
                  this.mTransformationMatrix.setTo(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
               }
            }
            else
            {
               this.mTransformationMatrix.identity();
               this.mTransformationMatrix.scale(this.mScaleX,this.mScaleY);
               MatrixUtil.skew(this.mTransformationMatrix,this.mSkewX,this.mSkewY);
               this.mTransformationMatrix.rotate(this.mRotation);
               this.mTransformationMatrix.translate(this.mX,this.mY);
               if(this.mPivotX != 0 || this.mPivotY != 0)
               {
                  this.mTransformationMatrix.tx = this.mX - this.mTransformationMatrix.a * this.mPivotX - this.mTransformationMatrix.c * this.mPivotY;
                  this.mTransformationMatrix.ty = this.mY - this.mTransformationMatrix.b * this.mPivotX - this.mTransformationMatrix.d * this.mPivotY;
               }
            }
         }
         return this.mTransformationMatrix;
      }
      
      public function set transformationMatrix(param1:Matrix) : void
      {
         var _loc2_:Number = 0;
         this.mOrientationChanged = false;
         this.mTransformationMatrix.copyFrom(param1);
         this.mPivotX = this.mPivotY = 0;
         this.mX = param1.tx;
         this.mY = param1.ty;
         this.mSkewX = Math.atan(-param1.c / param1.d);
         this.mSkewY = Math.atan(param1.b / param1.a);
         if(this.mSkewX != this.mSkewX)
         {
            this.mSkewX = 0;
         }
         if(this.mSkewY != this.mSkewY)
         {
            this.mSkewY = 0;
         }
         this.mScaleY = this.mSkewX > -_loc2_ && this.mSkewX < _loc2_ ? param1.d / Math.cos(this.mSkewX) : -param1.c / Math.sin(this.mSkewX);
         this.mScaleX = this.mSkewY > -_loc2_ && this.mSkewY < _loc2_ ? param1.a / Math.cos(this.mSkewY) : param1.b / Math.sin(this.mSkewY);
         if(this.isEquivalent(this.mSkewX,this.mSkewY))
         {
            this.mRotation = this.mSkewX;
            this.mSkewX = this.mSkewY = 0;
         }
         else
         {
            this.mRotation = 0;
         }
      }
      
      public function get useHandCursor() : Boolean
      {
         return this.mUseHandCursor;
      }
      
      public function set useHandCursor(param1:Boolean) : void
      {
         if(param1 == this.mUseHandCursor)
         {
            return;
         }
         this.mUseHandCursor = param1;
         if(this.mUseHandCursor)
         {
            this.addEventListener(TouchEvent.TOUCH,this.onTouch);
         }
         else
         {
            this.removeEventListener(TouchEvent.TOUCH,this.onTouch);
         }
      }
      
      private function onTouch(param1:TouchEvent) : void
      {
         Mouse.cursor = param1.interactsWith(this) ? "null" : MouseCursor.AUTO;
      }
      
      public function get bounds() : Rectangle
      {
         return this.getBounds(this.mParent);
      }
      
      public function get width() : Number
      {
         return this.getBounds(this.mParent,sHelperRect).width;
      }
      
      public function set width(param1:Number) : void
      {
         this.scaleX = 1;
         var _loc2_:Number = this.width;
         if(_loc2_ != 0)
         {
            this.scaleX = param1 / _loc2_;
         }
      }
      
      public function get height() : Number
      {
         return this.getBounds(this.mParent,sHelperRect).height;
      }
      
      public function set height(param1:Number) : void
      {
         this.scaleY = 1;
         var _loc2_:Number = this.height;
         if(_loc2_ != 0)
         {
            this.scaleY = param1 / _loc2_;
         }
      }
      
      public function get x() : Number
      {
         return this.mX;
      }
      
      public function set x(param1:Number) : void
      {
         if(this.mX != param1)
         {
            this.mX = param1;
            this.mOrientationChanged = true;
         }
      }
      
      public function get y() : Number
      {
         return this.mY;
      }
      
      public function set y(param1:Number) : void
      {
         if(this.mY != param1)
         {
            this.mY = param1;
            this.mOrientationChanged = true;
         }
      }
      
      public function get pivotX() : Number
      {
         return this.mPivotX;
      }
      
      public function set pivotX(param1:Number) : void
      {
         if(this.mPivotX != param1)
         {
            this.mPivotX = param1;
            this.mOrientationChanged = true;
         }
      }
      
      public function get pivotY() : Number
      {
         return this.mPivotY;
      }
      
      public function set pivotY(param1:Number) : void
      {
         if(this.mPivotY != param1)
         {
            this.mPivotY = param1;
            this.mOrientationChanged = true;
         }
      }
      
      public function get scaleX() : Number
      {
         return this.mScaleX;
      }
      
      public function set scaleX(param1:Number) : void
      {
         if(this.mScaleX != param1)
         {
            this.mScaleX = param1;
            this.mOrientationChanged = true;
         }
      }
      
      public function get scaleY() : Number
      {
         return this.mScaleY;
      }
      
      public function set scaleY(param1:Number) : void
      {
         if(this.mScaleY != param1)
         {
            this.mScaleY = param1;
            this.mOrientationChanged = true;
         }
      }
      
      public function get skewX() : Number
      {
         return this.mSkewX;
      }
      
      public function set skewX(param1:Number) : void
      {
         param1 = this.normalizeAngle(param1);
         if(this.mSkewX != param1)
         {
            this.mSkewX = param1;
            this.mOrientationChanged = true;
         }
      }
      
      public function get skewY() : Number
      {
         return this.mSkewY;
      }
      
      public function set skewY(param1:Number) : void
      {
         param1 = this.normalizeAngle(param1);
         if(this.mSkewY != param1)
         {
            this.mSkewY = param1;
            this.mOrientationChanged = true;
         }
      }
      
      public function get rotation() : Number
      {
         return this.mRotation;
      }
      
      public function set rotation(param1:Number) : void
      {
         param1 = this.normalizeAngle(param1);
         if(this.mRotation != param1)
         {
            this.mRotation = param1;
            this.mOrientationChanged = true;
         }
      }
      
      public function get alpha() : Number
      {
         return this.mAlpha;
      }
      
      public function set alpha(param1:Number) : void
      {
         this.mAlpha = param1 < 0 ? 0 : (param1 > 1 ? 1 : param1);
      }
      
      public function get visible() : Boolean
      {
         return this.mVisible;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.mVisible = param1;
      }
      
      public function get touchable() : Boolean
      {
         return this.mTouchable;
      }
      
      public function set touchable(param1:Boolean) : void
      {
         this.mTouchable = param1;
      }
      
      public function get blendMode() : String
      {
         return this.mBlendMode;
      }
      
      public function set blendMode(param1:String) : void
      {
         this.mBlendMode = param1;
      }
      
      public function get name() : String
      {
         return this.mName;
      }
      
      public function set name(param1:String) : void
      {
         this.mName = param1;
      }
      
      public function get filter() : FragmentFilter
      {
         return this.mFilter;
      }
      
      public function set filter(param1:FragmentFilter) : void
      {
         this.mFilter = param1;
      }
      
      public function get parent() : DisplayObjectContainer
      {
         return this.mParent;
      }
      
      public function get base() : DisplayObject
      {
         var _loc1_:* = {};
         while(_loc1_.mParent)
         {
            _loc1_ = _loc1_.mParent;
         }
         return _loc1_;
      }
      
      public function get root() : DisplayObject
      {
         var _loc1_:* = {};
         while(_loc1_.mParent)
         {
            if(_loc1_.mParent is Stage)
            {
               return _loc1_;
            }
            _loc1_ = _loc1_.parent;
         }
         return null;
      }
      
      public function get stage() : Stage
      {
         return this.base as Stage;
      }
   }
}
