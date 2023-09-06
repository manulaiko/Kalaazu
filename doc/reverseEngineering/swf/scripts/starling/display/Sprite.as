package starling.display
{
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import starling.core.RenderSupport;
   import starling.events.Event;
   import starling.utils.MatrixUtil;
   import starling.utils.RectangleUtil;
   
   public class Sprite extends DisplayObjectContainer
   {
      
      private static var sHelperMatrix:Matrix = new Matrix();
      
      private static var sHelperPoint:Point = new Point();
      
      private static var sHelperRect:Rectangle = new Rectangle();
       
      
      private var mFlattenedContents:Vector.<QuadBatch>;
      
      private var mFlattenRequested:Boolean;
      
      private var mClipRect:Rectangle;
      
      public function Sprite()
      {
         super();
      }
      
      override public function dispose() : void
      {
         this.disposeFlattenedContents();
         super.dispose();
      }
      
      private function disposeFlattenedContents() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this.mFlattenedContents)
         {
            _loc1_ = 0;
            _loc2_ = this.mFlattenedContents.length;
            while(_loc1_ < _loc2_)
            {
               this.mFlattenedContents[_loc1_].dispose();
               _loc1_++;
            }
            this.mFlattenedContents = null;
         }
      }
      
      public function flatten() : void
      {
         this.mFlattenRequested = true;
         broadcastEventWith(Event.FLATTEN);
      }
      
      public function unflatten() : void
      {
         this.mFlattenRequested = false;
         this.disposeFlattenedContents();
      }
      
      public function get isFlattened() : Boolean
      {
         return this.mFlattenedContents != null || this.mFlattenRequested;
      }
      
      public function get clipRect() : Rectangle
      {
         return this.mClipRect;
      }
      
      public function set clipRect(param1:Rectangle) : void
      {
         if(Boolean(this.mClipRect) && Boolean(param1))
         {
            this.mClipRect.copyFrom(param1);
         }
         else
         {
            this.mClipRect = !!param1 ? param1.clone() : null;
         }
      }
      
      public function getClipRect(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc11_:* = null;
         if(this.mClipRect == null)
         {
            return null;
         }
         if(param2 == null)
         {
            param2 = new Rectangle();
         }
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         var _loc9_:Matrix = getTransformationMatrix(param1,sHelperMatrix);
         var _loc10_:int = 0;
         while(_loc10_ < 4)
         {
            switch(_loc10_)
            {
               case 0:
                  _loc3_ = this.mClipRect.left;
                  _loc4_ = this.mClipRect.top;
                  break;
               case 1:
                  _loc3_ = this.mClipRect.left;
                  _loc4_ = this.mClipRect.bottom;
                  break;
               case 2:
                  _loc3_ = this.mClipRect.right;
                  _loc4_ = this.mClipRect.top;
                  break;
               case 3:
                  _loc3_ = this.mClipRect.right;
                  _loc4_ = this.mClipRect.bottom;
                  break;
            }
            _loc11_ = MatrixUtil.transformCoords(_loc9_,_loc3_,_loc4_,sHelperPoint);
            if(_loc5_ > _loc11_.x)
            {
               _loc5_ = _loc11_.x;
            }
            if(_loc6_ < _loc11_.x)
            {
               _loc6_ = _loc11_.x;
            }
            if(_loc7_ > _loc11_.y)
            {
               _loc7_ = _loc11_.y;
            }
            if(_loc8_ < _loc11_.y)
            {
               _loc8_ = _loc11_.y;
            }
            _loc10_++;
         }
         param2.setTo(_loc5_,_loc7_,_loc6_ - _loc5_,_loc8_ - _loc7_);
         return param2;
      }
      
      override public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         var _loc3_:Rectangle = super.getBounds(param1,param2);
         if(this.mClipRect)
         {
            RectangleUtil.intersect(_loc3_,this.getClipRect(param1,sHelperRect),_loc3_);
         }
         return _loc3_;
      }
      
      override public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
      {
         if(this.mClipRect != null && !this.mClipRect.containsPoint(param1))
         {
            return null;
         }
         return super.hitTest(param1,param2);
      }
      
      override public function render(param1:RenderSupport, param2:Number) : void
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(this.mClipRect)
         {
            _loc3_ = param1.pushClipRect(this.getClipRect(stage,sHelperRect));
            if(_loc3_.isEmpty())
            {
               param1.popClipRect();
               return;
            }
         }
         if(Boolean(this.mFlattenedContents) || this.mFlattenRequested)
         {
            if(this.mFlattenedContents == null)
            {
               this.mFlattenedContents = new Vector.<QuadBatch>(0);
            }
            if(this.mFlattenRequested)
            {
               QuadBatch.compile(this,this.mFlattenedContents);
               param1.applyClipRect();
               this.mFlattenRequested = false;
            }
            _loc4_ = param2 * this.alpha;
            _loc5_ = this.mFlattenedContents.length;
            _loc6_ = param1.mvpMatrix;
            param1.finishQuadBatch();
            param1.raiseDrawCount(_loc5_);
            _loc7_ = 0;
            while(_loc7_ < _loc5_)
            {
               _loc9_ = (_loc8_ = this.mFlattenedContents[_loc7_]).blendMode == BlendMode.AUTO ? param1.blendMode : _loc8_.blendMode;
               _loc8_.renderCustom(_loc6_,_loc4_,_loc9_);
               _loc7_++;
            }
         }
         else
         {
            super.render(param1,param2);
         }
         if(this.mClipRect)
         {
            param1.popClipRect();
         }
      }
   }
}
