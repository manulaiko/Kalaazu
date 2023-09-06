package starling.display
{
   import flash.display3D.Context3D;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Context3DTextureFormat;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.display3D.IndexBuffer3D;
   import flash.display3D.Program3D;
   import flash.display3D.VertexBuffer3D;
   import flash.geom.Matrix;
   import flash.geom.Matrix3D;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import starling.core.RenderSupport;
   import starling.core.Starling;
   import starling.core.starling_internal;
   import starling.errors.MissingContextError;
   import starling.events.Event;
   import starling.filters.FragmentFilter;
   import starling.filters.FragmentFilterMode;
   import starling.textures.Texture;
   import starling.textures.TextureSmoothing;
   import starling.utils.MatrixUtil;
   import starling.utils.VertexData;
   
   public class QuadBatch extends DisplayObject
   {
      
      public static const MAX_NUM_QUADS:int = 16383;
      
      private static const QUAD_PROGRAM_NAME:String = "QB_q";
      
      private static var sHelperMatrix:Matrix = new Matrix();
      
      private static var sRenderAlpha:Vector.<Number> = new <Number>[1,1,1,1];
      
      private static var sRenderMatrix:Matrix3D = new Matrix3D();
      
      private static var sProgramNameCache:Dictionary = new Dictionary();
       
      
      private var mNumQuads:int;
      
      private var mSyncRequired:Boolean;
      
      private var mBatchable:Boolean;
      
      private var mTinted:Boolean;
      
      private var mTexture:Texture;
      
      private var mSmoothing:String;
      
      private var mVertexBuffer:VertexBuffer3D;
      
      private var mIndexData:Vector.<uint>;
      
      private var mIndexBuffer:IndexBuffer3D;
      
      protected var mVertexData:VertexData;
      
      public function QuadBatch()
      {
         super();
         this.mVertexData = new VertexData(0,true);
         this.mIndexData = new Vector.<uint>(0);
         this.mNumQuads = 0;
         this.mTinted = false;
         this.mSyncRequired = false;
         this.mBatchable = false;
         Starling.current.stage3D.addEventListener(Event.CONTEXT3D_CREATE,this.onContextCreated,false,0,true);
      }
      
      public static function compile(param1:DisplayObject, param2:Vector.<QuadBatch>) : void
      {
         compileObject(param1,param2,-1,new Matrix());
      }
      
      private static function compileObject(param1:DisplayObject, param2:Vector.<QuadBatch>, param3:int, param4:Matrix, param5:Number = 1, param6:String = null, param7:Boolean = false) : int
      {
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc16_:int = 0;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:Boolean = false;
         var _loc23_:int = 0;
         var _loc24_:* = null;
         var _loc10_:Boolean = false;
         var _loc11_:Number = param1.alpha;
         var _loc12_:DisplayObjectContainer = param1 as DisplayObjectContainer;
         var _loc13_:Quad = param1 as Quad;
         var _loc14_:QuadBatch = param1 as QuadBatch;
         var _loc15_:FragmentFilter = param1.filter;
         if(param3 == -1)
         {
            _loc10_ = true;
            param3 = 0;
            _loc11_ = 1;
            param6 = param1.blendMode;
            param7 = true;
            if(param2.length == 0)
            {
               param2.push(new QuadBatch());
            }
            else
            {
               param2[0].reset();
            }
         }
         if(Boolean(_loc15_) && !param7)
         {
            if(_loc15_.mode == FragmentFilterMode.ABOVE)
            {
               param3 = compileObject(param1,param2,param3,param4,param5,param6,true);
            }
            param3 = compileObject(_loc15_.starling_internal::compile(param1),param2,param3,param4,param5,param6);
            if(_loc15_.mode == FragmentFilterMode.BELOW)
            {
               param3 = compileObject(param1,param2,param3,param4,param5,param6,true);
            }
         }
         else if(_loc12_)
         {
            _loc16_ = _loc12_.numChildren;
            _loc17_ = new Matrix();
            _loc8_ = 0;
            while(_loc8_ < _loc16_)
            {
               if((_loc18_ = _loc12_.getChildAt(_loc8_)).hasVisibleArea)
               {
                  _loc19_ = _loc18_.blendMode == BlendMode.AUTO ? param6 : _loc18_.blendMode;
                  _loc17_.copyFrom(param4);
                  RenderSupport.transformMatrixForObject(_loc17_,_loc18_);
                  param3 = compileObject(_loc18_,param2,param3,_loc17_,param5 * _loc11_,_loc19_);
               }
               _loc8_++;
            }
         }
         else
         {
            if(!(Boolean(_loc13_) || Boolean(_loc14_)))
            {
               throw new Error("Unsupported display object: " + getQualifiedClassName(param1));
            }
            if(_loc13_)
            {
               _loc20_ = !!(_loc24_ = _loc13_ as Image) ? _loc24_.texture : null;
               _loc21_ = !!_loc24_ ? _loc24_.smoothing : null;
               _loc22_ = _loc13_.tinted;
               _loc23_ = 1;
            }
            else
            {
               _loc20_ = _loc14_.mTexture;
               _loc21_ = _loc14_.mSmoothing;
               _loc22_ = _loc14_.mTinted;
               _loc23_ = _loc14_.mNumQuads;
            }
            if((_loc9_ = param2[param3]).isStateChange(_loc22_,param5 * _loc11_,_loc20_,_loc21_,param6,_loc23_))
            {
               param3++;
               if(param2.length <= param3)
               {
                  param2.push(new QuadBatch());
               }
               (_loc9_ = param2[param3]).reset();
            }
            if(_loc13_)
            {
               _loc9_.addQuad(_loc13_,param5,_loc20_,_loc21_,param4,param6);
            }
            else
            {
               _loc9_.addQuadBatch(_loc14_,param5,param4,param6);
            }
         }
         if(_loc10_)
         {
            _loc8_ = param2.length - 1;
            while(_loc8_ > param3)
            {
               param2.pop().dispose();
               _loc8_--;
            }
         }
         return param3;
      }
      
      private static function getImageProgramName(param1:Boolean, param2:Boolean = true, param3:Boolean = false, param4:String = "bgra", param5:String = "bilinear") : String
      {
         var _loc6_:* = 0;
         if(param1)
         {
            _loc6_ |= 1;
         }
         if(param2)
         {
            _loc6_ |= 2;
         }
         if(param3)
         {
            _loc6_ |= 4;
         }
         if(param5 == TextureSmoothing.NONE)
         {
            _loc6_ |= 8;
         }
         else if(param5 == TextureSmoothing.TRILINEAR)
         {
            _loc6_ |= 16;
         }
         if(param4 == Context3DTextureFormat.COMPRESSED)
         {
            _loc6_ |= 32;
         }
         else if(param4 == "compressedAlpha")
         {
            _loc6_ |= 64;
         }
         var _loc7_:String;
         if((_loc7_ = "null") == null)
         {
            _loc7_ = "QB_i." + _loc6_.toString(16);
            sProgramNameCache[_loc6_] = _loc7_;
         }
         return _loc7_;
      }
      
      override public function dispose() : void
      {
         Starling.current.stage3D.removeEventListener(Event.CONTEXT3D_CREATE,this.onContextCreated);
         this.destroyBuffers();
         this.mVertexData.numVertices = 0;
         this.mIndexData.length = 0;
         this.mNumQuads = 0;
         super.dispose();
      }
      
      private function onContextCreated(param1:Object) : void
      {
         this.createBuffers();
      }
      
      protected function onVertexDataChanged() : void
      {
         this.mSyncRequired = true;
      }
      
      public function clone() : QuadBatch
      {
         var _loc1_:QuadBatch = new QuadBatch();
         _loc1_.mVertexData = this.mVertexData.clone(0,this.mNumQuads * 4);
         _loc1_.mIndexData = this.mIndexData.slice(0,this.mNumQuads * 6);
         _loc1_.mNumQuads = this.mNumQuads;
         _loc1_.mTinted = this.mTinted;
         _loc1_.mTexture = this.mTexture;
         _loc1_.mSmoothing = this.mSmoothing;
         _loc1_.mSyncRequired = true;
         _loc1_.blendMode = blendMode;
         _loc1_.alpha = alpha;
         return _loc1_;
      }
      
      private function expand() : void
      {
         var _loc1_:int = this.capacity;
         this.capacity = _loc1_ < 8 ? 16 : _loc1_ * 2;
      }
      
      private function createBuffers() : void
      {
         this.destroyBuffers();
         var _loc1_:int = this.mVertexData.numVertices;
         var _loc2_:int = this.mIndexData.length;
         var _loc3_:Context3D = Starling.context;
         if(_loc1_ == 0)
         {
            return;
         }
         if(_loc3_ == null)
         {
            throw new MissingContextError();
         }
         this.mVertexBuffer = _loc3_.createVertexBuffer(_loc1_,VertexData.ELEMENTS_PER_VERTEX);
         this.mVertexBuffer.uploadFromVector(this.mVertexData.rawData,0,_loc1_);
         this.mIndexBuffer = _loc3_.createIndexBuffer(_loc2_);
         this.mIndexBuffer.uploadFromVector(this.mIndexData,0,_loc2_);
         this.mSyncRequired = false;
      }
      
      private function destroyBuffers() : void
      {
         if(this.mVertexBuffer)
         {
            this.mVertexBuffer.dispose();
            this.mVertexBuffer = null;
         }
         if(this.mIndexBuffer)
         {
            this.mIndexBuffer.dispose();
            this.mIndexBuffer = null;
         }
      }
      
      private function syncBuffers() : void
      {
         if(this.mVertexBuffer == null)
         {
            this.createBuffers();
         }
         else
         {
            this.mVertexBuffer.uploadFromVector(this.mVertexData.rawData,0,this.mVertexData.numVertices);
            this.mSyncRequired = false;
         }
      }
      
      public function renderCustom(param1:Matrix, param2:Number = 1, param3:String = null) : void
      {
         if(this.mNumQuads == 0)
         {
            return;
         }
         if(this.mSyncRequired)
         {
            this.syncBuffers();
         }
         var _loc4_:Boolean = this.mVertexData.premultipliedAlpha;
         var _loc5_:Context3D = Starling.context;
         var _loc6_:Boolean = this.mTinted || param2 != 1;
         sRenderAlpha[0] = sRenderAlpha[1] = sRenderAlpha[2] = _loc4_ ? param2 : 1;
         sRenderAlpha[3] = param2;
         MatrixUtil.convertTo3D(param1,sRenderMatrix);
         RenderSupport.setBlendFactors(_loc4_,!!param3 ? param3 : this.blendMode);
         _loc5_.setProgram(this.getProgram(_loc6_));
         _loc5_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,0,sRenderAlpha,1);
         _loc5_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,1,sRenderMatrix,true);
         _loc5_.setVertexBufferAt(0,this.mVertexBuffer,VertexData.POSITION_OFFSET,Context3DVertexBufferFormat.FLOAT_2);
         if(this.mTexture == null || _loc6_)
         {
            _loc5_.setVertexBufferAt(1,this.mVertexBuffer,VertexData.COLOR_OFFSET,Context3DVertexBufferFormat.FLOAT_4);
         }
         if(this.mTexture)
         {
            _loc5_.setTextureAt(0,this.mTexture.base);
            _loc5_.setVertexBufferAt(2,this.mVertexBuffer,VertexData.TEXCOORD_OFFSET,Context3DVertexBufferFormat.FLOAT_2);
         }
         _loc5_.drawTriangles(this.mIndexBuffer,0,this.mNumQuads * 2);
         if(this.mTexture)
         {
            _loc5_.setTextureAt(0,null);
            _loc5_.setVertexBufferAt(2,null);
         }
         _loc5_.setVertexBufferAt(1,null);
         _loc5_.setVertexBufferAt(0,null);
      }
      
      public function reset() : void
      {
         this.mNumQuads = 0;
         this.mTexture = null;
         this.mSmoothing = null;
         this.mSyncRequired = true;
      }
      
      public function addImage(param1:Image, param2:Number = 1, param3:Matrix = null, param4:String = null) : void
      {
         this.addQuad(param1,param2,param1.texture,param1.smoothing,param3,param4);
      }
      
      public function addQuad(param1:Quad, param2:Number = 1, param3:Texture = null, param4:String = null, param5:Matrix = null, param6:String = null) : void
      {
         if(param5 == null)
         {
            param5 = param1.transformationMatrix;
         }
         var _loc7_:Number = param2 * param1.alpha;
         var _loc8_:int = this.mNumQuads * 4;
         if(this.mNumQuads + 1 > this.mVertexData.numVertices / 4)
         {
            this.expand();
         }
         if(this.mNumQuads == 0)
         {
            this.blendMode = !!param6 ? param6 : param1.blendMode;
            this.mTexture = param3;
            this.mTinted = !!param3 ? param1.tinted || param2 != 1 : false;
            this.mSmoothing = param4;
            this.mVertexData.setPremultipliedAlpha(param1.premultipliedAlpha);
         }
         param1.copyVertexDataTransformedTo(this.mVertexData,_loc8_,param5);
         if(_loc7_ != 1)
         {
            this.mVertexData.scaleAlpha(_loc8_,_loc7_,4);
         }
         this.mSyncRequired = true;
         ++this.mNumQuads;
      }
      
      public function addQuadBatch(param1:QuadBatch, param2:Number = 1, param3:Matrix = null, param4:String = null) : void
      {
         if(param3 == null)
         {
            param3 = param1.transformationMatrix;
         }
         var _loc5_:Boolean = param1.mTinted || param2 != 1;
         var _loc6_:Number = param2 * param1.alpha;
         var _loc7_:int = this.mNumQuads * 4;
         var _loc8_:int = param1.numQuads;
         if(this.mNumQuads + _loc8_ > this.capacity)
         {
            this.capacity = this.mNumQuads + _loc8_;
         }
         if(this.mNumQuads == 0)
         {
            this.blendMode = !!param4 ? param4 : param1.blendMode;
            this.mTexture = param1.mTexture;
            this.mTinted = _loc5_;
            this.mSmoothing = param1.mSmoothing;
            this.mVertexData.setPremultipliedAlpha(param1.mVertexData.premultipliedAlpha,false);
         }
         param1.mVertexData.copyTransformedTo(this.mVertexData,_loc7_,param3,0,_loc8_ * 4);
         if(_loc6_ != 1)
         {
            this.mVertexData.scaleAlpha(_loc7_,_loc6_,_loc8_ * 4);
         }
         this.mSyncRequired = true;
         this.mNumQuads += _loc8_;
      }
      
      public function isStateChange(param1:Boolean, param2:Number, param3:Texture, param4:String, param5:String, param6:int = 1) : Boolean
      {
         if(this.mNumQuads == 0)
         {
            return false;
         }
         if(this.mNumQuads + param6 > MAX_NUM_QUADS)
         {
            return true;
         }
         if(this.mTexture == null && param3 == null)
         {
            return this.blendMode != param5;
         }
         if(this.mTexture != null && param3 != null)
         {
            return this.mTexture.base != param3.base || this.mTexture.repeat != param3.repeat || this.mSmoothing != param4 || this.mTinted != (param1 || param2 != 1) || this.blendMode != param5;
         }
         return true;
      }
      
      public function transformQuad(param1:int, param2:Matrix) : void
      {
         this.mVertexData.transformVertex(param1 * 4,param2,4);
         this.mSyncRequired = true;
      }
      
      public function getVertexColor(param1:int, param2:int) : uint
      {
         return this.mVertexData.getColor(param1 * 4 + param2);
      }
      
      public function setVertexColor(param1:int, param2:int, param3:uint) : void
      {
         this.mVertexData.setColor(param1 * 4 + param2,param3);
         this.mSyncRequired = true;
      }
      
      public function getVertexAlpha(param1:int, param2:int) : Number
      {
         return this.mVertexData.getAlpha(param1 * 4 + param2);
      }
      
      public function setVertexAlpha(param1:int, param2:int, param3:Number) : void
      {
         this.mVertexData.setAlpha(param1 * 4 + param2,param3);
         this.mSyncRequired = true;
      }
      
      public function getQuadColor(param1:int) : uint
      {
         return this.mVertexData.getColor(param1 * 4);
      }
      
      public function setQuadColor(param1:int, param2:uint) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < 4)
         {
            this.mVertexData.setColor(param1 * 4 + _loc3_,param2);
            _loc3_++;
         }
         this.mSyncRequired = true;
      }
      
      public function getQuadAlpha(param1:int) : Number
      {
         return this.mVertexData.getAlpha(param1 * 4);
      }
      
      public function setQuadAlpha(param1:int, param2:Number) : void
      {
         var _loc3_:int = 0;
         while(_loc3_ < 4)
         {
            this.mVertexData.setAlpha(param1 * 4 + _loc3_,param2);
            _loc3_++;
         }
         this.mSyncRequired = true;
      }
      
      public function getQuadBounds(param1:int, param2:Matrix = null, param3:Rectangle = null) : Rectangle
      {
         return this.mVertexData.getBounds(param2,param1 * 4,4,param3);
      }
      
      override public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         if(param2 == null)
         {
            param2 = new Rectangle();
         }
         var _loc3_:Matrix = param1 == this ? null : getTransformationMatrix(param1,sHelperMatrix);
         return this.mVertexData.getBounds(_loc3_,0,this.mNumQuads * 4,param2);
      }
      
      override public function render(param1:RenderSupport, param2:Number) : void
      {
         if(this.mNumQuads)
         {
            if(this.mBatchable)
            {
               param1.batchQuadBatch(this,param2);
            }
            else
            {
               param1.finishQuadBatch();
               param1.raiseDrawCount();
               this.renderCustom(param1.mvpMatrix,alpha * param2,param1.blendMode);
            }
         }
      }
      
      public function get numQuads() : int
      {
         return this.mNumQuads;
      }
      
      public function get tinted() : Boolean
      {
         return this.mTinted;
      }
      
      public function get texture() : Texture
      {
         return this.mTexture;
      }
      
      public function get smoothing() : String
      {
         return this.mSmoothing;
      }
      
      public function get premultipliedAlpha() : Boolean
      {
         return this.mVertexData.premultipliedAlpha;
      }
      
      public function get batchable() : Boolean
      {
         return this.mBatchable;
      }
      
      public function set batchable(param1:Boolean) : void
      {
         this.mBatchable = param1;
      }
      
      public function get capacity() : int
      {
         return this.mVertexData.numVertices / 4;
      }
      
      public function set capacity(param1:int) : void
      {
         var _loc2_:int = this.capacity;
         if(param1 == _loc2_)
         {
            return;
         }
         if(param1 == 0)
         {
            throw new Error("Capacity must be > 0");
         }
         if(param1 > MAX_NUM_QUADS)
         {
            param1 = MAX_NUM_QUADS;
         }
         if(this.mNumQuads > param1)
         {
            this.mNumQuads = param1;
         }
         this.mVertexData.numVertices = param1 * 4;
         this.mIndexData.length = param1 * 6;
         var _loc3_:int = _loc2_;
         while(_loc3_ < param1)
         {
            this.mIndexData[int(_loc3_ * 6)] = _loc3_ * 4;
            this.mIndexData[int(_loc3_ * 6 + 1)] = _loc3_ * 4 + 1;
            this.mIndexData[int(_loc3_ * 6 + 2)] = _loc3_ * 4 + 2;
            this.mIndexData[int(_loc3_ * 6 + 3)] = _loc3_ * 4 + 1;
            this.mIndexData[int(_loc3_ * 6 + 4)] = _loc3_ * 4 + 3;
            this.mIndexData[int(_loc3_ * 6 + 5)] = _loc3_ * 4 + 2;
            _loc3_++;
         }
         this.destroyBuffers();
         this.mSyncRequired = true;
      }
      
      private function getProgram(param1:Boolean) : Program3D
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:Starling = Starling.current;
         var _loc3_:String = QUAD_PROGRAM_NAME;
         if(this.mTexture)
         {
            _loc3_ = getImageProgramName(param1,this.mTexture.mipMapping,this.mTexture.repeat,this.mTexture.format,this.mSmoothing);
         }
         var _loc4_:Program3D;
         if(!(_loc4_ = _loc2_.getProgram(_loc3_)))
         {
            if(!this.mTexture)
            {
               _loc5_ = "m44 op, va0, vc1 \nmul v0, va1, vc0 \n";
               _loc6_ = "mov oc, v0       \n";
            }
            else
            {
               _loc5_ = param1 ? "m44 op, va0, vc1 \nmul v0, va1, vc0 \nmov v1, va2      \n" : "m44 op, va0, vc1 \n" + "mov v1, va2      \n";
               _loc6_ = (_loc6_ = param1 ? "tex ft1,  v1, fs0 <???> \nmul  oc, ft1,  v0       \n" : "tex  oc,  v1, fs0 <???> \n").replace("<???>",RenderSupport.getTextureLookupFlags(this.mTexture.format,this.mTexture.mipMapping,this.mTexture.repeat,this.smoothing));
            }
            _loc4_ = _loc2_.registerProgramFromSource(_loc3_,_loc5_,_loc6_);
         }
         return _loc4_;
      }
   }
}
