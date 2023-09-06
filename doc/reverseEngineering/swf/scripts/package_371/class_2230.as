package package_371
{
   import away3d.arcane;
   import flash.geom.Vector3D;
   
   public class class_2230
   {
      
      public static const const_162:int = 0;
      
      public static const const_652:int = 1;
      
      public static const const_1284:int = 2;
      
      public static const const_626:int = 3;
       
      
      public var a:Number;
      
      public var b:Number;
      
      public var c:Number;
      
      public var d:Number;
      
      arcane var _alignment:int;
      
      public function class_2230(param1:Number = 0, param2:Number = 0, param3:Number = 0, param4:Number = 0)
      {
         super();
         this.a = param1;
         this.b = param2;
         this.c = param3;
         this.d = param4;
         if(param1 == 0 && param2 == 0)
         {
            this.arcane::_alignment = const_652;
         }
         else if(param2 == 0 && param3 == 0)
         {
            this.arcane::_alignment = const_1284;
         }
         else if(param1 == 0 && param3 == 0)
         {
            this.arcane::_alignment = const_626;
         }
         else
         {
            this.arcane::_alignment = const_162;
         }
      }
      
      public function method_4770(param1:Vector3D, param2:Vector3D, param3:Vector3D) : void
      {
         var _loc4_:Number = param2.x - param1.x;
         var _loc5_:Number = param2.y - param1.y;
         var _loc6_:Number = param2.z - param1.z;
         var _loc7_:Number = param3.x - param1.x;
         var _loc8_:Number = param3.y - param1.y;
         var _loc9_:Number = param3.z - param1.z;
         this.a = _loc5_ * _loc9_ - _loc6_ * _loc8_;
         this.b = _loc6_ * _loc7_ - _loc4_ * _loc9_;
         this.c = _loc4_ * _loc8_ - _loc5_ * _loc7_;
         this.d = Number(this.a) * param1.x + Number(this.b) * param1.y + Number(this.c) * param1.z;
         if(this.a == 0 && this.b == 0)
         {
            this.arcane::_alignment = const_652;
         }
         else if(this.b == 0 && this.c == 0)
         {
            this.arcane::_alignment = const_1284;
         }
         else if(this.a == 0 && this.c == 0)
         {
            this.arcane::_alignment = const_626;
         }
         else
         {
            this.arcane::_alignment = const_162;
         }
      }
      
      public function method_4324(param1:Vector3D, param2:Vector3D) : void
      {
         this.a = param1.x;
         this.b = param1.y;
         this.c = param1.z;
         this.d = Number(this.a) * param2.x + Number(this.b) * param2.y + Number(this.c) * param2.z;
         if(this.a == 0 && this.b == 0)
         {
            this.arcane::_alignment = const_652;
         }
         else if(this.b == 0 && this.c == 0)
         {
            this.arcane::_alignment = const_1284;
         }
         else if(this.a == 0 && this.c == 0)
         {
            this.arcane::_alignment = const_626;
         }
         else
         {
            this.arcane::_alignment = const_162;
         }
      }
      
      public function normalize() : class_2230
      {
         var _loc1_:Number = 1 / Math.sqrt(Number(this.a) * Number(this.a) + Number(this.b) * Number(this.b) + Number(this.c) * Number(this.c));
         this.a *= _loc1_;
         this.b *= _loc1_;
         this.c *= _loc1_;
         this.d *= _loc1_;
         return this;
      }
      
      public function distance(param1:Vector3D) : Number
      {
         if(this.arcane::_alignment == const_1284)
         {
            return Number(this.a) * param1.x - Number(this.d);
         }
         if(this.arcane::_alignment == const_626)
         {
            return Number(this.b) * param1.y - Number(this.d);
         }
         if(this.arcane::_alignment == const_652)
         {
            return Number(this.c) * param1.z - Number(this.d);
         }
         return Number(this.a) * param1.x + Number(this.b) * param1.y + Number(this.c) * param1.z - Number(this.d);
      }
      
      public function method_2376(param1:Vector3D, param2:Number = 0.01) : int
      {
         var _loc3_:Number = NaN;
         if(this.d != this.d)
         {
            return class_2491.FRONT;
         }
         if(this.arcane::_alignment == const_1284)
         {
            _loc3_ = Number(this.a) * param1.x - Number(this.d);
         }
         else if(this.arcane::_alignment == const_626)
         {
            _loc3_ = Number(this.b) * param1.y - Number(this.d);
         }
         else if(this.arcane::_alignment == const_652)
         {
            _loc3_ = Number(this.c) * param1.z - Number(this.d);
         }
         else
         {
            _loc3_ = Number(this.a) * param1.x + Number(this.b) * param1.y + Number(this.c) * param1.z - Number(this.d);
         }
         if(_loc3_ < -param2)
         {
            return class_2491.BACK;
         }
         if(_loc3_ > param2)
         {
            return class_2491.FRONT;
         }
         return class_2491.const_2149;
      }
      
      public function toString() : String
      {
         return "Plane3D [a:" + this.a + ", b:" + this.b + ", c:" + this.c + ", d:" + this.d + "].";
      }
   }
}
