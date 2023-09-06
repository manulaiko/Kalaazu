package package_120
{
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.class_126;
   
   public class class_2010
   {
      
      public static const const_714:uint = 0;
      
      public static const const_2888:uint = 4289352960;
      
      public static const const_1021:Number = 1;
      
      public static const const_342:Number = 0.4;
      
      public static const const_792:uint = 4294940928;
      
      public static const const_2839:Number = 0;
      
      public static const const_1676:Number = 1;
      
      public static const const_1651:uint = 16711680;
      
      public static const const_377:uint = 65280;
      
      public static const const_3295:uint = 255;
      
      public static const const_625:uint = 16776960;
      
      public static const const_724:uint = 16777215;
      
      public static const const_3081:uint = 0;
      
      public static const const_45:uint = 0;
      
      public static const const_1607:uint = 1;
      
      public static const const_2997:uint = 4294967295;
      
      public static const const_1485:Dictionary = new Dictionary();
      
      {
         method_4904();
      }
      
      public var var_2501:uint = 0;
      
      public var var_2132:uint = 0;
      
      public var lineColor:uint = 4294940928;
      
      public var lineAlpha:Number = 0;
      
      public var fillColor:uint = 4289352960;
      
      public var var_3490:Number = 1;
      
      public var var_1355:Number = 1;
      
      public var fillAlpha:Number = 0.4;
      
      public function class_2010()
      {
         super();
      }
      
      public static function method_1388(param1:class_431) : uint
      {
         var _loc5_:int = 0;
         var _loc2_:String = method_1171(param1);
         var _loc3_:class_2010 = class_2010.const_1485[_loc2_] as class_2010;
         var _loc4_:* = 0;
         if(_loc3_)
         {
            _loc4_ = uint(_loc3_.fillColor);
         }
         if(param1.method_807 == class_431.const_1104 || param1.method_807 == class_431.const_16)
         {
            if((_loc5_ = int(class_126.method_4731(param1.zoneTypeSpecification.value))) != -1)
            {
               _loc4_ = uint(class_126.getInstance().method_6115[_loc5_]);
            }
         }
         if(_loc4_ == class_2010.const_2997)
         {
            _loc4_ = 0;
         }
         return _loc4_;
      }
      
      public static function method_5013(param1:class_431) : uint
      {
         var _loc2_:String = method_1171(param1);
         var _loc3_:class_2010 = class_2010.const_1485[_loc2_] as class_2010;
         var _loc4_:Number = 0;
         if(_loc3_)
         {
            _loc4_ = Number(_loc3_.var_2132);
         }
         return _loc4_;
      }
      
      public static function method_1227(param1:class_431) : uint
      {
         var _loc2_:String = method_1171(param1);
         var _loc3_:class_2010 = class_2010.const_1485[_loc2_] as class_2010;
         var _loc4_:Number = 0;
         if(_loc3_)
         {
            _loc4_ = Number(_loc3_.var_2501);
         }
         return _loc4_;
      }
      
      public static function method_3220(param1:class_431) : Number
      {
         var _loc2_:String = method_1171(param1);
         var _loc3_:class_2010 = class_2010.const_1485[_loc2_] as class_2010;
         var _loc4_:Number = 0;
         if(_loc3_)
         {
            _loc4_ = Number(_loc3_.var_3490);
         }
         return _loc4_;
      }
      
      public static function method_5228(param1:class_431) : Number
      {
         var _loc2_:String = method_1171(param1);
         var _loc3_:class_2010 = class_2010.const_1485[_loc2_] as class_2010;
         var _loc4_:Number = 0;
         if(_loc3_)
         {
            _loc4_ = Number(_loc3_.fillAlpha);
         }
         return _loc4_;
      }
      
      public static function method_4696(param1:class_431) : uint
      {
         var _loc5_:int = 0;
         var _loc2_:String = method_1171(param1);
         var _loc3_:class_2010 = class_2010.const_1485[_loc2_] as class_2010;
         var _loc4_:* = 0;
         if(_loc3_)
         {
            _loc4_ = uint(_loc3_.lineColor);
         }
         if(param1.method_807 == class_431.const_16)
         {
            if((_loc5_ = int(class_126.method_4731(param1.zoneTypeSpecification.value))) != -1)
            {
               _loc4_ = uint(class_126.getInstance().method_6115[_loc5_]);
            }
            else
            {
               _loc4_ = 0;
            }
         }
         return _loc4_;
      }
      
      public static function method_1501(param1:class_431) : Number
      {
         var _loc2_:String = method_1171(param1);
         var _loc3_:class_2010 = class_2010.const_1485[_loc2_] as class_2010;
         var _loc4_:Number = 0;
         if(_loc3_)
         {
            _loc4_ = Number(_loc3_.lineAlpha);
         }
         return _loc4_;
      }
      
      public static function method_3772(param1:class_431) : Number
      {
         var _loc2_:String = method_1171(param1);
         var _loc3_:class_2010 = class_2010.const_1485[_loc2_] as class_2010;
         var _loc4_:Number = 0;
         if(_loc3_)
         {
            _loc4_ = Number(_loc3_.var_1355);
         }
         return _loc4_;
      }
      
      private static function method_1171(param1:class_431) : String
      {
         var _loc2_:String = param1.method_807;
         if(param1.zoneTypeSpecification.value && param1.zoneTypeSpecification.value.length > 1 && param1.method_807 == class_431.const_2821)
         {
            _loc2_ += "_" + param1.zoneTypeSpecification;
         }
         return _loc2_;
      }
      
      public static function method_6177(param1:String) : class_2010
      {
         return class_2010.const_1485[param1] as class_2010;
      }
      
      private static function method_4904() : void
      {
         var _loc1_:* = null;
         _loc1_ = new class_2010();
         _loc1_.var_2501 = const_1607;
         _loc1_.var_2132 = const_1607;
         _loc1_.fillAlpha = 0.2;
         _loc1_.lineColor = const_724;
         _loc1_.lineAlpha = 0.4;
         _loc1_.fillColor = const_1651;
         _loc1_.var_3490 = 1;
         const_1485[class_431.const_2513] = _loc1_;
         _loc1_ = new class_2010();
         _loc1_.fillColor = const_377;
         _loc1_.lineColor = const_3081;
         _loc1_.var_3490 = 1;
         const_1485[class_431.const_1780] = _loc1_;
         _loc1_ = new class_2010();
         _loc1_.fillColor = const_3295;
         _loc1_.lineColor = const_3081;
         _loc1_.var_3490 = 1;
         const_1485[class_431.const_1212] = _loc1_;
         _loc1_ = new class_2010();
         _loc1_.var_2501 = const_1607;
         _loc1_.fillColor = const_3295;
         _loc1_.lineColor = const_3081;
         _loc1_.var_3490 = 1;
         const_1485[class_431.const_32] = _loc1_;
         _loc1_ = new class_2010();
         _loc1_.var_2501 = const_1607;
         _loc1_.var_2132 = const_1607;
         _loc1_.lineColor = const_1651;
         _loc1_.lineAlpha = 0.4;
         _loc1_.fillColor = const_1651;
         _loc1_.var_3490 = 0.4;
         const_1485[class_431.const_62] = _loc1_;
         _loc1_ = new class_2010();
         _loc1_.var_3490 = 0.25;
         const_1485[class_431.const_1104] = _loc1_;
         _loc1_ = new class_2010();
         _loc1_.lineAlpha = 1;
         _loc1_.var_1355 = 1;
         _loc1_.var_3490 = 0.25;
         const_1485[class_431.const_16] = _loc1_;
         _loc1_ = new class_2010();
         _loc1_.lineColor = const_724;
         _loc1_.fillColor = const_377;
         _loc1_.var_3490 = 0;
         _loc1_.lineAlpha = 0;
         const_1485[class_431.const_1709] = _loc1_;
         _loc1_ = new class_2010();
         _loc1_.fillColor = const_377;
         _loc1_.var_3490 = 1;
         _loc1_.fillAlpha = 0;
         _loc1_.lineColor = const_724;
         _loc1_.lineAlpha = 0.5;
         _loc1_.var_1355 = 1;
         const_1485[class_431.const_1881] = _loc1_;
      }
   }
}
