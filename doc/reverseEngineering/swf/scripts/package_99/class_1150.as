package package_99
{
   public class class_1150
   {
       
      
      public var seed:uint;
      
      public function class_1150()
      {
         super();
         this.seed = 1;
      }
      
      public function method_2642() : uint
      {
         return this.method_188();
      }
      
      public function method_4158() : Number
      {
         return Number(this.method_188()) / 2147483647;
      }
      
      public function method_4354(param1:Number, param2:Number) : uint
      {
         param1 -= 0.4999;
         param2 += 0.4999;
         return Math.round(param1 + (param2 - param1) * Number(this.method_4158()));
      }
      
      public function method_6060(param1:Number, param2:Number) : Number
      {
         return param1 + (param2 - param1) * Number(this.method_4158());
      }
      
      private function method_188() : uint
      {
         var _loc1_:* = Number(this.seed) * 16807 % 2147483647;
         this.seed = Number(this.seed) * 16807 % 2147483647;
         return _loc1_;
      }
   }
}
