package package_436
{
   import away3d.arcane;
   import package_294.class_2602;
   
   public class TorusGeometry extends class_2474
   {
       
      
      protected var var_126:Number;
      
      protected var var_505:Number;
      
      protected var var_408:uint;
      
      protected var var_162:uint;
      
      protected var var_1296:Boolean;
      
      private var var_1264:Vector.<Number>;
      
      private var var_280:Vector.<uint>;
      
      private var var_4876:uint;
      
      private var _currentIndex:uint;
      
      private var var_4692:uint;
      
      private var var_490:uint;
      
      private var var_3430:uint;
      
      private var var_1321:int;
      
      public function TorusGeometry(param1:Number = 50, param2:Number = 50, param3:uint = 16, param4:uint = 8, param5:Boolean = true)
      {
         super();
         this.var_126 = param1;
         this.var_505 = param2;
         this.var_408 = param3;
         this.var_162 = param4;
         this.var_1296 = param5;
      }
      
      private function method_39(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         var _loc10_:uint = this.var_1321 + Number(this.var_4876) * Number(this.var_3430);
         var _loc11_:*;
         this.var_1264[_loc11_ = _loc10_++] = param1;
         var _loc12_:*;
         this.var_1264[_loc12_ = _loc10_++] = param2;
         var _loc13_:*;
         this.var_1264[_loc13_ = _loc10_++] = param3;
         var _loc14_:*;
         this.var_1264[_loc14_ = _loc10_++] = param4;
         var _loc15_:*;
         this.var_1264[_loc15_ = _loc10_++] = param5;
         var _loc16_:*;
         this.var_1264[_loc16_ = _loc10_++] = param6;
         var _loc17_:*;
         this.var_1264[_loc17_ = _loc10_++] = param7;
         var _loc18_:*;
         this.var_1264[_loc18_ = _loc10_++] = param8;
         this.var_1264[_loc10_] = param9;
         ++this.var_4876;
      }
      
      private function method_3952(param1:uint, param2:uint, param3:uint) : void
      {
         var _loc4_:*;
         this.var_280[_loc4_ = this._currentIndex++] = param1;
         var _loc5_:*;
         this.var_280[_loc5_ = this._currentIndex++] = param2;
         var _loc6_:*;
         this.var_280[_loc6_ = this._currentIndex++] = param3;
         ++this.var_4692;
      }
      
      override protected function method_389(param1:class_2602) : void
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:* = 0;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:* = 0;
         var _loc22_:* = 0;
         var _loc23_:* = 0;
         var _loc24_:* = 0;
         var _loc25_:* = 0;
         var _loc26_:Number = NaN;
         var _loc27_:* = 0;
         this.var_490 = 0;
         this.var_4876 = 0;
         this._currentIndex = 0;
         this.var_4692 = 0;
         this.var_3430 = param1.method_4110;
         this.var_1321 = param1.method_720;
         this.var_490 = (this.var_162 + 1) * (this.var_408 + 1);
         _loc12_ = Number(this.var_162) * Number(this.var_408) * 2;
         if(this.var_490 == param1.numVertices)
         {
            this.var_1264 = param1.name_104;
            this.var_280 = param1.indexData || new Vector.<uint>(_loc12_ * 3,true);
         }
         else
         {
            _loc27_ = Number(this.var_490) * Number(this.var_3430);
            this.var_1264 = new Vector.<Number>(_loc27_,true);
            this.var_280 = new Vector.<uint>(_loc12_ * 3,true);
            method_596();
         }
         var _loc13_:Number = 0 / Number(this.var_408);
         var _loc14_:Number = 0 / Number(this.var_162);
         _loc3_ = 0;
         while(_loc3_ <= this.var_162)
         {
            _loc21_ = this.var_1321 + Number(this.var_4876) * Number(this.var_3430);
            _loc2_ = 0;
            while(_loc2_ <= this.var_408)
            {
               _loc10_ = _loc2_ * _loc13_;
               _loc11_ = _loc3_ * _loc14_;
               _loc7_ = (_loc26_ = Math.cos(_loc11_)) * Math.cos(_loc10_);
               _loc8_ = _loc26_ * Math.sin(_loc10_);
               _loc9_ = Math.sin(_loc11_);
               _loc4_ = Number(this.var_126) * Math.cos(_loc10_) + Number(this.var_505) * _loc7_;
               _loc5_ = Number(this.var_126) * Math.sin(_loc10_) + Number(this.var_505) * _loc8_;
               _loc6_ = _loc3_ == this.var_162 ? 0 : Number(this.var_505) * _loc9_;
               if(this.var_1296)
               {
                  _loc19_ = -_loc9_;
                  _loc20_ = _loc8_;
                  _loc17_ = 0;
                  _loc18_ = !!_loc26_ ? _loc7_ / _loc26_ : _loc4_ / Number(this.var_126);
                  _loc15_ = -_loc6_;
                  _loc16_ = _loc5_;
               }
               else
               {
                  _loc19_ = _loc8_;
                  _loc20_ = _loc9_;
                  _loc17_ = !!_loc26_ ? _loc7_ / _loc26_ : _loc4_ / Number(this.var_126);
                  _loc18_ = 0;
                  _loc15_ = _loc5_;
                  _loc16_ = _loc6_;
               }
               if(_loc2_ == this.var_408)
               {
                  this.method_39(_loc4_,this.var_1264[_loc21_ + 1],this.var_1264[_loc21_ + 2],_loc7_,_loc19_,_loc20_,-(!!_loc26_ ? _loc8_ / _loc26_ : _loc5_ / Number(this.var_126)),_loc17_,_loc18_);
               }
               else
               {
                  this.method_39(_loc4_,_loc15_,_loc16_,_loc7_,_loc19_,_loc20_,-(!!_loc26_ ? _loc8_ / _loc26_ : _loc5_ / Number(this.var_126)),_loc17_,_loc18_);
               }
               if(_loc2_ > 0 && _loc3_ > 0)
               {
                  _loc22_ = this.var_4876 - 1;
                  _loc24_ = (_loc23_ = Number(this.var_4876) - 2) - Number(this.var_408) - 1;
                  _loc25_ = _loc22_ - Number(this.var_408) - 1;
                  this.method_3952(_loc22_,_loc23_,_loc24_);
                  this.method_3952(_loc22_,_loc24_,_loc25_);
               }
               _loc2_++;
            }
            _loc3_++;
         }
         param1.updateData(this.var_1264);
         param1.updateIndexData(this.var_280);
      }
      
      override protected function method_1765(param1:class_2602) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = int(param1.method_2639);
         var _loc6_:int = int(param1.method_2585);
         var _loc7_:int = Number(param1.method_2639) - 2;
         var _loc8_:uint = Number(this.var_490) * _loc5_;
         if(Boolean(param1.method_868) && _loc8_ == param1.method_868.length)
         {
            _loc4_ = param1.method_868;
         }
         else
         {
            _loc4_ = new Vector.<Number>(_loc8_,true);
            method_2121();
         }
         var _loc9_:uint = _loc6_;
         _loc3_ = 0;
         while(_loc3_ <= this.var_162)
         {
            _loc2_ = 0;
            while(_loc2_ <= this.var_408)
            {
               var _loc10_:*;
               _loc4_[_loc10_ = _loc9_++] = _loc2_ / Number(this.var_408) * Number(param1.name_38);
               var _loc11_:*;
               _loc4_[_loc11_ = _loc9_++] = _loc3_ / Number(this.var_162) * Number(param1.name_72);
               _loc9_ += _loc7_;
               _loc2_++;
            }
            _loc3_++;
         }
         param1.updateData(_loc4_);
      }
      
      public function get radius() : Number
      {
         return this.var_126;
      }
      
      public function set radius(param1:Number) : void
      {
         this.var_126 = param1;
         method_2121();
      }
      
      public function get method_6187() : Number
      {
         return this.var_505;
      }
      
      public function set method_6187(param1:Number) : void
      {
         this.var_505 = param1;
         method_2121();
      }
      
      public function get method_78() : uint
      {
         return this.var_408;
      }
      
      public function set method_78(param1:uint) : void
      {
         this.var_408 = param1;
         method_2121();
         method_596();
      }
      
      public function get method_576() : uint
      {
         return this.var_162;
      }
      
      public function set method_576(param1:uint) : void
      {
         this.var_162 = param1;
         method_2121();
         method_596();
      }
      
      public function get yUp() : Boolean
      {
         return this.var_1296;
      }
      
      public function set yUp(param1:Boolean) : void
      {
         this.var_1296 = param1;
         method_2121();
      }
   }
}
