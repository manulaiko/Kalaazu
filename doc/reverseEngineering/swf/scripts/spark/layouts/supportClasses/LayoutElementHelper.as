package spark.layouts.supportClasses
{
   import mx.core.mx_internal;
   
   public class LayoutElementHelper
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      public function LayoutElementHelper()
      {
         super();
      }
      
      public static function pinBetween(param1:Number, param2:Number, param3:Number) : Number
      {
         return Math.min(param3,Math.max(param2,param1));
      }
      
      public static function parseConstraintValue(param1:Object) : Number
      {
         if(param1 is Number)
         {
            return Number(param1);
         }
         var _loc2_:String = param1 as String;
         if(!_loc2_)
         {
            return NaN;
         }
         var _loc3_:Array = parseConstraintExp(_loc2_);
         return _loc3_[0];
      }
      
      public static function parseConstraintExp(param1:Object) : Array
      {
         if(param1 is Number)
         {
            return [Number(param1),null];
         }
         if(!param1)
         {
            return [NaN,null];
         }
         var _loc2_:String = String(param1).replace(/:/g," ");
         var _loc3_:Array = _loc2_.split(/\s+/);
         if(_loc3_.length == 1)
         {
            return _loc3_;
         }
         return [_loc3_[1],_loc3_[0]];
      }
   }
}
