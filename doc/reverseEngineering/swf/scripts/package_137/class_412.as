package package_137
{
   public class class_412
   {
      
      public static const const_559:int = 0;
      
      public static const const_2146:int = 1;
      
      public static const const_738:int = 2;
      
      public static const const_1915:int = 3;
      
      public static const const_1883:int = 4;
      
      public static const const_1185:int = 5;
      
      public static const const_978:int = 6;
      
      public static const const_707:int = 7;
      
      private static var var_4255:Array;
      
      private static var var_2204:Array;
       
      
      public function class_412()
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
      
      private static function method_4089() : void
      {
         var_4255 = [];
         var_4255[const_559] = "DEFAULT";
         var_4255[const_2146] = "ENERGY_LEECH_ARRAY";
         var_4255[const_738] = "ENERGY_CHAIN_IMPULSE";
         var_4255[const_1915] = "ROCKET_PROBABILITY_MAXIMIZER";
         var_4255[const_1883] = "SHIELD_BACKUP";
         var_4255[const_978] = "SPEED_LEECH";
         var_4255[const_1185] = "BATTLE_REPAIR_BOT";
         var_4255[const_707] = "CLINGING_IMPULSE_DRONE";
      }
      
      private static function method_113() : void
      {
         var_2204 = [];
         var_2204[const_559] = "DEFAULT";
         var_2204[const_2146] = "ELA";
         var_2204[const_738] = "ECI";
         var_2204[const_1915] = "RPM";
         var_2204[const_1883] = "SBU";
         var_2204[const_978] = "SL";
         var_2204[const_1185] = "BRB";
         var_2204[const_707] = "CID";
      }
   }
}
