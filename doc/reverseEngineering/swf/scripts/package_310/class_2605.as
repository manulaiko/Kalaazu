package package_310
{
   import away3d.arcane;
   import flash.geom.Matrix3D;
   import package_198.class_1208;
   import package_294.class_2133;
   import package_304.class_2418;
   import package_305.class_1767;
   import package_385.class_2237;
   import package_385.class_2251;
   
   public class class_2605 extends class_1780
   {
      
      public static const MULTIPLY:String = "multiply";
      
      public static const ADD:String = "add";
      
      public static const const_1264:String = "mix";
       
      
      private var var_3180:class_2418;
      
      private var var_4894:class_2251;
      
      private var var_771:Matrix3D;
      
      private var _mode:String;
      
      public function class_2605(param1:class_2418, param2:String = "multiply")
      {
         this.var_771 = new Matrix3D();
         super();
         this.var_3180 = param1;
         this._mode = param2;
      }
      
      override arcane function method_4956(param1:class_2252) : void
      {
         var _loc2_:int = int(param1.var_2676);
         var _loc3_:Vector.<Number> = param1.var_3329;
         _loc3_[_loc2_] = 0.5;
         _loc3_[_loc2_ + 1] = -0.5;
         _loc3_[_loc2_ + 2] = 1;
         _loc3_[_loc2_ + 3] = 1;
      }
      
      override arcane function method_3031() : void
      {
         super.arcane::method_3031();
         this.var_4894 = null;
      }
      
      public function get mode() : String
      {
         return this._mode;
      }
      
      public function set mode(param1:String) : void
      {
         if(this._mode == param1)
         {
            return;
         }
         this._mode = param1;
         method_220();
      }
      
      public function get method_411() : class_2418
      {
         return this.var_3180;
      }
      
      public function set method_411(param1:class_2418) : void
      {
         this.var_3180 = param1;
      }
      
      override arcane function getVertexCode(param1:class_2252, param2:class_2237) : String
      {
         var _loc3_:class_2251 = param2.method_5384();
         param2.method_5384();
         param2.method_5384();
         param2.method_5384();
         param2.method_3118();
         param1.var_2112 = Number(_loc3_.index) * 4;
         this.var_4894 = param2.method_5601();
         return "m44 " + this.var_4894 + ", vt0, " + _loc3_ + "\n";
      }
      
      override arcane function getFragmentCode(param1:class_2252, param2:class_2237, param3:class_2251) : String
      {
         var _loc4_:String = "";
         var _loc5_:class_2251 = param2.method_3238();
         var _loc6_:class_2251 = param2.method_4834();
         var _loc7_:class_2251 = param2.method_1853();
         param1.var_2676 = Number(_loc7_.index) * 4;
         param1.var_2852 = _loc5_.index;
         _loc4_ = (_loc4_ += "div " + _loc6_ + ", " + this.var_4894 + ", " + this.var_4894 + ".w\t\t\t\t\t\t\n" + "mul " + _loc6_ + ".xy, " + _loc6_ + ".xy, " + _loc7_ + ".xy\t\n" + "add " + _loc6_ + ".xy, " + _loc6_ + ".xy, " + _loc7_ + ".xx\t\n") + getTex2DSampleCode(param1,_loc6_,_loc5_,this.var_3180.texture,_loc6_,"clamp");
         if(this._mode == MULTIPLY)
         {
            _loc4_ += "mul " + param3 + ".xyz, " + param3 + ".xyz, " + _loc6_ + ".xyz\t\t\t\n";
         }
         else if(this._mode == ADD)
         {
            _loc4_ += "add " + param3 + ".xyz, " + param3 + ".xyz, " + _loc6_ + ".xyz\t\t\t\n";
         }
         else
         {
            if(this._mode != const_1264)
            {
               throw new Error("Unknown mode \"" + this._mode + "\"");
            }
            _loc4_ += "sub " + _loc6_ + ".xyz, " + _loc6_ + ".xyz, " + param3 + ".xyz\t\t\t\t\n" + "mul " + _loc6_ + ".xyz, " + _loc6_ + ".xyz, " + _loc6_ + ".w\t\t\t\t\t\t\n" + "add " + param3 + ".xyz, " + param3 + ".xyz, " + _loc6_ + ".xyz\t\t\t\n";
         }
         return _loc4_;
      }
      
      override arcane function setRenderState(param1:class_2252, param2:class_2133, param3:class_1208, param4:class_1767) : void
      {
         this.var_771.copyFrom(this.var_3180.method_2785);
         this.var_771.prepend(param2.method_846(param4));
         this.var_771.copyRawDataTo(param1.name_104,param1.var_2112,true);
      }
      
      override arcane function activate(param1:class_2252, param2:class_1208) : void
      {
         param2.arcane::var_4582.setTextureAt(param1.var_2852,this.var_3180.texture.method_6425(param2));
      }
   }
}
