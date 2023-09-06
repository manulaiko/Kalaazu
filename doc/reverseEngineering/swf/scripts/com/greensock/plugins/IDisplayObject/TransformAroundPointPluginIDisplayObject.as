package com.greensock.plugins.IDisplayObject
{
   import com.greensock.TweenLite;
   import com.greensock.core.PropTween;
   import com.greensock.plugins.ShortRotationPlugin;
   import com.greensock.plugins.TweenPlugin;
   import flash.geom.Point;
   import net.bigpoint.darkorbit.mvc.display.class_1704;
   
   public class TransformAroundPointPluginIDisplayObject extends TweenPlugin
   {
      
      public static const API:Number = 1;
       
      
      protected var _target:class_1704;
      
      protected var _local:Point;
      
      protected var _point:Point;
      
      protected var _shortRotation:ShortRotationPlugin;
      
      public function TransformAroundPointPluginIDisplayObject()
      {
         super();
         this.propName = "transformAroundPointIDisplayObject";
         this.overwriteProps = ["x","y"];
         this.priority = -1;
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:TweenLite) : Boolean
      {
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         if(!(param2.point is Point))
         {
            return false;
         }
         this._target = param1 as class_1704;
         this._point = param2.point.clone();
         this._local = this._target.method_4347(this._target.method_1052.localToGlobal(this._point));
         for(_loc4_ in param2)
         {
            if(_loc4_ != "point")
            {
               if(_loc4_ == "shortRotation")
               {
                  this._shortRotation = new ShortRotationPlugin();
                  this._shortRotation.onInitTween(this._target,param2[_loc4_],param3);
                  addTween(this._shortRotation,"changeFactor",0,1,"shortRotation");
                  for(this.overwriteProps[this.overwriteProps.length] in param2[_loc4_])
                  {
                  }
               }
               else if(_loc4_ == "x" || _loc4_ == "y")
               {
                  addTween(this._point,_loc4_,this._point[_loc4_],param2[_loc4_],_loc4_);
                  this.overwriteProps[this.overwriteProps.length] = _loc4_;
               }
               else if(_loc4_ == "scale")
               {
                  addTween(this._target,"scaleX",this._target.scaleX,param2.scale,"scaleX");
                  addTween(this._target,"scaleY",this._target.scaleY,param2.scale,"scaleY");
                  this.overwriteProps[this.overwriteProps.length] = "scaleX";
                  this.overwriteProps[this.overwriteProps.length] = "scaleY";
               }
               else
               {
                  addTween(this._target,_loc4_,this._target[_loc4_],param2[_loc4_],_loc4_);
                  this.overwriteProps[this.overwriteProps.length] = _loc4_;
               }
            }
         }
         if(param3 != null)
         {
            _loc7_ = param3.vars;
            if("x" in _loc7_ || "y" in _loc7_)
            {
               if("x" in _loc7_)
               {
                  _loc8_ = typeof _loc7_.x == "number" ? Number(_loc7_.x) : this._target.x + Number(_loc7_.x);
               }
               if("y" in _loc7_)
               {
                  _loc9_ = typeof _loc7_.y == "number" ? Number(_loc7_.y) : this._target.y + Number(_loc7_.y);
               }
               param3.killVars({
                  "x":true,
                  "y":true
               },false);
               this.changeFactor = 1;
               if(!isNaN(_loc8_))
               {
                  addTween(this._point,"x",this._point.x,this._point.x + (_loc8_ - this._target.x),"x");
               }
               if(!isNaN(_loc9_))
               {
                  addTween(this._point,"y",this._point.y,this._point.y + (_loc9_ - this._target.y),"y");
               }
               this.changeFactor = 0;
            }
         }
         return true;
      }
      
      override public function killProps(param1:Object) : void
      {
         if(this._shortRotation != null)
         {
            this._shortRotation.killProps(param1);
            if(this._shortRotation.overwriteProps.length == 0)
            {
               param1.shortRotation = true;
            }
         }
         super.killProps(param1);
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(this._target.method_1052)
         {
            _loc4_ = 0;
            if(this.round)
            {
               while(_loc4_--)
               {
                  _loc3_ = _tweens[_loc4_];
                  _loc5_ = _loc3_.start + _loc3_.change * param1;
                  _loc3_.target[_loc3_.property] = _loc5_ > 0 ? int(_loc5_ + 0.5) : int(_loc5_ - 0.5);
               }
               _loc2_ = this._target.method_1052.globalToLocal(this._target.method_990(this._local));
               _loc6_ = this._target.x + this._point.x - _loc2_.x;
               _loc7_ = this._target.y + this._point.y - _loc2_.y;
               this._target.x = _loc6_ > 0 ? int(_loc6_ + 0.5) : int(_loc6_ - 0.5);
               this._target.y = _loc7_ > 0 ? int(_loc7_ + 0.5) : int(_loc7_ - 0.5);
            }
            else
            {
               while(_loc4_--)
               {
                  _loc3_ = _tweens[_loc4_];
                  _loc3_.target[_loc3_.property] = _loc3_.start + _loc3_.change * param1;
               }
               _loc2_ = this._target.method_1052.globalToLocal(this._target.method_990(this._local));
               this._target.x += this._point.x - _loc2_.x;
               this._target.y += this._point.y - _loc2_.y;
            }
            _changeFactor = param1;
         }
      }
   }
}
