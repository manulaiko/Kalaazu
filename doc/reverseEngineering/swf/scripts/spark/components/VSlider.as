package spark.components
{
   import flash.display.DisplayObject;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.core.IDataRenderer;
   import mx.core.LayoutDirection;
   import mx.core.mx_internal;
   import mx.utils.PopUpUtil;
   import spark.components.supportClasses.SliderBase;
   
   public class VSlider extends SliderBase
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public function VSlider()
      {
         super();
      }
      
      override protected function pointToValue(param1:Number, param2:Number) : Number
      {
         if(!thumb || !track)
         {
            return 0;
         }
         var _loc3_:Number = maximum - minimum;
         var _loc4_:Number = track.getLayoutBoundsHeight() - thumb.getLayoutBoundsHeight();
         return minimum + (_loc4_ != 0 ? (_loc4_ - param2) / _loc4_ * _loc3_ : 0);
      }
      
      override protected function updateSkinDisplayList() : void
      {
         if(!thumb || !track)
         {
            return;
         }
         var _loc1_:Number = track.getLayoutBoundsHeight() - thumb.getLayoutBoundsHeight();
         var _loc2_:Number = maximum - minimum;
         var _loc3_:Number = _loc2_ > 0 ? _loc1_ - (pendingValue - minimum) / _loc2_ * _loc1_ : 0;
         var _loc4_:Point = track.localToGlobal(new Point(0,_loc3_));
         var _loc5_:Number = thumb.parent.globalToLocal(_loc4_).y;
         thumb.setLayoutBoundsPosition(thumb.getLayoutBoundsX(),Math.round(_loc5_));
      }
      
      override protected function updateDataTip(param1:IDataRenderer, param2:Point) : void
      {
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:* = null;
         var _loc3_:DisplayObject = param1 as DisplayObject;
         if(Boolean(_loc3_) && Boolean(thumb))
         {
            _loc4_ = _loc3_.getBounds(_loc3_.parent);
            _loc5_ = thumb.getLayoutBoundsY() + (thumb.getLayoutBoundsHeight() - _loc3_.height) / 2;
            _loc6_ = layoutDirection == LayoutDirection.RTL ? param2.x + _loc4_.width : param2.x;
            _loc7_ = PopUpUtil.positionOverComponent(thumb.parent,systemManager,_loc4_.width,_loc4_.height,NaN,null,new Point(_loc6_,_loc5_));
            _loc7_ = _loc3_.parent.globalToLocal(systemManager.getSandboxRoot().localToGlobal(_loc7_));
            _loc3_.x = Math.floor(_loc7_.x);
            _loc3_.y = Math.floor(_loc7_.y);
         }
      }
   }
}
