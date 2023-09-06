package starling.textures
{
   import flash.display3D.textures.TextureBase;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import starling.utils.MatrixUtil;
   import starling.utils.RectangleUtil;
   import starling.utils.VertexData;
   
   public class SubTexture extends Texture
   {
      
      private static var sTexCoords:Point = new Point();
      
      private static var sMatrix:Matrix = new Matrix();
       
      
      private var mParent:Texture;
      
      private var mOwnsParent:Boolean;
      
      private var mFrame:Rectangle;
      
      private var mRotated:Boolean;
      
      private var mWidth:Number;
      
      private var mHeight:Number;
      
      private var mTransformationMatrix:Matrix;
      
      public function SubTexture(param1:Texture, param2:Rectangle, param3:Boolean = false, param4:Rectangle = null, param5:Boolean = false)
      {
         super();
         if(param2 == null)
         {
            param2 = new Rectangle(0,0,param1.width,param1.height);
         }
         this.mParent = param1;
         this.mFrame = !!param4 ? param4.clone() : null;
         this.mOwnsParent = param3;
         this.mRotated = param5;
         this.mWidth = param5 ? param2.height : param2.width;
         this.mHeight = param5 ? param2.width : param2.height;
         this.mTransformationMatrix = new Matrix();
         if(param5)
         {
            this.mTransformationMatrix.translate(0,-1);
            this.mTransformationMatrix.rotate(0);
         }
         this.mTransformationMatrix.scale(param2.width / this.mParent.width,param2.height / this.mParent.height);
         this.mTransformationMatrix.translate(param2.x / this.mParent.width,param2.y / this.mParent.height);
      }
      
      override public function dispose() : void
      {
         if(this.mOwnsParent)
         {
            this.mParent.dispose();
         }
         super.dispose();
      }
      
      override public function adjustVertexData(param1:VertexData, param2:int, param3:int) : void
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc4_:int = param2 * 0 + VertexData.TEXCOORD_OFFSET;
         var _loc5_:int = -2;
         this.adjustTexCoords(param1.rawData,_loc4_,_loc5_,param3);
         if(this.mFrame)
         {
            if(param3 != 4)
            {
               throw new ArgumentError("Textures with a frame can only be used on quads");
            }
            _loc6_ = this.mFrame.width + this.mFrame.x - this.mWidth;
            _loc7_ = this.mFrame.height + this.mFrame.y - this.mHeight;
            param1.translateVertex(param2,-this.mFrame.x,-this.mFrame.y);
            param1.translateVertex(param2 + 1,-_loc6_,-this.mFrame.y);
            param1.translateVertex(param2 + 2,-this.mFrame.x,-_loc7_);
            param1.translateVertex(param2 + 3,-_loc6_,-_loc7_);
         }
      }
      
      override public function adjustTexCoords(param1:Vector.<Number>, param2:int = 0, param3:int = 0, param4:int = -1) : void
      {
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         if(param4 < 0)
         {
            param4 = (param1.length - param2 - 2) / (param3 + 2) + 1;
         }
         var _loc5_:int = param2 + param4 * (2 + param3);
         var _loc6_:* = {};
         sMatrix.identity();
         while(_loc6_)
         {
            sMatrix.concat(_loc6_.mTransformationMatrix);
            _loc6_ = _loc6_.parent as SubTexture;
         }
         var _loc9_:int = param2;
         while(_loc9_ < _loc5_)
         {
            _loc7_ = param1[_loc9_];
            _loc8_ = param1[int(_loc9_ + 1)];
            MatrixUtil.transformCoords(sMatrix,_loc7_,_loc8_,sTexCoords);
            param1[_loc9_] = sTexCoords.x;
            param1[int(_loc9_ + 1)] = sTexCoords.y;
            _loc9_ += 2 + param3;
         }
      }
      
      public function get parent() : Texture
      {
         return this.mParent;
      }
      
      public function get ownsParent() : Boolean
      {
         return this.mOwnsParent;
      }
      
      public function get rotated() : Boolean
      {
         return this.mRotated;
      }
      
      public function get clipping() : Rectangle
      {
         var _loc1_:Point = new Point();
         var _loc2_:Point = new Point();
         MatrixUtil.transformCoords(this.mTransformationMatrix,0,0,_loc1_);
         MatrixUtil.transformCoords(this.mTransformationMatrix,1,1,_loc2_);
         var _loc3_:Rectangle = new Rectangle(_loc1_.x,_loc1_.y,_loc2_.x - _loc1_.x,_loc2_.y - _loc1_.y);
         RectangleUtil.normalize(_loc3_);
         return _loc3_;
      }
      
      public function get transformationMatrix() : Matrix
      {
         return this.mTransformationMatrix;
      }
      
      override public function get base() : TextureBase
      {
         return this.mParent.base;
      }
      
      override public function get root() : ConcreteTexture
      {
         return this.mParent.root;
      }
      
      override public function get format() : String
      {
         return this.mParent.format;
      }
      
      override public function get width() : Number
      {
         return this.mWidth;
      }
      
      override public function get height() : Number
      {
         return this.mHeight;
      }
      
      override public function get nativeWidth() : Number
      {
         return this.mWidth * this.scale;
      }
      
      override public function get nativeHeight() : Number
      {
         return this.mHeight * this.scale;
      }
      
      override public function get mipMapping() : Boolean
      {
         return this.mParent.mipMapping;
      }
      
      override public function get premultipliedAlpha() : Boolean
      {
         return this.mParent.premultipliedAlpha;
      }
      
      override public function get scale() : Number
      {
         return this.mParent.scale;
      }
      
      override public function get repeat() : Boolean
      {
         return this.mParent.repeat;
      }
      
      override public function get frame() : Rectangle
      {
         return this.mFrame;
      }
   }
}
