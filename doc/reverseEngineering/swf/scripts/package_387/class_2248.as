package package_387
{
   import away3d.arcane;
   import package_198.class_1208;
   import package_294.class_2133;
   import package_305.class_1767;
   import package_310.class_1779;
   import package_310.class_1780;
   import package_310.class_2252;
   import package_369.class_2115;
   import package_385.class_2237;
   import package_385.class_2251;
   
   public class class_2248 extends class_1780
   {
       
      
      private var _useTexture:Boolean;
      
      private var _texture:class_2115;
      
      public function class_2248(param1:Number = 1)
      {
         super();
      }
      
      override arcane function initVO(param1:class_2252) : void
      {
         super.arcane::initVO(param1);
         param1.var_3859 = true;
      }
      
      public function get texture() : class_2115
      {
         return this._texture;
      }
      
      public function set texture(param1:class_2115) : void
      {
         if(Boolean(param1) != this._useTexture || param1 && this._texture && (param1.method_5818 != this._texture.method_5818 || param1.format != this._texture.format))
         {
            method_220();
         }
         this._useTexture = Boolean(param1);
         this._texture = param1;
      }
      
      override arcane function activate(param1:class_2252, param2:class_1208) : void
      {
         if(this._useTexture)
         {
            param2.context3D.setTextureAt(param1.var_2852,this._texture.method_6425(param2));
         }
      }
      
      override arcane function setRenderState(param1:class_2252, param2:class_2133, param3:class_1208, param4:class_1767) : void
      {
         super.arcane::setRenderState(param1,param2,param3,param4);
         if(this._useTexture)
         {
            param1.var_3329[param1.var_2676] = !!param2.name_55 ? Number(param2.name_55.glow) || false : 1;
         }
      }
      
      override arcane function deactivate(param1:class_2252, param2:class_1208) : void
      {
         if(this._useTexture)
         {
            param2.context3D.setTextureAt(param1.var_2852,null);
         }
         super.arcane::deactivate(param1,param2);
      }
      
      override public function copyFrom(param1:class_1779) : void
      {
         var _loc2_:class_2248 = param1 as class_2248;
         this.texture = _loc2_.texture;
      }
      
      override arcane function getFragmentCode(param1:class_2252, param2:class_2237, param3:class_2251) : String
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc4_:String = "";
         if(this._useTexture)
         {
            _loc5_ = param2.method_3238();
            param1.var_2852 = _loc5_.index;
            _loc6_ = param2.method_1853();
            param1.var_2676 = Number(_loc6_.index) * 4;
            _loc7_ = param2.method_4834();
            param2.method_4539(_loc7_,1);
            _loc4_ += getTex2DSampleCode(param1,_loc7_,_loc5_,this._texture) + "mul " + _loc7_ + ".xyz, " + _loc7_ + "," + _loc6_ + ".xxxx\n" + "add " + param3 + ".xyz, " + param3 + ", " + _loc7_ + "\n";
            param2.method_771(_loc7_);
         }
         return _loc4_;
      }
   }
}
