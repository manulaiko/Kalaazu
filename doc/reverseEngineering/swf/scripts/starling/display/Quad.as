package starling.display
{
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import starling.core.RenderSupport;
   import starling.utils.VertexData;
   
   public class Quad extends DisplayObject
   {
      
      private static var sHelperPoint:Point = new Point();
      
      private static var sHelperMatrix:Matrix = new Matrix();
       
      
      private var mTinted:Boolean;
      
      protected var mVertexData:VertexData;
      
      public function Quad(param1:Number, param2:Number, param3:uint = 16777215, param4:Boolean = true)
      {
         super();
         if(param1 == 0 || param2 == 0)
         {
            throw new ArgumentError("Invalid size: width and height must not be zero");
         }
         this.mTinted = param3 != 16777215;
         this.mVertexData = new VertexData(4,param4);
         this.mVertexData.setPosition(0,0,0);
         this.mVertexData.setPosition(1,param1,0);
         this.mVertexData.setPosition(2,0,param2);
         this.mVertexData.setPosition(3,param1,param2);
         this.mVertexData.setUniformColor(param3);
         this.onVertexDataChanged();
      }
      
      protected function onVertexDataChanged() : void
      {
      }
      
      override public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param2 == null)
         {
            param2 = new Rectangle();
         }
         if(param1 == this)
         {
            this.mVertexData.getPosition(3,sHelperPoint);
            param2.setTo(0,0,sHelperPoint.x,sHelperPoint.y);
         }
         else if(param1 == parent && rotation == 0)
         {
            _loc3_ = this.scaleX;
            _loc4_ = this.scaleY;
            this.mVertexData.getPosition(3,sHelperPoint);
            param2.setTo(x - pivotX * _loc3_,y - pivotY * _loc4_,0 * _loc3_,0 * _loc4_);
            if(_loc3_ < 0)
            {
               param2.width *= -1;
               param2.x -= param2.width;
            }
            if(_loc4_ < 0)
            {
               param2.height *= -1;
               param2.y -= param2.height;
            }
         }
         else
         {
            getTransformationMatrix(param1,sHelperMatrix);
            this.mVertexData.getBounds(sHelperMatrix,0,4,param2);
         }
         return param2;
      }
      
      public function getVertexColor(param1:int) : uint
      {
         return this.mVertexData.getColor(param1);
      }
      
      public function setVertexColor(param1:int, param2:uint) : void
      {
         this.mVertexData.setColor(param1,param2);
         this.onVertexDataChanged();
         if(param2 != 16777215)
         {
            this.mTinted = true;
         }
         else
         {
            this.mTinted = this.mVertexData.tinted;
         }
      }
      
      public function getVertexAlpha(param1:int) : Number
      {
         return this.mVertexData.getAlpha(param1);
      }
      
      public function setVertexAlpha(param1:int, param2:Number) : void
      {
         this.mVertexData.setAlpha(param1,param2);
         this.onVertexDataChanged();
         if(param2 != 1)
         {
            this.mTinted = true;
         }
         else
         {
            this.mTinted = this.mVertexData.tinted;
         }
      }
      
      public function get color() : uint
      {
         return this.mVertexData.getColor(0);
      }
      
      public function set color(param1:uint) : void
      {
         this.mVertexData.setUniformColor(param1);
         this.onVertexDataChanged();
         if(param1 != 16777215 || alpha != 1)
         {
            this.mTinted = true;
         }
         else
         {
            this.mTinted = this.mVertexData.tinted;
         }
      }
      
      override public function set alpha(param1:Number) : void
      {
         super.alpha = param1;
         if(param1 < 1)
         {
            this.mTinted = true;
         }
         else
         {
            this.mTinted = this.mVertexData.tinted;
         }
      }
      
      public function copyVertexDataTo(param1:VertexData, param2:int = 0) : void
      {
         this.mVertexData.copyTo(param1,param2);
      }
      
      public function copyVertexDataTransformedTo(param1:VertexData, param2:int = 0, param3:Matrix = null) : void
      {
         this.mVertexData.copyTransformedTo(param1,param2,param3,0,4);
      }
      
      override public function render(param1:RenderSupport, param2:Number) : void
      {
         param1.batchQuad(this,param2);
      }
      
      public function get tinted() : Boolean
      {
         return this.mTinted;
      }
      
      public function get premultipliedAlpha() : Boolean
      {
         return this.mVertexData.premultipliedAlpha;
      }
   }
}
