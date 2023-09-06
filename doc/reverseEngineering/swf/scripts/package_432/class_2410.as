package package_432
{
   import package_293.class_1751;
   
   public class class_2410
   {
       
      
      private var _assets:Vector.<class_1751>;
      
      private var var_4132:Vector.<class_1751>;
      
      private var var_3415:uint;
      
      public function class_2410(param1:Vector.<class_1751>, param2:String, param3:String, param4:Function)
      {
         super();
         this._assets = param1;
         this.filter(param2,param3,param4);
      }
      
      public function get method_1200() : class_1751
      {
         return this.var_3415 < this.var_4132.length ? this.var_4132[this.var_3415] : null;
      }
      
      public function get method_5128() : uint
      {
         return this.var_4132.length;
      }
      
      public function next() : class_1751
      {
         var _loc1_:* = null;
         if(this.var_3415 < this.var_4132.length)
         {
            _loc1_ = this.var_4132[this.var_3415];
         }
         ++this.var_3415;
         return _loc1_;
      }
      
      public function reset() : void
      {
         this.var_3415 = 0;
      }
      
      public function method_1599(param1:uint) : void
      {
         this.var_3415 = param1;
      }
      
      private function filter(param1:String, param2:String, param3:Function) : void
      {
         var _loc4_:Number = 0;
         var _loc5_:* = null;
         if(Boolean(param1) || Boolean(param2) || param3 != null)
         {
            _loc4_ = 0;
            this.var_4132 = new Vector.<class_1751>();
            for each(_loc5_ in this._assets)
            {
               if(!(Boolean(param1) && _loc5_.assetType != param1))
               {
                  if(!(Boolean(param2) && _loc5_.method_2094 != param2))
                  {
                     if(!(param3 != null && !param3(_loc5_)))
                     {
                        var _loc8_:*;
                        this.var_4132[_loc8_ = _loc4_++] = _loc5_;
                     }
                  }
               }
            }
         }
         else
         {
            this.var_4132 = this._assets;
         }
      }
   }
}
