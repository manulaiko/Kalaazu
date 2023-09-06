package package_76
{
   import com.bigpoint.utils.class_129;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import package_140.class_967;
   
   public class class_1110
   {
      
      private static const const_3084:String = "<font color=\'#";
      
      private static const const_3044:String = "<font fontFamily=\'";
      
      private static const const_2545:String = "\'>";
      
      private static const const_3267:String = "</font>";
      
      public static const BR:String = "<br/>";
       
      
      public function class_1110()
      {
         super();
      }
      
      public static function method_5670(param1:uint, param2:String) : String
      {
         return const_3084 + param1.toString(16) + const_2545 + param2 + const_3267;
      }
      
      public static function method_5473(param1:String, param2:String) : String
      {
         return const_3044 + param1 + const_2545 + param2 + const_3267;
      }
      
      public static function method_3608(param1:uint, param2:uint, param3:int, param4:Boolean = true, param5:Boolean = false) : String
      {
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc6_:class_967 = class_129.method_156(param3,param4,param5);
         var _loc7_:* = "";
         var _loc8_:String = "";
         if(param5)
         {
            _loc14_ = (_loc13_ = class_88.getItem("abbreviation_days")).split("%VALUE%");
            _loc14_ = method_4418(param1,_loc14_);
            _loc8_ = method_5670(param2,_loc6_.method_1675.toString());
            _loc7_ += _loc14_.join(_loc8_);
         }
         if(param4)
         {
            if(_loc7_.length > 0)
            {
               _loc7_ += " ";
            }
            _loc16_ = (_loc15_ = class_88.getItem("abbreviation_hours")).split("%VALUE%");
            _loc16_ = method_4418(param1,_loc16_);
            _loc8_ = method_5670(param2,_loc6_.method_993.toString());
            _loc7_ += _loc16_.join(_loc8_);
         }
         if(_loc7_.length > 0)
         {
            _loc7_ += " ";
         }
         var _loc9_:String;
         var _loc10_:Array = (_loc9_ = class_88.getItem("abbreviation_minutes")).split("%VALUE%");
         _loc10_ = method_4418(param1,_loc10_);
         _loc8_ = method_5670(param2,_loc6_.method_2315.toString());
         if((_loc7_ += _loc10_.join(_loc8_)).length > 0)
         {
            _loc7_ += " ";
         }
         var _loc11_:String;
         var _loc12_:Array = (_loc11_ = class_88.getItem("abbreviation_seconds")).split("%VALUE%");
         _loc12_ = method_4418(param1,_loc12_);
         _loc8_ = method_5670(param2,_loc6_.method_5819.toString());
         return _loc7_ + _loc12_.join(_loc8_);
      }
      
      private static function method_4418(param1:uint, param2:Array) : Array
      {
         var _loc4_:* = null;
         var _loc3_:* = [];
         for each(_loc4_ in param2)
         {
            _loc3_.push(method_5670(param1,_loc4_));
         }
         return _loc3_;
      }
      
      public static function method_1252(param1:uint) : String
      {
         return "#" + param1.toString(16);
      }
      
      public static function method_2482(param1:String, param2:Vector.<class_1575>) : String
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         for each(_loc3_ in param2)
         {
            _loc4_ = _loc3_.method_5626;
            _loc5_ = _loc3_.string;
            param1 = param1.replace(_loc4_,_loc5_);
         }
         return param1;
      }
   }
}
