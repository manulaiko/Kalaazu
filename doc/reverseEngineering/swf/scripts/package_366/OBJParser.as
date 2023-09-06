package package_366
{
   import away3d.arcane;
   import flash.net.URLRequest;
   import package_293.class_1751;
   import package_293.class_2131;
   import package_294.class_2425;
   import package_294.class_2429;
   import package_304.class_2114;
   import package_307.class_1772;
   import package_307.class_1776;
   import package_307.class_2446;
   import package_307.class_2448;
   import package_307.class_2449;
   import package_310.class_2241;
   import package_368.class_2416;
   import package_369.class_2116;
   import package_434.class_2450;
   import package_435.class_2414;
   import package_441.class_2430;
   import package_442.class_2444;
   import package_442.class_2447;
   
   public class OBJParser extends class_2105
   {
       
      
      private var var_2578:String;
      
      private var var_1216:Boolean;
      
      private var var_2029:uint;
      
      private var var_3356:uint;
      
      private var var_1831:uint;
      
      private var var_3283:ObjectGroup;
      
      private var var_4811:Group;
      
      private var var_1261:MaterialGroup;
      
      private var _objects:Vector.<ObjectGroup>;
      
      private var var_600:Vector.<String>;
      
      private var var_3509:Vector.<LoadedMaterial>;
      
      private var var_4817:Vector.<SpecularData>;
      
      private var var_557:Vector.<class_2114>;
      
      private var var_2963:String;
      
      private var var_4497:uint;
      
      private var var_4660:Array;
      
      private var var_2515:uint;
      
      private var _vertices:Vector.<class_2447>;
      
      private var var_3048:Vector.<class_2447>;
      
      private var var_172:Vector.<class_2444>;
      
      private var _scale:Number;
      
      private var var_2162:Boolean;
      
      private var var_132:Boolean = true;
      
      private var var_1982:String = "";
      
      public function OBJParser(param1:Number = 1)
      {
         super(class_2419.const_65);
         this._scale = param1;
      }
      
      public static function supportsType(param1:String) : Boolean
      {
         param1 = param1.toLowerCase();
         return param1 == "obj";
      }
      
      public static function supportsData(param1:*) : Boolean
      {
         var _loc3_:* = false;
         var _loc4_:* = false;
         var _loc2_:String = class_2414.toString(param1);
         if(_loc2_)
         {
            _loc3_ = _loc2_.indexOf("\nv ") != -1;
            _loc4_ = _loc2_.indexOf("\nf ") != -1;
         }
         return _loc3_ && _loc4_;
      }
      
      public function set scale(param1:Number) : void
      {
         this._scale = param1;
      }
      
      override arcane function method_3765(param1:class_2416) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1.id == "mtl")
         {
            _loc2_ = class_2414.toString(param1.data);
            this.method_1833(_loc2_);
         }
         else
         {
            if(param1.assets.length != 1)
            {
               return;
            }
            _loc3_ = param1.assets[0];
            if(_loc3_.assetType == class_2131.TEXTURE)
            {
               (_loc4_ = new LoadedMaterial()).materialID = param1.id;
               _loc4_.texture = _loc3_ as class_2116;
               this.var_3509.push(_loc4_);
               if(this.var_557.length > 0)
               {
                  this.method_6429(_loc4_);
               }
            }
         }
      }
      
      override arcane function resolveDependencyFailure(param1:class_2416) : void
      {
         var _loc2_:* = null;
         if(param1.id == "mtl")
         {
            this.var_2162 = false;
            this.var_132 = false;
         }
         else
         {
            _loc2_ = new LoadedMaterial();
            _loc2_.materialID = param1.id;
            this.var_3509.push(_loc2_);
         }
         if(this.var_557.length > 0)
         {
            this.method_6429(_loc2_);
         }
      }
      
      override protected function method_196() : Boolean
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc2_:String = String.fromCharCode(10);
         if(!this.var_1216)
         {
            this.var_2578 = method_5311();
            this.var_2578 = this.var_2578.replace(/\\[\r\n]+\s*/gm," ");
         }
         if(this.var_2578.indexOf(_loc2_) == -1)
         {
            _loc2_ = String.fromCharCode(13);
         }
         if(!this.var_1216)
         {
            this.var_1216 = true;
            this._vertices = new Vector.<class_2447>();
            this.var_3048 = new Vector.<class_2447>();
            this.var_600 = new Vector.<String>();
            this.var_3509 = new Vector.<LoadedMaterial>();
            this.var_557 = new Vector.<class_2114>();
            this.var_172 = new Vector.<class_2444>();
            this.var_1831 = this.var_2578.length;
            this.var_2029 = this.var_2578.indexOf(_loc2_,0);
            this.var_3356 = 0;
            this._objects = new Vector.<ObjectGroup>();
            this.var_4497 = 0;
         }
         while(this.var_2029 < this.var_1831 && Boolean(method_2812()))
         {
            this.var_2029 = this.var_2578.indexOf(_loc2_,this.var_3356);
            if(this.var_2029 == -1)
            {
               this.var_2029 = this.var_1831;
            }
            _loc1_ = this.var_2578.substring(this.var_3356,this.var_2029);
            _loc1_ = _loc1_.split("\r").join("");
            _loc1_ = _loc1_.replace("  "," ");
            _loc3_ = _loc1_.split(" ");
            this.var_3356 = this.var_2029 + 1;
            this.method_3176(_loc3_);
            if(method_3984)
            {
               return const_2971;
            }
         }
         if(this.var_2029 >= this.var_1831)
         {
            if(Boolean(this.var_2162) && !this.var_132)
            {
               return const_2971;
            }
            this.translate();
            this.method_5822();
            return const_2361;
         }
         return const_2971;
      }
      
      private function method_3176(param1:Array) : void
      {
         switch(param1[0])
         {
            case "mtllib":
               this.var_2162 = true;
               this.var_132 = false;
               this.method_4330(param1[1]);
               break;
            case "g":
               this.method_3105(param1);
               break;
            case "o":
               this.method_1924(param1);
               break;
            case "usemtl":
               if(this.var_2162)
               {
                  if(!param1[1])
                  {
                     param1[1] = "def000";
                  }
                  this.var_600.push(param1[1]);
                  this.var_1982 = param1[1];
                  if(this.var_4811)
                  {
                     this.var_4811.materialID = this.var_1982;
                     break;
                  }
                  break;
               }
               break;
            case "v":
               this.method_6301(param1);
               break;
            case "vt":
               this.method_2116(param1);
               break;
            case "vn":
               this.method_15(param1);
               break;
            case "f":
               this.method_4879(param1);
         }
      }
      
      private function translate() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = 0;
         var _loc4_:* = null;
         var _loc5_:* = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         var _loc10_:* = null;
         var _loc11_:Number = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this._objects.length)
         {
            _loc2_ = this._objects[_loc1_].groups;
            _loc3_ = _loc2_.length;
            _loc11_ = 0;
            while(_loc11_ < _loc3_)
            {
               _loc6_ = new class_2429();
               _loc5_ = (_loc4_ = _loc2_[_loc11_].materialGroups).length;
               _loc8_ = 0;
               while(_loc8_ < _loc5_)
               {
                  this.method_5283(_loc4_[_loc8_],_loc6_);
                  _loc8_++;
               }
               if(_loc6_.subGeometries.length != 0)
               {
                  method_3342(_loc6_,"");
                  if(method_810 < 2)
                  {
                     _loc10_ = new class_1776(class_2430.method_1959());
                  }
                  else
                  {
                     _loc10_ = new class_2449(class_2430.method_1959());
                  }
                  _loc7_ = new class_2114(_loc6_,_loc10_);
                  if(this._objects[_loc1_].name)
                  {
                     _loc7_.name = this._objects[_loc1_].name;
                  }
                  else if(_loc2_[_loc11_].name)
                  {
                     _loc7_.name = _loc2_[_loc11_].name;
                  }
                  else
                  {
                     _loc7_.name = "";
                  }
                  this.var_557.push(_loc7_);
                  if(_loc2_[_loc11_].materialID != "")
                  {
                     _loc10_.name = _loc2_[_loc11_].materialID + "~" + _loc7_.name;
                  }
                  else
                  {
                     _loc10_.name = this.var_2963 + "~" + _loc7_.name;
                  }
                  if(_loc7_.method_3381.length > 1)
                  {
                     _loc9_ = 1;
                     while(_loc9_ < _loc7_.method_3381.length)
                     {
                        _loc7_.method_3381[_loc9_].material = _loc10_;
                        _loc9_++;
                     }
                  }
                  method_3342(_loc7_);
               }
               _loc11_++;
            }
            _loc1_++;
         }
      }
      
      private function method_5283(param1:MaterialGroup, param2:class_2429) : void
      {
         var _loc4_:* = null;
         var _loc6_:* = 0;
         var _loc7_:* = null;
         var _loc12_:Number = 0;
         var _loc3_:Vector.<FaceData> = param1.faces;
         var _loc5_:uint = _loc3_.length;
         var _loc8_:Vector.<Number> = new Vector.<Number>();
         var _loc9_:Vector.<Number> = new Vector.<Number>();
         var _loc10_:Vector.<Number> = new Vector.<Number>();
         var _loc11_:Vector.<uint> = new Vector.<uint>();
         this.var_4660 = [];
         this.var_2515 = 0;
         var _loc13_:Number = 0;
         while(_loc13_ < _loc5_)
         {
            _loc6_ = (_loc4_ = _loc3_[_loc13_]).indexIds.length - 1;
            _loc12_ = 1;
            while(_loc12_ < _loc6_)
            {
               this.method_4921(_loc4_,_loc12_,_loc8_,_loc9_,_loc11_,_loc10_);
               this.method_4921(_loc4_,0,_loc8_,_loc9_,_loc11_,_loc10_);
               this.method_4921(_loc4_,_loc12_ + 1,_loc8_,_loc9_,_loc11_,_loc10_);
               _loc12_++;
            }
            _loc13_++;
         }
         if(_loc8_.length > 0)
         {
            _loc7_ = class_2450.method_5600(_loc8_,_loc11_,_loc9_,_loc10_,null,null,null);
            _loc13_ = 0;
            while(_loc13_ < _loc7_.length)
            {
               param2.method_1586(_loc7_[_loc13_]);
               _loc13_++;
            }
         }
      }
      
      private function method_4921(param1:FaceData, param2:int, param3:Vector.<Number>, param4:Vector.<Number>, param5:Vector.<uint>, param6:Vector.<Number>) : void
      {
         var var_654:uint = 0;
         var var_652:class_2447 = null;
         var var_4959:class_2447 = null;
         var var_247:class_2444 = null;
         var var_4155:FaceData = param1;
         var var_2946:int = param2;
         var var_197:Vector.<Number> = param3;
         var var_1051:Vector.<Number> = param4;
         var var_4658:Vector.<uint> = param5;
         var var_2038:Vector.<Number> = param6;
         if(!this.var_4660[var_4155.indexIds[var_2946]])
         {
            var_654 = uint(this.var_2515);
            this.var_4660[var_4155.indexIds[var_2946]] = ++this.var_2515;
            var_652 = this._vertices[var_4155.vertexIndices[var_2946] - 1];
            var_197.push(Number(var_652.x) * Number(this._scale),Number(var_652.y) * Number(this._scale),Number(var_652.z) * Number(this._scale));
            if(var_4155.normalIndices.length > 0)
            {
               var_4959 = this.var_3048[var_4155.normalIndices[var_2946] - 1];
               var_2038.push(var_4959.x,var_4959.y,var_4959.z);
            }
            if(var_4155.uvIndices.length > 0)
            {
               try
               {
                  var_247 = this.var_172[var_4155.uvIndices[var_2946] - 1];
                  var_1051.push(var_247.u,var_247.v);
               }
               catch(e:Error)
               {
                  switch(var_2946)
                  {
                     case 0:
                        var_1051.push(0,1);
                        break;
                     case 1:
                        var_1051.push(0.5,0);
                        break;
                     case 2:
                        var_1051.push(1,1);
                  }
               }
            }
         }
         else
         {
            var_654 = this.var_4660[var_4155.indexIds[var_2946]] - 1;
         }
         var_4658.push(var_654);
      }
      
      private function method_1924(param1:Array) : void
      {
         this.var_4811 = null;
         this.var_1261 = null;
         this._objects.push(this.var_3283 = new ObjectGroup());
         if(param1)
         {
            this.var_3283.name = param1[1];
         }
      }
      
      private function method_3105(param1:Array) : void
      {
         if(!this.var_3283)
         {
            this.method_1924(null);
         }
         this.var_4811 = new Group();
         this.var_4811.materialID = this.var_1982;
         if(param1)
         {
            this.var_4811.name = param1[1];
         }
         this.var_3283.groups.push(this.var_4811);
         this.method_4964(null);
      }
      
      private function method_4964(param1:Array) : void
      {
         this.var_1261 = new MaterialGroup();
         if(param1)
         {
            this.var_1261.url = param1[1];
         }
         this.var_4811.materialGroups.push(this.var_1261);
      }
      
      private function method_6301(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = 0;
         if(param1.length > 4)
         {
            _loc2_ = [];
            _loc4_ = 1;
            while(_loc4_ < param1.length)
            {
               _loc3_ = parseFloat(param1[_loc4_]);
               if(!isNaN(_loc3_))
               {
                  _loc2_.push(_loc3_);
               }
               _loc4_++;
            }
            this._vertices.push(new class_2447(_loc2_[0],_loc2_[1],-Number(_loc2_[2])));
         }
         else
         {
            this._vertices.push(new class_2447(parseFloat(param1[1]),parseFloat(param1[2]),-parseFloat(param1[3])));
         }
      }
      
      private function method_2116(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = 0;
         if(param1.length > 3)
         {
            _loc2_ = [];
            _loc4_ = 1;
            while(_loc4_ < param1.length)
            {
               _loc3_ = parseFloat(param1[_loc4_]);
               if(!isNaN(_loc3_))
               {
                  _loc2_.push(_loc3_);
               }
               _loc4_++;
            }
            this.var_172.push(new class_2444(_loc2_[0],1 - Number(_loc2_[1])));
         }
         else
         {
            this.var_172.push(new class_2444(parseFloat(param1[1]),1 - parseFloat(param1[2])));
         }
      }
      
      private function method_15(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = 0;
         if(param1.length > 4)
         {
            _loc2_ = [];
            _loc4_ = 1;
            while(_loc4_ < param1.length)
            {
               _loc3_ = parseFloat(param1[_loc4_]);
               if(!isNaN(_loc3_))
               {
                  _loc2_.push(_loc3_);
               }
               _loc4_++;
            }
            this.var_3048.push(new class_2447(_loc2_[0],_loc2_[1],-Number(_loc2_[2])));
         }
         else
         {
            this.var_3048.push(new class_2447(parseFloat(param1[1]),parseFloat(param1[2]),-parseFloat(param1[3])));
         }
      }
      
      private function method_4879(param1:Array) : void
      {
         var _loc4_:* = null;
         var _loc2_:uint = param1.length;
         var _loc3_:FaceData = new FaceData();
         if(!this.var_4811)
         {
            this.method_3105(null);
         }
         var _loc5_:Number = 1;
         while(_loc5_ < _loc2_)
         {
            if(param1[_loc5_] != "")
            {
               _loc4_ = param1[_loc5_].split("/");
               _loc3_.vertexIndices.push(this.method_414(parseInt(_loc4_[0]),this._vertices.length));
               if(Boolean(_loc4_[1]) && String(_loc4_[1]).length > 0)
               {
                  _loc3_.uvIndices.push(this.method_414(parseInt(_loc4_[1]),this.var_172.length));
               }
               if(Boolean(_loc4_[2]) && String(_loc4_[2]).length > 0)
               {
                  _loc3_.normalIndices.push(this.method_414(parseInt(_loc4_[2]),this.var_3048.length));
               }
               _loc3_.indexIds.push(param1[_loc5_]);
            }
            _loc5_++;
         }
         this.var_1261.faces.push(_loc3_);
      }
      
      private function method_414(param1:int, param2:uint) : int
      {
         if(param1 < 0)
         {
            return param1 + param2 + 1;
         }
         return param1;
      }
      
      private function method_1833(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Number = 0;
         var _loc6_:* = null;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         var _loc11_:* = 0;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc2_:Array = param1.split("newmtl");
         var _loc15_:Number = 0;
         while(_loc15_ < _loc2_.length)
         {
            _loc3_ = (_loc2_[_loc15_].split("\r") as Array).join("").split("\n");
            if(_loc3_.length == 1)
            {
               _loc3_ = _loc2_[_loc15_].split(String.fromCharCode(13));
            }
            _loc9_ = _loc10_ = _loc11_ = 16777215;
            _loc12_ = 0;
            _loc7_ = false;
            _loc8_ = false;
            _loc13_ = 1;
            _loc14_ = "";
            _loc5_ = 0;
            for(; _loc5_ < _loc3_.length; _loc5_++)
            {
               _loc3_[_loc5_] = _loc3_[_loc5_].replace(/\s+$/,"");
               if(_loc3_[_loc5_].substring(0,1) != "#" && (_loc5_ == 0 || _loc3_[_loc5_] != ""))
               {
                  _loc4_ = _loc3_[_loc5_].split(" ");
                  if(String(_loc4_[0]).charCodeAt(0) == 9 || String(_loc4_[0]).charCodeAt(0) == 32)
                  {
                     _loc4_[0] = _loc4_[0].substring(1,_loc4_[0].length);
                  }
                  if(_loc5_ == 0)
                  {
                     this.var_2963 = _loc4_.join("");
                     this.var_2963 = this.var_2963 == "" ? "def000" : this.var_2963;
                  }
                  else
                  {
                     switch(_loc4_[0])
                     {
                        case "Ka":
                           if(_loc4_[1] && !isNaN(Number(_loc4_[1])) && _loc4_[2] && !isNaN(Number(_loc4_[2])) && Boolean(_loc4_[3]) && !isNaN(Number(_loc4_[3])))
                           {
                              _loc10_ = Number(_loc4_[1]) * 255 << 16 | Number(_loc4_[2]) * 255 << 8 | Number(_loc4_[3]) * 255;
                           }
                           continue;
                        case "Ks":
                           if(_loc4_[1] && !isNaN(Number(_loc4_[1])) && _loc4_[2] && !isNaN(Number(_loc4_[2])) && Boolean(_loc4_[3]) && !isNaN(Number(_loc4_[3])))
                           {
                              _loc11_ = Number(_loc4_[1]) * 255 << 16 | Number(_loc4_[2]) * 255 << 8 | Number(_loc4_[3]) * 255;
                              _loc7_ = true;
                           }
                           continue;
                        case "Ns":
                           if(Boolean(_loc4_[1]) && !isNaN(Number(_loc4_[1])))
                           {
                              _loc12_ = Number(_loc4_[1]) * 0.001;
                           }
                           if(_loc12_ == 0)
                           {
                              _loc7_ = false;
                           }
                           continue;
                        case "Kd":
                           if(_loc4_[1] && !isNaN(Number(_loc4_[1])) && _loc4_[2] && !isNaN(Number(_loc4_[2])) && Boolean(_loc4_[3]) && !isNaN(Number(_loc4_[3])))
                           {
                              _loc9_ = Number(_loc4_[1]) * 255 << 16 | Number(_loc4_[2]) * 255 << 8 | Number(_loc4_[3]) * 255;
                              _loc8_ = true;
                           }
                           continue;
                        case "tr":
                        case "d":
                           if(Boolean(_loc4_[1]) && !isNaN(Number(_loc4_[1])))
                           {
                              _loc13_ = Number(_loc4_[1]);
                           }
                           continue;
                        case "map_Kd":
                           _loc14_ = (_loc14_ = this.method_2072(_loc4_)).replace(/\\/g,"/");
                     }
                  }
               }
            }
            if(_loc14_ != "")
            {
               if(_loc7_)
               {
                  (_loc6_ = new class_2241()).specularColor = _loc11_;
                  _loc6_.specular = _loc12_;
                  (_loc16_ = new SpecularData()).alpha = _loc13_;
                  _loc16_.basicSpecularMethod = _loc6_;
                  _loc16_.materialID = this.var_2963;
                  if(!this.var_4817)
                  {
                     this.var_4817 = new Vector.<SpecularData>();
                  }
                  this.var_4817.push(_loc16_);
               }
               method_597(this.var_2963,new URLRequest(_loc14_));
            }
            else if(_loc8_ && !isNaN(_loc9_))
            {
               (_loc17_ = new LoadedMaterial()).materialID = this.var_2963;
               if(_loc13_ == 0)
               {
               }
               if(method_810 < 2)
               {
                  _loc18_ = new class_2448(_loc9_);
                  class_2448(_loc18_).alpha = _loc13_;
                  class_2448(_loc18_).ambientColor = _loc10_;
                  class_2448(_loc18_).repeat = true;
                  if(_loc7_)
                  {
                     class_2448(_loc18_).specularColor = _loc11_;
                     class_2448(_loc18_).specular = _loc12_;
                  }
               }
               else
               {
                  _loc18_ = new class_2446(_loc9_);
                  class_2446(_loc18_).ambientColor = _loc10_;
                  class_2446(_loc18_).repeat = true;
                  if(_loc7_)
                  {
                     class_2446(_loc18_).specularColor = _loc11_;
                     class_2446(_loc18_).specular = _loc12_;
                  }
               }
               _loc17_.cm = _loc18_;
               this.var_3509.push(_loc17_);
               if(this.var_557.length > 0)
               {
                  this.method_6429(_loc17_);
               }
            }
            _loc15_++;
         }
         this.var_132 = true;
      }
      
      private function method_2072(param1:Array) : String
      {
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         var _loc2_:* = "";
         _loc3_ = 1;
         while(_loc3_ < param1.length)
         {
            switch(param1[_loc3_])
            {
               case "-blendu":
               case "-blendv":
               case "-cc":
               case "-clamp":
               case "-texres":
                  _loc3_ += 2;
                  break;
               case "-mm":
                  _loc3_ += 3;
                  break;
               case "-o":
               case "-s":
               case "-t":
                  _loc3_ += 4;
                  continue;
               default:
                  _loc4_ = true;
            }
            if(_loc4_)
            {
               break;
            }
         }
         while(_loc3_ < param1.length)
         {
            _loc2_ += param1[_loc3_];
            _loc2_ += " ";
            _loc3_++;
         }
         return _loc2_.replace(/\s+$/,"");
      }
      
      private function method_4330(param1:String) : void
      {
         method_597("mtl",new URLRequest(param1),true);
         method_1516();
      }
      
      private function method_6429(param1:LoadedMaterial) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Number = 0;
         var _loc6_:* = null;
         var _loc7_:Number = 0;
         while(_loc7_ < this.var_557.length)
         {
            _loc3_ = this.var_557[_loc7_];
            _loc2_ = _loc3_.material.name.split("~");
            if(_loc2_[0] == param1.materialID)
            {
               if(param1.cm)
               {
                  if(_loc3_.material)
                  {
                     _loc3_.material = null;
                  }
                  _loc3_.material = param1.cm;
               }
               else if(param1.texture)
               {
                  if(method_810 < 2)
                  {
                     _loc4_ = class_1776(_loc3_.material);
                     class_1776(_loc4_).texture = param1.texture;
                     class_1776(_loc4_).ambientColor = param1.ambientColor;
                     class_1776(_loc4_).alpha = param1.alpha;
                     class_1776(_loc4_).repeat = true;
                     if(param1.specularMethod)
                     {
                        class_1776(_loc4_).specularMethod = null;
                        class_1776(_loc4_).specularMethod = param1.specularMethod;
                     }
                     else if(this.var_4817)
                     {
                        _loc5_ = 0;
                        while(true)
                        {
                           if(_loc5_ < this.var_4817.length)
                           {
                              if((_loc6_ = this.var_4817[_loc5_]).materialID != param1.materialID)
                              {
                                 continue;
                              }
                              class_1776(_loc4_).specularMethod = null;
                              class_1776(_loc4_).specularMethod = _loc6_.basicSpecularMethod;
                              class_1776(_loc4_).ambientColor = _loc6_.ambientColor;
                              class_1776(_loc4_).alpha = _loc6_.alpha;
                           }
                        }
                     }
                  }
                  else
                  {
                     _loc4_ = class_2449(_loc3_.material);
                     class_2449(_loc4_).texture = param1.texture;
                     class_2449(_loc4_).ambientColor = param1.ambientColor;
                     class_2449(_loc4_).repeat = true;
                     if(param1.specularMethod)
                     {
                        class_2449(_loc4_).specularMethod = null;
                        class_2449(_loc4_).specularMethod = param1.specularMethod;
                     }
                     else if(this.var_4817)
                     {
                        _loc5_ = 0;
                        while(_loc5_ < this.var_4817.length)
                        {
                           if((_loc6_ = this.var_4817[_loc5_]).materialID == param1.materialID)
                           {
                              class_2449(_loc4_).specularMethod = null;
                              class_2449(_loc4_).specularMethod = _loc6_.basicSpecularMethod;
                              class_2449(_loc4_).ambientColor = _loc6_.ambientColor;
                              break;
                           }
                           _loc5_++;
                        }
                     }
                  }
               }
               _loc3_.material.name = !!_loc2_[1] ? _loc2_[1] : _loc2_[0];
               this.var_557.splice(_loc7_,1);
               _loc7_--;
            }
            _loc7_++;
         }
         if(Boolean(param1.cm) || Boolean(_loc4_))
         {
            method_3342(param1.cm || _loc4_);
         }
      }
      
      private function method_5822() : void
      {
         if(this.var_3509.length == 0)
         {
            return;
         }
         var _loc1_:Number = 0;
         while(_loc1_ < this.var_3509.length)
         {
            this.method_6429(this.var_3509[_loc1_]);
            _loc1_++;
         }
      }
   }
}

class ObjectGroup
{
    
   
   public var name:String;
   
   public var groups:Vector.<Group>;
   
   function ObjectGroup()
   {
      this.groups = new Vector.<Group>();
      super();
   }
}

class Group
{
    
   
   public var name:String;
   
   public var materialID:String;
   
   public var materialGroups:Vector.<MaterialGroup>;
   
   function Group()
   {
      this.materialGroups = new Vector.<MaterialGroup>();
      super();
   }
}

class MaterialGroup
{
    
   
   public var url:String;
   
   public var faces:Vector.<FaceData>;
   
   function MaterialGroup()
   {
      this.faces = new Vector.<FaceData>();
      super();
   }
}

import package_310.class_2241;

class SpecularData
{
    
   
   public var materialID:String;
   
   public var basicSpecularMethod:class_2241;
   
   public var ambientColor:uint = 16777215;
   
   public var alpha:Number = 1;
   
   function SpecularData()
   {
      super();
   }
}

import package_307.class_1772;
import package_310.class_2241;
import package_369.class_2116;

class LoadedMaterial
{
    
   
   public var materialID:String;
   
   public var texture:class_2116;
   
   public var cm:class_1772;
   
   public var specularMethod:class_2241;
   
   public var ambientColor:uint = 16777215;
   
   public var alpha:Number = 1;
   
   function LoadedMaterial()
   {
      super();
   }
}

class FaceData
{
    
   
   public var vertexIndices:Vector.<uint>;
   
   public var uvIndices:Vector.<uint>;
   
   public var normalIndices:Vector.<uint>;
   
   public var indexIds:Vector.<String>;
   
   function FaceData()
   {
      this.vertexIndices = new Vector.<uint>();
      this.uvIndices = new Vector.<uint>();
      this.normalIndices = new Vector.<uint>();
      this.indexIds = new Vector.<String>();
      super();
   }
}
