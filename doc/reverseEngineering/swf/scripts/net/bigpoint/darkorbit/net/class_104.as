package net.bigpoint.darkorbit.net
{
   import com.bigpoint.utils.class_122;
   import flash.utils.Dictionary;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.class_9;
   import net.bigpoint.darkorbit.gui.class_187;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.mvc.common.utils.TextUtils;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import package_126.class_354;
   import package_127.class_356;
   import package_30.class_91;
   import package_33.class_93;
   import package_35.class_338;
   import package_38.class_117;
   import package_38.class_353;
   import package_69.class_181;
   import package_75.class_355;
   import package_9.class_50;
   
   public class class_104 extends class_96
   {
      
      private static var _instance:class_104;
       
      
      private var var_4251:String;
      
      private var var_1448:String;
      
      private var var_139:Dictionary;
      
      private var main:class_9;
      
      public function class_104(param1:Function)
      {
         super();
         if(param1 !== method_336)
         {
            throw new Error("SettingsAssembly is a Singleton and can only be accessed through BoxCollectResponseAssembly.getInstance()");
         }
         this.main = var_574;
         this.method_709();
      }
      
      public static function getInstance() : class_104
      {
         if(_instance == null)
         {
            _instance = new class_104(method_336);
         }
         return _instance;
      }
      
      private static function method_336() : void
      {
      }
      
      private function method_709() : void
      {
         this.var_139 = new Dictionary();
         this.var_139[class_74.const_2548] = this.method_4191;
         this.var_139[class_74.const_2656] = this.method_5519;
         this.var_139[class_74.const_1559] = this.method_69;
         this.var_139[class_74.const_1668] = this.method_973;
         this.var_139[class_74.const_1549] = this.method_4004;
         this.var_139[class_74.const_1113] = this.method_687;
         this.var_139[class_74.const_1513] = this.method_2925;
         this.var_139[class_74.const_2048] = this.method_2686;
         this.var_139[class_74.const_785] = this.method_6065;
         this.var_139[class_74.const_69] = this.method_4786;
         this.var_139[class_74.const_1630] = this.method_1110;
         this.var_139[class_74.const_529] = this.method_2613;
         this.var_139[class_74.const_322] = this.method_1519;
         this.var_139[class_74.const_1496] = this.method_1972;
         this.var_139[class_74.const_1868] = this.method_4221;
         this.var_139[class_74.const_1297] = this.method_988;
         this.var_139[class_74.const_2506] = this.method_490;
         this.var_139[class_74.const_1002] = this.method_5676;
         this.var_139[class_74.const_2038] = this.method_5217;
         this.var_139[class_74.const_2133] = this.method_124;
         this.var_139[class_74.const_589] = this.method_160;
         this.var_139[class_74.const_2772] = this.method_6300;
         this.var_139[class_74.LOGFILE] = this.method_2680;
         this.var_139[class_74.const_2621] = this.method_4701;
         this.var_139[class_74.const_1951] = this.method_3776;
         this.var_139[class_74.const_2790] = this.method_5330;
         this.var_139[class_74.const_3010] = this.method_3681;
      }
      
      private function method_3681(param1:Array) : void
      {
         var _loc5_:* = null;
         var _loc2_:String = param1[2];
         var _loc3_:String = param1[4];
         var _loc4_:int = int(param1[5]);
         switch(_loc3_)
         {
            case class_74.const_1483:
               _loc5_ = "msg_info_booster_quest_reward_higher_loot_level";
               break;
            case class_74.const_2670:
               _loc5_ = "msg_info_booster_bonus_box_higher_box_content_level";
         }
         if(_loc4_ > 0)
         {
            this.main.method_4489().writeToLog(class_88.getItem(_loc5_).replace(/%AMOUNT%/,_loc4_),_loc2_);
         }
      }
      
      private function method_4701(param1:Array) : void
      {
         var _loc5_:* = null;
         var _loc2_:String = param1[2];
         var _loc3_:String = param1[4];
         var _loc4_:int = int(param1[5]);
         switch(_loc3_)
         {
            case class_74.const_1159:
               if(_loc4_ > 0)
               {
                  _loc5_ = "msg_warning_less_box_content_level";
                  break;
               }
               _loc5_ = "msg_warning_no_box_content_level";
               break;
            case class_74.const_735:
               if(_loc4_ > 0)
               {
                  _loc5_ = "msg_warning_less_loot_level";
                  break;
               }
               _loc5_ = "msg_warning_no_loot_level";
               break;
         }
         this.main.method_4489().writeToLog(class_88.getItem(_loc5_).replace(/%AMOUNT%/,_loc4_),_loc2_);
      }
      
      private function method_2680(param1:Array) : void
      {
         var _loc4_:* = null;
         var _loc2_:int = int(param1[4]);
         var _loc3_:String = param1[2];
         if(_loc2_ == 1)
         {
            _loc4_ = class_88.getItem("log_msg_gather_log-file_s");
         }
         else
         {
            _loc4_ = class_88.getItem("log_msg_gather_log-file_p").replace(/%COUNT%/,_loc2_);
         }
         this.main.method_4489().writeToLog(_loc4_,_loc3_);
      }
      
      private function method_6300(param1:Array) : void
      {
         var _loc5_:* = null;
         var _loc2_:String = TextUtils.getTranslationByType(param1[4],class_117.const_2983);
         var _loc3_:int = int(param1[5]);
         var _loc4_:String = param1[2];
         _loc5_ = class_88.getItem("getbonusrok").replace(/%!/,class_122.method_98(_loc3_)).replace(/%2!/,_loc2_);
         this.main.method_4489().writeToLog(_loc5_,_loc4_);
      }
      
      private function method_4221(param1:Array) : void
      {
         var _loc6_:* = null;
         var _loc2_:String = TextUtils.getTranslationByType(param1[4],class_117.const_2983);
         var _loc3_:int = int(param1[5]);
         var _loc5_:String = param1[2];
         if(_loc3_ == 1)
         {
            _loc6_ = class_88.getItem("log_msg_gather_mine_s");
         }
         else
         {
            _loc6_ = class_88.getItem("log_msg_gather_mine_p").replace(/%COUNT%/,class_122.method_98(_loc3_));
         }
         _loc6_ = _loc6_.replace(/%TYPE%/,_loc2_);
         this.main.method_4489().writeToLog(_loc6_,_loc5_);
      }
      
      private function method_160(param1:Array) : void
      {
         var _loc2_:String = param1[2];
         this.main.method_4489().writeToLog(class_88.getItem("msg_jackpot_players_left").replace(/%COUNT%/,param1[4]),_loc2_);
      }
      
      private function method_124(param1:Array) : void
      {
         var _loc2_:String = param1[4];
         var _loc3_:class_354 = map.method_3454(_loc2_) as class_354;
         if(_loc3_)
         {
            _loc3_.bang();
            map.removeEntity(_loc3_);
         }
      }
      
      private function method_5217(param1:Array) : void
      {
         var _loc2_:String = param1[2];
         var _loc3_:class_90 = this.main.name_47.map;
         if(_loc3_ != null)
         {
         }
         this.main.method_4489().writeToLog(class_88.getItem("boxdisabled"),_loc2_);
      }
      
      private function method_5676(param1:Array) : void
      {
         var _loc2_:String = param1[2];
         var _loc3_:class_90 = this.main.name_47.map;
         if(_loc3_ != null)
         {
         }
         this.main.method_4489().writeToLog(class_88.getItem("boxtoobig"),_loc2_);
      }
      
      private function method_1519(param1:Array) : void
      {
         var _loc5_:* = null;
         var _loc2_:int = int(param1[4]);
         var _loc3_:String = param1[2];
         if(_loc2_ > 1)
         {
            _loc5_ = class_88.getItem("log_msg_gather_extra-energy_p").replace(/%COUNT%/,_loc2_);
         }
         else
         {
            _loc5_ = class_88.getItem("log_msg_gather_extra-energy_s");
         }
         this.main.method_4489().writeToLog(_loc5_,_loc3_);
      }
      
      private function method_1972(param1:Array) : void
      {
         var _loc5_:* = null;
         var _loc2_:int = int(param1[4]);
         var _loc3_:String = param1[2];
         if(_loc2_ == 1)
         {
            _loc5_ = class_88.getItem("log_msg_gather_jump-voucher_s");
         }
         else
         {
            _loc5_ = class_88.getItem("log_msg_gather_jump-voucher_p").replace(/%COUNT%/,_loc2_);
         }
         this.main.method_4489().writeToLog(_loc5_,_loc3_);
      }
      
      private function method_988(param1:Array) : void
      {
         var _loc5_:* = null;
         var _loc2_:int = int(param1[4]);
         var _loc3_:String = param1[2];
         if(_loc2_ == 1)
         {
            _loc5_ = class_88.getItem("log_msg_gather_pet-fuel_s");
         }
         else
         {
            _loc5_ = class_88.getItem("log_msg_gather_pet-fuel_p").replace(/%COUNT%/,_loc2_);
         }
         this.main.method_4489().writeToLog(_loc5_,_loc3_);
      }
      
      private function method_490(param1:Array) : void
      {
         var _loc7_:* = null;
         var _loc2_:String = param1[4];
         var _loc3_:int = int(param1[5]);
         var _loc4_:String = param1[2];
         var _loc6_:class_356;
         if((_loc6_ = class_126.getInstance().var_2033[_loc2_] as class_356) != null)
         {
            if(_loc3_ == 1)
            {
               _loc7_ = class_88.getItem("log_msg_gather_" + _loc6_.category + "_s").replace(/%TYPE%/,_loc6_.name);
            }
            else
            {
               _loc7_ = class_88.getItem("log_msg_gather_" + _loc6_.category + "_p").replace(/%TYPE%/,_loc6_.name).replace(/%COUNT%/,class_122.method_98(_loc3_));
            }
            this.main.method_4489().writeToLog(_loc7_,_loc4_);
         }
      }
      
      private function method_3776(param1:Array) : void
      {
         var _loc2_:int = int(param1[4]);
         var _loc3_:class_86 = this.main.name_47.map.hero;
         class_50.getInstance().map.effects.method_5084(new class_355(_loc3_,_loc2_,true));
         var _loc4_:String = class_88.getItem("msg_loot_harvest_init");
         this.main.method_4489().writeToLog(_loc4_);
      }
      
      private function method_5330(param1:Array) : void
      {
         var _loc2_:class_86 = this.main.name_47.map.hero;
         class_50.getInstance().map.effects.method_3217(_loc2_.id,class_338.const_2285);
         var _loc3_:String = class_88.getItem("msg_loot_error_generic");
         this.main.method_4489().writeToLog(_loc3_);
      }
      
      private function method_2613(param1:Array) : void
      {
         var _loc2_:String = param1[2];
         var _loc3_:int = int(param1[4]);
         this.main.method_4489().writeToLog(class_88.getItem("minushp").replace(this.var_4251,_loc3_),_loc2_);
      }
      
      private function method_1110(param1:Array) : void
      {
         var _loc2_:String = param1[2];
         var _loc3_:int = int(param1[4]);
         this.main.method_4489().writeToLog(class_88.getItem("banking_multiplier_active").replace(this.var_4251,_loc3_),_loc2_);
      }
      
      private function method_4786(param1:Array) : void
      {
         var _loc2_:String = param1[2];
         var _loc3_:String = TextUtils.getTranslationByType(param1[4],class_117.const_2983);
         var _loc4_:int = int(param1[5]);
         this.main.method_4489().writeToLog(class_88.getItem("getbonuslas").replace(this.var_4251,_loc4_).replace(this.var_1448,_loc3_),_loc2_);
      }
      
      private function method_6065(param1:Array) : void
      {
         var _loc2_:String = param1[2];
         var _loc3_:String = TextUtils.getTranslationByType(param1[4],class_117.const_2983);
         var _loc4_:int = int(param1[5]);
         this.main.method_4489().writeToLog(class_88.getItem("getbonusrok").replace(this.var_4251,_loc4_).replace(this.var_1448,_loc3_),_loc2_);
      }
      
      private function method_2686(param1:Array) : void
      {
         var _loc2_:String = param1[2];
         var _loc3_:String = TextUtils.getTranslationByType(param1[4],class_117.const_2983);
         var _loc4_:int = int(param1[5]);
         this.main.method_4489().writeToLog(class_88.getItem("log_collected_firework").replace(this.var_4251,_loc4_).replace(this.var_1448,_loc3_),_loc2_);
      }
      
      private function method_2925(param1:Array) : void
      {
         var _loc2_:String = param1[2];
         var _loc3_:Number = parseFloat(param1[4]);
         this.main.method_4489().writeToLog(class_88.getItem("gethp").replace(this.var_4251,_loc3_),_loc2_);
      }
      
      private function method_687(param1:Array) : void
      {
         var _loc2_:String = param1[2];
         var _loc3_:Number = Number(param1[4]);
         this.main.method_4489().writeToLog(class_88.getItem("gatherep").replace(this.var_4251,_loc3_),_loc2_);
         class_81.var_2369 = param1[5];
         this.updateInfoField(GuiConstants.USER_WINDOW,class_93.var_3333,class_91.const_2295);
      }
      
      private function method_4004(param1:Array) : void
      {
         var _loc2_:String = param1[2];
         var _loc3_:Number = parseFloat(param1[4]);
         this.main.method_4489().writeToLog(class_88.getItem("getexp").replace(this.var_4251,class_122.method_98(_loc3_)),_loc2_);
         class_81.var_5027 = parseFloat(param1[5]);
         this.updateInfoField(GuiConstants.USER_WINDOW,class_93.var_3333,class_91.const_1371);
         class_81.level = int(param1[6]);
         this.updateInfoField(GuiConstants.USER_WINDOW,class_93.var_3333,class_91.const_2982);
      }
      
      private function method_973(param1:Array) : void
      {
         var _loc2_:String = param1[2];
         var _loc3_:Number = parseFloat(param1[4]);
         this.main.method_4489().writeToLog(class_88.getItem("geturidium").replace(this.var_4251,class_122.method_98(_loc3_)),_loc2_);
         class_81.var_3732 = parseFloat(param1[5]);
         this.updateInfoField(GuiConstants.USER_WINDOW,class_93.var_886,class_91.const_1329);
      }
      
      private function method_69(param1:Array) : void
      {
         var _loc2_:String = param1[2];
         var _loc3_:Number = parseFloat(param1[4]);
         this.main.method_4489().writeToLog(class_88.getItem("getcredits").replace(this.var_4251,class_122.method_98(_loc3_)),_loc2_);
         class_81.var_3705 = Number(param1[5]);
         this.updateInfoField(GuiConstants.USER_WINDOW,class_93.var_886,class_91.const_1115);
      }
      
      private function method_5519(param1:Array) : void
      {
         var _loc2_:String = param1[2];
         var _loc3_:Number = parseFloat(param1[4]);
         this.main.method_4489().writeToLog(class_88.getItem("getjackpot").replace(this.var_4251,class_122.round(_loc3_,2)),_loc2_);
         class_81.var_4516 = parseFloat(param1[5]);
         this.updateInfoField(GuiConstants.USER_WINDOW,class_93.var_886,class_91.const_1026);
      }
      
      public function method_4191(param1:uint, param2:Vector.<class_353>) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc3_:String = class_88.getItem("farmresult");
         for each(_loc4_ in param2)
         {
            if((_loc5_ = int(_loc4_.count)) > 0)
            {
               _loc3_ += "\n" + _loc5_ + " " + class_88.getItem(class_181.var_2567[_loc4_.var_4809.var_2008]);
            }
         }
         if(_loc3_.length != class_88.getItem("farmresult").length)
         {
            this.main.method_4489().writeToLog(_loc3_,this.method_2345(param1));
         }
      }
      
      private function method_2345(param1:uint) : String
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case 0:
               _loc2_ = "ST";
               break;
            case 1:
               _loc2_ = "HP";
         }
         return _loc2_;
      }
      
      private function updateInfoField(param1:String, param2:int, param3:int) : void
      {
         this.main.method_4489().updateInfoField(param1,param2,param3);
      }
      
      public function method_5709(param1:Array) : void
      {
         var _loc3_:* = null;
         param1 = this.method_923(param1);
         var _loc2_:String = param1[3];
         if(this.var_139[_loc2_] != null)
         {
            this.var_139[_loc2_](param1);
         }
         else
         {
            _loc3_ = class_88.getItem(_loc2_);
            if(_loc3_.length > 0)
            {
               this.main.method_4489().writeToLog(_loc3_,param1[2]);
            }
         }
      }
      
      private function method_923(param1:Array) : Array
      {
         if(param1[1] == class_74.const_3321)
         {
            param1[0] = class_74.const_2118;
            param1[1] = class_187.const_1495;
            param1.unshift("0");
         }
         return param1;
      }
      
      public function method_6219(param1:String, param2:String) : void
      {
         this.var_4251 = param1;
         this.var_1448 = param2;
      }
   }
}
