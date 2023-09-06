package flashx.textLayout.elements
{
   import flash.geom.Rectangle;
   import flash.text.engine.TextLine;
   import flash.text.engine.TextRotation;
   import flashx.textLayout.formats.BlockProgression;
   import flashx.textLayout.tlf_internal;
   
   public final class TCYElement extends SubParagraphGroupElementBase
   {
       
      
      public function TCYElement()
      {
         super();
      }
      
      override tlf_internal function createContentElement() : void
      {
         super.tlf_internal::createContentElement();
         this.updateTCYRotation();
      }
      
      override protected function get abstract() : Boolean
      {
         return false;
      }
      
      override tlf_internal function get defaultTypeName() : String
      {
         return "tcy";
      }
      
      override tlf_internal function get precedence() : uint
      {
         return 100;
      }
      
      override tlf_internal function mergeToPreviousIfPossible() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(Boolean(parent) && !tlf_internal::bindableElement)
         {
            _loc1_ = parent.getChildIndex(this);
            if(_loc1_ != 0)
            {
               _loc2_ = parent.getChildAt(_loc1_ - 1) as TCYElement;
               if(_loc2_)
               {
                  while(this.numChildren > 0)
                  {
                     _loc3_ = this.getChildAt(0);
                     replaceChildren(0,1);
                     _loc2_.replaceChildren(_loc2_.numChildren,_loc2_.numChildren,_loc3_);
                  }
                  parent.replaceChildren(_loc1_,_loc1_ + 1);
                  return true;
               }
            }
         }
         return false;
      }
      
      override tlf_internal function acceptTextBefore() : Boolean
      {
         return false;
      }
      
      override tlf_internal function setParentAndRelativeStart(param1:FlowGroupElement, param2:int) : void
      {
         super.tlf_internal::setParentAndRelativeStart(param1,param2);
         this.updateTCYRotation();
      }
      
      override tlf_internal function formatChanged(param1:Boolean = true) : void
      {
         super.tlf_internal::formatChanged(param1);
         this.updateTCYRotation();
      }
      
      tlf_internal function calculateAdornmentBounds(param1:SubParagraphGroupElementBase, param2:TextLine, param3:String, param4:Rectangle) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc5_:int = 0;
         while(_loc5_ < param1.numChildren)
         {
            if(!(_loc7_ = (_loc6_ = param1.getChildAt(_loc5_) as FlowElement) as FlowLeafElement) && _loc6_ is SubParagraphGroupElementBase)
            {
               this.tlf_internal::calculateAdornmentBounds(_loc6_ as SubParagraphGroupElementBase,param2,param3,param4);
               _loc5_++;
            }
            else
            {
               _loc8_ = null;
               if(!(_loc7_ is InlineGraphicElement))
               {
                  _loc8_ = _loc7_.tlf_internal::getSpanBoundsOnLine(param2,param3)[0];
               }
               else
               {
                  _loc8_ = (_loc7_ as InlineGraphicElement).graphic.getBounds(param2);
               }
               if(_loc5_ != 0)
               {
                  if(_loc8_.top < param4.top)
                  {
                     param4.top = _loc8_.top;
                  }
                  if(_loc8_.bottom > param4.bottom)
                  {
                     param4.bottom = _loc8_.bottom;
                  }
                  if(param4.x > _loc8_.x)
                  {
                     param4.x = _loc8_.x;
                  }
               }
               else
               {
                  param4.top = _loc8_.top;
                  param4.bottom = _loc8_.bottom;
                  param4.x = _loc8_.x;
               }
               _loc5_++;
            }
         }
      }
      
      private function updateTCYRotation() : void
      {
         var _loc1_:ContainerFormattedElement = tlf_internal::getAncestorWithContainer();
         if(tlf_internal::groupElement)
         {
            tlf_internal::groupElement.textRotation = Boolean(_loc1_) && _loc1_.computedFormat.blockProgression == BlockProgression.RL ? "null" : TextRotation.ROTATE_0;
         }
      }
   }
}
