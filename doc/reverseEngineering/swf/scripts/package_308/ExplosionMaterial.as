package package_308
{
   import package_307.class_1776;
   import package_369.class_2116;
   
   public class ExplosionMaterial extends class_1776
   {
       
      
      private var var_2219:ExplosionMaterialMethod;
      
      public function ExplosionMaterial(param1:class_2116)
      {
         super();
         this.var_2219 = new ExplosionMaterialMethod(param1);
         addMethod(this.var_2219);
         alphaBlending = true;
         this.var_1462.method_4194 = false;
      }
      
      public function get method_307() : ExplosionMaterialMethod
      {
         return this.var_2219;
      }
   }
}

import away3d.animators.class_2403;
import away3d.arcane;
import package_198.class_1208;
import package_294.class_2133;
import package_294.class_2398;
import package_305.class_1767;
import package_310.class_1780;
import package_310.class_2252;
import package_369.class_2116;
import package_385.class_2237;
import package_385.class_2251;
import package_430.class_2402;

class ExplosionMaterialMethod extends class_1780
{
    
   
   public var fireIntensity:Number = 8;
   
   private var _texture:class_2116;
   
   function ExplosionMaterialMethod(param1:class_2116)
   {
      super();
      this._texture = param1;
   }
   
   override arcane function initVO(param1:class_2252) : void
   {
      super.arcane::initVO(param1);
      param1.var_3859 = true;
   }
   
   override arcane function activate(param1:class_2252, param2:class_1208) : void
   {
      super.arcane::activate(param1,param2);
      param2.arcane::var_4582.setTextureAt(param1.var_2852,this._texture.method_6425(param2));
   }
   
   override arcane function setRenderState(param1:class_2252, param2:class_2133, param3:class_1208, param4:class_1767) : void
   {
      super.arcane::setRenderState(param1,param2,param3,param4);
      var _loc5_:class_2403;
      var _loc6_:class_2402 = (_loc5_ = class_2398(param2).animator as class_2403).method_1258("ParticleTimeLocalStatic") as class_2402;
      var _loc7_:Number = Number(_loc5_.time) / 1000;
      var _loc8_:Number;
      if((_loc8_ = !!_loc6_ ? (_loc7_ - Number(_loc6_.method_2497.method_561[0])) / Number(_loc6_.method_2497.method_561[2]) : 1) < 0 || _loc8_ > 1)
      {
         _loc8_ = 1;
      }
      param1.var_3329[param1.var_2676 + 0] = Math.max(0,Math.min((_loc8_ - 0.25) * 4,1));
      var _loc9_:Number = 1 - Math.max(0,Math.min((_loc8_ - 0.25) / 0.75,1));
      param1.var_3329[param1.var_2676 + 1] = _loc9_ * _loc9_;
      param1.var_3329[param1.var_2676 + 2] = this.fireIntensity;
      param1.var_3329[param1.var_2676 + 3] = 0.5;
   }
   
   override arcane function deactivate(param1:class_2252, param2:class_1208) : void
   {
      param2.arcane::var_4582.setTextureAt(param1.var_2852,null);
      param2.arcane::var_4582.setTextureAt(param1.var_2852 + 1,null);
      super.arcane::deactivate(param1,param2);
   }
   
   override arcane function getFragmentCode(param1:class_2252, param2:class_2237, param3:class_2251) : String
   {
      var _loc4_:class_2251 = param2.method_3238();
      param1.var_2852 = _loc4_.index;
      var _loc5_:class_2251 = param2.method_1853();
      param1.var_2676 = Number(_loc5_.index) * 4;
      var _loc6_:class_2251 = param2.method_4834();
      param2.method_4539(_loc6_,1);
      var _loc7_:class_2251 = param2.method_4834();
      param2.method_4539(_loc7_,1);
      var _loc8_:class_2251 = param2.method_4834();
      param2.method_4539(_loc8_,1);
      var _loc9_:class_2251 = param2.method_4834();
      param2.method_4539(_loc9_,1);
      var _loc10_:class_2251 = param2.method_4834();
      param2.method_4539(_loc10_,1);
      var _loc11_:String = ["mov " + _loc6_ + ", " + var_1283.var_443,"add " + _loc6_ + ".y, " + _loc6_ + ", " + _loc5_ + ".wwww",getTex2DSampleCode(param1,_loc7_,_loc4_,this._texture,_loc6_),getTex2DSampleCode(param1,_loc8_,_loc4_,this._texture),"mov " + _loc6_ + ", " + _loc7_,"mul " + _loc6_ + ".w, " + _loc6_ + ".wwww, " + _loc5_ + ".yyyy","sub " + _loc10_ + ".x, " + _loc8_ + ".wwww, " + _loc5_ + ".xxxx","sat " + _loc10_ + ".x, " + _loc10_ + ".x","mul " + _loc10_ + ".x, " + _loc10_ + ".x, " + _loc5_ + ".z","sub " + _loc9_ + ", " + _loc8_ + ", " + _loc7_,"mul " + _loc9_ + ", " + _loc9_ + ", " + _loc10_ + ".xxxx","add " + _loc9_ + ", " + _loc9_ + ", " + _loc7_,"add " + param3 + ".xyz, " + _loc6_ + ", " + _loc9_,"mov " + param3 + ".w, " + _loc6_ + ".wwww"].join("\n");
      param2.method_771(_loc6_);
      param2.method_771(_loc7_);
      param2.method_771(_loc8_);
      param2.method_771(_loc9_);
      param2.method_771(_loc10_);
      return _loc11_ + "\n";
   }
}
