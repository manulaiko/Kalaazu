package package_309
{
   import away3d.arcane;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DCompareMode;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Context3DTriangleFace;
   import flash.geom.Matrix3D;
   import flash.utils.Dictionary;
   import package_198.class_1208;
   import package_294.class_2133;
   import package_294.class_2398;
   import package_294.class_2425;
   import package_294.class_2427;
   import package_294.class_2429;
   import package_304.class_2114;
   import package_305.class_1767;
   import package_371.class_2125;
   
   public class class_2663 extends class_1774
   {
       
      
      private var var_3677:uint;
      
      private var var_1698:Vector.<Number>;
      
      private var var_810:Vector.<Number>;
      
      private var var_4400:Boolean;
      
      private var var_4578:Dictionary;
      
      private var var_802:Boolean;
      
      public function class_2663(param1:uint = 0, param2:Number = 20, param3:Boolean = true, param4:Boolean = false)
      {
         super();
         mipmap = false;
         this.var_1698 = new Vector.<Number>(4,true);
         this.var_1698[3] = 1;
         this.var_810 = new Vector.<Number>(4,true);
         this.method_3357 = param1;
         this.outlineSize = param2;
         var_3455 = Context3DTriangleFace.FRONT;
         var_1671 = 2;
         var_237 = 6;
         this.var_4400 = param3;
         this.var_802 = param4;
         if(param4)
         {
            this.var_4578 = new Dictionary();
         }
         var_16 = Vector.<String>(["va0","va1"]);
         var_2915 = Vector.<String>(["vt0","vt1"]);
      }
      
      public function method_2931(param1:class_2114) : void
      {
         var _loc2_:int = 0;
         if(this.var_802)
         {
            _loc2_ = 0;
            while(_loc2_ < param1.method_3381.length)
            {
               this.method_2431(param1.method_3381[_loc2_]);
               _loc2_++;
            }
         }
      }
      
      private function method_2431(param1:Object) : void
      {
         var _loc2_:* = null;
         _loc2_ = class_2114(this.var_802[param1]);
         _loc2_.geometry.dispose();
         _loc2_.dispose();
         delete this.var_802[param1];
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         super.dispose();
         if(this.var_802)
         {
            for(_loc1_ in this.var_4578)
            {
               this.method_2431(_loc1_);
            }
         }
      }
      
      public function get method_4631() : Boolean
      {
         return this.var_4400;
      }
      
      public function set method_4631(param1:Boolean) : void
      {
         this.var_4400 = param1;
      }
      
      public function get method_3357() : uint
      {
         return this.var_3677;
      }
      
      public function set method_3357(param1:uint) : void
      {
         this.var_3677 = param1;
         this.var_1698[0] = (param1 >> 16 & 255) / 255;
         this.var_1698[1] = (param1 >> 8 & 255) / 255;
         this.var_1698[2] = (param1 & 255) / 255;
      }
      
      public function get outlineSize() : Number
      {
         return this.var_810[0];
      }
      
      public function set outlineSize(param1:Number) : void
      {
         this.var_810[0] = param1;
      }
      
      override arcane function getVertexCode() : String
      {
         var _loc1_:* = null;
         return "mul vt7, vt1, vc5.x\nadd vt7, vt7, vt0\nmov vt7.w, vt0.w\nm44 op, vt7, vc0\t\t\n";
      }
      
      override arcane function getFragmentCode(param1:String) : String
      {
         return "mov oc, fc0\n";
      }
      
      override arcane function activate(param1:class_1208, param2:class_1767) : void
      {
         var _loc3_:Context3D = param1.arcane::var_4582;
         super.arcane::activate(param1,param2);
         if(!this.var_4400)
         {
            _loc3_.setDepthTest(false,Context3DCompareMode.LESS);
         }
         _loc3_.setCulling(var_3455);
         _loc3_.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,this.var_1698,1);
         _loc3_.setProgramConstantsFromVector(Context3DProgramType.VERTEX,5,this.var_810,1);
      }
      
      override arcane function deactivate(param1:class_1208) : void
      {
         super.arcane::deactivate(param1);
         if(!this.var_4400)
         {
            param1.arcane::var_4582.setDepthTest(true,Context3DCompareMode.LESS);
         }
      }
      
      override arcane function render(param1:class_2133, param2:class_1208, param3:class_1767, param4:Matrix3D) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:Context3D = param2.arcane::var_4582;
         var _loc8_:Matrix3D;
         (_loc8_ = class_2125.const_1289).copyFrom(param1.method_846(param3));
         _loc8_.append(param4);
         if(this.var_802)
         {
            var _loc9_:* = this.var_4578[param1] || this.method_4003(class_2398(param1).subGeometry);
            this.var_4578[param1] = this.var_4578[param1] || this.method_4003(class_2398(param1).subGeometry);
            _loc6_ = (_loc5_ = _loc9_).method_3381[0];
            _loc7_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,0,_loc8_,true);
            _loc6_.method_748(0,param2);
            _loc6_.method_298(1,param2);
            _loc7_.drawTriangles(_loc6_.method_612(param2),0,_loc6_.name_42);
         }
         else
         {
            param1.method_298(1,param2);
            _loc7_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX,0,_loc8_,true);
            param1.method_748(0,param2);
            _loc7_.drawTriangles(param1.method_612(param2),0,param1.name_42);
         }
      }
      
      private function method_4003(param1:class_2425) : class_2114
      {
         var _loc9_:int = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc17_:int = 0;
         var _loc2_:class_2114 = new class_2114(new class_2429(),null);
         var _loc3_:class_2427 = new class_2427();
         var _loc4_:* = [];
         var _loc5_:Vector.<uint> = param1.indexData;
         var _loc6_:Vector.<Number> = param1.name_104;
         var _loc7_:Vector.<uint> = new Vector.<uint>();
         var _loc8_:Vector.<Number> = new Vector.<Number>();
         var _loc16_:int = _loc5_.length;
         var _loc18_:int = int(param1.method_4110);
         var _loc19_:int = int(param1.method_720);
         var _loc20_:int = 0;
         while(_loc20_ < _loc16_)
         {
            _loc9_ = _loc19_ + _loc5_[_loc20_] * _loc18_;
            _loc10_ = _loc6_[_loc9_];
            _loc11_ = _loc6_[_loc9_ + 1];
            _loc12_ = _loc6_[_loc9_ + 2];
            _loc13_ = _loc10_.toPrecision(5) + "/" + _loc11_.toPrecision(5) + "/" + _loc12_.toPrecision(5);
            if(_loc4_[_loc13_])
            {
               _loc9_ = _loc4_[_loc13_] - 1;
            }
            else
            {
               _loc9_ = _loc15_ / 3;
               _loc4_[_loc13_] = _loc9_ + 1;
               var _loc21_:*;
               _loc8_[_loc21_ = _loc15_++] = _loc10_;
               var _loc22_:*;
               _loc8_[_loc22_ = _loc15_++] = _loc11_;
               var _loc23_:*;
               _loc8_[_loc23_ = _loc15_++] = _loc12_;
            }
            if(_loc9_ > _loc17_)
            {
               _loc17_ = _loc9_;
            }
            _loc7_[_loc21_ = _loc14_++] = _loc9_;
            _loc20_++;
         }
         _loc3_.method_251 = true;
         _loc3_.updateVertexData(_loc8_);
         _loc3_.updateIndexData(_loc7_);
         _loc2_.geometry.method_1586(_loc3_);
         return _loc2_;
      }
   }
}
