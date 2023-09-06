package com.greensock.layout
{
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class AutoFitArea extends Shape
   {
      
      public static const version:Number = 1.5;
      
      private static var _bd:BitmapData = new BitmapData(2800,2800,true,16777215);
      
      private static var _rect:Rectangle = new Rectangle(0,0,2800,2800);
      
      private static var _matrix:Matrix = new Matrix();
       
      
      protected var _parent:DisplayObjectContainer;
      
      protected var _previewColor:uint;
      
      protected var _rootItem:AutoFitItem;
      
      protected var _hasListener:Boolean;
      
      protected var _preview:Boolean;
      
      protected var _tweenMode:Boolean;
      
      public function AutoFitArea(param1:DisplayObjectContainer, param2:Number = 0, param3:Number = 0, param4:Number = 100, param5:Number = 100, param6:uint = 16711680)
      {
         super();
         super.x = param2;
         super.y = param3;
         if(param1 == null)
         {
            throw new Error("AutoFitArea parent cannot be null");
         }
         this._parent = param1;
         var _loc7_:Graphics;
         (_loc7_ = this.graphics).clear();
         _loc7_.beginFill(param6,1);
         _loc7_.drawRect(0,0,param4,param5);
         _loc7_.endFill();
         this.previewColor = param6;
      }
      
      public static function createAround(param1:DisplayObject, param2:String = "proportionalInside", param3:String = "center", param4:String = "center", param5:Boolean = false, param6:Number = 0, param7:Number = 0, param8:Number = 999999999, param9:Number = 999999999, param10:uint = 16711680, param11:Boolean = false) : AutoFitArea
      {
         var _loc12_:Rectangle = param11 ? getVisibleBounds(param1,param1.parent) : param1.getBounds(param1.parent);
         var _loc13_:AutoFitArea;
         (_loc13_ = new AutoFitArea(param1.parent,_loc12_.x,_loc12_.y,_loc12_.width,_loc12_.height,param10)).attach(param1,param2,param3,param4,param5,param6,param8,param7,param9,param11);
         return _loc13_;
      }
      
      protected static function getVisibleBounds(param1:DisplayObject, param2:DisplayObject) : Rectangle
      {
         _bd.fillRect(_rect,16777215);
         _matrix.ty = 0;
         _matrix.tx = 0;
         var _loc3_:Rectangle = param1.getBounds(param2);
         var _loc4_:Matrix = param2 == param1 ? _matrix : param1.transform.matrix;
         _loc4_.tx -= _loc3_.x;
         _loc4_.ty -= _loc3_.y;
         _bd.draw(param1,_loc4_,null,"normal",_rect,false);
         var _loc5_:Rectangle = _bd.getColorBoundsRect(4278190080,0,false);
         _loc5_.x += _loc3_.x;
         _loc5_.y += _loc3_.y;
         return _loc5_;
      }
      
      public function attach(param1:DisplayObject, param2:String = "proportionalInside", param3:String = "center", param4:String = "center", param5:Boolean = false, param6:Number = 0, param7:Number = 999999999, param8:Number = 0, param9:Number = 999999999, param10:Boolean = false, param11:Number = NaN) : void
      {
         var _loc12_:* = null;
         var _loc13_:* = null;
         if(param1.parent != this._parent)
         {
            throw new Error("The parent of the DisplayObject " + param1.name + " added to AutoFitArea " + this.name + " doesn\'t share the same parent.");
         }
         this.release(param1);
         this._rootItem = new AutoFitItem(param1,param2,param3,param4,param6,param7,param8,param9,param10,param11,this._rootItem);
         if(param5)
         {
            _loc12_ = new Shape();
            _loc13_ = this.getBounds(this);
            _loc12_.graphics.beginFill(this._previewColor,1);
            _loc12_.graphics.drawRect(_loc13_.x,_loc13_.y,_loc13_.width,_loc13_.height);
            _loc12_.graphics.endFill();
            _loc12_.visible = false;
            this._parent.addChild(_loc12_);
            this._rootItem.mask = _loc12_;
            param1.mask = _loc12_;
         }
         if(this._preview)
         {
            this.preview = true;
         }
         this.update(null);
      }
      
      public function release(param1:DisplayObject) : Boolean
      {
         var _loc2_:AutoFitItem = this.getItem(param1);
         if(_loc2_ == null)
         {
            return false;
         }
         if(_loc2_.mask != null)
         {
            if(_loc2_.mask.parent)
            {
               _loc2_.mask.parent.removeChild(_loc2_.mask);
            }
            param1.mask = null;
            _loc2_.mask = null;
         }
         if(_loc2_.next)
         {
            _loc2_.next.prev = _loc2_.prev;
         }
         if(_loc2_.prev)
         {
            _loc2_.prev.next = _loc2_.next;
         }
         else if(_loc2_ == this._rootItem)
         {
            this._rootItem = _loc2_.next;
         }
         _loc2_.prev = null;
         _loc2_.next = null;
         return true;
      }
      
      public function getAttachedObjects() : Array
      {
         var _loc1_:* = [];
         var _loc2_:Number = 0;
         var _loc3_:AutoFitItem = this._rootItem;
         while(_loc3_)
         {
            var _loc4_:*;
            _loc1_[_loc4_ = _loc2_++] = _loc3_.target;
            _loc3_ = _loc3_.next;
         }
         return _loc1_;
      }
      
      protected function getItem(param1:DisplayObject) : AutoFitItem
      {
         var _loc2_:AutoFitItem = this._rootItem;
         while(_loc2_)
         {
            if(_loc2_.target == param1)
            {
               return _loc2_;
            }
            _loc2_ = _loc2_.next;
         }
         return null;
      }
      
      public function update(param1:Event = null) : void
      {
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:Number = NaN;
         var _loc13_:* = null;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:* = null;
         var _loc20_:Number = NaN;
         var _loc21_:* = null;
         var _loc2_:Number = this.width;
         var _loc3_:Number = this.height;
         var _loc4_:Number = this.x;
         var _loc5_:Number = this.y;
         var _loc6_:Matrix = this.transform.matrix;
         var _loc7_:AutoFitItem = this._rootItem;
         while(_loc7_)
         {
            _loc10_ = _loc7_.target;
            if((_loc13_ = _loc7_.scaleMode) != ScaleMode.NONE)
            {
               _loc11_ = _loc7_.calculateVisible ? (_loc7_.bounds = getVisibleBounds(_loc10_,_loc10_)) : _loc10_.getBounds(_loc10_);
               _loc12_ = _loc7_.hasCustomRatio ? _loc7_.aspectRatio : _loc11_.width / _loc11_.height;
               if((_loc19_ = _loc10_.transform.matrix).b != 0 || _loc19_.a == 0 || _loc19_.d == 0)
               {
                  if(_loc19_.a == 0 || _loc19_.d == 0)
                  {
                     _loc19_ = _loc10_.transform.matrix = _loc7_.matrix;
                  }
                  else
                  {
                     (_loc21_ = _loc7_.matrix).a = _loc19_.a;
                     _loc21_.b = _loc19_.b;
                     _loc21_.c = _loc19_.c;
                     _loc21_.d = _loc19_.d;
                     _loc21_.tx = _loc19_.tx;
                     _loc21_.ty = _loc19_.ty;
                  }
                  _loc15_ = Math.atan2(_loc19_.b,_loc19_.a);
                  if(_loc19_.a < 0 && _loc19_.d >= 0)
                  {
                     if(_loc15_ <= 0)
                     {
                        _loc15_ += Math.PI;
                     }
                     else
                     {
                        _loc15_ -= 0;
                     }
                  }
                  if((_loc16_ = Math.sin(_loc15_)) < 0)
                  {
                     _loc16_ = -_loc16_;
                  }
                  if((_loc17_ = Math.cos(_loc15_)) < 0)
                  {
                     _loc17_ = -_loc17_;
                  }
                  _loc12_ = (_loc12_ * _loc17_ + _loc16_) / (_loc12_ * _loc16_ + _loc17_);
               }
               _loc8_ = _loc2_ > _loc7_.maxWidth ? _loc7_.maxWidth : (_loc2_ < _loc7_.minWidth ? _loc7_.minWidth : _loc2_);
               _loc9_ = _loc3_ > _loc7_.maxHeight ? _loc7_.maxHeight : (_loc3_ < _loc7_.minHeight ? _loc7_.minHeight : _loc3_);
               _loc14_ = _loc8_ / _loc9_;
               if(_loc12_ < _loc14_ && _loc13_ == ScaleMode.PROPORTIONAL_INSIDE || _loc12_ > _loc14_ && _loc13_ == ScaleMode.PROPORTIONAL_OUTSIDE)
               {
                  if((_loc8_ = _loc9_ * _loc12_) > _loc7_.maxWidth)
                  {
                     _loc9_ = (_loc8_ = _loc7_.maxWidth) / _loc12_;
                  }
                  else if(_loc8_ < _loc7_.minWidth)
                  {
                     _loc9_ = (_loc8_ = _loc7_.minWidth) / _loc12_;
                  }
               }
               if(_loc12_ > _loc14_ && _loc13_ == ScaleMode.PROPORTIONAL_INSIDE || _loc12_ < _loc14_ && _loc13_ == ScaleMode.PROPORTIONAL_OUTSIDE)
               {
                  if((_loc9_ = _loc8_ / _loc12_) > _loc7_.maxHeight)
                  {
                     _loc8_ = (_loc9_ = _loc7_.maxHeight) * _loc12_;
                  }
                  else if(_loc9_ < _loc7_.minHeight)
                  {
                     _loc8_ = (_loc9_ = _loc7_.minHeight) * _loc12_;
                  }
               }
               if(_loc13_ != ScaleMode.HEIGHT_ONLY)
               {
                  if(_loc7_.calculateVisible)
                  {
                     _loc7_.setVisibleWidth(_loc8_);
                  }
                  else if(_loc19_.b != 0)
                  {
                     _loc20_ = _loc8_ / _loc10_.width;
                     _loc19_.a *= _loc20_;
                     _loc19_.c *= _loc20_;
                     _loc10_.transform.matrix = _loc19_;
                  }
                  else
                  {
                     _loc10_.width = _loc8_;
                  }
               }
               if(_loc13_ != ScaleMode.WIDTH_ONLY)
               {
                  if(_loc7_.calculateVisible)
                  {
                     _loc7_.setVisibleHeight(_loc9_);
                  }
                  else if(_loc19_.b != 0)
                  {
                     _loc20_ = _loc9_ / _loc10_.height;
                     _loc19_.d *= _loc20_;
                     _loc19_.b *= _loc20_;
                     _loc10_.transform.matrix = _loc19_;
                  }
                  else
                  {
                     _loc10_.height = _loc9_;
                  }
               }
            }
            _loc11_ = _loc7_.calculateVisible ? getVisibleBounds(_loc10_,this._parent) : _loc10_.getBounds(this._parent);
            if(_loc7_.hAlign == AlignMode.LEFT)
            {
               _loc10_.x += _loc4_ - _loc11_.x;
            }
            else if(_loc7_.hAlign == AlignMode.CENTER)
            {
               _loc10_.x += _loc4_ - _loc11_.x + (_loc2_ - _loc11_.width) * 0.5;
            }
            else
            {
               _loc10_.x += _loc4_ - _loc11_.x + (_loc2_ - _loc11_.width);
            }
            if(_loc7_.vAlign == AlignMode.TOP)
            {
               _loc10_.y += _loc5_ - _loc11_.y;
            }
            else if(_loc7_.vAlign == AlignMode.CENTER)
            {
               _loc10_.y += _loc5_ - _loc11_.y + (_loc3_ - _loc11_.height) * 0.5;
            }
            else
            {
               _loc10_.y += _loc5_ - _loc11_.y + (_loc3_ - _loc11_.height);
            }
            if(_loc7_.mask)
            {
               _loc7_.mask.transform.matrix = _loc6_;
            }
            _loc7_ = _loc7_.next;
         }
         if(this._hasListener)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function enableTweenMode() : void
      {
         this._tweenMode = true;
      }
      
      public function disableTweenMode() : void
      {
         this._tweenMode = false;
      }
      
      override public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._hasListener = true;
         super.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function destroy() : void
      {
         var _loc1_:* = null;
         if(this._preview)
         {
            this.preview = false;
         }
         var _loc2_:AutoFitItem = this._rootItem;
         while(_loc2_)
         {
            _loc1_ = _loc2_.next;
            this.release(_loc2_.target);
            _loc2_ = _loc1_;
         }
         this._parent = null;
      }
      
      override public function set x(param1:Number) : void
      {
         super.x = param1;
         if(!this._tweenMode)
         {
            this.update();
         }
      }
      
      override public function set y(param1:Number) : void
      {
         super.y = param1;
         if(!this._tweenMode)
         {
            this.update();
         }
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         if(!this._tweenMode)
         {
            this.update();
         }
      }
      
      override public function set height(param1:Number) : void
      {
         super.height = param1;
         if(!this._tweenMode)
         {
            this.update();
         }
      }
      
      override public function set scaleX(param1:Number) : void
      {
         super.scaleX = param1;
         this.update();
      }
      
      override public function set scaleY(param1:Number) : void
      {
         super.scaleY = param1;
         this.update();
      }
      
      override public function set rotation(param1:Number) : void
      {
      }
      
      public function get previewColor() : uint
      {
         return this._previewColor;
      }
      
      public function set previewColor(param1:uint) : void
      {
         this._previewColor = param1;
         var _loc2_:ColorTransform = this.transform.colorTransform;
         _loc2_.color = param1;
         this.transform.colorTransform = _loc2_;
      }
      
      public function get preview() : Boolean
      {
         return this._preview;
      }
      
      public function set preview(param1:Boolean) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:* = null;
         this._preview = param1;
         if(this.parent == this._parent)
         {
            this._parent.removeChild(this);
         }
         if(param1)
         {
            _loc2_ = this._rootItem == null ? 0 : 999999999;
            _loc4_ = this._rootItem;
            while(_loc4_)
            {
               if(_loc4_.target.parent == this._parent)
               {
                  _loc3_ = this._parent.getChildIndex(_loc4_.target);
                  if(_loc3_ < _loc2_)
                  {
                     _loc2_ = _loc3_;
                  }
               }
               _loc4_ = _loc4_.next;
            }
            this._parent.addChildAt(this,_loc2_);
            this.visible = true;
         }
      }
   }
}

import flash.display.DisplayObject;
import flash.display.Shape;
import flash.geom.Matrix;
import flash.geom.Rectangle;

class AutoFitItem
{
    
   
   public var target:DisplayObject;
   
   public var scaleMode:String;
   
   public var hAlign:String;
   
   public var vAlign:String;
   
   public var minWidth:Number;
   
   public var maxWidth:Number;
   
   public var minHeight:Number;
   
   public var maxHeight:Number;
   
   public var aspectRatio:Number;
   
   public var mask:Shape;
   
   public var matrix:Matrix;
   
   public var hasCustomRatio:Boolean;
   
   public var next:AutoFitItem;
   
   public var prev:AutoFitItem;
   
   public var calculateVisible:Boolean;
   
   public var bounds:Rectangle;
   
   function AutoFitItem(param1:DisplayObject, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number, param8:Number, param9:Boolean, param10:Number, param11:AutoFitItem)
   {
      super();
      this.target = param1;
      this.scaleMode = param2;
      this.hAlign = param3;
      this.vAlign = param4;
      this.minWidth = param5;
      this.maxWidth = param6;
      this.minHeight = param7;
      this.maxHeight = param8;
      this.matrix = param1.transform.matrix;
      this.calculateVisible = param9;
      if(!isNaN(param10))
      {
         this.aspectRatio = param10;
         this.hasCustomRatio = true;
      }
      if(param11)
      {
         param11.prev = this;
         this.next = param11;
      }
   }
   
   public function setVisibleWidth(param1:Number) : void
   {
      var _loc4_:Number = NaN;
      var _loc2_:Matrix = this.target.transform.matrix;
      if(_loc2_.a == 0 && _loc2_.c == 0 || _loc2_.d == 0 && _loc2_.b == 0)
      {
         _loc2_.a = this.matrix.a;
         _loc2_.c = this.matrix.c;
      }
      var _loc3_:Number = _loc2_.a < 0 ? -_loc2_.a * Number(this.bounds.width) : _loc2_.a * Number(this.bounds.width);
      _loc3_ += _loc2_.c < 0 ? -_loc2_.c * Number(this.bounds.height) : _loc2_.c * Number(this.bounds.height);
      if(_loc3_ != 0)
      {
         _loc4_ = param1 / _loc3_;
         _loc2_.a *= _loc4_;
         _loc2_.c *= _loc4_;
         this.target.transform.matrix = _loc2_;
         if(param1 != 0)
         {
            this.matrix = _loc2_;
         }
      }
   }
   
   public function setVisibleHeight(param1:Number) : void
   {
      var _loc4_:Number = NaN;
      var _loc2_:Matrix = this.target.transform.matrix;
      if(_loc2_.a == 0 && _loc2_.c == 0 || _loc2_.d == 0 && _loc2_.b == 0)
      {
         _loc2_.b = this.matrix.b;
         _loc2_.d = this.matrix.d;
      }
      var _loc3_:Number = _loc2_.b < 0 ? -_loc2_.b * Number(this.bounds.width) : _loc2_.b * Number(this.bounds.width);
      _loc3_ += _loc2_.d < 0 ? -_loc2_.d * Number(this.bounds.height) : _loc2_.d * Number(this.bounds.height);
      if(_loc3_ != 0)
      {
         _loc4_ = param1 / _loc3_;
         _loc2_.b *= _loc4_;
         _loc2_.d *= _loc4_;
         this.target.transform.matrix = _loc2_;
         if(param1 != 0)
         {
            this.matrix = _loc2_;
         }
      }
   }
}
