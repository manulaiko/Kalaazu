package package_294
{
   import away3d.arcane;
   import flash.display3D.Context3D;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.display3D.VertexBuffer3D;
   import flash.geom.Matrix3D;
   import package_198.class_1208;
   
   public class class_2427 extends class_2426 implements class_2425
   {
       
      
      protected var var_172:Vector.<Number>;
      
      protected var var_4707:Vector.<Number>;
      
      protected var var_3048:Vector.<Number>;
      
      protected var var_4053:Vector.<Number>;
      
      protected var var_300:Vector.<Boolean>;
      
      protected var var_1503:Vector.<Boolean>;
      
      protected var var_4435:Vector.<Boolean>;
      
      protected var var_3025:Vector.<Boolean>;
      
      protected var var_4913:Vector.<Boolean>;
      
      protected var _vertexBuffer:Vector.<VertexBuffer3D>;
      
      protected var var_3799:Vector.<VertexBuffer3D>;
      
      protected var var_1378:Vector.<VertexBuffer3D>;
      
      protected var var_3841:Vector.<VertexBuffer3D>;
      
      protected var var_4570:Vector.<VertexBuffer3D>;
      
      protected var var_2409:Vector.<Context3D>;
      
      protected var var_2705:Vector.<Context3D>;
      
      protected var var_4685:Vector.<Context3D>;
      
      protected var var_650:Vector.<Context3D>;
      
      protected var var_1744:Vector.<Context3D>;
      
      protected var var_490:uint;
      
      public function class_2427()
      {
         this.var_300 = new Vector.<Boolean>(8,true);
         this.var_1503 = new Vector.<Boolean>(8,true);
         this.var_4435 = new Vector.<Boolean>(8,true);
         this.var_3025 = new Vector.<Boolean>(8,true);
         this.var_4913 = new Vector.<Boolean>(8,true);
         this._vertexBuffer = new Vector.<VertexBuffer3D>(8);
         this.var_3799 = new Vector.<VertexBuffer3D>(8);
         this.var_1378 = new Vector.<VertexBuffer3D>(8);
         this.var_3841 = new Vector.<VertexBuffer3D>(8);
         this.var_4570 = new Vector.<VertexBuffer3D>(8);
         this.var_2409 = new Vector.<Context3D>(8);
         this.var_2705 = new Vector.<Context3D>(8);
         this.var_4685 = new Vector.<Context3D>(8);
         this.var_650 = new Vector.<Context3D>(8);
         this.var_1744 = new Vector.<Context3D>(8);
         super();
      }
      
      public function get numVertices() : uint
      {
         return this.var_490;
      }
      
      public function method_748(param1:int, param2:class_1208) : void
      {
         var _loc3_:int = int(param2.arcane::var_1572);
         var _loc4_:Context3D = param2.arcane::var_4582;
         if(!this._vertexBuffer[_loc3_] || this.var_2409[_loc3_] != _loc4_)
         {
            this._vertexBuffer[_loc3_] = _loc4_.createVertexBuffer(this.var_490,3);
            this.var_2409[_loc3_] = _loc4_;
            this.var_300[_loc3_] = true;
         }
         if(this.var_300[_loc3_])
         {
            this._vertexBuffer[_loc3_].uploadFromVector(_vertexData,0,this.var_490);
            this.var_300[_loc3_] = false;
         }
         _loc4_.setVertexBufferAt(param1,this._vertexBuffer[_loc3_],0,Context3DVertexBufferFormat.FLOAT_3);
      }
      
      public function method_2801(param1:int, param2:class_1208) : void
      {
         var _loc3_:int = int(param2.arcane::var_1572);
         var _loc4_:Context3D = param2.arcane::var_4582;
         if(Boolean(var_1124) && Boolean(var_1139))
         {
            this.var_172 = this.method_3678(this.var_172);
         }
         if(!this.var_3799[_loc3_] || this.var_2705[_loc3_] != _loc4_)
         {
            this.var_3799[_loc3_] = _loc4_.createVertexBuffer(this.var_490,2);
            this.var_2705[_loc3_] = _loc4_;
            this.var_1503[_loc3_] = true;
         }
         if(this.var_1503[_loc3_])
         {
            this.var_3799[_loc3_].uploadFromVector(this.var_172,0,this.var_490);
            this.var_1503[_loc3_] = false;
         }
         _loc4_.setVertexBufferAt(param1,this.var_3799[_loc3_],0,Context3DVertexBufferFormat.FLOAT_2);
      }
      
      public function method_1094(param1:int, param2:class_1208) : void
      {
         var _loc3_:int = int(param2.arcane::var_1572);
         var _loc4_:Context3D = param2.arcane::var_4582;
         if(!this.var_1378[_loc3_] || this.var_4685[_loc3_] != _loc4_)
         {
            this.var_1378[_loc3_] = _loc4_.createVertexBuffer(this.var_490,2);
            this.var_4685[_loc3_] = _loc4_;
            this.var_4435[_loc3_] = true;
         }
         if(this.var_4435[_loc3_])
         {
            this.var_1378[_loc3_].uploadFromVector(this.var_4707,0,this.var_490);
            this.var_4435[_loc3_] = false;
         }
         _loc4_.setVertexBufferAt(param1,this.var_1378[_loc3_],0,Context3DVertexBufferFormat.FLOAT_2);
      }
      
      public function method_298(param1:int, param2:class_1208) : void
      {
         var _loc3_:int = int(param2.arcane::var_1572);
         var _loc4_:Context3D = param2.arcane::var_4582;
         if(Boolean(var_2532) && Boolean(var_4775))
         {
            this.var_3048 = this.method_3484(this.var_3048);
         }
         if(!this.var_3841[_loc3_] || this.var_650[_loc3_] != _loc4_)
         {
            this.var_3841[_loc3_] = _loc4_.createVertexBuffer(this.var_490,3);
            this.var_650[_loc3_] = _loc4_;
            this.var_3025[_loc3_] = true;
         }
         if(this.var_3025[_loc3_])
         {
            this.var_3841[_loc3_].uploadFromVector(this.var_3048,0,this.var_490);
            this.var_3025[_loc3_] = false;
         }
         _loc4_.setVertexBufferAt(param1,this.var_3841[_loc3_],0,Context3DVertexBufferFormat.FLOAT_3);
      }
      
      public function method_4672(param1:int, param2:class_1208) : void
      {
         var _loc3_:int = int(param2.arcane::var_1572);
         var _loc4_:Context3D = param2.arcane::var_4582;
         if(var_659)
         {
            this.var_4053 = this.method_653(this.var_4053);
         }
         if(!this.var_4570[_loc3_] || this.var_1744[_loc3_] != _loc4_)
         {
            this.var_4570[_loc3_] = _loc4_.createVertexBuffer(this.var_490,3);
            this.var_1744[_loc3_] = _loc4_;
            this.var_4913[_loc3_] = true;
         }
         if(this.var_4913[_loc3_])
         {
            this.var_4570[_loc3_].uploadFromVector(this.var_4053,0,this.var_490);
            this.var_4913[_loc3_] = false;
         }
         _loc4_.setVertexBufferAt(param1,this.var_4570[_loc3_],0,Context3DVertexBufferFormat.FLOAT_3);
      }
      
      override public function method_1695(param1:Matrix3D) : void
      {
         super.method_1695(param1);
         method_1458(this.var_300);
         method_1458(this.var_3025);
         method_1458(this.var_4913);
      }
      
      public function clone() : class_2425
      {
         var _loc1_:class_2427 = new class_2427();
         _loc1_.updateVertexData(_vertexData.concat());
         _loc1_.updateUVData(this.var_172.concat());
         _loc1_.updateIndexData(_indices.concat());
         if(this.var_4707)
         {
            _loc1_.method_6332(this.var_4707.concat());
         }
         if(!var_2532)
         {
            _loc1_.updateVertexNormalData(this.var_3048.concat());
         }
         if(!var_1890)
         {
            _loc1_.updateVertexTangentData(this.var_4053.concat());
         }
         return _loc1_;
      }
      
      override public function scale(param1:Number) : void
      {
         super.scale(param1);
         method_1458(this.var_300);
      }
      
      override public function method_3965(param1:Number = 1, param2:Number = 1) : void
      {
         super.method_3965(param1,param2);
         method_1458(this.var_1503);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.method_6277();
         this._vertexBuffer = null;
         this.var_3841 = null;
         this.var_3799 = null;
         this.var_1378 = null;
         this.var_4570 = null;
         _indexBuffer = null;
         this.var_172 = null;
         this.var_4707 = null;
         this.var_3048 = null;
         this.var_4053 = null;
         this.var_2409 = null;
         this.var_2705 = null;
         this.var_4685 = null;
         this.var_650 = null;
         this.var_1744 = null;
      }
      
      protected function method_6277() : void
      {
         method_1214(this._vertexBuffer);
         method_1214(this.var_3841);
         method_1214(this.var_3799);
         method_1214(this.var_1378);
         method_1214(this.var_4570);
      }
      
      override public function get name_104() : Vector.<Number>
      {
         return _vertexData;
      }
      
      override public function get method_1272() : Vector.<Number>
      {
         return _vertexData;
      }
      
      public function updateVertexData(param1:Vector.<Number>) : void
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
         _vertexData = param1;
         var _loc2_:int = param1.length / 3;
         if(_loc2_ != this.var_490)
         {
            this.method_6277();
         }
         this.var_490 = _loc2_;
         method_1458(this.var_300);
         method_1513();
      }
      
      override public function get method_868() : Vector.<Number>
      {
         if(Boolean(var_1139) && Boolean(var_1124))
         {
            this.var_172 = this.method_3678(this.var_172);
         }
         return this.var_172;
      }
      
      override public function get method_419() : Vector.<Number>
      {
         return this.var_4707;
      }
      
      public function updateUVData(param1:Vector.<Number>) : void
      {
         if(var_1890)
         {
            var_659 = true;
         }
         var_3074 = true;
         this.var_172 = param1;
         method_1458(this.var_1503);
      }
      
      public function method_6332(param1:Vector.<Number>) : void
      {
         this.var_4707 = param1;
         method_1458(this.var_4435);
      }
      
      override public function get method_4313() : Vector.<Number>
      {
         if(Boolean(var_2532) && Boolean(var_4775))
         {
            this.var_3048 = this.method_3484(this.var_3048);
         }
         return this.var_3048;
      }
      
      public function updateVertexNormalData(param1:Vector.<Number>) : void
      {
         var_4775 = false;
         var_2532 = param1 == null;
         this.var_3048 = param1;
         method_1458(this.var_3025);
      }
      
      override public function get method_303() : Vector.<Number>
      {
         if(Boolean(var_1890) && Boolean(var_659))
         {
            this.var_4053 = this.method_653(this.var_4053);
         }
         return this.var_4053;
      }
      
      public function updateVertexTangentData(param1:Vector.<Number>) : void
      {
         var_659 = false;
         var_1890 = param1 == null;
         this.var_4053 = param1;
         method_1458(this.var_4913);
      }
      
      public function method_5600(param1:Vector.<Number>, param2:Vector.<Number>, param3:Vector.<Number>, param4:Vector.<Number>, param5:Vector.<Number> = null) : void
      {
         this.updateVertexData(param1);
         this.updateUVData(param2);
         this.updateVertexNormalData(param3);
         this.updateVertexTangentData(param4);
         if(Boolean(param5) && Boolean(param5.length))
         {
            this.method_6332(param5);
            method_3441 = true;
         }
      }
      
      override protected function method_3484(param1:Vector.<Number>) : Vector.<Number>
      {
         method_1458(this.var_3025);
         return super.method_3484(param1);
      }
      
      override protected function method_653(param1:Vector.<Number>) : Vector.<Number>
      {
         if(var_4775)
         {
            this.var_3048 = this.method_3484(this.var_3048);
         }
         method_1458(this.var_4913);
         return super.method_653(param1);
      }
      
      override protected function method_3678(param1:Vector.<Number>) : Vector.<Number>
      {
         method_1458(this.var_1503);
         return super.method_3678(param1);
      }
      
      protected function method_2781(param1:class_1208) : void
      {
         var _loc2_:int = int(param1.arcane::var_1572);
         if(this._vertexBuffer[_loc2_])
         {
            this._vertexBuffer[_loc2_].dispose();
            this._vertexBuffer[_loc2_] = null;
         }
         if(this.var_3799[_loc2_])
         {
            this.var_3799[_loc2_].dispose();
            this.var_3799[_loc2_] = null;
         }
         if(this.var_1378[_loc2_])
         {
            this.var_1378[_loc2_].dispose();
            this.var_1378[_loc2_] = null;
         }
         if(this.var_3841[_loc2_])
         {
            this.var_3841[_loc2_].dispose();
            this.var_3841[_loc2_] = null;
         }
         if(this.var_4570[_loc2_])
         {
            this.var_4570[_loc2_].dispose();
            this.var_4570[_loc2_] = null;
         }
         if(false)
         {
            _indexBuffer[_loc2_].dispose();
            _indexBuffer[_loc2_] = null;
         }
      }
      
      override public function get method_4110() : uint
      {
         return 3;
      }
      
      override public function get method_2683() : uint
      {
         return 3;
      }
      
      override public function get method_4163() : uint
      {
         return 3;
      }
      
      override public function get method_2639() : uint
      {
         return 2;
      }
      
      public function get method_247() : uint
      {
         return 2;
      }
      
      override public function get method_720() : int
      {
         return 0;
      }
      
      override public function get method_4530() : int
      {
         return 0;
      }
      
      override public function get method_4538() : int
      {
         return 0;
      }
      
      override public function get method_2585() : int
      {
         return 0;
      }
      
      public function get method_2550() : int
      {
         return 0;
      }
      
      public function method_1677() : class_2427
      {
         return class_2427(this.clone());
      }
   }
}
