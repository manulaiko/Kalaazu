package com.greensock.plugins.IDisplayObject
{
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import net.bigpoint.darkorbit.mvc.display.class_1704;
   import net.bigpoint.darkorbit.mvc.display.class_1709;
   import package_102.class_1721;
   import package_282.class_1731;
   
   public class TransformAroundCenterPluginIDisplayObject extends TransformAroundPointPluginIDisplayObject
   {
      
      public static const API:Number = 1;
       
      
      public function TransformAroundCenterPluginIDisplayObject()
      {
         super();
         this.propName = "transformAroundCenterIDisplayObject";
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:TweenLite) : Boolean
      {
         var _loc8_:* = null;
         var _loc4_:Boolean = false;
         var _loc5_:class_1704;
         if((_loc5_ = param1 as class_1704).method_1052 == null)
         {
            _loc4_ = true;
            (_loc8_ = _loc5_ is DisplayObject ? new class_1721() : new class_1731()).addUntypedChild(_loc5_);
         }
         var _loc6_:Rectangle = _loc5_.method_2392(_loc5_.method_1052);
         param2.point = new Point(_loc6_.x + _loc6_.width * 0.5,_loc6_.y + _loc6_.height * 0.5);
         if(_loc4_)
         {
            _loc5_.method_1052.removeChild(_loc5_);
         }
         var _loc7_:Boolean = super.onInitTween(_loc5_,param2,param3);
         if(_loc6_.width < 1 || _loc6_.height < 1)
         {
            _loc6_ = _loc5_.method_2392(_loc5_);
            _local = new Point(_loc6_.x + _loc6_.width * 0.5,_loc6_.y + _loc6_.height * 0.5);
         }
         return _loc7_;
      }
   }
}
