package net.bigpoint.darkorbit.mvc.battlestationswindow
{
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   import package_163.class_1520;
   import package_38.class_683;
   import package_9.ResourceManager;
   
   public class class_1023
   {
      
      private static var var_2694:Object = {};
      
      public static const const_2503:String = "filterChange";
      
      public static const const_1822:Dictionary = new Dictionary();
      
      public static const const_528:Object = {};
      
      public static const const_2224:String = "hull";
      
      public static const const_1277:String = "deflector";
      
      public static const const_2380:String = "engineering_bay";
      
      public static const const_2001:String = "lasers";
      
      public static const const_1144:String = "rockets";
      
      public static const const_2758:String = "boosters";
      
      public static const SHOW_ALL:String = "show_all";
      
      public static const const_1384:Object = {};
      
      public static const const_2968:Array = [];
      
      {
         const_1822[class_1520.NONE] = "itemslot_empty";
         const_1822[class_1520.const_632] = "destroyedModule";
         const_1822[class_1520.HULL] = "module_hulm_1";
         const_1822[class_1520.DEFLECTOR] = "module_defm_1";
         const_1822[class_1520.REPAIR] = "module_repm_1";
         const_1822[class_1520.DAMAGE_BOOSTER] = "damageBoosterModulePH";
         const_1822[class_1520.LASER_HIGH_RANGE] = "module_ltm_hr";
         const_1822[class_1520.LASER_MID_RANGE] = "module_ltm_mr";
         const_1822[class_1520.LASER_LOW_RANGE] = "module_ltm_lr";
         const_1822[class_1520.ROCKET_MID_ACCURACY] = "module_ram_ma";
         const_1822[class_1520.ROCKET_LOW_ACCURACY] = "module_ram_la";
         const_1822[class_1520.HONOR_BOOSTER] = "module_honm_1";
         const_1822[class_1520.DAMAGE_BOOSTER] = "module_dmgm_1";
         const_1822[class_1520.EXPERIENCE_BOOSTER] = "module_xpm_1";
         const_528[class_1520.HULL] = "module_hulm-1";
         const_528[class_1520.DEFLECTOR] = "module_defm-1";
         const_528[class_1520.REPAIR] = "module_repm-1";
         const_528[class_1520.LASER_LOW_RANGE] = "module_ltm-lr";
         const_528[class_1520.LASER_MID_RANGE] = "module_ltm-mr";
         const_528[class_1520.LASER_HIGH_RANGE] = "module_ltm-hr";
         const_528[class_1520.ROCKET_MID_ACCURACY] = "module_ram-ma";
         const_528[class_1520.ROCKET_LOW_ACCURACY] = "module_ram-la";
         const_528[class_1520.HONOR_BOOSTER] = "module_honm-1";
         const_528[class_1520.DAMAGE_BOOSTER] = "module_dmgm-1";
         const_528[class_1520.EXPERIENCE_BOOSTER] = "module_xpm-1";
         const_1384[class_1520.HULL] = const_2224;
         const_1384[class_1520.DEFLECTOR] = const_1277;
         const_1384[class_1520.REPAIR] = const_2380;
         const_1384[class_1520.LASER_LOW_RANGE] = const_2001;
         const_1384[class_1520.LASER_MID_RANGE] = const_2001;
         const_1384[class_1520.LASER_HIGH_RANGE] = const_2001;
         const_1384[class_1520.ROCKET_MID_ACCURACY] = const_1144;
         const_1384[class_1520.ROCKET_LOW_ACCURACY] = const_1144;
         const_1384[class_1520.HONOR_BOOSTER] = const_2758;
         const_1384[class_1520.DAMAGE_BOOSTER] = const_2758;
         const_1384[class_1520.EXPERIENCE_BOOSTER] = const_2758;
         const_2968[class_683.const_838] = "error_bswin_unspecified";
         const_2968[class_683.const_1509] = "error_bswin_no_clan";
         const_2968[class_683.const_2249] = "error_bswin_station_already_building";
         const_2968[class_683.const_2075] = "error_bswin_item_hitpoints_not_full";
         const_2968[class_683.const_2362] = "error_bswin_item_already_equipped_in_another_asteroid";
         const_2968[class_683.const_2906] = "error_bswin_concurrent_equip";
         const_2968[class_683.const_495] = "error_bswin_replace_rights_missing";
         const_2968[class_683.const_524] = "error_bswin_item_not_owned";
         const_2968[class_683.const_826] = "error_bswin_out_of_range";
         const_2968[class_683.const_593] = "error_bswin_equip_of_same_player_running";
         const_2968[class_683.const_2541] = "error_bswin_satellite_only";
         const_2968[class_683.const_2559] = "error_bswin_hub_only";
         const_2968[class_683.const_251] = "error_bswin_item_not_in_station";
         const_2968[class_683.const_82] = "error_bswin_max_number_of_module_type_exceeded";
         const_2968[class_683.const_912] = "error_bswin_deflector_no_rights";
         const_2968[class_683.const_341] = "error_bswin_deflector_already_off";
         const_2968[class_683.const_1983] = "error_bswin_repair_no_module";
         const_2968[class_683.const_1812] = "error_bswin_repair_no_money";
         const_2968[class_683.const_2444] = "error_bswin_repair_already_running";
      }
      
      public function class_1023()
      {
         super();
      }
      
      public static function getBitmapData(param1:String) : BitmapData
      {
         var _loc2_:BitmapData = var_2694[param1] as BitmapData;
         if(_loc2_)
         {
            return _loc2_;
         }
         return var_2694[param1] = ResourceManager.getBitmapData("battleStationsUI",param1);
      }
   }
}
