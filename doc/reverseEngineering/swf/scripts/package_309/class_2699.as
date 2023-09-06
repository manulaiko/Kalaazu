package package_309
{
   import away3d.arcane;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Context3DTextureFormat;
   import flash.display3D.textures.Texture;
   import flash.geom.Matrix3D;
   import flash.utils.Dictionary;
   import package_198.class_1208;
   import package_294.class_2133;
   import package_305.class_1767;
   import package_364.class_2102;
   
   public class class_2699 extends class_1774
   {
       
      
      private var var_2928:Vector.<Dictionary>;
      
      private var var_954:Dictionary;
      
      private var var_2636:uint;
      
      private var var_4394:Vector.<Number>;
      
      private var var_4595:Vector.<Number>;
      
      private var var_1883:Boolean = true;
      
      public function class_2699(param1:uint = 512, param2:Number = 15)
      {
         super(true);
         this.var_2636 = param1;
         var_1671 = 2;
         var_237 = 7;
         this.var_4394 = new <Number>[param2,0,0,0];
         this.var_4595 = Vector.<Number>([1,255,65025,16581375,0.00392156862745098,0.00392156862745098,0.00392156862745098,0]);
         var_16 = Vector.<String>(["va0","va1"]);
         var_2915 = Vector.<String>(["vt0","vt1"]);
      }
      
      override public function dispose() : void
      {
         var _loc1_:Number = 0;
         var _loc2_:* = null;
         var _loc3_:Number = 0;
         if(this.var_2928)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_2928.length)
            {
               for each(_loc2_ in this.var_2928[_loc1_])
               {
                  _loc3_ = 0;
                  while(_loc3_ < _loc2_.length)
                  {
                     _loc2_[_loc3_].dispose();
                     _loc3_++;
                  }
               }
               _loc1_++;
            }
            this.var_2928 = null;
         }
      }
      
      private function method_6476() : void
      {
         var _loc1_:Number = 0;
         var _loc2_:* = null;
         var _loc3_:Number = 0;
         if(this.var_2928)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_2928.length)
            {
               for each(_loc2_ in this.var_2928[_loc1_])
               {
                  _loc3_ = 0;
                  while(_loc3_ < _loc2_.length)
                  {
                     _loc2_[_loc3_].dispose();
                     _loc3_++;
                  }
               }
               _loc1_++;
            }
         }
         this.var_2928 = new Vector.<Dictionary>(8);
         this.var_954 = new Dictionary();
         this.var_1883 = false;
      }
      
      override arcane function getVertexCode() : String
      {
         var _loc1_:* = null;
         _loc1_ = "mul vt7, vt1, vc4.x\t\nadd vt7, vt7, vt0\t\t\nmov vt7.w, vt0.w\t\t\n";
         _loc1_ += "m44 vt2, vt7, vc0\t\t\nmov op, vt2\t\t\t\n";
         return _loc1_ + "div v0, vt2, vt2.w \n";
      }
      
      override arcane function getFragmentCode(param1:String) : String
      {
         var _loc2_:String = "";
         return _loc2_ + "mul ft0, fc0, v0.z     \nfrc ft0, ft0           \nmul ft1, ft0.yzww, fc1 \nsub ft0, ft0, ft1      \nmov oc, ft0            \n";
      }
      
      arcane function method_5952(param1:class_2133, param2:class_1208) : Texture
      {
         return this.var_2928[param2.arcane::var_1572][param1];
      }
      
      arcane function method_2022(param1:class_2133) : Matrix3D
      {
         return this.var_954[param1];
      }
      
      override arcane function render(param1:class_2133, param2:class_1208, param3:class_1767, param4:Matrix3D) : void
      {
         var _loc5_:* = null;
         var _loc8_:* = 0;
         var _loc9_:* = null;
         var _loc6_:int = int(param2.arcane::var_1572);
         var _loc7_:Context3D = param2.arcane::var_4582;
         var _loc10_:Vector.<class_2102> = var_1149.method_2314;
         this.var_2928[_loc6_] = this.var_2928[_loc6_] || new Dictionary();
         if(!this.var_954[param1])
         {
            this.var_954[param1] = new Matrix3D();
         }
         _loc8_ = _loc10_.length;
         _loc5_ = (_loc9_ = _loc10_[0]).arcane::method_3242(param1,this.var_954[param1]);
         var _loc12_:* = this.var_2928[_loc6_][param1] || _loc7_.createTexture(this.var_2636,this.var_2636,Context3DTextureFormat.BGRA,true);
         this.var_2928[_loc6_][param1] = this.var_2928[_loc6_][param1] || _loc7_.createTexture(this.var_2636,this.var_2636,Context3DTextureFormat.BGRA,true);
         var _loc11_:Texture = _loc12_;
         param2.setRenderTarget(_loc11_,true);
         _loc7_.clear(1,1,1);
         _loc7_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,0,_loc5_,true);
         _loc7_.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,this.var_4595,2);
         param1.method_748(0,param2);
         param1.method_298(1,param2);
         _loc7_.drawTriangles(param1.method_612(param2),0,param1.name_42);
      }
      
      override arcane function activate(param1:class_1208, param2:class_1767) : void
      {
         if(this.var_1883)
         {
            this.method_6476();
         }
         super.arcane::activate(param1,param2);
         param1.arcane::var_4582.setProgramConstantsFromVector(Context3DProgramType.VERTEX,4,this.var_4394,1);
      }
   }
}
