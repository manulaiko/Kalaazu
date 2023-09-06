package package_302
{
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import flash.geom.Vector3D;
   import net.bigpoint.darkorbit.map.view3D.display3D.class_1210;
   import package_22.class_1078;
   import package_22.class_1084;
   import package_22.class_198;
   import package_295.class_1752;
   import package_304.class_2114;
   import package_308.class_1777;
   import package_369.class_2116;
   import package_446.Merge;
   import package_99.class_266;
   
   public class class_2156 extends class_1752
   {
      
      private static const const_677:Class = class_2481;
      
      private static const const_979:int = 5021;
      
      private static const const_1844:int = 3132;
      
      private static const MARGIN:int = 0;
       
      
      private var var_2831:BitmapData;
      
      private var _bounds:Rectangle;
      
      private var var_3208:Number = 0.1;
      
      private var pattern:class_1084;
      
      private var var_2575:class_1078;
      
      private var var_3321:Vector.<class_2114>;
      
      private var var_3470:Vector.<class_2116>;
      
      private var _normal:class_2116;
      
      private var var_2344:class_2116;
      
      private var var_760:class_2116;
      
      private var var_4877:int = 0;
      
      private var var_4640:int = 0;
      
      private var var_3709:int = 0;
      
      private var var_3012:int = 0;
      
      public function class_2156(param1:int, param2:Rectangle, param3:int, param4:int)
      {
         var _loc7_:Number = NaN;
         this.var_3321 = new Vector.<class_2114>();
         super();
         this._bounds = param2;
         if(this._bounds.left < -Number(MARGIN))
         {
            this._bounds.left = -Number(MARGIN);
         }
         if(this._bounds.right > param3 + MARGIN)
         {
            this._bounds.right = param3 + MARGIN;
         }
         if(this._bounds.top < -Number(MARGIN))
         {
            this._bounds.top = -Number(MARGIN);
         }
         if(this._bounds.bottom > param4 + MARGIN)
         {
            this._bounds.bottom = param4 + MARGIN;
         }
         var _loc5_:Number = param2.width * Number(this.var_3208);
         var _loc6_:Number = param2.height * Number(this.var_3208);
         if(_loc5_ > const_979 || _loc6_ > const_1844)
         {
            _loc7_ = Math.max(_loc5_ / Number(const_979),_loc6_ / Number(const_1844));
            this.var_3208 /= _loc7_;
            _loc5_ /= _loc7_;
            _loc6_ /= _loc7_;
         }
         this.var_2831 = new BitmapData(int(_loc5_),int(_loc6_),true,0);
         this.pattern = class_198.var_103[param1] as class_1084;
         this.var_2575 = this.pattern.method_170;
      }
      
      public function get method_3162() : BitmapData
      {
         return this.var_2831;
      }
      
      public function get method_4662() : Number
      {
         return this.var_3208;
      }
      
      override public function dispose() : void
      {
         this.var_2831.dispose();
         this.var_2831 = null;
         this.method_2491();
         super.dispose();
      }
      
      public function get bounds() : Rectangle
      {
         return this._bounds;
      }
      
      public function update() : void
      {
         var _loc2_:* = null;
         if(!this.var_2575.geometry)
         {
            return;
         }
         this.var_3321.length = 0;
         var _loc1_:Vector.<String> = this.var_2575.geometry;
         this.var_4877 = _loc1_.length;
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_)
            {
               class_1210.instance.method_3761.method_3479(_loc2_,class_1210.const_2984).addOnce(this.method_6145);
            }
            else
            {
               --this.var_4877;
            }
         }
      }
      
      private function method_6145(param1:class_1752) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(param1)
         {
            _loc2_ = new class_2114(null);
            _loc3_ = new Merge();
            _loc3_.method_4327(_loc2_,param1);
            this.var_3321.push(_loc2_);
         }
         if(--this.var_4877 <= 0)
         {
            this.method_3116();
         }
      }
      
      private function method_3116() : void
      {
         var _loc2_:* = null;
         var _loc1_:Vector.<String> = this.var_2575.textureDiff;
         this.var_4640 = _loc1_.length;
         this.var_3470 = new Vector.<class_2116>();
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_)
            {
               class_1210.instance.method_3562.loadTexture(_loc2_,class_1210.const_2984).addOnce(this.method_4847);
            }
            else
            {
               --this.var_4640;
            }
         }
      }
      
      private function method_4847(param1:class_2116) : void
      {
         ++this.var_3012;
         if(param1)
         {
            this.var_3470.push(param1);
         }
         if(this.var_3012 >= this.var_4640)
         {
            if(this.var_2575.textureNormal.length >= 1)
            {
               class_1210.instance.method_3562.loadTexture(this.var_2575.textureNormal[0],class_1210.const_2984).addOnce(this.method_4774);
            }
            else
            {
               this.method_4774(null);
            }
         }
      }
      
      private function method_4774(param1:class_2116) : void
      {
         this._normal = param1;
         if(this.var_2575.textureSpecular.length >= 1)
         {
            class_1210.instance.method_3562.loadTexture(this.var_2575.textureSpecular[0],class_1210.const_2984).addOnce(this.method_4360);
         }
         else
         {
            this.method_4360(null);
         }
      }
      
      private function method_4360(param1:class_2116) : void
      {
         this.var_2344 = param1;
         if(this.var_2575.textureAlphaMask.length >= 1)
         {
            class_1210.instance.method_3562.loadTexture(this.var_2575.textureAlphaMask[0],class_1210.const_2984).addOnce(this.method_839);
         }
         else
         {
            this.method_2495();
         }
      }
      
      private function method_839(param1:class_2116) : void
      {
         this.var_760 = param1;
         this.method_2495();
      }
      
      private function method_2495() : void
      {
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:Number = NaN;
         var _loc16_:* = null;
         var _loc17_:Boolean = false;
         var _loc18_:* = null;
         this.method_2491();
         var _loc1_:class_1084 = this.pattern;
         var _loc2_:int = Math.round(Number(this._bounds.width) / Number(_loc1_.tileWidth));
         var _loc3_:int = Math.round(Number(this._bounds.height) / Number(_loc1_.tileHeight));
         var _loc4_:int;
         if((_loc4_ = Number(this._bounds.x) % Number(_loc1_.tileWidth)) < 0)
         {
            _loc4_ += _loc1_.tileWidth;
         }
         var _loc5_:int;
         if((_loc5_ = Number(this._bounds.y) % Number(_loc1_.tileHeight)) < 0)
         {
            _loc5_ += _loc1_.tileHeight;
         }
         _loc4_ = 0;
         _loc5_ = 0;
         _loc2_ = _loc2_ < 1 ? 1 : _loc2_;
         _loc3_ = _loc3_ < 1 ? 1 : _loc3_;
         if(_loc2_ >= 1 && _loc3_ >= 1)
         {
            if((_loc9_ = this.method_3162) != null)
            {
               _loc10_ = new Vector.<class_1777>();
               _loc11_ = 0;
               while(_loc11_ < this.var_3470.length)
               {
                  (_loc16_ = new class_1777()).texture = this.var_3470[_loc11_];
                  _loc16_.alphaBlending = this.var_2575.alphaBlending;
                  _loc16_.alphaPremultiplied = this.var_2575.alphaPremultiplied;
                  if(_loc17_ = Boolean(this.var_2575.useLights))
                  {
                     _loc16_.lightPicker = class_1210.instance.name_10.method_1066;
                     _loc16_.specularMap = this.var_2344;
                     _loc16_.normalMap = this._normal;
                  }
                  if(this.var_760)
                  {
                     _loc16_.alphaMask = this.var_760;
                  }
                  _loc10_.push(_loc16_);
                  _loc11_++;
               }
               _loc12_ = new class_1752();
               _loc13_ = int(this.var_3321.length);
               _loc14_ = null;
               _loc15_ = 0;
               _loc7_ = 0;
               while(_loc7_ < _loc3_)
               {
                  _loc8_ = 0;
                  while(_loc8_ < _loc2_)
                  {
                     _loc14_ = _loc10_[_loc15_];
                     _loc15_ = (_loc15_ + 1) % _loc10_.length;
                     if(this.method_4674(_loc8_,_loc7_,_loc9_,_loc2_,_loc3_))
                     {
                        _loc6_ = int(class_266.getRandomCount(0,_loc13_ - 1));
                        if(!this.method_4674(_loc8_,_loc7_ + 1,_loc9_,_loc2_,_loc3_))
                        {
                           while(this.var_2575.deepTiles.indexOf(this.var_2575.geometry[_loc6_]) != -1)
                           {
                              _loc6_ = int(class_266.getRandomCount(0,_loc13_ - 1));
                           }
                        }
                        (_loc18_ = class_2114(this.var_3321[_loc6_]).clone() as class_2114).material = _loc14_;
                        _loc18_.x = this._bounds.x + _loc8_ * Number(_loc1_.tileWidth) + _loc4_ + 128;
                        _loc18_.y += -0.5 * Number(this.var_2575.ySpread) + Math.random() * Number(this.var_2575.ySpread);
                        _loc18_.z = -(this._bounds.y + _loc7_ * Number(_loc1_.tileHeight) + _loc5_ + 128);
                        if(this.var_2575.randomGeometryRotation)
                        {
                           _loc18_.rotate(Vector3D.Y_AXIS,int(Math.random() * 4) * 90);
                        }
                        if(this.var_2575.enlargeInnerTilesFactor != 1 && Boolean(this.method_4866(_loc8_,_loc7_,_loc9_,_loc2_,_loc3_)))
                        {
                           _loc18_.scale(this.var_2575.enlargeInnerTilesFactor);
                        }
                        _loc12_.addChild(_loc18_);
                     }
                     _loc8_ += 1 / (1 + this.var_2575.additionalTilesInGrid);
                  }
                  _loc7_ += 1 / (1 + this.var_2575.additionalTilesInGrid);
               }
               addChild(_loc12_);
            }
         }
      }
      
      private function method_4866(param1:Number, param2:Number, param3:BitmapData, param4:int, param5:int) : Boolean
      {
         if(Boolean(this.method_4674(param1 - 1,param2,param3,param4,param5)) && Boolean(this.method_4674(param1 + 1,param2,param3,param4,param5)) && Boolean(this.method_4674(param1,param2 - 1,param3,param4,param5)) && Boolean(this.method_4674(param1,param2 + 1,param3,param4,param5)))
         {
            return true;
         }
         return false;
      }
      
      private function method_4674(param1:Number, param2:Number, param3:BitmapData, param4:int, param5:int) : Boolean
      {
         var _loc6_:int = param3.width * Math.min(param1 + 0.1,param4) / param4;
         var _loc7_:int = param3.width * Math.min(param1 + 0.9,param4) / param4;
         var _loc8_:int = param3.height * Math.min(param2 + 0.1,param5) / param5;
         var _loc9_:int = param3.height * Math.min(param2 + 0.5,param5) / param5;
         if(param3.getPixel32(_loc6_,_loc8_) != 0 && param3.getPixel32(_loc6_,_loc9_) != 0 && param3.getPixel32(_loc7_,_loc8_) != 0 && param3.getPixel32(_loc7_,_loc9_) != 0)
         {
            return true;
         }
         return false;
      }
      
      private function method_2491() : void
      {
         while(numChildren)
         {
            removeChildAt(0);
         }
      }
   }
}
