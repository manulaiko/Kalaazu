package package_309
{
   import away3d.arcane;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DProgramType;
   import flash.geom.Matrix3D;
   import package_198.RTTBufferManager;
   import package_198.class_1208;
   import package_294.class_2133;
   import package_304.SegmentSet;
   import package_305.class_1767;
   
   public class class_2691 extends class_1774
   {
      
      protected static const const_2645:Vector.<Number> = Vector.<Number>([1,1,1,1]);
      
      protected static const const_2949:Vector.<Number> = Vector.<Number>([0,0,-1,0]);
       
      
      private var var_3293:Vector.<Number>;
      
      private var var_3783:Matrix3D;
      
      private var var_125:Number;
      
      public function class_2691(param1:Number)
      {
         this.var_3293 = new Vector.<Number>(4,true);
         this.var_3783 = new Matrix3D();
         this.var_125 = param1;
         this.var_3293[1] = 0.00392156862745098;
         super();
      }
      
      override arcane function getVertexCode() : String
      {
         return "m44 vt0, va0, vc8\t\t\t\nm44 vt1, va1, vc8\t\t\t\nsub vt2, vt1, vt0 \t\t\t\nslt vt5.x, vt0.z, vc7.z\t\t\t\nsub vt5.y, vc5.x, vt5.x\t\t\t\nadd vt4.x, vt0.z, vc7.z\t\t\t\nsub vt4.y, vt0.z, vt1.z\t\t\t\nseq vt4.z, vt4.y vc6.x\t\t\t\nadd vt4.y, vt4.y, vt4.z\t\t\t\ndiv vt4.z, vt4.x, vt4.y\t\t\t\nmul vt4.xyz, vt4.zzz, vt2.xyz\t\nadd vt3.xyz, vt0.xyz, vt4.xyz\t\nmov vt3.w, vc5.x\t\t\t\nmul vt0, vt0, vt5.yyyy\t\t\t\nmul vt3, vt3, vt5.xxxx\t\t\t\nadd vt0, vt0, vt3\t\t\t\t\nsub vt2, vt1, vt0 \t\t\t\nnrm vt2.xyz, vt2.xyz\t\t\t\nnrm vt5.xyz, vt0.xyz\t\t\t\nmov vt5.w, vc5.x\t\t\t\t\ncrs vt3.xyz, vt2, vt5\t\t\t\nnrm vt3.xyz, vt3.xyz\t\t\t\nmul vt3.xyz, vt3.xyz, va2.xxx\t\nmov vt3.w, vc5.x\t\t\t\ndp3 vt4.x, vt0, vc6\t\t\t\nmul vt4.x, vt4.x, vc7.x\t\t\t\nmul vt3.xyz, vt3.xyz, vt4.xxx\t\nadd vt0.xyz, vt0.xyz, vt3.xyz\t\nm44 op, vt0, vc0\t\t\t\nmov v0, va3\t\t\t\t\n";
      }
      
      override arcane function getFragmentCode(param1:String) : String
      {
         return "mov oc, v0\n";
      }
      
      override arcane function render(param1:class_2133, param2:class_1208, param3:class_1767, param4:Matrix3D) : void
      {
         var _loc7_:Number = 0;
         var _loc5_:Context3D = param2.arcane::var_4582;
         this.var_3783.copyFrom(param1.method_1409.sceneTransform);
         this.var_3783.append(param3.method_2908);
         var _loc6_:uint = uint(SegmentSet(param1).arcane::subSetCount);
         if(SegmentSet(param1).arcane::hasData)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc6_)
            {
               param1.method_748(_loc7_,param2);
               _loc5_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,8,this.var_3783,true);
               _loc5_.drawTriangles(param1.method_612(param2),0,param1.name_42);
               _loc7_++;
            }
         }
      }
      
      override arcane function activate(param1:class_1208, param2:class_1767) : void
      {
         var _loc4_:* = null;
         var _loc3_:Context3D = param1.arcane::var_4582;
         super.arcane::activate(param1,param2);
         if(param1.method_2358)
         {
            this.var_3293[0] = Number(this.var_125) / Math.min(param1.method_2358.width,param1.method_2358.height);
         }
         else
         {
            this.var_3293[0] = Number(this.var_125) / Math.min(param1.width,param1.height);
         }
         this.var_3293[2] = param2.lens.method_5049;
         _loc3_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,5,const_2645);
         _loc3_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,6,const_2949);
         _loc3_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,7,this.var_3293);
         if(!param1.renderTarget)
         {
            _loc3_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,0,param2.lens.matrix,true);
         }
         else
         {
            this.var_3783.copyFrom(param2.lens.matrix);
            _loc4_ = RTTBufferManager.getInstance(param1);
            this.var_3783.appendScale(_loc4_.method_5446,_loc4_.method_1932,1);
            _loc3_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,0,this.var_3783,true);
         }
      }
      
      override arcane function deactivate(param1:class_1208) : void
      {
         var _loc2_:Context3D = param1.arcane::var_4582;
         _loc2_.setVertexBufferAt(0,null);
         _loc2_.setVertexBufferAt(1,null);
         _loc2_.setVertexBufferAt(2,null);
         _loc2_.setVertexBufferAt(3,null);
      }
   }
}
