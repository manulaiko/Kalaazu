package package_124
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import package_122.class_341;
   import package_37.class_170;
   import package_38.class_346;
   import package_38.class_359;
   import package_38.class_360;
   import package_38.class_897;
   import package_39.class_100;
   
   public class class_344 extends class_170
   {
       
      
      public function class_344()
      {
         super();
      }
      
      public static function run(param1:class_897) : void
      {
         var _loc4_:* = null;
         var _loc11_:* = null;
         var _loc2_:class_359 = param1.var_2669;
         var _loc3_:class_359 = param1.var_1453;
         var _loc5_:class_341 = new class_341();
         var _loc6_:class_341 = new class_341();
         var _loc7_:class_100 = class_100.getInstance();
         _loc5_.currency = method_4307(param1.price.type);
         _loc6_.currency = method_4307(param1.price.type);
         var _loc8_:int = 0;
         while(_loc8_ < _loc2_.var_4257.length)
         {
            _loc4_ = _loc2_.var_4257[_loc8_];
            _loc5_.wildcard = _loc4_.wildcard;
            _loc5_.replacement = _loc4_.replacement;
            _loc8_++;
         }
         _loc5_.baseKey = _loc2_.baseKey;
         var _loc9_:int = 0;
         while(_loc9_ < _loc3_.var_4257.length)
         {
            _loc4_ = _loc3_.var_4257[_loc9_];
            _loc6_.wildcard = _loc4_.wildcard;
            _loc6_.replacement = _loc4_.replacement;
            _loc9_++;
         }
         _loc6_.baseKey = _loc3_.baseKey;
         if(_loc4_)
         {
            _loc7_.method_2278(param1.var_413.var_1785,_loc5_,_loc6_);
         }
         else
         {
            _loc7_.method_2278(param1.var_413.var_1785,_loc5_);
         }
         var _loc10_:class_359 = param1.name_29;
         var _loc12_:int = 0;
         while(_loc12_ < _loc10_.var_4257.length)
         {
            _loc11_ = _loc10_.var_4257[_loc12_];
            _loc12_++;
         }
         if(_loc11_)
         {
            _loc7_.method_2530(param1.var_413.var_1785,param1.price.amount,param1.price.type,_loc10_.baseKey,_loc11_.replacement,param1.var_3954,param1.var_1181,param1.price.type);
         }
         else
         {
            _loc7_.method_2530(param1.var_413.var_1785,param1.price.amount,param1.price.type,_loc10_.baseKey,"",param1.var_3954,param1.var_1181,param1.price.type);
         }
      }
      
      public static function method_4307(param1:int) : String
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case class_346.CREDITS:
               _loc2_ = class_88.getItem("ttip_credits");
               break;
            case class_346.URIDIUM:
               _loc2_ = class_88.getItem("ttip_uridium");
               break;
            default:
               _loc2_ = class_88.getItem("ttip_uridium");
         }
         return _loc2_;
      }
   }
}
