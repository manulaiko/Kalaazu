package net.bigpoint.darkorbit.fui.components.core.layout
{
   import flash.display.DisplayObjectContainer;
   import net.bigpoint.darkorbit.fui.components.core.Coreponent;
   import net.bigpoint.darkorbit.fui.components.core.IContainer;
   import net.bigpoint.darkorbit.fui.components.core.ICoreponent;
   import net.bigpoint.darkorbit.fui.components.core.InvalidationType;
   
   public class VerticalLayout extends AbstractAlignmentLayout implements ILayout
   {
       
      
      public function VerticalLayout()
      {
         super();
      }
      
      public function execute(param1:DisplayObjectContainer = null) : void
      {
         this.container = param1;
         initChildrenMapping();
         prefilterAndAlignmentActivator(this.alignmentActivator);
         this.calculateChildrenSizes();
         this.drawLayout();
      }
      
      protected function alignmentActivator(param1:Coreponent) : void
      {
         param1.setAlignmentActivation(Alignment.ACIVATE_HORIZONTAL,true);
         param1.setAlignmentActivation(Alignment.ACIVATE_VERTICAL,false);
      }
      
      protected function calculateChildrenSizes() : void
      {
         var _loc1_:Number = 0;
         var _loc3_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc7_:Number = NaN;
         childCount = allChildren.length;
         var _loc2_:Number = 0;
         var _loc4_:IContainer;
         if(_loc4_ = container as IContainer)
         {
            _loc5_ = Number((container as IContainer).getCalculatedHeight());
         }
         else
         {
            _loc5_ = 0;
         }
         var _loc6_:*;
         if((_loc6_ = childCount - 1) < 0)
         {
            _loc6_ = 0;
            remainingSize = _loc5_;
         }
         else
         {
            _loc7_ = _loc6_ * this.gap;
            remainingSize = _loc5_ - _loc7_;
         }
         _loc1_ = 0;
         _loc3_ = 0;
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ += absoluteChildren[_loc2_].height;
            _loc2_++;
         }
         remainingSizeAfterAbsolute = remainingSize - _loc3_;
         _loc3_ = 0;
         _loc1_ = 0;
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ += (relativeChildren[_loc2_] as ICoreponent).relativeHeight * remainingSizeAfterAbsolute;
            _loc2_++;
         }
         remainingSizeAfterRelative = remainingSizeAfterAbsolute - _loc3_;
         var _loc8_:Number;
         if((_loc8_ = 0) > 0 && remainingSizeAfterRelative > 0)
         {
            fillElementSize = remainingSizeAfterRelative / _loc8_;
         }
      }
      
      protected function drawLayout() : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc1_:Number = 0;
         var _loc3_:int = 0;
         for(; _loc3_ < childCount; _loc1_ += !!_loc2_ ? _loc2_.marginTop : 0,child.y = _loc1_,_loc1_ += child.height,_loc1_ += _gap,_loc1_ += !!_loc2_ ? _loc2_.marginBottom : 0,_loc3_++)
         {
            child = allChildren[_loc3_];
            _loc2_ = child as ICoreponent;
            if(!_loc2_)
            {
               continue;
            }
            _loc4_ = getSizeTypeRelatedChildrenVector(_loc2_).shift() as ICoreponent;
            switch(_loc4_.sizeHandling)
            {
               case Coreponent.SIZE_RELATIVE:
                  _loc5_ = _loc4_.relativeHeight * remainingSizeAfterAbsolute;
                  _loc4_.height = _loc5_;
                  _loc2_.invalidate(InvalidationType.SIZE);
                  break;
               case Coreponent.SIZE_FILL:
                  _loc4_.height = fillElementSize;
                  _loc2_.invalidate(InvalidationType.SIZE);
                  break;
            }
         }
      }
   }
}
