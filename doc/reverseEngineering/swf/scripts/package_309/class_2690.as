package package_309
{
   import away3d.arcane;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DCompareMode;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Context3DTextureFormat;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import package_198.class_1208;
   import package_294.class_2133;
   import package_305.class_1767;
   import package_369.class_2570;
   
   public class class_2690 extends class_1774
   {
       
      
      private var var_302:class_2570;
      
      private var _vertexData:Vector.<Number>;
      
      public function class_2690()
      {
         super();
         mipmap = false;
         var_1971 = 1;
         this._vertexData = new <Number>[0,0,0,0,1,1,1,1];
      }
      
      public function get method_6530() : class_2570
      {
         return this.var_302;
      }
      
      public function set method_6530(param1:class_2570) : void
      {
         this.var_302 = param1;
      }
      
      override arcane function getVertexCode() : String
      {
         return "mul vt0, va0, vc5\t\t\nadd vt0, vt0, vc4\t\t\nm44 op, vt0, vc0\t\t\nmul v0, va0, vc4.xxxx\n";
      }
      
      override arcane function getFragmentCode(param1:String) : String
      {
         var _loc2_:* = null;
         switch(this.var_302.format)
         {
            case Context3DTextureFormat.COMPRESSED:
               _loc2_ = "dxt1,";
               break;
            case "compressedAlpha":
               _loc2_ = "dxt5,";
               break;
            default:
               _loc2_ = "";
         }
         var _loc3_:String = ",mipnone";
         if(this.var_302.method_5818)
         {
            _loc3_ = ",miplinear";
         }
         return "tex ft0, v0, fs0 <cube," + _loc2_ + "linear,clamp" + _loc3_ + ">\t\n" + "mov oc, ft0\n";
      }
      
      override arcane function render(param1:class_2133, param2:class_1208, param3:class_1767, param4:Matrix3D) : void
      {
         var _loc5_:Context3D = param2.arcane::var_4582;
         var _loc6_:Vector3D = param3.method_3037;
         this._vertexData[0] = _loc6_.x;
         this._vertexData[1] = _loc6_.y;
         this._vertexData[2] = _loc6_.z;
         this._vertexData[3] = 0.01;
         var _loc7_:* = Number(param3.lens.method_1840) / Math.sqrt(3);
         this._vertexData[6] = Number(param3.lens.method_1840) / Math.sqrt(3);
         this._vertexData[4] = this._vertexData[5] = _loc7_;
         _loc5_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,0,param4,true);
         _loc5_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,4,this._vertexData,2);
         param1.method_748(0,param2);
         _loc5_.drawTriangles(param1.method_612(param2),0,param1.name_42);
      }
      
      override arcane function activate(param1:class_1208, param2:class_1767) : void
      {
         super.arcane::activate(param1,param2);
         var _loc3_:Context3D = param1.arcane::var_4582;
         _loc3_.setDepthTest(false,Context3DCompareMode.LESS);
         _loc3_.setTextureAt(0,this.var_302.method_6425(param1));
      }
   }
}
