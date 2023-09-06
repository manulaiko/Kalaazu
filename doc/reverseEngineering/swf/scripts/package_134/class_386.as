package package_134
{
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.net.class_74;
   import package_35.class_338;
   import package_75.class_1480;
   import package_75.class_1481;
   import package_75.class_1482;
   import package_75.class_1483;
   import package_75.class_1484;
   import package_75.class_1485;
   
   public class class_386
   {
      
      public static const const_399:String = "SHIP_SKILL_SOLACE";
      
      public static const const_775:String = "SHIP_SKILL_DIMINISHER";
      
      public static const const_3036:String = "SHIP_SKILL_SPECTRUM";
      
      public static const const_1177:String = "SHIP_SKILL_SENTINEL";
      
      public static const const_3043:String = "SHIP_SKILL_VENOM";
      
      public static const const_880:String = "SHIP_SKILL_LIGHTNING";
      
      public static const const_1704:String = "SHIP_SKILL_AEGIS_HEALING_BEAM";
      
      public static const const_1314:String = "SHIP_SKILL_AEGIS_SHIELD_BEAM";
      
      public static const const_691:String = "SHIP_SKILL_AEGIS_HEALING_POD";
      
      public static const const_52:String = "SHIP_SKILL_CITADEL_DRAW_FIRE";
      
      public static const const_3233:String = "SHIP_SKILL_CITADEL_TRAVEL_MODE";
      
      public static const const_2377:String = "SHIP_SKILL_CITADEL_FORTIFY";
      
      public static const const_850:String = "SHIP_SKILL_CITADEL_PROTECTION";
      
      public static const const_815:String = "SHIP_SKILL_SPEARHEAD_ULTIMATE_CLOAKING";
      
      public static const const_2734:String = "SHIP_SKILL_SPEARHEAD_JAMX";
      
      public static const const_1389:String = "SHIP_SKILL_SPEARHEAD_MARK_TARGET";
      
      public static const const_1471:String = "SHIP_SKILL_SPEARHEAD_DOUBLE_MINIMAP";
      
      private static var var_4255:Array;
      
      private static var var_2204:Array;
      
      private static var var_2770:Array;
      
      private static var var_2558:Object = {};
      
      {
         var_2558[class_126.const_1952] = class_1480;
         var_2558[class_126.const_1583] = class_1484;
         var_2558[class_126.const_1779] = class_1483;
         var_2558[class_126.const_1124] = class_1485;
         var_2558[class_126.const_1250] = class_1481;
         var_2558[class_126.const_80] = class_1482;
      }
      
      public function class_386()
      {
         super();
      }
      
      public static function method_1243(param1:int) : String
      {
         if(var_4255 == null)
         {
            method_4089();
         }
         return var_4255[param1];
      }
      
      public static function method_2229(param1:int) : String
      {
         if(var_2204 == null)
         {
            method_113();
         }
         return var_2204[param1];
      }
      
      public static function method_4481(param1:String) : int
      {
         if(var_2204 == null)
         {
            method_113();
         }
         return var_2204.indexOf(param1);
      }
      
      public static function method_1232(param1:int) : int
      {
         if(var_2770 == null)
         {
            method_255();
         }
         return var_2770[param1];
      }
      
      private static function method_4089() : void
      {
         var_4255 = [];
         var_4255[class_126.const_1952] = const_399;
         var_4255[class_126.const_1583] = const_775;
         var_4255[class_126.const_1779] = const_1177;
         var_4255[class_126.const_1124] = const_3036;
         var_4255[class_126.const_1250] = const_3043;
         var_4255[class_126.const_80] = const_880;
         var_4255[class_126.const_1423] = const_1704;
         var_4255[class_126.const_806] = const_1314;
         var_4255[class_126.const_1361] = const_691;
         var_4255[class_126.const_437] = const_52;
         var_4255[class_126.const_448] = const_3233;
         var_4255[class_126.const_1508] = const_2377;
         var_4255[class_126.const_3104] = const_850;
         var_4255[class_126.const_1752] = const_815;
         var_4255[class_126.const_545] = const_2734;
         var_4255[class_126.const_3217] = const_1389;
         var_4255[class_126.const_1685] = const_1471;
      }
      
      private static function method_113() : void
      {
         var_2204 = [];
         var_2204[class_126.const_1952] = class_74.const_2398;
         var_2204[class_126.const_1583] = class_74.const_2767;
         var_2204[class_126.const_1779] = class_74.const_2098;
         var_2204[class_126.const_1124] = class_74.const_931;
         var_2204[class_126.const_1250] = class_74.const_2659;
         var_2204[class_126.const_80] = class_74.const_2169;
         var_2204[class_126.const_1423] = class_74.const_449;
         var_2204[class_126.const_806] = class_74.const_1092;
         var_2204[class_126.const_1361] = class_74.const_2034;
         var_2204[class_126.const_437] = class_74.const_1969;
         var_2204[class_126.const_448] = class_74.const_3239;
         var_2204[class_126.const_1508] = class_74.const_1659;
         var_2204[class_126.const_3104] = class_74.const_970;
         var_2204[class_126.const_1752] = class_74.const_235;
         var_2204[class_126.const_545] = class_74.const_2403;
         var_2204[class_126.const_3217] = class_74.const_374;
         var_2204[class_126.const_1685] = class_74.const_1052;
      }
      
      private static function method_255() : void
      {
         var_2770 = [];
         var_2770[class_126.const_1952] = class_338.const_1733;
         var_2770[class_126.const_1583] = class_338.const_2390;
         var_2770[class_126.const_1779] = class_338.const_1875;
         var_2770[class_126.const_1124] = class_338.const_356;
         var_2770[class_126.const_1250] = class_338.const_1766;
         var_2770[class_126.const_80] = class_338.const_1034;
      }
      
      public static function method_2063(param1:int) : Class
      {
         return var_2558[param1];
      }
   }
}
