package package_294
{
   import away3d.arcane;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.display3D.VertexBuffer3D;
   import flash.geom.Matrix3D;
   import package_198.class_1208;
   
   public class class_2602 extends class_2426 implements class_2425
   {
       
      
      protected var var_3632:Vector.<Boolean>;
      
      protected var _vertexBuffer:Vector.<VertexBuffer3D>;
      
      protected var var_269:Vector.<Context3D>;
      
      protected var var_490:uint;
      
      protected var var_472:int;
      
      protected var var_3032:VertexBuffer3D;
      
      protected var var_403:Context3D;
      
      protected var var_3611:Boolean;
      
      private var var_5015:Vector.<Number>;
      
      private var var_374:Boolean;
      
      public function class_2602()
      {
         this.var_3632 = new Vector.<Boolean>(8,true);
         this._vertexBuffer = new Vector.<VertexBuffer3D>(8);
         this.var_269 = new Vector.<Context3D>(8);
         super();
         var_2532 = false;
         var_1890 = false;
      }
      
      public function get numVertices() : uint
      {
         return this.var_490;
      }
      
      public function updateData(param1:Vector.<Number>) : void
      {
         if(var_2532)
         {
            var_4775 = true;
         }
         if(var_1890)
         {
            var_659 = true;
         }
         var_1798 = true;
         var_3074 = true;
         this.var_374 = true;
         _vertexData = param1;
         var _loc2_:int = 0;
         if(_loc2_ != this.var_490)
         {
            this.method_1214(this._vertexBuffer);
         }
         this.var_490 = _loc2_;
         if(this.var_490 == 0)
         {
            throw new Error("Bad data: geometry can\'t have zero triangles");
         }
         this.method_1458(this.var_3632);
         method_1513();
      }
      
      public function method_748(param1:int, param2:class_1208) : void
      {
         var _loc3_:int = int(param2.arcane::var_1572);
         var _loc4_:Context3D = param2.arcane::var_4582;
         if(_loc3_ != this.var_472)
         {
            this.method_2179(_loc3_);
         }
         if(!this.var_3032 || this.var_403 != _loc4_)
         {
            this.method_2023(_loc3_,_loc4_);
         }
         if(this.var_3611)
         {
            this.method_1720(_loc3_);
         }
         _loc4_.setVertexBufferAt(param1,this.var_3032,0,Context3DVertexBufferFormat.FLOAT_3);
      }
      
      public function method_2801(param1:int, param2:class_1208) : void
      {
         var _loc3_:int = int(param2.arcane::var_1572);
         var _loc4_:Context3D = param2.arcane::var_4582;
         if(Boolean(var_1139) && Boolean(var_1124))
         {
            _vertexData = method_3678(_vertexData);
            this.method_1458(this.var_3632);
         }
         if(_loc3_ != this.var_472)
         {
            this.method_2179(_loc3_);
         }
         if(!this.var_3032 || this.var_403 != _loc4_)
         {
            this.method_2023(_loc3_,_loc4_);
         }
         if(this.var_3611)
         {
            this.method_1720(_loc3_);
         }
         _loc4_.setVertexBufferAt(param1,this.var_3032,9,Context3DVertexBufferFormat.FLOAT_2);
      }
      
      public function method_1094(param1:int, param2:class_1208) : void
      {
         var _loc3_:int = int(param2.arcane::var_1572);
         var _loc4_:Context3D = param2.arcane::var_4582;
         if(_loc3_ != this.var_472)
         {
            this.method_2179(_loc3_);
         }
         if(!this.var_3032 || this.var_403 != _loc4_)
         {
            this.method_2023(_loc3_,_loc4_);
         }
         if(this.var_3611)
         {
            this.method_1720(_loc3_);
         }
         _loc4_.setVertexBufferAt(param1,this.var_3032,11,Context3DVertexBufferFormat.FLOAT_2);
      }
      
      protected function method_1720(param1:int) : void
      {
         this.var_3032.uploadFromVector(_vertexData,0,this.var_490);
         this.var_3611 = false;
         this.var_3632[param1] = false;
      }
      
      public function method_298(param1:int, param2:class_1208) : void
      {
         var _loc3_:int = int(param2.arcane::var_1572);
         var _loc4_:Context3D = param2.arcane::var_4582;
         if(_loc3_ != this.var_472)
         {
            this.method_2179(_loc3_);
         }
         if(!this.var_3032 || this.var_403 != _loc4_)
         {
            this.method_2023(_loc3_,_loc4_);
         }
         if(this.var_3611)
         {
            this.method_1720(_loc3_);
         }
         _loc4_.setVertexBufferAt(param1,this.var_3032,3,Context3DVertexBufferFormat.FLOAT_3);
      }
      
      public function method_4672(param1:int, param2:class_1208) : void
      {
         var _loc3_:int = int(param2.arcane::var_1572);
         var _loc4_:Context3D = param2.arcane::var_4582;
         if(_loc3_ != this.var_472)
         {
            this.method_2179(_loc3_);
         }
         if(!this.var_3032 || this.var_403 != _loc4_)
         {
            this.method_2023(_loc3_,_loc4_);
         }
         if(this.var_3611)
         {
            this.method_1720(_loc3_);
         }
         _loc4_.setVertexBufferAt(param1,this.var_3032,6,Context3DVertexBufferFormat.FLOAT_3);
      }
      
      protected function method_2023(param1:int, param2:Context3D) : void
      {
         this._vertexBuffer[param1] = this.var_3032 = param2.createVertexBuffer(this.var_490,13);
         this.var_269[param1] = this.var_403 = param2;
         this.var_3632[param1] = this.var_3611 = true;
      }
      
      protected function method_2179(param1:int) : void
      {
         this.var_472 = param1;
         this.var_3611 = this.var_3632[param1];
         this.var_3032 = this._vertexBuffer[param1];
         this.var_403 = this.var_269[param1];
      }
      
      override public function get name_104() : Vector.<Number>
      {
         if(Boolean(var_2532) && Boolean(var_4775))
         {
            _vertexData = this.method_3484(_vertexData);
         }
         if(Boolean(var_1890) && Boolean(var_659))
         {
            _vertexData = this.method_653(_vertexData);
         }
         if(Boolean(var_1139) && Boolean(var_1124))
         {
            _vertexData = method_3678(_vertexData);
         }
         return _vertexData;
      }
      
      override protected function method_3484(param1:Vector.<Number>) : Vector.<Number>
      {
         this.method_1458(this.var_3632);
         return super.method_3484(param1);
      }
      
      override protected function method_653(param1:Vector.<Number>) : Vector.<Number>
      {
         if(var_4775)
         {
            _vertexData = this.method_3484(_vertexData);
         }
         this.method_1458(this.var_3632);
         return super.method_653(param1);
      }
      
      override public function get method_4313() : Vector.<Number>
      {
         if(Boolean(var_2532) && Boolean(var_4775))
         {
            _vertexData = this.method_3484(_vertexData);
         }
         return _vertexData;
      }
      
      override public function get method_303() : Vector.<Number>
      {
         if(Boolean(var_1890) && Boolean(var_659))
         {
            _vertexData = this.method_653(_vertexData);
         }
         return _vertexData;
      }
      
      override public function get method_868() : Vector.<Number>
      {
         if(Boolean(var_1139) && Boolean(var_1124))
         {
            _vertexData = method_3678(_vertexData);
            this.method_1458(this.var_3632);
         }
         return _vertexData;
      }
      
      override public function get method_419() : Vector.<Number>
      {
         return _vertexData;
      }
      
      override public function method_1695(param1:Matrix3D) : void
      {
         super.method_1695(param1);
         this.method_1458(this.var_3632);
      }
      
      override public function scale(param1:Number) : void
      {
         super.scale(param1);
         this.method_1458(this.var_3632);
      }
      
      public function clone() : class_2425
      {
         var _loc1_:class_2602 = new class_2602();
         _loc1_.var_2532 = var_2532;
         _loc1_.var_1890 = var_1890;
         _loc1_.updateData(_vertexData.concat());
         _loc1_.updateIndexData(_indices.concat());
         return _loc1_;
      }
      
      override public function method_3965(param1:Number = 1, param2:Number = 1) : void
      {
         super.method_3965(param1,param2);
         this.method_1458(this.var_3632);
      }
      
      override public function get method_4110() : uint
      {
         return 13;
      }
      
      override public function get method_4163() : uint
      {
         return 13;
      }
      
      override public function get method_2683() : uint
      {
         return 13;
      }
      
      override public function get method_2639() : uint
      {
         return 13;
      }
      
      public function get method_247() : uint
      {
         return 13;
      }
      
      override public function get method_720() : int
      {
         return 0;
      }
      
      override public function get method_4530() : int
      {
         return 3;
      }
      
      override public function get method_4538() : int
      {
         return 6;
      }
      
      override public function get method_2585() : int
      {
         return 9;
      }
      
      public function get method_2550() : int
      {
         return 11;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.method_1214(this._vertexBuffer);
         this._vertexBuffer = null;
      }
      
      override protected function method_1214(param1:Vector.<VertexBuffer3D>) : void
      {
         super.method_1214(param1);
         this.var_3032 = null;
      }
      
      override protected function method_1458(param1:Vector.<Boolean>) : void
      {
         super.method_1458(param1);
         this.var_3611 = true;
      }
      
      public function method_1677() : class_2427
      {
         var _loc1_:class_2427 = new class_2427();
         _loc1_.updateVertexData(!!this.var_5015 ? this.var_5015 : (this.var_5015 = this.method_831(0,3)));
         _loc1_.method_251 = var_2532;
         _loc1_.method_5188 = var_1890;
         if(!var_2532)
         {
            _loc1_.updateVertexNormalData(this.method_831(3,3));
         }
         if(!var_1890)
         {
            _loc1_.updateVertexTangentData(this.method_831(6,3));
         }
         _loc1_.updateUVData(this.method_831(9,2));
         _loc1_.method_6332(this.method_831(11,2));
         _loc1_.updateIndexData(indexData.concat());
         return _loc1_;
      }
      
      override public function get method_1272() : Vector.<Number>
      {
         if(Boolean(this.var_374) || !this.var_5015)
         {
            this.var_5015 = this.method_831(0,3);
            this.var_374 = false;
         }
         return this.var_5015;
      }
      
      public function method_831(param1:int, param2:int) : Vector.<Number>
      {
         var _loc8_:int = 0;
         var _loc3_:Vector.<Number> = new Vector.<Number>(Number(this.var_490) * param2);
         var _loc4_:int = 0;
         var _loc5_:int = param1;
         var _loc6_:int = 13 - param2;
         var _loc7_:int = 0;
         while(_loc7_ < this.var_490)
         {
            _loc8_ = 0;
            while(_loc8_ < param2)
            {
               var _loc9_:*;
               _loc3_[_loc9_ = _loc4_++] = _vertexData[_loc5_++];
               _loc8_++;
            }
            _loc5_ += _loc6_;
            _loc7_++;
         }
         return _loc3_;
      }
      
      public function method_5600(param1:Vector.<Number>, param2:Vector.<Number>, param3:Vector.<Number>, param4:Vector.<Number>, param5:Vector.<Number> = null) : void
      {
         var _loc6_:int = param1.length / 3 * 13;
         method_3441 = Boolean(param5) && Boolean(param5.length);
         if(!param5)
         {
            param5 = param2;
         }
         else if(param5.length != param2.length)
         {
            param5 = param2;
         }
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Vector.<Number> = new Vector.<Number>(_loc6_,true);
         while(_loc7_ < _loc6_)
         {
            var _loc13_:*;
            _loc12_[_loc13_ = _loc7_++] = param1[_loc8_++];
            var _loc14_:*;
            _loc12_[_loc14_ = _loc7_++] = param1[_loc8_++];
            var _loc15_:*;
            _loc12_[_loc15_ = _loc7_++] = param1[_loc8_++];
            if(Boolean(param3) && Boolean(param3.length))
            {
               var _loc16_:*;
               _loc12_[_loc16_ = _loc7_++] = param3[_loc9_++];
               var _loc17_:*;
               _loc12_[_loc17_ = _loc7_++] = param3[_loc9_++];
               var _loc18_:*;
               _loc12_[_loc18_ = _loc7_++] = param3[_loc9_++];
            }
            else
            {
               _loc12_[_loc16_ = _loc7_++] = 0;
               _loc12_[_loc17_ = _loc7_++] = 0;
               _loc12_[_loc18_ = _loc7_++] = 0;
            }
            if(Boolean(param4) && Boolean(param4.length))
            {
               _loc12_[_loc16_ = _loc7_++] = param4[_loc10_++];
               _loc12_[_loc17_ = _loc7_++] = param4[_loc10_++];
               _loc12_[_loc18_ = _loc7_++] = param4[_loc10_++];
            }
            else
            {
               _loc12_[_loc16_ = _loc7_++] = 0;
               _loc12_[_loc17_ = _loc7_++] = 0;
               _loc12_[_loc18_ = _loc7_++] = 0;
            }
            if(Boolean(param2) && Boolean(param2.length))
            {
               _loc12_[_loc16_ = _loc7_++] = param2[_loc11_];
               _loc12_[_loc17_ = _loc7_++] = param2[_loc11_ + 1];
               if(Boolean(param5) && Boolean(param5.length))
               {
                  _loc12_[_loc18_ = _loc7_++] = param5[_loc11_++];
                  var _loc19_:*;
                  _loc12_[_loc19_ = _loc7_++] = param5[_loc11_++];
               }
               else
               {
                  _loc12_[_loc18_ = _loc7_++] = param2[_loc11_++];
                  _loc12_[_loc19_ = _loc7_++] = param2[_loc11_++];
               }
            }
            else
            {
               _loc12_[_loc16_ = _loc7_++] = 0;
               _loc12_[_loc17_ = _loc7_++] = 0;
               _loc12_[_loc18_ = _loc7_++] = 0;
               _loc12_[_loc19_ = _loc7_++] = 0;
            }
         }
         method_251 = !(param3 && param3.length);
         method_5188 = !(param4 && param4.length);
         method_1688 = !(param2 && param2.length);
         this.updateData(_loc12_);
      }
   }
}
