package package_366
{
   import away3d.arcane;
   import flash.geom.Matrix3D;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import package_294.class_2429;
   import package_294.class_2602;
   import package_295.class_1752;
   import package_304.class_2114;
   import package_307.class_1776;
   import package_307.class_2449;
   import package_368.class_2416;
   import package_369.class_2116;
   import package_435.class_2414;
   import package_441.class_2430;
   
   public class class_2443 extends class_2105
   {
       
      
      private const const_1341:uint = 65535;
      
      private var var_2578:String;
      
      private var var_1216:Boolean;
      
      private var var_4439:Array;
      
      private var var_3321:Array;
      
      private var var_4596:Array;
      
      private var var_1064:Array;
      
      private var var_3434:Array;
      
      private var _container:class_1752;
      
      private var var_3039:Vector.<class_2114>;
      
      private var var_4068:Boolean;
      
      private var var_172:Array;
      
      private var var_2029:uint;
      
      private var var_3356:uint;
      
      private var var_1831:uint;
      
      private var _state:String = "";
      
      private var var_3362:uint = 0;
      
      private var var_4994:Boolean;
      
      private var var_2024:Boolean;
      
      private var _id:uint;
      
      public function class_2443()
      {
         super(class_2419.const_65);
      }
      
      public static function supportsType(param1:String) : Boolean
      {
         param1 = param1.toLowerCase();
         return param1 == "awd";
      }
      
      public static function supportsData(param1:*) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Number = 100;
         _loc2_ = class_2414.toByteArray(param1);
         if(_loc2_)
         {
            if(_loc2_.length < 100)
            {
               _loc5_ = _loc2_.length;
            }
            _loc2_.position = 0;
            _loc3_ = _loc2_.readUTFBytes(2);
            _loc4_ = _loc2_.readUTFBytes(_loc5_);
         }
         else
         {
            _loc3_ = param1 is String ? String(param1).substr(0,5) : null;
            _loc4_ = param1 is String ? String(param1).substr(0,_loc5_) : null;
         }
         if(_loc3_ == "//" && _loc4_.indexOf("#v:") != -1)
         {
            return true;
         }
         return false;
      }
      
      override arcane function method_3765(param1:class_2416) : void
      {
         if(param1.assets.length != 1)
         {
            return;
         }
         var _loc2_:class_2116 = param1.assets[0] as class_2116;
         var _loc3_:class_2114 = this.method_318(param1.id);
         if(Boolean(_loc3_) && Boolean(_loc2_))
         {
            if(method_810 < 2)
            {
               class_1776(_loc3_.material).texture = _loc2_;
            }
            else
            {
               class_2449(_loc3_.material).texture = _loc2_;
            }
         }
      }
      
      override arcane function resolveDependencyFailure(param1:class_2416) : void
      {
      }
      
      override protected function method_196() : Boolean
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc4_:Number = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc2_:String = String.fromCharCode(10);
         if(!this.var_1216)
         {
            this.var_2578 = method_5311();
            this.var_1216 = true;
         }
         if(this.var_2578.indexOf("#t:bsp") != -1)
         {
            throw new Error("AWD1 holding BSP information is not supported");
         }
         if(this.var_2578.indexOf(_loc2_) == -1 || this.var_2578.indexOf(_loc2_) > 200)
         {
            _loc2_ = String.fromCharCode(13);
         }
         if(!this.var_4068)
         {
            this.var_4068 = true;
            this.var_3039 = new Vector.<class_2114>();
            this.var_1831 = this.var_2578.length;
            this.var_2029 = this.var_2578.indexOf(_loc2_,0);
            this.var_3356 = this.var_2029;
            this.var_4439 = [];
            this.var_3321 = [];
            this.var_4596 = [];
            this.var_3434 = [];
            this.var_1064 = [];
            this._container = new class_1752();
         }
         while(this.var_2029 < this.var_1831 && Boolean(method_2812()))
         {
            this.var_2029 = this.var_2578.indexOf(_loc2_,this.var_3356);
            if(this.var_2029 == -1)
            {
               this.var_2029 = this.var_1831;
            }
            _loc1_ = this.var_2578.substring(this.var_3356,this.var_2029);
            if(this.var_2029 != this.var_1831)
            {
               this.var_3356 = this.var_2029 + 1;
            }
            if(_loc1_.substring(0,1) == "#" && this._state != _loc1_.substring(0,2))
            {
               this._state = _loc1_.substring(0,2);
               this._id = 0;
               this.var_3362 = 0;
               if(this._state == "#v")
               {
                  _loc1_.substring(3,_loc1_.length - 1);
               }
               if(this._state == "#f")
               {
                  this.var_2024 = (parseInt(_loc1_.substring(3,4)) == 2) as Boolean;
               }
               if(this._state == "#t")
               {
                  this.var_4994 = _loc1_.substring(3,7) == "mesh";
               }
            }
            else
            {
               this.var_3434 = _loc1_.split(",");
               if(!(this.var_3434.length <= 1 && !(this._state == "#m" || this._state == "#d")))
               {
                  if(this._state == "#o")
                  {
                     if(this.var_3362 == 0)
                     {
                        this._id = this.var_3434[0];
                        _loc6_ = new Matrix3D(Vector.<Number>([parseFloat(this.var_3434[1]),parseFloat(this.var_3434[5]),parseFloat(this.var_3434[9]),0,parseFloat(this.var_3434[2]),parseFloat(this.var_3434[6]),parseFloat(this.var_3434[10]),0,parseFloat(this.var_3434[3]),parseFloat(this.var_3434[7]),parseFloat(this.var_3434[11]),0,parseFloat(this.var_3434[4]),parseFloat(this.var_3434[8]),parseFloat(this.var_3434[12]),1]));
                        ++this.var_3362;
                     }
                     else
                     {
                        _loc5_ = {
                           "name":(this.var_3434[0] == "" ? "m_" + this._id : this.var_3434[0]),
                           "transform":_loc6_,
                           "container":parseInt(this.var_3434[4]),
                           "bothSides":(this.var_3434[5] == "true" ? true : false),
                           "x":parseFloat(this.var_3434[9]),
                           "y":parseFloat(this.var_3434[10]),
                           "z":parseFloat(this.var_3434[11]),
                           "material":(Boolean(this.var_2024) && this.var_3434[12] != null && this.var_3434[12] != "" ? this.var_3434[12] : null)
                        };
                        this.var_4439.push(_loc5_);
                        this.var_3362 = 0;
                     }
                  }
                  if(this._state == "#d")
                  {
                     switch(this.var_3362)
                     {
                        case 0:
                           this._id = this.var_3321.length;
                           this.var_3321.push({});
                           ++this.var_3362;
                           this.var_3321[this._id].aVstr = _loc1_.substring(2,_loc1_.length);
                           break;
                        case 1:
                           this.var_3321[this._id].aUstr = _loc1_.substring(2,_loc1_.length);
                           this.var_3321[this._id].aV = this.read(this.var_3321[this._id].aVstr).split(",");
                           this.var_3321[this._id].aU = this.read(this.var_3321[this._id].aUstr).split(",");
                           ++this.var_3362;
                           break;
                        case 2:
                           this.var_3321[this._id].f = _loc1_.substring(2,_loc1_.length);
                           this.var_4439[this._id].geo = this.var_3321[this._id];
                           this.var_3362 = 0;
                     }
                  }
                  if(this._state == "#c" && !this.var_4994)
                  {
                     this._id = parseInt(this.var_3434[0]);
                     _loc3_ = this.var_1064.length == 0 ? this._container : new class_1752();
                     _loc6_ = new Matrix3D(Vector.<Number>([parseFloat(this.var_3434[1]),parseFloat(this.var_3434[5]),parseFloat(this.var_3434[9]),0,parseFloat(this.var_3434[2]),parseFloat(this.var_3434[6]),parseFloat(this.var_3434[10]),0,parseFloat(this.var_3434[3]),parseFloat(this.var_3434[7]),parseFloat(this.var_3434[11]),0,parseFloat(this.var_3434[4]),parseFloat(this.var_3434[8]),parseFloat(this.var_3434[12]),1]));
                     _loc3_.transform = _loc6_;
                     _loc3_.name = this.var_3434[13] == "null" || this.var_3434[13] == undefined ? "cont_" + this._id : this.var_3434[13];
                     this.var_1064.push(_loc3_);
                     if(_loc3_ != this._container)
                     {
                        this.var_1064[0].addChild(_loc3_);
                     }
                  }
               }
            }
         }
         if(this.var_2029 >= this.var_1831)
         {
            _loc4_ = 0;
            while(_loc4_ < this.var_4439.length)
            {
               if((Boolean(_loc7_ = this.var_4439[_loc4_])) && Boolean(_loc7_.geo))
               {
                  (_loc8_ = new class_2114(new class_2429(),null)).name = _loc7_.name;
                  this.var_3039.push(_loc8_);
                  if(_loc7_.container != -1 && !this.var_4994)
                  {
                     this.var_1064[_loc7_.container].addChild(_loc8_);
                  }
                  _loc8_.transform = _loc7_.transform;
                  if(method_810 < 2)
                  {
                     _loc8_.material = new class_1776(class_2430.method_1959());
                  }
                  else
                  {
                     _loc8_.material = new class_2449(class_2430.method_1959());
                  }
                  _loc8_.material.bothSides = Boolean(_loc7_.bothSides);
                  if(Boolean(_loc7_.material) && _loc7_.material != "")
                  {
                     method_597(_loc7_.name,new URLRequest(_loc7_.material));
                  }
                  _loc8_.material.name = _loc7_.name;
                  if(Boolean(_loc7_.material) && _loc7_.material != "")
                  {
                     method_597(_loc7_.name,new URLRequest(_loc7_.material));
                  }
                  this.method_2005(_loc7_.geo,_loc8_);
                  method_3342(_loc8_);
               }
               _loc4_++;
            }
            var _loc9_:* = null;
            this.var_172 = null;
            this.var_4439 = this.var_3321 = this.var_4596 = this.var_1064 = _loc9_;
            method_3342(this._container);
            return const_2361;
         }
         return const_2971;
      }
      
      private function method_2005(param1:Object, param2:class_2114) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc11_:* = 0;
         var _loc12_:* = 0;
         var _loc13_:* = 0;
         var _loc14_:* = null;
         var _loc8_:Vector.<Number> = new Vector.<Number>();
         var _loc9_:Vector.<uint> = new Vector.<uint>();
         var _loc10_:Vector.<Number> = new Vector.<Number>();
         _loc6_ = param1.f.split(",");
         if(param1.m)
         {
            _loc7_ = param1.m.split(",");
         }
         var _loc15_:class_2429 = param2.geometry;
         _loc3_ = 0;
         while(_loc3_ < _loc6_.length)
         {
            if(_loc9_.length + 3 > 65535)
            {
               (_loc14_ = new class_2602()).updateIndexData(_loc9_);
               _loc14_.method_5600(_loc8_,_loc10_,null,null);
               _loc15_.method_1586(_loc14_);
               _loc8_ = new Vector.<Number>();
               _loc9_ = new Vector.<uint>();
               _loc10_ = new Vector.<Number>();
               _loc12_ = _loc11_ = _loc13_ = 0;
            }
            _loc9_[_loc12_] = _loc12_;
            _loc12_++;
            _loc9_[_loc12_] = _loc12_;
            _loc12_++;
            _loc9_[_loc12_] = _loc12_;
            _loc12_++;
            _loc4_ = param1.aV[parseInt(_loc6_[_loc3_ + 1],16)].split("/");
            var _loc16_:*;
            _loc8_[_loc16_ = _loc11_++] = parseFloat(_loc4_[0]);
            var _loc17_:*;
            _loc8_[_loc17_ = _loc11_++] = parseFloat(_loc4_[1]);
            var _loc18_:*;
            _loc8_[_loc18_ = _loc11_++] = parseFloat(_loc4_[2]);
            _loc4_ = param1.aV[parseInt(_loc6_[_loc3_],16)].split("/");
            var _loc19_:*;
            _loc8_[_loc19_ = _loc11_++] = parseFloat(_loc4_[0]);
            var _loc20_:*;
            _loc8_[_loc20_ = _loc11_++] = parseFloat(_loc4_[1]);
            var _loc21_:*;
            _loc8_[_loc21_ = _loc11_++] = parseFloat(_loc4_[2]);
            _loc4_ = param1.aV[parseInt(_loc6_[_loc3_ + 2],16)].split("/");
            var _loc22_:*;
            _loc8_[_loc22_ = _loc11_++] = parseFloat(_loc4_[0]);
            var _loc23_:*;
            _loc8_[_loc23_ = _loc11_++] = parseFloat(_loc4_[1]);
            var _loc24_:*;
            _loc8_[_loc24_ = _loc11_++] = parseFloat(_loc4_[2]);
            _loc5_ = param1.aU[parseInt(_loc6_[_loc3_ + 4],16)].split("/");
            var _loc25_:*;
            _loc10_[_loc25_ = _loc13_++] = parseFloat(_loc5_[0]);
            var _loc26_:*;
            _loc10_[_loc26_ = _loc13_++] = 1 - parseFloat(_loc5_[1]);
            _loc5_ = param1.aU[parseInt(_loc6_[_loc3_ + 3],16)].split("/");
            var _loc27_:*;
            _loc10_[_loc27_ = _loc13_++] = parseFloat(_loc5_[0]);
            var _loc28_:*;
            _loc10_[_loc28_ = _loc13_++] = 1 - parseFloat(_loc5_[1]);
            _loc5_ = param1.aU[parseInt(_loc6_[_loc3_ + 5],16)].split("/");
            var _loc29_:*;
            _loc10_[_loc29_ = _loc13_++] = parseFloat(_loc5_[0]);
            var _loc30_:*;
            _loc10_[_loc30_ = _loc13_++] = 1 - parseFloat(_loc5_[1]);
            _loc3_ += 6;
         }
         (_loc14_ = new class_2602()).updateIndexData(_loc9_);
         _loc14_.method_5600(_loc8_,_loc10_,null,null);
         _loc15_.method_1586(_loc14_);
      }
      
      private function method_318(param1:String) : class_2114
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.var_3039.length)
         {
            if(class_2114(this.var_3039[_loc2_]).name == param1)
            {
               return class_2114(this.var_3039[_loc2_]);
            }
            _loc2_++;
         }
         return null;
      }
      
      private function read(param1:String) : String
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         var _loc4_:String = "";
         var _loc5_:int = param1.length;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if(param1.charCodeAt(_loc6_) >= 44 && param1.charCodeAt(_loc6_) <= 48)
            {
               _loc4_ += param1.substring(_loc6_,_loc6_ + 1);
            }
            else
            {
               _loc2_ = _loc6_;
               _loc3_ = "";
               while(param1.charCodeAt(_loc6_) != 44 && param1.charCodeAt(_loc6_) != 45 && param1.charCodeAt(_loc6_) != 46 && param1.charCodeAt(_loc6_) != 47 && _loc6_ <= _loc5_)
               {
                  _loc6_++;
               }
               _loc3_ = "" + parseInt("0x" + param1.substring(_loc2_,_loc6_),16);
               _loc4_ += _loc3_;
               _loc6_--;
            }
            _loc6_++;
         }
         return _loc4_;
      }
   }
}
