package package_372
{
   import package_294.class_2398;
   import package_304.class_2114;
   import package_376.class_2144;
   
   public class class_2431 extends class_2225
   {
       
      
      private var var_1333:class_2114;
      
      public function class_2431(param1:class_2114)
      {
         super(param1);
         this.var_1333 = param1;
      }
      
      public function get mesh() : class_2114
      {
         return this.var_1333;
      }
      
      override public function method_2995(param1:class_2144) : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = 0;
         var _loc4_:* = 0;
         if(param1.method_4368(this))
         {
            super.method_2995(param1);
            _loc2_ = this.var_1333.method_3381;
            _loc4_ = _loc2_.length;
            while(_loc3_ < _loc4_)
            {
               param1.method_82(_loc2_[_loc3_++]);
            }
         }
      }
   }
}
