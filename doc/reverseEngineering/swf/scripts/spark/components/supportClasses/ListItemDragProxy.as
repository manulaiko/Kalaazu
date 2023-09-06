package spark.components.supportClasses
{
   import flash.geom.PerspectiveProjection;
   import flash.geom.Rectangle;
   import mx.core.IFactory;
   import mx.core.IVisualElement;
   import mx.core.mx_internal;
   import mx.utils.MatrixUtil;
   import spark.components.DataGroup;
   import spark.components.Group;
   import spark.components.IItemRenderer;
   import spark.components.List;
   
   public class ListItemDragProxy extends Group
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static var elementBounds:Rectangle;
       
      
      public function ListItemDragProxy()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         super.createChildren();
         var _loc1_:List = owner as List;
         if(!_loc1_)
         {
            return;
         }
         var _loc2_:DataGroup = _loc1_.dataGroup;
         if(!_loc2_)
         {
            return;
         }
         this.styleName = _loc1_;
         width = _loc2_.width;
         height = _loc2_.height;
         var _loc3_:Vector.<int> = _loc1_.selectedIndices;
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:Rectangle;
         if(_loc6_ = _loc2_.scrollRect)
         {
            _loc4_ = _loc6_.x;
            _loc5_ = _loc6_.y;
         }
         var _loc7_:PerspectiveProjection = _loc2_.transform.perspectiveProjection;
         var _loc8_:Boolean = false;
         var _loc9_:int = _loc3_.length;
         var _loc10_:int = 0;
         for(; _loc10_ < _loc9_; _loc10_++)
         {
            if(!(!(_loc11_ = _loc2_.getElementAt(_loc3_[_loc10_])) || !(_loc11_ is IItemRenderer)))
            {
               if(_loc11_.is3D)
               {
                  _loc8_ = true;
               }
               if(_loc6_)
               {
                  if(_loc11_.hasLayoutMatrix3D)
                  {
                     _loc13_ = new Rectangle(0,0,_loc11_.getLayoutBoundsWidth(false),_loc11_.getLayoutBoundsHeight(false));
                     _loc13_ = MatrixUtil.projectBounds(_loc13_,_loc11_.getLayoutMatrix3D(),_loc7_);
                  }
                  else
                  {
                     _loc13_ = this.getElementBounds(_loc11_);
                  }
                  if(!_loc6_.containsRect(_loc13_) && !_loc6_.intersects(_loc13_))
                  {
                     continue;
                  }
               }
               (_loc12_ = this.cloneItemRenderer(IItemRenderer(_loc11_),_loc1_)).width = _loc11_.width;
               _loc12_.height = _loc11_.height;
               if(_loc11_.hasLayoutMatrix3D)
               {
                  _loc12_.setLayoutMatrix3D(_loc11_.getLayoutMatrix3D(),false);
               }
               else
               {
                  _loc12_.setLayoutMatrix(_loc11_.getLayoutMatrix(),false);
               }
               _loc12_.x -= _loc4_;
               _loc12_.y -= _loc5_;
               _loc12_.depth = _loc11_.depth;
               _loc12_.visible = _loc11_.visible;
               if(_loc11_.postLayoutTransformOffsets)
               {
                  _loc12_.postLayoutTransformOffsets = _loc11_.postLayoutTransformOffsets;
               }
               _loc12_.dragging = true;
               addElement(_loc12_);
            }
         }
         if(_loc8_)
         {
            this.transform.perspectiveProjection = _loc7_;
         }
      }
      
      private function getElementBounds(param1:IVisualElement) : Rectangle
      {
         if(!elementBounds)
         {
            elementBounds = new Rectangle();
         }
         elementBounds.x = param1.getLayoutBoundsX();
         elementBounds.y = param1.getLayoutBoundsY();
         elementBounds.width = param1.getLayoutBoundsWidth();
         elementBounds.height = param1.getLayoutBoundsHeight();
         return elementBounds;
      }
      
      private function cloneItemRenderer(param1:IItemRenderer, param2:List) : IItemRenderer
      {
         var _loc3_:* = null;
         var _loc4_:Function = param2.itemRendererFunction;
         var _loc5_:Object = param1.data;
         if(_loc4_ != null)
         {
            _loc3_ = _loc4_(_loc5_);
         }
         if(!_loc3_)
         {
            _loc3_ = param2.itemRenderer;
         }
         var _loc6_:IItemRenderer;
         if(!(_loc6_ = _loc3_.newInstance()))
         {
            return null;
         }
         param2.updateRenderer(_loc6_,param1.itemIndex,_loc5_);
         return _loc6_;
      }
   }
}
