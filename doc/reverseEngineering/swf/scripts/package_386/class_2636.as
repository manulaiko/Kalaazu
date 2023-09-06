package package_386
{
   import package_293.*;
   
   public class class_2636 extends class_1749 implements class_1751
   {
       
      
      public var var_3009:Vector.<class_2627>;
      
      public function class_2636()
      {
         super();
         this.var_3009 = new Vector.<class_2627>();
      }
      
      public function get method_5552() : uint
      {
         return this.var_3009.length;
      }
      
      public function get assetType() : String
      {
         return class_2131.const_3077;
      }
      
      public function method_6379(param1:String) : class_2627
      {
         var _loc2_:int = int(this.method_616(param1));
         if(_loc2_ != -1)
         {
            return this.var_3009[_loc2_];
         }
         return null;
      }
      
      public function method_616(param1:String) : int
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         for each(_loc3_ in this.var_3009)
         {
            if(_loc3_.name == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function clone() : class_2636
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:class_2636 = new class_2636();
         var _loc2_:uint = uint(this.var_3009.length);
         var _loc3_:Number = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new class_2627();
            _loc5_ = this.var_3009[_loc3_];
            _loc4_.name = _loc5_.name;
            _loc4_.copyFrom(_loc5_);
            _loc1_.var_3009[_loc3_] = _loc4_;
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function dispose() : void
      {
         this.var_3009.length = 0;
      }
   }
}
