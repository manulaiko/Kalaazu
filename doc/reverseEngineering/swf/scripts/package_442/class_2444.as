package package_442
{
   public class class_2444
   {
       
      
      private var name_144:Number;
      
      private var var_171:Number;
      
      public function class_2444(param1:Number = 0, param2:Number = 0)
      {
         super();
         this.name_144 = param1;
         this.var_171 = param2;
      }
      
      public function get v() : Number
      {
         return this.var_171;
      }
      
      public function set v(param1:Number) : void
      {
         this.var_171 = param1;
      }
      
      public function get u() : Number
      {
         return this.name_144;
      }
      
      public function set u(param1:Number) : void
      {
         this.name_144 = param1;
      }
      
      public function clone() : class_2444
      {
         return new class_2444(this.name_144,this.var_171);
      }
      
      public function toString() : String
      {
         return this.name_144 + "," + this.var_171;
      }
   }
}
