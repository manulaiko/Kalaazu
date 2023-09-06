package package_430
{
   import away3d.animators.class_2403;
   import away3d.arcane;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.geom.Vector3D;
   import package_198.class_1208;
   import package_294.class_1750;
   import package_294.class_2133;
   import package_305.class_1767;
   import package_371.class_2127;
   import package_386.class_2238;
   import package_386.class_2575;
   import package_386.class_2576;
   import package_431.class_2407;
   
   public class class_2581 extends class_2401
   {
       
      
      private var var_1345:class_2407;
      
      private var var_2886:class_1750;
      
      private var var_1622:Vector3D;
      
      private var var_4067:Vector3D;
      
      private var var_1137:Vector3D;
      
      private var var_3908:Vector3D;
      
      private var _smooth:Boolean;
      
      private var var_3876:Vector3D;
      
      private var var_1825:Vector3D;
      
      private var var_2393:Vector3D;
      
      public function class_2581(param1:class_2403, param2:class_2407)
      {
         this.var_1622 = new Vector3D();
         this.var_4067 = new Vector3D();
         this.var_3876 = new Vector3D();
         this.var_1825 = new Vector3D();
         this.var_2393 = new Vector3D();
         super(param1,param2,true);
         this.var_1345 = param2;
         this._smooth = param2.arcane::_smooth;
      }
      
      public function get method_774() : class_1750
      {
         return this.var_2886;
      }
      
      public function set method_774(param1:class_1750) : void
      {
         this.var_2886 = param1;
      }
      
      public function get smooth() : Boolean
      {
         return this._smooth;
      }
      
      public function set smooth(param1:Boolean) : void
      {
         this._smooth = param1;
      }
      
      override public function setRenderState(param1:class_1208, param2:class_2133, param3:class_2575, param4:class_2238, param5:class_1767) : void
      {
         param2 = param2;
         param5 = param5;
         if(this.var_2886)
         {
            if(this.var_1345.arcane::var_2896)
            {
               this.var_1622.x = Number(this.var_2886.position.x) / Number(param2.method_1409.scaleX);
               this.var_1622.y = Number(this.var_2886.position.y) / Number(param2.method_1409.scaleY);
               this.var_1622.z = Number(this.var_2886.position.z) / Number(param2.method_1409.scaleZ);
            }
            if(this.var_1345.arcane::var_3361)
            {
               this.var_4067.x = this.var_2886.rotationX;
               this.var_4067.y = this.var_2886.rotationY;
               this.var_4067.z = this.var_2886.rotationZ;
               this.var_4067.scaleBy(class_2127.const_2816);
            }
         }
         if(!this.var_1137)
         {
            this.var_1137 = this.var_1622.clone();
         }
         if(!this.var_3908)
         {
            this.var_3908 = this.var_4067.clone();
         }
         var _loc6_:Number = Number(_time) / 1000;
         var _loc7_:Number = Number(param3.previousTime);
         var _loc8_:Number = _loc6_ - _loc7_;
         var _loc9_:* = _loc7_ != _loc6_;
         if(Boolean(this.var_1345.arcane::var_2896) && Boolean(this.var_1345.arcane::var_3361))
         {
            if(_loc9_)
            {
               this.method_2572(_loc6_,_loc8_,param3);
            }
            param3.method_748(param4.method_2879(var_3560,class_2407.arcane::const_905),this.var_1345.arcane::var_4676,param1,Context3DVertexBufferFormat.FLOAT_3);
            param3.method_748(param4.method_2879(var_3560,class_2407.arcane::const_1712),this.var_1345.arcane::var_4676 + 3,param1,Context3DVertexBufferFormat.FLOAT_3);
         }
         else if(this.var_1345.arcane::var_2896)
         {
            if(_loc9_)
            {
               this.method_1890(_loc6_,_loc8_,param3);
            }
            param3.method_748(param4.method_2879(var_3560,class_2407.arcane::const_905),this.var_1345.arcane::var_4676,param1,Context3DVertexBufferFormat.FLOAT_3);
         }
         else if(this.var_1345.arcane::var_3361)
         {
            if(_loc9_)
            {
               this.method_62(_loc6_,_loc8_,param3);
            }
            param3.method_748(param4.method_2879(var_3560,class_2407.arcane::const_1712),this.var_1345.arcane::var_4676,param1,Context3DVertexBufferFormat.FLOAT_3);
         }
         this.var_1137.copyFrom(this.var_1622);
         this.var_3908.copyFrom(this.var_4067);
         param3.previousTime = _loc6_;
      }
      
      private function method_1890(param1:Number, param2:Number, param3:class_2575) : void
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:int = 0;
         var _loc14_:Number = 0;
         var _loc4_:Vector.<class_2576> = param3.var_2059;
         var _loc5_:Vector.<Number> = param3.name_104;
         var _loc6_:Boolean = false;
         var _loc7_:uint = _loc4_.length;
         if(this._smooth)
         {
            (_loc9_ = this.var_1137.subtract(this.var_1622)).scaleBy(1 / param2);
            _loc8_ = this.var_1825;
         }
         else
         {
            _loc8_ = this.var_1622;
         }
         var _loc10_:Number = 0;
         while(_loc10_ < _loc7_)
         {
            if((_loc12_ = ((_loc11_ = (param1 - Number(_loc4_[_loc10_].startTime)) / Number(_loc4_[_loc10_].totalTime)) - Math.floor(_loc11_)) * Number(_loc4_[_loc10_].totalTime)) - param2 <= 0)
            {
               _loc13_ = Number(_loc4_[_loc10_].var_3158) * Number(param3.method_93) + this.var_1345.arcane::var_4676;
               if(this._smooth)
               {
                  this.var_3876.copyFrom(_loc9_);
                  this.var_3876.scaleBy(_loc12_);
                  _loc8_.x = this.var_1622.x + this.var_3876.x;
                  _loc8_.y = this.var_1622.y + this.var_3876.y;
                  _loc8_.z = this.var_1622.z + this.var_3876.z;
               }
               if(_loc5_[_loc13_] != _loc8_.x || _loc5_[_loc13_ + 1] != _loc8_.y || _loc5_[_loc13_ + 2] != _loc8_.z)
               {
                  _loc6_ = true;
                  _loc14_ = 0;
                  while(_loc14_ < _loc4_[_loc10_].numVertices)
                  {
                     var _loc15_:*;
                     _loc5_[_loc15_ = _loc13_++] = _loc8_.x;
                     var _loc16_:*;
                     _loc5_[_loc16_ = _loc13_++] = _loc8_.y;
                     var _loc17_:*;
                     _loc5_[_loc17_ = _loc13_++] = _loc8_.z;
                     _loc14_++;
                  }
               }
            }
            _loc10_++;
         }
         if(_loc6_)
         {
            param3.method_2736();
         }
      }
      
      private function method_62(param1:Number, param2:Number, param3:class_2575) : void
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:int = 0;
         var _loc14_:Number = 0;
         var _loc4_:Vector.<class_2576> = param3.var_2059;
         var _loc5_:Vector.<Number> = param3.name_104;
         var _loc6_:Boolean = false;
         var _loc7_:uint = _loc4_.length;
         if(this._smooth)
         {
            (_loc9_ = this.var_3908.subtract(this.var_4067)).scaleBy(1 / param2);
            _loc8_ = this.var_1825;
         }
         else
         {
            _loc8_ = this.var_4067;
         }
         var _loc10_:Number = 0;
         while(_loc10_ < _loc7_)
         {
            if((_loc12_ = ((_loc11_ = (param1 - Number(_loc4_[_loc10_].startTime)) / Number(_loc4_[_loc10_].totalTime)) - Math.floor(_loc11_)) * Number(_loc4_[_loc10_].totalTime)) - param2 <= 0)
            {
               _loc13_ = Number(_loc4_[_loc10_].var_3158) * Number(param3.method_93) + this.var_1345.arcane::var_4676;
               if(this._smooth)
               {
                  this.var_3876.copyFrom(_loc9_);
                  this.var_3876.scaleBy(_loc12_);
                  _loc8_.x = this.var_4067.x + this.var_3876.x;
                  _loc8_.y = this.var_4067.y + this.var_3876.y;
                  _loc8_.z = this.var_4067.z + this.var_3876.z;
               }
               if(_loc5_[_loc13_] != _loc8_.x || _loc5_[_loc13_ + 1] != _loc8_.y || _loc5_[_loc13_ + 2] != _loc8_.z)
               {
                  _loc6_ = true;
                  _loc14_ = 0;
                  while(_loc14_ < _loc4_[_loc10_].numVertices)
                  {
                     var _loc15_:*;
                     _loc5_[_loc15_ = _loc13_++] = _loc8_.x;
                     var _loc16_:*;
                     _loc5_[_loc16_ = _loc13_++] = _loc8_.y;
                     var _loc17_:*;
                     _loc5_[_loc17_ = _loc13_++] = _loc8_.z;
                     _loc14_++;
                  }
               }
            }
            _loc10_++;
         }
         if(_loc6_)
         {
            param3.method_2736();
         }
      }
      
      private function method_2572(param1:Number, param2:Number, param3:class_2575) : void
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:int = 0;
         var _loc16_:Number = 0;
         var _loc4_:Vector.<class_2576> = param3.var_2059;
         var _loc5_:Vector.<Number> = param3.name_104;
         var _loc6_:Boolean = false;
         var _loc7_:uint = _loc4_.length;
         if(this._smooth)
         {
            (_loc10_ = this.var_1137.subtract(this.var_1622)).scaleBy(1 / param2);
            (_loc11_ = this.var_3908.subtract(this.var_4067)).scaleBy(1 / param2);
            _loc8_ = this.var_1825;
            _loc9_ = this.var_2393;
         }
         else
         {
            _loc8_ = this.var_1622;
            _loc9_ = this.var_4067;
         }
         var _loc12_:Number = 0;
         while(_loc12_ < _loc7_)
         {
            if((_loc14_ = ((_loc13_ = (param1 - Number(_loc4_[_loc12_].startTime)) / Number(_loc4_[_loc12_].totalTime)) - Math.floor(_loc13_)) * Number(_loc4_[_loc12_].totalTime)) - param2 <= 0)
            {
               _loc15_ = Number(_loc4_[_loc12_].var_3158) * Number(param3.method_93) + this.var_1345.arcane::var_4676;
               if(this._smooth)
               {
                  this.var_3876.copyFrom(_loc10_);
                  this.var_3876.scaleBy(_loc14_);
                  _loc8_.x = this.var_1622.x + this.var_3876.x;
                  _loc8_.y = this.var_1622.y + this.var_3876.y;
                  _loc8_.z = this.var_1622.z + this.var_3876.z;
                  this.var_3876.copyFrom(_loc11_);
                  this.var_3876.scaleBy(_loc14_);
                  _loc9_.x = this.var_4067.x + this.var_3876.x;
                  _loc9_.y = this.var_4067.y + this.var_3876.y;
                  _loc9_.z = this.var_4067.z + this.var_3876.z;
               }
               if(_loc5_[_loc15_] != _loc8_.x || _loc5_[_loc15_ + 1] != _loc8_.y || _loc5_[_loc15_ + 2] != _loc8_.z || _loc5_[_loc15_ + 3] != _loc9_.x || _loc5_[_loc15_ + 4] != _loc9_.y || _loc5_[_loc15_ + 5] != _loc9_.z)
               {
                  _loc6_ = true;
                  _loc16_ = 0;
                  while(_loc16_ < _loc4_[_loc12_].numVertices)
                  {
                     var _loc17_:*;
                     _loc5_[_loc17_ = _loc15_++] = _loc8_.x;
                     var _loc18_:*;
                     _loc5_[_loc18_ = _loc15_++] = _loc8_.y;
                     var _loc19_:*;
                     _loc5_[_loc19_ = _loc15_++] = _loc8_.z;
                     var _loc20_:*;
                     _loc5_[_loc20_ = _loc15_++] = _loc9_.x;
                     var _loc21_:*;
                     _loc5_[_loc21_ = _loc15_++] = _loc9_.y;
                     var _loc22_:*;
                     _loc5_[_loc22_ = _loc15_++] = _loc9_.z;
                     _loc16_++;
                  }
               }
            }
            _loc12_++;
         }
         if(_loc6_)
         {
            param3.method_2736();
         }
      }
   }
}
