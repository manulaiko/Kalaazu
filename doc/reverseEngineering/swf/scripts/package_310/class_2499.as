package package_310
{
   import away3d.arcane;
   import flash.geom.ColorTransform;
   import package_198.class_1208;
   import package_385.class_2237;
   import package_385.class_2251;
   
   public class class_2499 extends class_1780
   {
       
      
      private var _colorTransform:ColorTransform;
      
      public function class_2499()
      {
         super();
      }
      
      public function get colorTransform() : ColorTransform
      {
         return this._colorTransform;
      }
      
      public function set colorTransform(param1:ColorTransform) : void
      {
         this._colorTransform = param1;
      }
      
      override arcane function getFragmentCode(param1:class_2252, param2:class_2237, param3:class_2251) : String
      {
         var _loc6_:* = null;
         var _loc4_:String = "";
         var _loc5_:class_2251 = param2.method_1853();
         _loc6_ = param2.method_1853();
         param1.var_2676 = Number(_loc5_.index) * 4;
         return _loc4_ + ("mul " + param3 + ", " + param3.toString() + ", " + _loc5_ + "\n" + "add " + param3 + ", " + param3.toString() + ", " + _loc6_ + "\n");
      }
      
      override arcane function activate(param1:class_2252, param2:class_1208) : void
      {
         var _loc3_:Number = 0.00392156862745098;
         var _loc4_:int = int(param1.var_2676);
         var _loc5_:Vector.<Number>;
         (_loc5_ = param1.var_3329)[_loc4_] = this._colorTransform.redMultiplier;
         _loc5_[_loc4_ + 1] = this._colorTransform.greenMultiplier;
         _loc5_[_loc4_ + 2] = this._colorTransform.blueMultiplier;
         _loc5_[_loc4_ + 3] = this._colorTransform.alphaMultiplier;
         _loc5_[_loc4_ + 4] = Number(this._colorTransform.redOffset) * _loc3_;
         _loc5_[_loc4_ + 5] = Number(this._colorTransform.greenOffset) * _loc3_;
         _loc5_[_loc4_ + 6] = Number(this._colorTransform.blueOffset) * _loc3_;
         _loc5_[_loc4_ + 7] = Number(this._colorTransform.alphaOffset) * _loc3_;
      }
   }
}
