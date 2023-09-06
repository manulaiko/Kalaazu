package package_309
{
   import away3d.arcane;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Context3DTextureFormat;
   import flash.geom.Matrix3D;
   import flash.geom.Vector3D;
   import package_198.class_1208;
   import package_294.class_2133;
   import package_305.class_1767;
   import package_369.class_2116;
   import package_371.class_2125;
   
   public class class_2236 extends class_1774
   {
       
      
      private var _fragmentData:Vector.<Number>;
      
      private var _vertexData:Vector.<Number>;
      
      private var var_1893:Number;
      
      private var var_760:class_2116;
      
      public function class_2236()
      {
         super();
         this._fragmentData = Vector.<Number>([1,255,65025,16581375,0.00392156862745098,0.00392156862745098,0.00392156862745098,0,0,0,0,0]);
         this._vertexData = new Vector.<Number>(4,true);
         this._vertexData[3] = 1;
         var_237 = 9;
      }
      
      public function get alphaThreshold() : Number
      {
         return this.var_1893;
      }
      
      public function set alphaThreshold(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         else if(param1 > 1)
         {
            param1 = 1;
         }
         if(param1 == this.var_1893)
         {
            return;
         }
         if(param1 == 0 || this.var_1893 == 0)
         {
            arcane::method_220();
         }
         this.var_1893 = param1;
         this._fragmentData[8] = this.var_1893;
      }
      
      public function get alphaMask() : class_2116
      {
         return this.var_760;
      }
      
      public function set alphaMask(param1:class_2116) : void
      {
         this.var_760 = param1;
      }
      
      override arcane function getVertexCode() : String
      {
         var _loc1_:* = null;
         _loc1_ = "m44 op, vt0, vc0\t\t\nm44 vt1, vt0, vc5\t\t\nsub v0, vt1, vc9\t\t\n";
         if(this.var_1893 > 0)
         {
            _loc1_ += "mov v1, va1\n";
            var_1971 = 1;
            var_1671 = 2;
         }
         else
         {
            var_1971 = 0;
            var_1671 = 1;
         }
         return _loc1_;
      }
      
      override arcane function getFragmentCode(param1:String) : String
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         param1 = param1;
         var _loc3_:String = !!_repeat ? "wrap" : "clamp";
         if(_smooth)
         {
            _loc4_ = !!var_2370 ? "linear,miplinear" : "linear";
         }
         else
         {
            _loc4_ = !!var_2370 ? "nearest,mipnearest" : "nearest";
         }
         _loc2_ = "dp3 ft2.z, v0.xyz, v0.xyz\t\nmul ft0, fc0, ft2.z\t\nfrc ft0, ft0\t\t\t\nmul ft1, ft0.yzww, fc1\t\n";
         if(this.var_1893 > 0)
         {
            switch(this.var_760.format)
            {
               case Context3DTextureFormat.COMPRESSED:
                  _loc5_ = "dxt1,";
                  break;
               case "compressedAlpha":
                  _loc5_ = "dxt5,";
                  break;
               default:
                  _loc5_ = "";
            }
            _loc2_ += "tex ft3, v1, fs0 <2d," + _loc4_ + "," + _loc5_ + _loc3_ + ">\n" + "sub ft3.w, ft3.w, fc2.x\n" + "kil ft3.w\n";
         }
         return _loc2_ + "sub oc, ft0, ft1\t\t\n";
      }
      
      override arcane function render(param1:class_2133, param2:class_1208, param3:class_1767, param4:Matrix3D) : void
      {
         var _loc5_:Context3D = param2.arcane::var_4582;
         var _loc6_:Vector3D = param3.method_3037;
         this._vertexData[0] = _loc6_.x;
         this._vertexData[1] = _loc6_.y;
         this._vertexData[2] = _loc6_.z;
         this._vertexData[3] = 1;
         var _loc7_:Matrix3D = param1.method_846(param3);
         _loc5_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,5,_loc7_,true);
         _loc5_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,9,this._vertexData,1);
         if(this.var_1893 > 0)
         {
            param1.method_2801(1,param2);
         }
         var _loc8_:Matrix3D;
         (_loc8_ = class_2125.const_1289).copyFrom(_loc7_);
         _loc8_.append(param4);
         _loc5_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,0,_loc8_,true);
         param1.method_748(0,param2);
         _loc5_.drawTriangles(param1.method_612(param2),0,param1.name_42);
      }
      
      override arcane function activate(param1:class_1208, param2:class_1767) : void
      {
         var _loc3_:Context3D = param1.arcane::var_4582;
         super.arcane::activate(param1,param2);
         var _loc4_:Number = Number(param2.lens.method_1840);
         _loc4_ = 1 / (2 * _loc4_ * _loc4_);
         this._fragmentData[0] = 1 * _loc4_;
         this._fragmentData[1] = 255 * _loc4_;
         this._fragmentData[2] = 65025 * _loc4_;
         this._fragmentData[3] = 16581375 * _loc4_;
         if(this.var_1893 > 0)
         {
            _loc3_.setTextureAt(0,this.var_760.method_6425(param1));
            _loc3_.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,this._fragmentData,3);
         }
         else
         {
            _loc3_.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,this._fragmentData,2);
         }
      }
   }
}
