package package_310
{
   import away3d.arcane;
   import package_198.class_1208;
   import package_385.class_2237;
   import package_385.class_2251;
   
   public class class_2607 extends class_1780
   {
       
      
      private var var_3579:Number = 0;
      
      private var var_2102:Number = 1000;
      
      private var var_2078:uint;
      
      private var var_3552:Number;
      
      private var var_1597:Number;
      
      private var var_1895:Number;
      
      public function class_2607(param1:Number, param2:Number, param3:uint = 8421504)
      {
         super();
         this.method_917 = param1;
         this.method_207 = param2;
         this.method_4335 = param3;
      }
      
      override arcane function initVO(param1:class_2252) : void
      {
         param1.var_1986 = true;
      }
      
      override arcane function method_4956(param1:class_2252) : void
      {
         var _loc2_:Vector.<Number> = param1.var_3329;
         var _loc3_:int = int(param1.var_2676);
         _loc2_[_loc3_ + 3] = 1;
         _loc2_[_loc3_ + 6] = 0;
         _loc2_[_loc3_ + 7] = 0;
      }
      
      public function get method_917() : Number
      {
         return this.var_3579;
      }
      
      public function set method_917(param1:Number) : void
      {
         this.var_3579 = param1;
      }
      
      public function get method_207() : Number
      {
         return this.var_2102;
      }
      
      public function set method_207(param1:Number) : void
      {
         this.var_2102 = param1;
      }
      
      public function get method_4335() : uint
      {
         return this.var_2078;
      }
      
      public function set method_4335(param1:uint) : void
      {
         this.var_2078 = param1;
         this.var_3552 = (param1 >> 16 & 255) / 255;
         this.var_1597 = (param1 >> 8 & 255) / 255;
         this.var_1895 = (param1 & 255) / 255;
      }
      
      override arcane function activate(param1:class_2252, param2:class_1208) : void
      {
         var _loc3_:Vector.<Number> = param1.var_3329;
         var _loc4_:int = int(param1.var_2676);
         _loc3_[_loc4_] = this.var_3552;
         _loc3_[_loc4_ + 1] = this.var_1597;
         _loc3_[_loc4_ + 2] = this.var_1895;
         _loc3_[_loc4_ + 4] = this.var_3579;
         _loc3_[_loc4_ + 5] = 1 / (Number(this.var_2102) - Number(this.var_3579));
      }
      
      override arcane function getFragmentCode(param1:class_2252, param2:class_2237, param3:class_2251) : String
      {
         var _loc4_:class_2251 = param2.method_1853();
         var _loc5_:class_2251 = param2.method_1853();
         var _loc6_:class_2251 = param2.method_4834();
         param2.method_4539(_loc6_,1);
         var _loc7_:class_2251 = param2.method_4834();
         var _loc8_:String = "";
         param1.var_2676 = Number(_loc4_.index) * 4;
         _loc8_ += "sub " + _loc7_ + ".w, " + var_1283.var_1930 + ".z, " + _loc5_ + ".x          \n" + "mul " + _loc7_ + ".w, " + _loc7_ + ".w, " + _loc5_ + ".y\t\t\t\t\t\n" + "sat " + _loc7_ + ".w, " + _loc7_ + ".w\t\t\t\t\t\t\t\t\t\t\n" + "sub " + _loc6_ + ", " + _loc4_ + ", " + param3 + "\n" + "mul " + _loc6_ + ", " + _loc6_ + ", " + _loc7_ + ".w\t\t\t\t\t\n" + "add " + param3 + ", " + param3 + ", " + _loc6_ + "\n";
         param2.method_771(_loc6_);
         return _loc8_;
      }
   }
}
