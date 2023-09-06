package package_310
{
   import away3d.arcane;
   import package_198.class_1208;
   import package_369.class_2116;
   import package_385.class_2237;
   import package_385.class_2251;
   
   public class class_2241 extends class_2240
   {
       
      
      protected var _useTexture:Boolean;
      
      protected var var_800:class_2251;
      
      protected var var_3088:class_2251;
      
      protected var var_1287:class_2251;
      
      protected var var_2626:class_2251;
      
      private var _texture:class_2116;
      
      private var var_3166:int = 50;
      
      private var var_2344:Number = 1;
      
      private var var_2360:uint = 16777215;
      
      arcane var var_3500:Number = 1;
      
      arcane var var_1919:Number = 1;
      
      arcane var var_2424:Number = 1;
      
      private var var_712:class_2251;
      
      protected var var_3130:Boolean;
      
      public function class_2241()
      {
         super();
      }
      
      override arcane function initVO(param1:class_2252) : void
      {
         param1.var_3859 = this._useTexture;
         param1.var_10 = param1.name_108 > 0;
         param1.var_3475 = param1.name_108 > 0;
      }
      
      public function get gloss() : Number
      {
         return this.var_3166;
      }
      
      public function set gloss(param1:Number) : void
      {
         this.var_3166 = param1;
      }
      
      public function get specular() : Number
      {
         return this.var_2344;
      }
      
      public function set specular(param1:Number) : void
      {
         if(param1 == this.var_2344)
         {
            return;
         }
         this.var_2344 = param1;
         this.method_861();
      }
      
      public function get specularColor() : uint
      {
         return this.var_2360;
      }
      
      public function set specularColor(param1:uint) : void
      {
         if(this.var_2360 == param1)
         {
            return;
         }
         if(this.var_2360 == 0 || param1 == 0)
         {
            method_220();
         }
         this.var_2360 = param1;
         this.method_861();
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
         var _loc2_:class_2241 = class_2241(param1);
         this.texture = _loc2_.texture;
         this.specular = _loc2_.specular;
         this.specularColor = _loc2_.specularColor;
         this.gloss = _loc2_.gloss;
      }
      
      override arcane function method_3031() : void
      {
         super.arcane::method_3031();
         this.var_712 = null;
         this.var_800 = null;
         this.var_3088 = null;
         this.var_1287 = null;
         this.var_2626 = null;
      }
      
      override arcane function method_1029(param1:class_2252, param2:class_2237) : String
      {
         var _loc3_:String = "";
         this.var_3130 = true;
         if(param1.name_108 > 0)
         {
            this.var_2626 = param2.method_1853();
            param1.var_2676 = Number(this.var_2626.index) * 4;
            if(this._useTexture)
            {
               this.var_1287 = param2.method_4834();
               param2.method_4539(this.var_1287,1);
               this.var_3088 = param2.method_3238();
               param1.var_2852 = this.var_3088.index;
               _loc3_ = getTex2DSampleCode(param1,this.var_1287,this.var_3088,this._texture);
            }
            else
            {
               this.var_3088 = null;
            }
            this.var_800 = param2.method_4834();
            param2.method_4539(this.var_800,1);
         }
         return _loc3_;
      }
      
      override arcane function method_4161(param1:class_2252, param2:class_2251, param3:class_2251, param4:class_2237) : String
      {
         var _loc6_:* = null;
         var _loc5_:String = "";
         if(this.var_3130)
         {
            _loc6_ = this.var_800;
         }
         else
         {
            _loc6_ = param4.method_4834();
            param4.method_4539(_loc6_,1);
         }
         var _loc7_:class_2251 = var_1283.var_4238;
         var _loc8_:class_2251 = var_1283.var_3779;
         _loc5_ += "add " + _loc6_ + ", " + param2 + ", " + _loc7_ + "\n" + "nrm " + _loc6_ + ".xyz, " + _loc6_ + "\n" + "dp3 " + _loc6_ + ".w, " + _loc8_ + ", " + _loc6_ + "\n" + "sat " + _loc6_ + ".w, " + _loc6_ + ".w\n";
         if(this._useTexture)
         {
            _loc5_ += "mul " + this.var_1287 + ".w, " + this.var_1287 + ".y, " + this.var_2626 + ".w\n" + "pow " + _loc6_ + ".w, " + _loc6_ + ".w, " + this.var_1287 + ".w\n" + "sat " + _loc6_ + ".w, " + _loc6_ + ".w\n";
         }
         else
         {
            _loc5_ += "pow " + _loc6_ + ".w, " + _loc6_ + ".w, " + this.var_2626 + ".w\n";
         }
         if(param1.var_4198)
         {
            _loc5_ += "mul " + _loc6_ + ".w, " + _loc6_ + ".w, " + param2 + ".w\n";
         }
         if(arcane::var_366 != null)
         {
            _loc5_ += arcane::var_366(param1,_loc6_,param4,var_1283);
         }
         _loc5_ += "mul " + _loc6_ + ".xyz, " + param3 + ", " + _loc6_ + ".w\n";
         if(!this.var_3130)
         {
            _loc5_ += "add " + this.var_800 + ".xyz, " + this.var_800 + ", " + _loc6_ + "\n";
            param4.method_771(_loc6_);
         }
         this.var_3130 = false;
         return _loc5_;
      }
      
      override arcane function method_1573(param1:class_2252, param2:class_2251, param3:String, param4:class_2237) : String
      {
         var _loc6_:* = null;
         var _loc5_:String = "";
         if(this.var_3130)
         {
            _loc6_ = this.var_800;
         }
         else
         {
            _loc6_ = param4.method_4834();
            param4.method_4539(_loc6_,1);
         }
         var _loc7_:class_2251 = var_1283.var_3779;
         var _loc8_:class_2251 = var_1283.var_4238;
         _loc5_ += "dp3 " + _loc6_ + ".w, " + _loc7_ + ", " + _loc8_ + "\n" + "add " + _loc6_ + ".w, " + _loc6_ + ".w, " + _loc6_ + ".w\n" + "mul " + _loc6_ + ", " + _loc6_ + ".w, " + _loc7_ + "\n" + "sub " + _loc6_ + ", " + _loc6_ + ", " + _loc8_ + "\n" + "tex " + _loc6_ + ", " + _loc6_ + ", " + param2 + " <cube," + (!!param1.var_4636 ? "linear" : "nearest") + ",miplinear>\n" + "mul " + _loc6_ + ".xyz, " + _loc6_ + ", " + param3 + "\n";
         if(arcane::var_366 != null)
         {
            _loc5_ += arcane::var_366(param1,_loc6_,param4,var_1283);
         }
         if(!this.var_3130)
         {
            _loc5_ += "add " + this.var_800 + ".xyz, " + this.var_800 + ", " + _loc6_ + "\n";
            param4.method_771(_loc6_);
         }
         this.var_3130 = false;
         return _loc5_;
      }
      
      override arcane function method_5951(param1:class_2252, param2:class_2237, param3:class_2251) : String
      {
         var _loc4_:String = "";
         if(param1.name_108 == 0)
         {
            return _loc4_;
         }
         if(this.var_712)
         {
            _loc4_ += "mul " + this.var_800 + ".xyz, " + this.var_800 + ", " + this.var_712 + ".w\n";
         }
         if(this._useTexture)
         {
            _loc4_ += "mul " + this.var_800 + ".xyz, " + this.var_800 + ", " + this.var_1287 + ".x\n";
            param2.method_771(this.var_1287);
         }
         _loc4_ += "mul " + this.var_800 + ".xyz, " + this.var_800 + ", " + this.var_2626 + "\n" + "add " + param3 + ".xyz, " + param3 + ", " + this.var_800 + "\n" + "max " + param3 + ".w, " + param3 + ".wwww, " + this.var_800 + ".wwww\n";
         param2.method_771(this.var_800);
         return _loc4_;
      }
      
      override arcane function activate(param1:class_2252, param2:class_1208) : void
      {
         if(param1.name_108 == 0)
         {
            return;
         }
         if(this._useTexture)
         {
            param2.arcane::var_4582.setTextureAt(param1.var_2852,this._texture.method_6425(param2));
         }
         var _loc3_:int = int(param1.var_2676);
         var _loc4_:Vector.<Number>;
         (_loc4_ = param1.var_3329)[_loc3_] = this.arcane::var_3500;
         _loc4_[_loc3_ + 1] = this.arcane::var_1919;
         _loc4_[_loc3_ + 2] = this.arcane::var_2424;
         _loc4_[_loc3_ + 3] = this.var_3166;
      }
      
      private function method_861() : void
      {
         this.arcane::var_3500 = (Number(this.var_2360) >> 16 & 255) / 255 * Number(this.var_2344);
         this.arcane::var_1919 = (Number(this.var_2360) >> 8 & 255) / 255 * Number(this.var_2344);
         this.arcane::var_2424 = (Number(this.var_2360) & 255) / 255 * Number(this.var_2344);
      }
      
      arcane function set shadowRegister(param1:class_2251) : void
      {
         this.var_712 = param1;
      }
   }
}
