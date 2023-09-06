package package_183
{
   public class class_1917
   {
      
      private static var _instance:class_1917;
       
      
      private var var_1926:Array;
      
      public function class_1917(param1:Function)
      {
         this.var_1926 = [];
         super();
         this.var_1926[0] = "NOTHING";
         this.var_1926[1] = "ON_ENEMY_MAP";
         this.var_1926[2] = "ON_PVP_MAP";
         this.var_1926[3] = "VISIBLE";
         this.var_1926[4] = "INVISIBLE";
         this.var_1926[5] = "IN_RADIATION_AREA";
         this.var_1926[6] = "INSTANT_SHIELD_ACTIVE";
         this.var_1926[7] = "LOW_ON_LIFE";
         this.var_1926[8] = "ATTACKING";
         this.var_1926[9] = "ATTACKED";
         this.var_1926[10] = "MARTYR";
         this.var_1926[11] = "REPAIRING";
         this.var_1926[12] = "OUTLAW";
         this.var_1926[13] = "ON_HOME_MAP";
         this.var_1926[14] = "ON_HOSTILE_HOME_MAP";
         this.var_1926[15] = "ON_MARS_MAP";
         this.var_1926[16] = "ON_EARTH_MAP";
         this.var_1926[17] = "ON_VENUS_MAP";
         this.var_1926[18] = "ON_OWN_FACTION_MAP";
         this.var_1926[19] = "ON_X_1";
         this.var_1926[20] = "ON_X_2";
         this.var_1926[21] = "ON_X_3";
         this.var_1926[22] = "ON_X_4";
         this.var_1926[23] = "ON_X_5";
         this.var_1926[24] = "ON_X_6";
         this.var_1926[25] = "ON_X_7";
         this.var_1926[26] = "ON_X_8";
         if(param1 !== method_336)
         {
            throw new Error("MiscellaneousConditionTypes is a Singleton and can only be accessed through MiscellaneousConditionTypes.getInstance()");
         }
      }
      
      private static function method_336() : void
      {
      }
      
      public static function get instance() : class_1917
      {
         if(_instance == null)
         {
            _instance = new class_1917(method_336);
         }
         return _instance;
      }
      
      public function method_4334(param1:int) : String
      {
         return String(this.var_1926[param1]);
      }
   }
}
