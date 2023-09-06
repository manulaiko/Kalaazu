package package_482
{
   import package_437.class_2592;
   import package_438.class_2421;
   import package_466.class_2595;
   import package_466.class_2598;
   import package_492.class_2745;
   
   public class Matrix2DUVCompositeValueSubParser extends class_2421
   {
       
      
      private var _numColumns:int;
      
      private var var_2462:int;
      
      private var var_2415:class_2421;
      
      public function Matrix2DUVCompositeValueSubParser(param1:String)
      {
         super(param1,const_1615);
      }
      
      public static function get identifier() : *
      {
         return class_2598.Matrix2DUVCompositeValueSubParser;
      }
      
      override protected function method_196() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(var_117)
         {
            this._numColumns = _data.numColumns;
            this.var_2462 = _data.numRows;
            _loc1_ = _data.selectedValue;
            _loc2_ = _loc1_.id;
            _loc3_ = _loc1_.data;
            if(!(_loc4_ = class_2592.method_6525(_loc2_,class_2595.const_2681)))
            {
               method_444("Unknown value");
            }
            this.var_2415 = new _loc4_(null);
            method_4558(this.var_2415);
            this.var_2415.method_5169(_loc3_);
         }
         if(super.method_196() == const_2361)
         {
            this.method_383();
            return const_2361;
         }
         return const_2971;
      }
      
      private function method_383() : void
      {
         var_4689 = new class_2745(var_78,this._numColumns,this.var_2462,this.var_2415.setter);
      }
   }
}
