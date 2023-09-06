package net.bigpoint.darkorbit.gui
{
   public class class_1499
   {
      
      private static var var_503:Vector.<class_176> = new Vector.<class_176>();
       
      
      public function class_1499()
      {
         super();
      }
      
      public static function method_3714(param1:class_176) : void
      {
         var_503.push(param1);
      }
      
      public static function method_1262(param1:int) : class_176
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_503)
         {
            if(param1 == _loc2_.getID())
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public static function getBarStatesAsString() : String
      {
         var _loc2_:* = null;
         var _loc1_:String = "";
         for each(_loc2_ in var_503)
         {
            _loc1_ += _loc2_.getID() + "," + _loc2_.var_3041 + "|";
         }
         return _loc1_;
      }
   }
}
