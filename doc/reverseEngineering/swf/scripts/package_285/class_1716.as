package package_285
{
   import flash.filters.ColorMatrixFilter;
   import package_283.class_1714;
   import package_283.class_1715;
   
   public class class_1716 implements class_1714, class_1715
   {
       
      
      private var var_855:ColorMatrixFilter;
      
      public function class_1716(param1:Vector.<Number> = null)
      {
         super();
         this.var_855 = new ColorMatrixFilter();
         if(param1)
         {
            param1 = param1;
         }
      }
      
      public function get matrix() : Vector.<Number>
      {
         return Vector.<Number>(this.var_855.matrix);
      }
      
      public function set matrix(param1:Vector.<Number>) : void
      {
         var _loc2_:Array = !!this.var_855.matrix ? this.var_855.matrix : [];
         this.method_2107(_loc2_,param1);
         this.var_855.matrix = _loc2_;
      }
      
      private function method_2107(param1:Array, param2:Vector.<Number>) : void
      {
         var _loc3_:int = param2.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            param1[_loc4_] = param2[_loc4_];
            _loc4_++;
         }
      }
      
      public function get filter() : Object
      {
         return this.var_855;
      }
   }
}
