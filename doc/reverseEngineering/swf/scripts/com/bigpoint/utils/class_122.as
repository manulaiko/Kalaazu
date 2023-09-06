package com.bigpoint.utils
{
   import flash.text.TextField;
   import flash.text.TextFormat;
   import mx.formatters.NumberBaseRoundType;
   import mx.formatters.NumberFormatter;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   
   public class class_122
   {
      
      public static var var_3200:String = ",";
      
      public static var var_4952:String = ".";
      
      private static var var_2759:NumberFormatter = new NumberFormatter();
      
      private static var var_2452:NumberFormatter = new NumberFormatter();
       
      
      public function class_122()
      {
         super();
      }
      
      public static function method_3540() : void
      {
         method_5423();
      }
      
      public static function method_5423() : void
      {
         if(class_88.getItem("decimal_separator") != " " && class_88.getItem("thousands_separator") != " " && class_88.getItem("thousands_separator") != class_88.getItem("decimal_separator"))
         {
            var_3200 = class_88.getItem("thousands_separator");
            var_4952 = class_88.getItem("decimal_separator");
         }
         var_2759 = new NumberFormatter();
         var_2759.thousandsSeparatorTo = var_3200;
         var_2759.decimalSeparatorTo = var_4952;
         var_2759.rounding = NumberBaseRoundType.NEAREST;
         var_2452 = new NumberFormatter();
         var_2452.thousandsSeparatorTo = var_3200;
         var_2452.decimalSeparatorTo = var_4952;
         var_2452.rounding = NumberBaseRoundType.NEAREST;
      }
      
      public static function method_2678(param1:Number, param2:String, param3:RegExp, param4:String) : String
      {
         return class_413.instance.format(param1,param2,param3,param4);
      }
      
      public static function round(param1:Number, param2:int = 0) : String
      {
         var_2452.precision = param2;
         return var_2452.format(param1);
      }
      
      public static function method_98(param1:Number) : String
      {
         return var_2759.format(param1);
      }
      
      public static function method_2867(param1:String, param2:TextField, param3:String = "left", param4:TextFormat = null) : Boolean
      {
         var _loc7_:int = 0;
         var _loc5_:Number = param2.width;
         param2.autoSize = param3;
         param2.text = param1;
         if(param4 != null)
         {
            param2.defaultTextFormat = param4;
         }
         if(param2.width <= _loc5_)
         {
            return false;
         }
         var _loc6_:* = param1;
         while(param2.width > _loc5_)
         {
            _loc7_ = _loc6_.length;
            _loc6_ = _loc6_.substring(0,_loc7_ - 3) + "… ";
            param2.text = _loc6_;
         }
         return true;
      }
   }
}
