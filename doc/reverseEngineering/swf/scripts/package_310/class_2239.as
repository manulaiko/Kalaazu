package package_310
{
   import away3d.arcane;
   import package_198.class_1208;
   import package_294.class_2133;
   import package_305.class_1767;
   import package_369.class_2116;
   import package_385.class_2237;
   import package_385.class_2251;
   
   public class class_2239 extends class_1779
   {
       
      
      protected var _useTexture:Boolean;
      
      private var _texture:class_2116;
      
      protected var var_3318:class_2251;
      
      private var var_1434:uint = 16777215;
      
      private var var_1211:Number = 0;
      
      private var var_1656:Number = 0;
      
      private var var_363:Number = 0;
      
      private var var_3307:Number = 1;
      
      arcane var var_2518:Number = 0;
      
      arcane var var_2721:Number = 0;
      
      arcane var var_3823:Number = 0;
      
      public function class_2239()
      {
         super();
      }
      
      override arcane function initVO(param1:class_2252) : void
      {
         param1.var_3859 = this._useTexture;
      }
      
      override arcane function method_4956(param1:class_2252) : void
      {
         param1.var_3329[param1.var_2676 + 3] = 1;
      }
      
      public function get ambient() : Number
      {
         return this.var_3307;
      }
      
      public function set ambient(param1:Number) : void
      {
         this.var_3307 = param1;
      }
      
      public function get ambientColor() : uint
      {
         return this.var_1434;
      }
      
      public function set ambientColor(param1:uint) : void
      {
         this.var_1434 = param1;
      }
      
      public function get texture() : class_2116
      {
         return this._texture;
      }
      
      public function set texture(param1:class_2116) : void
      {
         if(Boolean(param1) != this._useTexture || param1 && this._texture && (param1.method_5818 != this._texture.method_5818 || param1.format != this._texture.format))
         {
            method_220();
         }
         this._useTexture = Boolean(param1);
         this._texture = param1;
      }
      
      override public function copyFrom(param1:class_1779) : void
      {
         var _loc2_:class_2239 = class_2239(param1);
         this.ambient = _loc2_.ambient;
         this.ambientColor = _loc2_.ambientColor;
      }
      
      override arcane function method_3031() : void
      {
         super.arcane::method_3031();
         this.var_3318 = null;
      }
      
      arcane function getFragmentCode(param1:class_2252, param2:class_2237, param3:class_2251) : String
      {
         var _loc4_:String = "";
         if(this._useTexture)
         {
            this.var_3318 = param2.method_3238();
            param1.var_2852 = this.var_3318.index;
            _loc4_ += getTex2DSampleCode(param1,param3,this.var_3318,this._texture) + "div " + param3 + ".xyz, " + param3 + ".xyz, " + param3 + ".w\n";
         }
         else
         {
            this.var_3318 = param2.method_1853();
            param1.var_2676 = Number(this.var_3318.index) * 4;
            _loc4_ += "mov " + param3 + ", " + this.var_3318 + "\n";
         }
         return _loc4_;
      }
      
      override arcane function activate(param1:class_2252, param2:class_1208) : void
      {
         if(this._useTexture)
         {
            param2.arcane::var_4582.setTextureAt(param1.var_2852,this._texture.method_6425(param2));
         }
      }
      
      private function method_860() : void
      {
         this.var_1211 = (Number(this.var_1434) >> 16 & 255) / 255 * Number(this.var_3307) * Number(this.arcane::var_2518);
         this.var_1656 = (Number(this.var_1434) >> 8 & 255) / 255 * Number(this.var_3307) * Number(this.arcane::var_2721);
         this.var_363 = (Number(this.var_1434) & 255) / 255 * Number(this.var_3307) * Number(this.arcane::var_3823);
      }
      
      override arcane function setRenderState(param1:class_2252, param2:class_2133, param3:class_1208, param4:class_1767) : void
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         this.method_860();
         if(!this._useTexture)
         {
            _loc5_ = int(param1.var_2676);
            (_loc6_ = param1.var_3329)[_loc5_] = this.var_1211;
            _loc6_[_loc5_ + 1] = this.var_1656;
            _loc6_[_loc5_ + 2] = this.var_363;
         }
      }
   }
}
