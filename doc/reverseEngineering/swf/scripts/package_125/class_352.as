package package_125
{
   import flash.utils.Dictionary;
   import package_38.class_630;
   
   public class class_352
   {
      
      public static const ROCKET:String = "ROCKET";
      
      public static const LASER:String = "LASER";
      
      public static const MINE:String = "MINE";
      
      public static const RADIATION:String = "RADIATION";
      
      public static const PLASMA:String = "PLASMA";
      
      public static const ECI:String = "ECI";
      
      public static const SL:String = "SL";
      
      public static const CID:String = "CID";
      
      public static const SINGULARITY:String = "SINGULARITY";
      
      public static const KAMIKAZE:String = "KAMIKAZE";
      
      public static const REPAIR:String = "REPAIR";
      
      public static const DECELERATION:String = "DECELERATION";
      
      public static const const_272:String = "SAR01";
      
      public static const const_455:String = "SAR02";
      
      private static var var_277:Dictionary = initialize();
       
      
      public function class_352()
      {
         super();
      }
      
      public static function method_425(param1:uint) : String
      {
         return var_277[param1];
      }
      
      private static function initialize() : Dictionary
      {
         var _loc1_:Dictionary = new Dictionary();
         _loc1_[class_630.ROCKET] = ROCKET;
         _loc1_[class_630.LASER] = LASER;
         _loc1_[class_630.MINE] = MINE;
         _loc1_[class_630.RADIATION] = RADIATION;
         _loc1_[class_630.PLASMA] = PLASMA;
         _loc1_[class_630.ECI] = ECI;
         _loc1_[class_630.SL] = SL;
         _loc1_[class_630.CID] = CID;
         _loc1_[class_630.SINGULARITY] = SINGULARITY;
         _loc1_[class_630.KAMIKAZE] = KAMIKAZE;
         _loc1_[class_630.REPAIR] = REPAIR;
         _loc1_[class_630.DECELERATION] = DECELERATION;
         _loc1_[class_630.const_272] = const_272;
         _loc1_[class_630.const_455] = const_455;
         return _loc1_;
      }
   }
}
