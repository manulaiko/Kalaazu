package package_310
{
   import away3d.arcane;
   import package_198.class_1208;
   import package_369.class_2116;
   import package_385.class_2237;
   import package_385.class_2251;
   
   public class class_2619 extends class_2242
   {
       
      
      private var var_1417:class_2116;
      
      private var var_2317:class_2251;
      
      private var var_4745:Boolean;
      
      private var var_4591:Number = 0;
      
      private var var_3173:Number = 0;
      
      private var var_4418:Number = 0;
      
      private var var_3661:Number = 0;
      
      public function class_2619(param1:class_2116, param2:class_2116)
      {
         super();
         this.normalMap = param1;
         this.method_3115 = param2;
      }
      
      override arcane function method_4956(param1:class_2252) : void
      {
         var _loc2_:int = int(param1.var_2676);
         param1.var_3329[_loc2_] = 0.5;
         param1.var_3329[_loc2_ + 1] = 0;
         param1.var_3329[_loc2_ + 2] = 0;
         param1.var_3329[_loc2_ + 3] = 1;
      }
      
      override arcane function initVO(param1:class_2252) : void
      {
         super.arcane::initVO(param1);
         this.var_4745 = normalMap != this.method_3115;
      }
      
      public function get method_6378() : Number
      {
         return this.var_4591;
      }
      
      public function set method_6378(param1:Number) : void
      {
         this.var_4591 = param1;
      }
      
      public function get method_560() : Number
      {
         return this.var_3173;
      }
      
      public function set method_560(param1:Number) : void
      {
         this.var_3173 = param1;
      }
      
      public function get method_4812() : Number
      {
         return this.var_4418;
      }
      
      public function set method_4812(param1:Number) : void
      {
         this.var_4418 = param1;
      }
      
      public function get method_6452() : Number
      {
         return this.var_3661;
      }
      
      public function set method_6452(param1:Number) : void
      {
         this.var_3661 = param1;
      }
      
      override public function set normalMap(param1:class_2116) : void
      {
         if(!param1)
         {
            return;
         }
         super.normalMap = param1;
      }
      
      public function get method_3115() : class_2116
      {
         return this.var_1417;
      }
      
      public function set method_3115(param1:class_2116) : void
      {
         this.var_1417 = param1;
      }
      
      override arcane function method_3031() : void
      {
         super.arcane::method_3031();
         this.var_2317 = null;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_1417 = null;
      }
      
      override arcane function activate(param1:class_2252, param2:class_1208) : void
      {
         super.arcane::activate(param1,param2);
         var _loc3_:Vector.<Number> = param1.var_3329;
         var _loc4_:int = int(param1.var_2676);
         _loc3_[_loc4_ + 4] = this.var_4591;
         _loc3_[_loc4_ + 5] = this.var_3173;
         _loc3_[_loc4_ + 6] = this.var_4418;
         _loc3_[_loc4_ + 7] = this.var_3661;
         if(this.var_4745 >= 0)
         {
            param2.arcane::var_4582.setTextureAt(param1.var_2852 + 1,this.var_1417.method_6425(param2));
         }
      }
      
      override arcane function getFragmentCode(param1:class_2252, param2:class_2237, param3:class_2251) : String
      {
         var _loc4_:class_2251 = param2.method_4834();
         var _loc5_:class_2251 = param2.method_1853();
         var _loc6_:class_2251 = param2.method_1853();
         var_4416 = param2.method_3238();
         this.var_2317 = !!this.var_4745 ? param2.method_3238() : var_4416;
         param1.var_2852 = var_4416.index;
         param1.var_2676 = Number(_loc5_.index) * 4;
         return "add " + _loc4_ + ", " + var_1283.var_443 + ", " + _loc6_ + ".xyxy\n" + getTex2DSampleCode(param1,param3,var_4416,normalMap,_loc4_) + "add " + _loc4_ + ", " + var_1283.var_443 + ", " + _loc6_ + ".zwzw\n" + getTex2DSampleCode(param1,_loc4_,this.var_2317,this.var_1417,_loc4_) + "add " + param3 + ", " + param3 + ", " + _loc4_ + "\t\t\n" + "mul " + param3 + ", " + param3 + ", " + _loc5_ + ".x\t\n" + "sub " + param3 + ".xyz, " + param3 + ".xyz, " + var_1283.var_1569 + ".xxx\t\n" + "nrm " + param3 + ".xyz, " + param3 + ".xyz\t\t\t\t\t\t\t\n";
      }
   }
}
