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
   
   public class HSlider extends SliderBase
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public function HSlider()
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
         var _loc4_:Number = track.getLayoutBoundsWidth() - thumb.getLayoutBoundsWidth();
         return minimum + (_loc4_ != 0 ? param1 / _loc4_ * _loc3_ : 0);
      }
      
      override protected function updateSkinDisplayList() : void
      {
         if(!thumb || !track)
         {
            return;
         }
         var _loc1_:Number = track.getLayoutBoundsWidth() - thumb.getLayoutBoundsWidth();
         var _loc2_:Number = maximum - minimum;
         var _loc3_:Number = _loc2_ > 0 ? (pendingValue - minimum) / _loc2_ * _loc1_ : 0;
         var _loc4_:Point = track.localToGlobal(new Point(_loc3_,0));
         var _loc5_:Number = thumb.parent.globalToLocal(_loc4_).x;
         thumb.setLayoutBoundsPosition(Math.round(_loc5_),thumb.getLayoutBoundsY());
      }
      
      override protected function updateDataTip(param1:IDataRenderer, param2:Point) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc3_:DisplayObject = param1 as DisplayObject;
         if(Boolean(_loc3_) && Boolean(thumb))
         {
            _loc4_ = _loc3_.width;
            _loc5_ = thumb.getLayoutBoundsX() - (_loc4_ - thumb.getLayoutBoundsWidth()) / 2;
            if(layoutDirection == LayoutDirection.RTL)
            {
               _loc5_ += _loc3_.width;
            }
            _loc6_ = _loc3_.getBounds(_loc3_.parent);
            _loc7_ = PopUpUtil.positionOverComponent(thumb.parent,systemManager,_loc6_.width,_loc6_.height,NaN,null,new Point(_loc5_,param2.y));
            _loc7_ = _loc3_.parent.globalToLocal(systemManager.getSandboxRoot().localToGlobal(_loc7_));
            _loc3_.x = Math.floor(_loc7_.x);
            _loc3_.y = Math.floor(_loc7_.y);
         }
      }
   }
}
