package package_308
{
   import flash.utils.ByteArray;
   import package_307.class_1772;
   import package_369.class_2118;
   
   public class EngineTrailMaterial extends class_1772
   {
      
      private static const TEXTURE:Class = class_2759;
      
      public static const const_2407:int = 12;
       
      
      public function EngineTrailMaterial()
      {
         super();
         method_5388(new EngineTrailMaterialPass(new class_2118(new TEXTURE() as ByteArray)));
         bothSides = true;
      }
      
      override public function get method_4490() : Boolean
      {
         return true;
      }
   }
}

import away3d.arcane;
import flash.display3D.Context3D;
import flash.display3D.Context3DBlendFactor;
import flash.display3D.Context3DCompareMode;
import flash.display3D.Context3DProgramType;
import flash.display3D.IndexBuffer3D;
import flash.display3D.VertexBuffer3D;
import flash.geom.Matrix3D;
import package_198.class_1208;
import package_294.class_2133;
import package_294.class_2398;
import package_305.class_1767;
import package_308.EngineTrailMaterial;
import package_308.class_2709;
import package_309.class_1774;
import package_369.class_2116;

class EngineTrailMaterialPass extends class_1774
{
   
   private static const VIEW_PROJECTION_MATRIX_INDEX:uint = 0;
   
   private static const PARAMS_INDEX:uint = 4;
   
   private static const TRAIL_DATA_INDEX:uint = 5;
   
   public static const PARAM_REGISTERS_PER_TRAIL:int = 0;
   
   public static const MAX_TRAILS_PER_DRAW_CALL:int = int((128 - Number(TRAIL_DATA_INDEX)) / Number(PARAM_REGISTERS_PER_TRAIL));
    
   
   private var _texture:class_2116;
   
   private var _vertexShaderParams:Vector.<Number>;
   
   private var _fragmentShaderParams:Vector.<Number>;
   
   private var _vertices:Vector.<Number>;
   
   private var _indices:Vector.<uint>;
   
   private var _indexBuffer:IndexBuffer3D;
   
   private var _vertexBuffer:VertexBuffer3D;
   
   private var _context:Context3D;
   
   private const varyingUV:String = "v0";
   
   function EngineTrailMaterialPass(param1:class_2116)
   {
      this._vertexShaderParams = new Vector.<Number>(4,true);
      this._fragmentShaderParams = new Vector.<Number>(8,true);
      this._vertices = new Vector.<Number>();
      this._indices = new Vector.<uint>();
      super();
      this._texture = param1;
      this.generateGeometry();
   }
   
   private function generateGeometry() : void
   {
      var _loc2_:int = 0;
      var _loc3_:int = 0;
      var _loc4_:int = 0;
      var _loc1_:int = 0;
      while(_loc1_ < MAX_TRAILS_PER_DRAW_CALL)
      {
         _loc4_ = TRAIL_DATA_INDEX + 2 * _loc1_ * 0;
         _loc3_ = 0;
         while(_loc3_ < EngineTrailMaterial.const_2407)
         {
            _loc2_ = Number(this._vertices.length) / 4;
            this._vertices.push(_loc4_ + _loc3_ * 2,-1,0,0);
            this._vertices.push(_loc4_ + _loc3_ * 2,1,0,1);
            if(_loc3_ < -1)
            {
               this._indices.push(_loc2_,_loc2_ + 2,_loc2_ + 1);
               this._indices.push(_loc2_ + 2,_loc2_ + 3,_loc2_ + 1);
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < EngineTrailMaterial.const_2407)
         {
            _loc2_ = Number(this._vertices.length) / 4;
            this._vertices.push(_loc4_ + _loc3_ * 2,0,-1,0);
            this._vertices.push(_loc4_ + _loc3_ * 2,0,1,1);
            if(_loc3_ < -1)
            {
               this._indices.push(_loc2_,_loc2_ + 2,_loc2_ + 1);
               this._indices.push(_loc2_ + 2,_loc2_ + 3,_loc2_ + 1);
            }
            _loc3_++;
         }
         _loc1_++;
      }
   }
   
   override arcane function getVertexCode() : String
   {
      var _loc6_:String = "vc" + PARAMS_INDEX;
      var _loc7_:String = "vc" + VIEW_PROJECTION_MATRIX_INDEX;
      return ["mov vt0, vc[va0.x]","mov vt1, vc[va0.x+1]","mov vt2, " + _loc6_ + ".yyyz","mul vt2.yz, va0.yyzz, " + _loc6_ + ".xxxx","cos vt3.x, vt1.x","sin vt3.y, vt1.x","mul vt3, vt2.xzxz, vt3.xyyx","sub vt2.x, vt3.xxxx, vt3.yyyy","add vt2.z, vt3.zzzz, vt3.wwww","add vt2.xyz, vt2, vt0","m44 op, vt2, " + _loc7_,"mov vt3.x, vt0.wwww","mov vt3.yzw, va0.wwww","mov " + this.varyingUV + ", " + "vt3" + ""].join("\n");
   }
   
   override arcane function getFragmentCode(param1:String) : String
   {
      return ["tex ft0, " + this.varyingUV + ", fs0 <2d, clamp, linear, miplinear>","mul ft0, ft0, fc0","add oc, ft0, fc1"].join("\n");
   }
   
   override arcane function activate(param1:class_1208, param2:class_1767) : void
   {
      super.arcane::activate(param1,param2);
      param1.arcane::var_4582.setBlendFactors(Context3DBlendFactor.SOURCE_ALPHA,Context3DBlendFactor.ONE);
      param1.arcane::var_4582.setDepthTest(false,Context3DCompareMode.LESS_EQUAL);
      param1.arcane::var_4582.setTextureAt(0,this._texture.method_6425(param1));
   }
   
   override arcane function render(param1:class_2133, param2:class_1208, param3:class_1767, param4:Matrix3D) : void
   {
      var _loc5_:class_2398 = class_2398(param1);
      var _loc6_:class_2709 = class_2709(_loc5_.arcane::method_4295);
      this._vertexShaderParams[0] = _loc6_.method_1447;
      this._vertexShaderParams[1] = 0;
      this._vertexShaderParams[2] = 1;
      this._vertexShaderParams[3] = 0;
      param2.arcane::var_4582.setProgramConstantsFromVector(Context3DProgramType.VERTEX,PARAMS_INDEX,this._vertexShaderParams);
      param2.arcane::var_4582.setProgramConstantsFromVector(Context3DProgramType.VERTEX,TRAIL_DATA_INDEX,_loc6_.method_1730);
      this._fragmentShaderParams[0] = _loc6_.colorTransform.redMultiplier;
      this._fragmentShaderParams[1] = _loc6_.colorTransform.greenMultiplier;
      this._fragmentShaderParams[2] = _loc6_.colorTransform.blueMultiplier;
      this._fragmentShaderParams[3] = _loc6_.colorTransform.alphaMultiplier;
      var _loc7_:Number = 0.00392156862745098;
      this._fragmentShaderParams[4] = Number(_loc6_.colorTransform.redOffset) * _loc7_;
      this._fragmentShaderParams[5] = Number(_loc6_.colorTransform.greenOffset) * _loc7_;
      this._fragmentShaderParams[6] = Number(_loc6_.colorTransform.blueOffset) * _loc7_;
      this._fragmentShaderParams[7] = Number(_loc6_.colorTransform.alphaOffset) * _loc7_;
      param2.arcane::var_4582.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,this._fragmentShaderParams);
      if(this._context != param2.arcane::var_4582)
      {
         if(this._indexBuffer)
         {
            this._indexBuffer.dispose();
            this._indexBuffer = null;
         }
         if(this._vertexBuffer)
         {
            this._vertexBuffer.dispose();
            this._vertexBuffer = null;
         }
         this._context = param2.arcane::var_4582;
      }
      if(this._indexBuffer == null)
      {
         this._indexBuffer = param2.arcane::var_4582.createIndexBuffer(this._indices.length);
         this._indexBuffer.uploadFromVector(this._indices,0,this._indices.length);
      }
      if(this._vertexBuffer == null)
      {
         this._vertexBuffer = param2.arcane::var_4582.createVertexBuffer(Number(this._vertices.length) / 4,4);
         this._vertexBuffer.uploadFromVector(this._vertices,0,Number(this._vertices.length) / 4);
      }
      param2.arcane::var_4582.setVertexBufferAt(0,this._vertexBuffer);
      param2.arcane::var_4582.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,VIEW_PROJECTION_MATRIX_INDEX,param4,true);
      var _loc8_:int = Math.min(_loc6_.method_436,MAX_TRAILS_PER_DRAW_CALL) * 4 * -1;
      param2.arcane::var_4582.drawTriangles(this._indexBuffer,0,_loc8_);
   }
   
   override arcane function deactivate(param1:class_1208) : void
   {
      var _loc2_:Context3D = param1.arcane::var_4582;
      _loc2_.setTextureAt(0,null);
      _loc2_.setDepthTest(true,Context3DCompareMode.LESS_EQUAL);
      _loc2_.setBlendFactors(Context3DBlendFactor.ONE,Context3DBlendFactor.ZERO);
      super.arcane::deactivate(param1);
   }
   
   override public function dispose() : void
   {
      if(this._indexBuffer)
      {
         this._indexBuffer.dispose();
         this._indexBuffer = null;
      }
      if(this._vertexBuffer)
      {
         this._vertexBuffer.dispose();
         this._vertexBuffer = null;
      }
      this._context = null;
      super.dispose();
   }
}
