package package_433
{
   import away3d.arcane;
   import package_293.class_1751;
   
   public class class_2688 extends class_2411
   {
       
      
      private var var_2052:String;
      
      private var var_2925:Object;
      
      public function class_2688(param1:String = ".")
      {
         super();
         this.var_2052 = param1;
         this.var_2925 = {};
      }
      
      override public function method_5147(param1:class_1751, param2:class_1751, param3:Object, param4:String) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         if((_loc5_ = param1.name).indexOf(this.var_2052) >= 0)
         {
            _loc7_ = _loc5_.substring(0,_loc5_.lastIndexOf(this.var_2052));
            _loc8_ = parseInt(_loc5_.substring(_loc7_.length - 1));
            if(isNaN(_loc8_))
            {
               _loc7_ = _loc5_;
               _loc8_ = 0;
            }
         }
         else
         {
            _loc7_ = _loc5_;
            _loc8_ = 0;
         }
         if(_loc8_ == 0 && Boolean(this.var_2925.hasOwnProperty(_loc7_)))
         {
            _loc8_ = int(this.var_2925[_loc7_]);
         }
         do
         {
            _loc8_++;
            _loc6_ = _loc7_.concat(this.var_2052,_loc8_);
         }
         while(param3.hasOwnProperty(_loc6_));
         
         this.var_2925[_loc7_] = _loc8_;
         method_3186(param2.method_2094,_loc6_,param2,param1,param3,param4);
      }
      
      override public function create() : class_2411
      {
         return new class_2688(this.var_2052);
      }
   }
}
