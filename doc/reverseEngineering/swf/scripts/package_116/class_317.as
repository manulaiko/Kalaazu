package package_116
{
   import package_10.class_1179;
   import package_10.class_20;
   import package_19.class_68;
   import package_19.class_70;
   
   public class class_317
   {
       
      
      public const drones:Vector.<class_1178> = new Vector.<class_1178>();
      
      public const const_1831:class_68 = new class_70();
      
      public const const_1693:class_20 = new class_20(0);
      
      public const const_2113:class_1179 = new class_1179(1);
      
      private var var_4306:String = "";
      
      public function class_317()
      {
         super();
      }
      
      public function method_6489(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         this.drones.length = 0;
         var _loc2_:String = this.var_4306;
         this.var_4306 = "";
         var _loc3_:int = param1.length;
         if(_loc3_ > 0)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc3_)
            {
               _loc6_ = int((_loc5_ = param1[_loc4_])[0]);
               _loc7_ = int(_loc5_[1]);
               _loc8_ = int(_loc5_[2]);
               this.drones.push(new class_1178(_loc4_,_loc6_,_loc8_,_loc7_));
               this.var_4306 += this.method_835(_loc8_,_loc6_);
               _loc4_++;
            }
         }
         if(_loc2_ != this.var_4306)
         {
            this.const_1831.dispatch();
         }
      }
      
      public function method_6136() : String
      {
         return this.var_4306;
      }
      
      private function method_835(param1:int, param2:int) : String
      {
         return "<font color=\'" + class_1086.const_1076[param1] + "\'>" + class_1086.const_2277[param2] + "</font>";
      }
   }
}
