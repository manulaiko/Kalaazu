package package_386
{
   import flash.geom.Matrix3D;
   import flash.utils.Dictionary;
   import package_371.class_2125;
   import package_385.class_2237;
   import package_385.class_2251;
   import package_431.class_2405;
   
   public class class_2238 extends class_2237
   {
       
      
      public var var_3069:class_2251;
      
      public var var_4345:class_2251;
      
      public var var_1532:class_2251;
      
      public var var_705:class_2251;
      
      public var var_1015:class_2251;
      
      public var var_2838:class_2251;
      
      public var var_4785:class_2251;
      
      public var var_4178:class_2251;
      
      public var var_748:class_2251;
      
      public var var_4235:class_2251;
      
      public var var_741:class_2251;
      
      public var var_3848:class_2251;
      
      public var var_1404:class_2251;
      
      public var var_3313:class_2251;
      
      public var var_2309:class_2251;
      
      public var var_2764:class_2251;
      
      public var var_3853:Vector.<class_2251>;
      
      public var name_132:Boolean;
      
      public var name_26:Boolean;
      
      public var var_873:Vector.<String>;
      
      public var var_2082:Vector.<String>;
      
      private var var_4564:Dictionary;
      
      public var var_4176:Boolean;
      
      public var var_3696:Boolean;
      
      public var var_3591:Boolean;
      
      public var var_3056:Boolean;
      
      public var var_3262:Boolean;
      
      public var var_1522:Vector.<Number>;
      
      public var var_114:Vector.<Number>;
      
      private var var_3050:int;
      
      private var var_537:int;
      
      public function class_2238(param1:String)
      {
         this.var_4564 = new Dictionary(true);
         this.var_1522 = new Vector.<Number>();
         this.var_114 = new Vector.<Number>();
         super(param1);
      }
      
      override public function reset() : void
      {
         var _loc2_:* = null;
         super.reset();
         this.var_3853 = new Vector.<class_2251>();
         this.var_3069 = this.method_2319(this.var_873[0]);
         this.var_705 = this.method_2319(this.var_2082[0]);
         method_588(this.var_705,1);
         var _loc1_:int = 1;
         while(_loc1_ < this.var_2082.length)
         {
            this.var_3853.push(this.method_2319(this.var_2082[_loc1_]));
            method_588(this.var_3853[_loc1_ - 1],1);
            _loc1_++;
         }
         this.var_705 = new class_2251(this.var_705.method_3684,this.var_705.index);
         this.var_4178 = method_5384();
         this.var_4178 = new class_2251(this.var_4178.method_3684,this.var_4178.index,0);
         this.var_748 = new class_2251(this.var_4178.method_3684,this.var_4178.index,1);
         this.var_4235 = new class_2251(this.var_4178.method_3684,this.var_4178.index,2);
         this.var_1532 = method_3118();
         method_588(this.var_1532,1);
         this.var_1532 = new class_2251(this.var_1532.method_3684,this.var_1532.index);
         if(this.var_3696)
         {
            this.var_1015 = method_3118();
            method_588(this.var_1015,1);
            this.var_1015 = new class_2251(this.var_1015.method_3684,this.var_1015.index);
            this.var_2838 = new class_2251(this.var_1015.method_3684,this.var_1015.index,3);
            this.var_4785 = new class_2251(this.var_1532.method_3684,this.var_1532.index,3);
         }
         else
         {
            _loc2_ = method_3118();
            method_588(_loc2_,1);
            this.var_2838 = new class_2251(_loc2_.method_3684,_loc2_.index,0);
            this.var_4785 = new class_2251(_loc2_.method_3684,_loc2_.index,1);
         }
      }
      
      public function method_4526(param1:String, param2:String) : void
      {
         this.var_2764 = this.method_2319(param2);
         this.var_4345 = this.method_2319(param1);
         this.var_741 = new class_2251(this.var_1532.method_3684,this.var_1532.index);
      }
      
      public function method_5487(param1:class_2405, param2:int, param3:int) : void
      {
         var _loc5_:* = this.var_4564[param1] || new Vector.<int>(8,true);
         this.var_4564[param1] = this.var_4564[param1] || new Vector.<int>(8,true);
         var _loc4_:Vector.<int>;
         (_loc4_ = _loc5_)[param2] = param3;
      }
      
      public function method_2879(param1:class_2405, param2:int) : int
      {
         return this.var_4564[param1][param2];
      }
      
      public function method_2833() : String
      {
         var _loc1_:int = int(this.var_873.length);
         var _loc2_:String = "";
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            _loc2_ += "mov " + this.var_2082[_loc3_] + "," + this.var_873[_loc3_] + "\n";
            _loc3_++;
         }
         _loc2_ += "mov " + this.var_1532 + ".xyz," + this.var_4178.toString() + "\n";
         if(this.var_3696)
         {
            _loc2_ += "mov " + this.var_1015 + ".xyz," + this.var_4178.toString() + "\n";
         }
         return _loc2_;
      }
      
      public function method_1282() : String
      {
         return "add " + this.var_705 + ".xyz," + this.var_705 + ".xyz," + this.var_1532 + ".xyz\n";
      }
      
      public function method_3047() : String
      {
         var _loc1_:String = "";
         if(this.var_3056)
         {
            this.var_1404 = method_3118();
            method_588(this.var_1404,1);
            this.var_2309 = method_5601();
            _loc1_ += "mov " + this.var_1404 + "," + this.var_748 + "\n";
         }
         if(this.var_3262)
         {
            this.var_3848 = method_3118();
            method_588(this.var_3848,1);
            this.var_3313 = method_5601();
            _loc1_ += "mov " + this.var_3848 + "," + this.var_4178 + "\n";
         }
         return _loc1_;
      }
      
      public function method_3234() : String
      {
         var _loc1_:String = "";
         if(Boolean(this.name_132) && (Boolean(this.var_3262) || Boolean(this.var_3056)))
         {
            if(this.var_3056)
            {
               _loc1_ += "mov " + this.var_2309 + "," + this.var_1404 + "\n";
            }
            if(this.var_3262)
            {
               _loc1_ += "mov " + this.var_3313 + "," + this.var_3848 + "\n";
            }
         }
         return _loc1_;
      }
      
      public function method_1835(param1:String) : String
      {
         var _loc3_:* = null;
         var _loc2_:String = "";
         if(Boolean(this.name_132) && (Boolean(this.var_3262) || Boolean(this.var_3056)))
         {
            _loc3_ = this.method_2319(param1);
            method_4539(_loc3_,1);
            if(this.var_3056)
            {
               _loc2_ += "mul " + _loc3_ + "," + _loc3_ + "," + this.var_2309 + "\n";
            }
            if(this.var_3262)
            {
               _loc2_ += "add " + _loc3_ + "," + _loc3_ + "," + this.var_3313 + "\n";
            }
         }
         return _loc2_;
      }
      
      private function method_2319(param1:String) : class_2251
      {
         var _loc2_:Array = param1.split(/(\d+)/);
         return new class_2251(_loc2_[0],_loc2_[1]);
      }
      
      public function get method_4877() : int
      {
         return this.var_3050;
      }
      
      public function get method_952() : int
      {
         return this.var_537;
      }
      
      public function method_2643() : void
      {
         this.var_3050 = Number(var_237) - Number(var_4830);
         this.var_537 = Number(var_47) - Number(var_2550);
         this.var_1522.length = Number(this.var_3050) * 4;
         this.var_114.length = Number(this.var_537) * 4;
      }
      
      public function method_5167(param1:int, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0) : void
      {
         var _loc6_:int = (param1 - Number(var_4830)) * 4;
         var _loc7_:*;
         this.var_1522[_loc7_ = _loc6_++] = param2;
         var _loc8_:*;
         this.var_1522[_loc8_ = _loc6_++] = param3;
         var _loc9_:*;
         this.var_1522[_loc9_ = _loc6_++] = param4;
         this.var_1522[_loc6_] = param5;
      }
      
      public function method_2855(param1:int, param2:Vector.<Number>) : void
      {
         var _loc3_:int = (param1 - Number(var_4830)) * 4;
         var _loc4_:int = 0;
         while(_loc4_ < param2.length)
         {
            var _loc5_:*;
            this.var_1522[_loc5_ = _loc3_++] = param2[_loc4_];
            _loc4_++;
         }
      }
      
      public function method_1255(param1:int, param2:Matrix3D) : void
      {
         var _loc3_:Vector.<Number> = class_2125.const_2368;
         param2.copyRawDataTo(_loc3_);
         var _loc4_:int = (param1 - Number(var_4830)) * 4;
         var _loc5_:*;
         this.var_1522[_loc5_ = _loc4_++] = _loc3_[0];
         var _loc6_:*;
         this.var_1522[_loc6_ = _loc4_++] = _loc3_[4];
         var _loc7_:*;
         this.var_1522[_loc7_ = _loc4_++] = _loc3_[8];
         var _loc8_:*;
         this.var_1522[_loc8_ = _loc4_++] = _loc3_[12];
         var _loc9_:*;
         this.var_1522[_loc9_ = _loc4_++] = _loc3_[1];
         var _loc10_:*;
         this.var_1522[_loc10_ = _loc4_++] = _loc3_[5];
         var _loc11_:*;
         this.var_1522[_loc11_ = _loc4_++] = _loc3_[9];
         var _loc12_:*;
         this.var_1522[_loc12_ = _loc4_++] = _loc3_[13];
         var _loc13_:*;
         this.var_1522[_loc13_ = _loc4_++] = _loc3_[2];
         var _loc14_:*;
         this.var_1522[_loc14_ = _loc4_++] = _loc3_[6];
         var _loc15_:*;
         this.var_1522[_loc15_ = _loc4_++] = _loc3_[10];
         var _loc16_:*;
         this.var_1522[_loc16_ = _loc4_++] = _loc3_[14];
         var _loc17_:*;
         this.var_1522[_loc17_ = _loc4_++] = _loc3_[3];
         var _loc18_:*;
         this.var_1522[_loc18_ = _loc4_++] = _loc3_[7];
         var _loc19_:*;
         this.var_1522[_loc19_ = _loc4_++] = _loc3_[11];
         this.var_1522[_loc4_] = _loc3_[15];
      }
      
      public function method_1968(param1:int, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Number = 0) : void
      {
         var _loc6_:int = (param1 - Number(var_2550)) * 4;
         var _loc7_:*;
         this.var_114[_loc7_ = _loc6_++] = param2;
         var _loc8_:*;
         this.var_114[_loc8_ = _loc6_++] = param3;
         var _loc9_:*;
         this.var_114[_loc9_ = _loc6_++] = param4;
         this.var_114[_loc6_] = param5;
      }
   }
}
