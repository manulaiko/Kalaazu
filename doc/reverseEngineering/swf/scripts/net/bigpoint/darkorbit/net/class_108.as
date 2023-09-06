package net.bigpoint.darkorbit.net
{
   import com.bigpoint.utils.class_122;
   import com.greensock.TweenLite;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Rectangle;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import mx.utils.StringUtil;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.class_9;
   import net.bigpoint.darkorbit.gui.class_194;
   import net.bigpoint.darkorbit.gui.class_365;
   import net.bigpoint.darkorbit.gui.class_58;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.map.model.traits.class_308;
   import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
   import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_105.class_282;
   import package_11.class_65;
   import package_128.class_364;
   import package_17.class_62;
   import package_22.class_283;
   import package_27.class_82;
   import package_29.class_85;
   import package_30.class_91;
   import package_33.class_93;
   import package_35.Effect;
   import package_35.class_338;
   import package_45.class_366;
   import package_46.class_131;
   import package_72.class_190;
   import package_72.class_281;
   import package_75.class_349;
   import package_75.class_355;
   import package_75.class_367;
   import package_75.class_369;
   import package_75.class_370;
   import package_75.class_371;
   import package_9.ResourceManager;
   import package_9.class_50;
   
   public class class_108 extends class_96
   {
      
      private static const const_58:GlowFilter = new GlowFilter(13809664,1,6,6,2,1,true);
      
      private static var instance:class_108;
       
      
      private var var_4710:Dictionary;
      
      private var var_139:Dictionary;
      
      private var var_663:class_368;
      
      private var var_1870:Dictionary;
      
      private var main:class_9;
      
      private var var_4339:Timer;
      
      private var var_3827:Boolean = false;
      
      private var var_4589:Array;
      
      private var achievements:Dictionary;
      
      private var name_20:class_62;
      
      public function class_108(param1:Function)
      {
         this.var_4339 = new Timer(6000,1);
         this.var_4589 = [];
         this.achievements = new Dictionary();
         super();
         if(param1 !== method_336)
         {
            throw new Error("SetAttributeAssembly is a Singleton and can only be accessed through SetAttributeAssembly.getInstance()");
         }
         this.main = var_574;
         this.method_709();
         this.method_5983();
         this.var_663 = class_368.getInstance();
         this.name_20 = class_62.getInstance();
      }
      
      public static function getInstance() : class_108
      {
         if(instance == null)
         {
            instance = new class_108(method_336);
         }
         return instance;
      }
      
      private static function method_336() : void
      {
      }
      
      private function method_5983() : void
      {
         this.var_4710 = new Dictionary();
         this.var_4710[3] = class_365.const_3270;
         this.var_4710[4] = class_365.const_1797;
         this.var_4710[5] = class_365.const_1853;
         this.var_4710[6] = class_365.const_2791;
         this.var_4710[7] = class_365.const_1512;
         this.var_4710[8] = class_365.const_2497;
         this.var_4710[10] = class_365.const_2829;
         this.var_4710[11] = class_365.const_1011;
         this.var_4710[12] = class_365.const_793;
         this.var_4710[13] = class_365.const_393;
         this.var_4710[14] = class_365.const_891;
         this.var_4710[15] = class_365.const_209;
         this.var_4710[16] = class_365.const_2543;
         this.var_4710[17] = class_365.const_1209;
         this.var_4710[18] = class_365.const_859;
         this.var_4710[19] = class_365.const_2336;
      }
      
      public function method_5080(param1:Array) : void
      {
         var _loc2_:String = param1[2];
         if(this.var_139[_loc2_] != null)
         {
            this.var_139[_loc2_](param1);
         }
      }
      
      private function method_709() : void
      {
         this.var_139 = new Dictionary();
         this.var_139[class_74.const_1959] = this.method_1716;
         this.var_139[class_74.const_869] = this.method_2119;
         this.var_139[class_74.const_1855] = this.method_1690;
         this.var_139[class_74.const_1895] = this.method_4650;
         this.var_139[class_74.const_366] = this.method_2629;
         this.var_139[class_74.const_915] = this.method_2723;
         this.var_139[class_74.const_894] = this.method_353;
         this.var_139[class_74.const_3126] = this.method_2017;
         this.var_139[class_74.const_2366] = this.method_4018;
         this.var_139[class_74.const_2713] = this.method_5824;
         this.var_139[class_74.const_3183] = this.method_1966;
         this.var_139[class_74.const_1846] = this.method_3059;
         this.var_139[class_74.const_2865] = this.method_2333;
         this.var_139[class_74.const_743] = this.method_2748;
         this.var_139[class_74.const_1157] = this.method_4275;
         this.var_139[class_74.const_2317] = this.method_4374;
         this.var_139[class_74.const_1118] = this.method_3382;
         this.var_139[class_74.const_2155] = this.method_4322;
         this.var_139[class_74.const_2229] = this.method_549;
         this.var_139[class_74.const_1367] = this.method_2595;
         this.var_139[class_74.const_1929] = this.method_1956;
         this.var_139[class_74.const_1656] = this.method_1593;
         this.var_139[class_74.const_1730] = this.method_1593;
         this.var_139[class_74.const_239] = this.method_1593;
         this.var_139[class_74.const_2788] = this.method_1593;
         this.var_139[class_74.const_2696] = this.method_5225;
         this.var_139[class_74.const_2071] = this.method_2203;
         this.var_139[class_74.const_1370] = this.method_271;
         this.var_139[class_74.const_1397] = this.method_4661;
         this.var_139[class_74.const_2601] = this.method_1671;
         this.var_139[class_74.const_3230] = this.method_794;
      }
      
      private function method_1671(param1:Array) : void
      {
         var _loc5_:* = null;
         var _loc2_:int = int(param1[3]);
         var _loc3_:int = int(param1[4]);
         var _loc4_:int = -1;
         if(param1.length > 5)
         {
            _loc4_ = int(param1[5]);
         }
         if(_loc2_ == 1)
         {
            _loc5_ = this.main.name_47.map.method_1203().method_3416(_loc3_);
         }
         else
         {
            _loc5_ = this.main.name_47.map.method_1203().method_2455(_loc3_);
         }
         if(!_loc5_)
         {
            return;
         }
         var _loc7_:int = 1;
         var _loc8_:Boolean = false;
         if(_loc4_ > -1)
         {
            _loc7_ = _loc4_;
            _loc8_ = true;
         }
         class_82.playSoundEffect(3,false,false,_loc5_.x,_loc5_.y);
         map.effects.method_5084(new class_355(_loc5_,_loc7_,_loc8_));
      }
      
      private function method_794(param1:Array) : void
      {
         var _loc4_:* = null;
         var _loc2_:int = int(param1[3]);
         var _loc3_:int = int(param1[4]);
         if(_loc2_ == 1)
         {
            _loc4_ = this.main.name_47.map.method_1203().method_3416(_loc3_);
         }
         else
         {
            _loc4_ = this.main.name_47.map.method_1203().method_2455(_loc3_);
         }
         map.effects.method_3217(_loc4_.id,class_338.const_2285);
         var _loc5_:String = class_88.getItem("msg_loot_error_generic");
         this.main.method_4489().writeToLog(_loc5_);
      }
      
      private function method_2595(param1:Array) : void
      {
         var _loc2_:String = String(param1[3]);
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         switch(_loc2_)
         {
            case class_74.const_35:
               this.method_865(param1);
               break;
            case class_74.const_2202:
               this.method_675(param1);
               break;
            case class_74.const_1690:
               _loc3_ = int(param1[4]);
               _loc4_ = int(param1[5]);
               this.main.method_4489().method_6388(_loc3_,_loc4_);
               map.effects.method_269(new class_367(this.hero.x,this.hero.y));
               if(_loc3_ != -1)
               {
                  this.main.name_47.method_1772.method_5917();
                  break;
               }
               this.main.name_47.method_1772.method_94();
               break;
         }
      }
      
      private function method_675(param1:Array) : void
      {
         var _loc2_:int = 3;
         var _loc3_:int = int(param1[++_loc2_]);
         var _loc4_:int = int(param1[++_loc2_]);
         var _loc5_:int = int(param1[++_loc2_]);
         this.main.method_4489().method_6383(_loc3_,_loc4_,_loc5_);
      }
      
      private function method_865(param1:Array) : void
      {
         var _loc2_:String = "";
         var _loc5_:* = [];
         var _loc6_:* = [];
         var _loc7_:* = [];
         var _loc8_:Array = param1.slice(4,param1.length);
         if(param1.length < 5)
         {
            this.main.method_4489().method_322();
            return;
         }
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_.length)
         {
            _loc2_ = String(_loc8_[_loc9_]);
            if(_loc2_.split(";").length < 2)
            {
               if(_loc2_ == "-1")
               {
                  _loc5_ = this.method_1362(_loc8_,_loc9_);
               }
               else if(_loc2_ == "-2")
               {
                  _loc6_ = this.method_1362(_loc8_,_loc9_);
               }
               else
               {
                  _loc7_.push([_loc2_,this.method_1362(_loc8_,_loc9_)]);
               }
            }
            _loc9_++;
         }
         this.main.method_4489().method_3629(_loc7_,_loc5_,_loc6_);
      }
      
      private function method_1362(param1:Array, param2:int) : Array
      {
         var _loc3_:Array = String(param1[param2 + 1]).split(";");
         _loc3_.pop();
         return _loc3_;
      }
      
      private function method_3382(param1:Array) : void
      {
         var _loc2_:Boolean = Boolean(int(param1[3]));
         this.main.method_6154().method_3579 = _loc2_;
      }
      
      private function method_4322(param1:Array) : void
      {
      }
      
      private function method_549(param1:Array) : void
      {
         class_9.var_635 = param1[3];
         this.main.method_4489().writeToLog("Server Version: undefined");
      }
      
      private function method_4374(param1:Array) : void
      {
      }
      
      private function method_4275(param1:Array) : void
      {
         var _loc2_:String = param1[3];
         var _loc3_:String = StringUtil.trim(param1[4]);
         class_81.var_1203 = new class_283(_loc2_,_loc3_);
      }
      
      public function method_2748(param1:Boolean, param2:int, param3:int) : void
      {
         if(param1)
         {
            map.effects.method_5565(new class_370(map.hero,Effect.const_2311,param2,param3));
         }
         else
         {
            map.effects.method_3217(class_81.userID,class_338.const_2606);
         }
      }
      
      private function method_2203(param1:Array) : void
      {
         var _loc12_:* = null;
         var _loc2_:int = int(param1[3]);
         var _loc3_:int = int(param1[4]);
         var _loc4_:Number = Number(param1[5]);
         var _loc5_:Number = Number(param1[6]);
         var _loc6_:int = int(param1[7]);
         var _loc7_:int = int(param1[8]);
         var _loc8_:int = int(param1[9]);
         var _loc10_:Number = 0.2 * _loc7_;
         var _loc11_:class_131;
         if(!(_loc11_ = this.main.method_4489().method_468(GuiConstants.SCOREEVENT_WINDOW)))
         {
            this.main.method_4489().method_4765();
         }
         if(true)
         {
            _loc12_ = new class_281();
            class_81.var_918 = _loc12_;
         }
         class_81.var_918.var_2253 = _loc2_;
         class_81.var_918.var_392 = _loc3_;
         class_81.var_918.name_91 = _loc4_;
         class_81.var_918.var_297 = _loc5_;
         class_81.var_918.var_3111 = _loc6_;
         class_81.var_918.var_4813 = _loc7_;
         class_81.var_918.var_3914 = _loc10_;
         class_81.var_918.points = _loc8_;
         this.main.method_4489().method_840();
      }
      
      private function method_271(param1:Array) : void
      {
         var _loc2_:class_131 = this.main.method_4489().method_468(GuiConstants.SCOREEVENT_WINDOW);
         if(_loc2_)
         {
            this.main.method_4489().method_2624(GuiConstants.SCOREEVENT_WINDOW);
         }
      }
      
      private function method_5225(param1:Array) : void
      {
         var _loc6_:* = null;
         var _loc2_:int = int(param1[3]);
         var _loc3_:int = int(param1[4]);
         var _loc4_:int = int(param1[5]);
         var _loc5_:class_131;
         if(!(_loc5_ = this.main.method_4489().method_468(GuiConstants.HIGH_SCORE_GATE_WINDOW)))
         {
            this.main.method_4489().method_5740();
         }
         if(true)
         {
            _loc6_ = new class_281();
            class_81.var_3085 = _loc6_;
         }
         class_81.var_3085.name_11 = _loc2_;
         class_81.var_3085.var_4573 = _loc3_;
         class_81.var_3085.points = _loc4_;
         this.main.method_4489().method_3641();
      }
      
      private function method_4661(param1:Array) : void
      {
         var _loc5_:* = null;
         var _loc2_:String = String(param1[3]);
         var _loc3_:int = int(param1[4]);
         var _loc4_:Vector.<class_85> = class_50.getInstance().map.method_1792;
         for each(_loc5_ in _loc4_)
         {
            if(_loc5_ && _loc5_.name_164 == class_366.const_946)
            {
               _loc5_.text.left = _loc2_;
               _loc5_.text.right = _loc3_.toString();
            }
         }
      }
      
      private function method_2333(param1:Array) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         if(true)
         {
            this.method_2887(class_282.const_2576);
         }
         var _loc2_:int = int(param1[3]);
         var _loc3_:String = param1[4];
         var _loc4_:int = int(param1[5]);
         if(true)
         {
            class_81.var_121 = new class_282();
         }
         if(class_81.var_121.var_3580 == null)
         {
            class_81.var_121.var_3580 = [];
         }
         var _loc5_:class_190;
         if((_loc5_ = class_81.var_121.var_3580[_loc2_] as class_190) == null)
         {
            this.main.method_6154().sendCommand(class_113.const_1276,[class_74.const_2865,_loc2_]);
            _loc5_ = new class_190();
            class_81.var_121.var_3580[_loc2_] = _loc5_;
         }
         loop1:
         switch(_loc3_)
         {
            case class_74.const_1406:
               if(_loc5_.var_3850 != 0)
               {
                  _loc5_.var_2347 = _loc4_ - Number(_loc5_.var_3850);
               }
               _loc5_.var_3850 = _loc4_;
               if(_loc5_.var_2347 > 0 && _loc5_.targetList != null)
               {
                  if(_loc5_.var_2347 == 1)
                  {
                     this.main.method_4489().writeToLog(class_88.getItem("log_msg_ranked_hunt_point_s"));
                  }
                  else
                  {
                     this.main.method_4489().writeToLog(class_88.getItem("log_msg_ranked_hunt_point_p").replace(/%AMOUNT%/,class_122.method_98(_loc5_.var_2347)));
                  }
               }
               _loc5_.var_1443 = false;
               break;
            case class_74.const_288:
               _loc5_.var_2347 = 0;
               _loc5_.var_1443 = false;
               _loc5_.var_1138 = _loc4_;
               _loc5_.var_1443 = true;
               break;
            case class_74.const_1946:
               _loc6_ = param1[5];
               _loc7_ = param1[6];
               if(param1[7] == undefined)
               {
                  _loc8_ = 0;
               }
               else
               {
                  _loc8_ = int(param1[7]);
               }
               switch(_loc6_)
               {
                  case class_74.const_2633:
                     if((_loc5_ = class_81.var_121.var_3580[_loc2_] as class_190) != null)
                     {
                        _loc5_.var_99 = _loc8_;
                        this.method_2887(_loc8_);
                        _loc9_ = _loc7_.split(",");
                        _loc5_.targetList = Vector.<int>(_loc9_);
                        _loc10_ = int(_loc5_.targetList.length);
                        _loc11_ = class_126.instance.method_1789;
                        _loc12_ = "";
                        _loc13_ = 0;
                        while(_loc13_ < _loc10_)
                        {
                           if((_loc14_ = _loc11_[_loc5_.targetList[_loc13_]]) != null)
                           {
                              _loc12_ += ", " + _loc14_;
                           }
                           _loc13_++;
                        }
                        _loc12_ = _loc12_.substring(2);
                        if(_loc5_.targetList.length > 1)
                        {
                           _loc5_.name_94 = class_88.getItem("q2_condition_KILL_NPC").replace(/%npc%/,_loc12_);
                           break loop1;
                        }
                        _loc5_.name_94 = class_88.getItem("q2_condition_KILL_NPCS").replace(/%npcs%/,_loc12_);
                        break loop1;
                     }
                     break loop1;
                  case class_74.const_2416:
               }
         }
         class_81.var_121.var_3003 = _loc2_;
         if(_loc5_.targetList != null)
         {
            this.main.method_4489().method_1917(_loc2_);
         }
      }
      
      private function method_2887(param1:int) : void
      {
         switch(param1)
         {
            case class_282.const_594:
               class_88.method_4884("title_ranked_hunt",class_88.getItem("title_pirate_hunt"));
               class_88.method_4884("ttip_ranked_hunt_point",class_88.getItem("ttip_bounty_points"));
               class_88.method_4884("ttip_clan_ranked_hunt_point",class_88.getItem("ttip_clan_bounty_points"));
               class_88.method_4884("log_msg_ranked_hunt_point_s",class_88.getItem("log_msg_bounty_point"));
               class_88.method_4884("log_msg_ranked_hunt_point_p",class_88.getItem("log_msg_bounty_points"));
               break;
            case class_282.const_2576:
            default:
               class_88.method_4884("title_ranked_hunt",class_88.getItem("title_npc_hunt"));
               class_88.method_4884("ttip_ranked_hunt_point",class_88.getItem("ttip_npc_hunt_point"));
               class_88.method_4884("ttip_clan_ranked_hunt_point",class_88.getItem("ttip_clan_npc_hunt_point"));
               class_88.method_4884("log_msg_ranked_hunt_point_s",class_88.getItem("log_msg_npc_hunt_point_s"));
               class_88.method_4884("log_msg_ranked_hunt_point_p",class_88.getItem("log_msg_npc_hunt_point_p"));
         }
      }
      
      private function method_3059(param1:Array) : void
      {
         var _loc2_:int = int(param1[3]);
         Settings.selectedConfiguration = _loc2_;
         this.main.method_4489().updateInfoField(GuiConstants.SHIP_WINDOW,class_93.var_3654,class_91.const_2130);
      }
      
      private function method_1966(param1:Array) : void
      {
         class_81.const_227.value = int(param1[3]);
      }
      
      public function method_5824(param1:int) : void
      {
         if(this.hero != null)
         {
            this.hero.speed.value = param1;
         }
      }
      
      private function method_2017(param1:Array) : void
      {
         var _loc2_:int = int(param1[3]);
         var _loc3_:int = int(param1[4]);
         this.main.method_4489().method_4304(_loc2_,_loc3_);
         var _loc4_:class_86;
         if(_loc4_ = this.hero)
         {
            map.effects.method_5084(new class_369(_loc4_));
         }
         class_59.call(class_59.const_388,[{
            "level":_loc2_,
            "event":"levelUp"
         }]);
      }
      
      private function method_4018(param1:Array) : void
      {
         if(map != null && this.hero != null)
         {
            map.effects.method_5084(new class_371(map.hero));
            this.method_1823(param1[3],param1[4],param1[5]);
            this.method_1196();
         }
      }
      
      private function method_1196() : void
      {
         class_82.playSoundEffect(class_126.const_1044,false,false,this.hero.x,this.hero.y);
      }
      
      private function method_1823(param1:String, param2:String = null, param3:String = null) : void
      {
         var _loc4_:Object = new Object();
         if(!param1)
         {
            return;
         }
         if(param2 == null)
         {
            _loc4_["count"] = "";
         }
         else
         {
            _loc4_["count"] = param2;
         }
         if(param3 == null)
         {
            _loc4_["time"] = "";
         }
         else
         {
            _loc4_["time"] = param3;
         }
         this.achievements[param1] = _loc4_;
         this.name_20.method_2407(AssetNotifications.LOAD_ASSET,[param1 + "_30x30",this.method_4555,null,AssetsProxy.ACHIEVEMENTS]);
      }
      
      private function method_4555(param1:class_65) : void
      {
         var _loc2_:class_65 = param1;
         var _loc3_:BitmapData = ResourceManager.getBitmapData("ui","achievementBG");
         var _loc4_:String = _loc2_.name_58.id;
         var _loc5_:RegExp = /_30x30/;
         var _loc6_:String = _loc4_.replace(_loc5_,"");
         var _loc7_:Object = this.achievements[_loc6_];
         var _loc8_:String = class_88.method_734("achievements",_loc6_ + "_name");
         var _loc9_:TextField;
         (_loc9_ = new TextField()).selectable = false;
         _loc9_.autoSize = TextFieldAutoSize.LEFT;
         _loc9_.defaultTextFormat = class_18.const_1467;
         _loc9_.antiAliasType = AntiAliasType.ADVANCED;
         _loc9_.embedFonts = class_18.var_3564;
         _loc9_.text = _loc8_;
         _loc9_.x = 42;
         _loc9_.y = 9;
         var _loc10_:TextField;
         (_loc10_ = new TextField()).selectable = false;
         var _loc11_:String = class_88.method_734("achievements",_loc6_ + "_description");
         _loc10_.autoSize = TextFieldAutoSize.LEFT;
         var _loc12_:RegExp = /%COUNT%/;
         _loc10_.defaultTextFormat = class_18.const_2572;
         _loc10_.embedFonts = class_18.var_3564;
         _loc10_.antiAliasType = AntiAliasType.ADVANCED;
         var _loc13_:String = _loc11_.replace(_loc12_,_loc7_["count"]);
         _loc10_.text = _loc13_.replace("%TIME%",_loc7_["time"]);
         _loc10_.x = 42;
         _loc10_.y = 24;
         var _loc14_:String;
         var _loc15_:String = (_loc14_ = _loc10_.text.replace("<i>","")).replace("</i>","");
         _loc10_.text = _loc15_;
         var _loc16_:Bitmap = _loc2_.getBitmap();
         var _loc17_:MovieClip = new MovieClip();
         var _loc18_:Number;
         if((_loc18_ = _loc9_.width >= _loc10_.width ? _loc9_.width : _loc10_.width) > 240)
         {
            _loc18_ += 50;
         }
         else
         {
            _loc18_ = 280;
         }
         var _loc19_:class_364 = new class_364(new Rectangle(9,0,1,45),_loc18_,45,_loc3_);
         _loc17_.addChild(_loc19_);
         _loc17_.addChild(_loc16_);
         _loc17_.addChild(_loc9_);
         _loc17_.addChild(_loc10_);
         _loc16_.x = 7;
         _loc16_.y = 9;
         class_50.getInstance().method_6457.addChild(_loc17_);
         _loc17_.x = 5;
         _loc17_.y = -50;
         if(this.var_3827)
         {
            this.method_308();
         }
         _loc17_.addEventListener(MouseEvent.ROLL_OVER,this.method_4088);
         _loc17_.addEventListener(MouseEvent.ROLL_OUT,this.method_6417);
         _loc17_.addEventListener(MouseEvent.CLICK,this.method_36);
         _loc17_.mouseChildren = false;
         _loc17_.buttonMode = true;
         TweenLite.to(_loc17_,0.8,{"y":Number(this.var_4589.length) * 45});
         this.var_4589.push(_loc17_);
         this.var_4339.reset();
         this.var_4339.addEventListener(TimerEvent.TIMER_COMPLETE,this.method_3296);
         this.var_4339.start();
      }
      
      private function method_36(param1:MouseEvent) : void
      {
         class_59.referToURL("internalPilotSheet","seo_title_achievements","achievements",true);
      }
      
      private function method_6417(param1:MouseEvent) : void
      {
         var _loc2_:DisplayObject = param1.target as DisplayObject;
         _loc2_.filters = [];
      }
      
      private function method_4088(param1:MouseEvent) : void
      {
         var _loc2_:DisplayObject = param1.target as DisplayObject;
         _loc2_.filters = [const_58];
      }
      
      private function method_3296(param1:TimerEvent) : void
      {
         var _loc3_:* = null;
         this.var_3827 = true;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_4589.length)
         {
            _loc3_ = this.var_4589[_loc2_] as MovieClip;
            TweenLite.to(_loc3_,0.8,{
               "y":-50,
               "onComplete":this.method_308
            });
            _loc2_++;
         }
         this.var_4339.removeEventListener(TimerEvent.TIMER_COMPLETE,this.method_3296);
         this.var_4339.stop();
      }
      
      private function method_308() : void
      {
         var _loc2_:* = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.var_4589.length)
         {
            _loc2_ = this.var_4589[_loc1_] as MovieClip;
            _loc2_.removeEventListener(MouseEvent.ROLL_OVER,this.method_4088);
            _loc2_.removeEventListener(MouseEvent.ROLL_OUT,this.method_6417);
            _loc2_.removeEventListener(MouseEvent.CLICK,this.method_36);
            if(class_50.getInstance().method_6457.contains(_loc2_))
            {
               class_50.getInstance().method_6457.removeChild(_loc2_);
               TweenLite.killTweensOf(_loc2_);
            }
            _loc1_++;
         }
         this.var_4589 = [];
         if(!this.var_3827)
         {
            this.achievements = new Dictionary();
         }
         this.var_3827 = false;
      }
      
      private function method_1956(param1:Array) : void
      {
         class_81.var_238 = int(param1[3]);
         var _loc2_:class_58 = this.main.method_4489();
         _loc2_.updateInfoField(GuiConstants.USER_WINDOW,class_93.var_3333,class_91.const_2410);
         var _loc3_:class_194 = class_194.getInstance();
         _loc3_.method_1965();
         _loc2_.method_570();
         _loc2_.method_2830();
      }
      
      private function method_1593(param1:Array) : void
      {
         var _loc2_:String = String(param1[2]);
         var _loc3_:int = int(param1[3]);
         switch(_loc2_)
         {
            case class_74.const_1656:
               class_81.var_3331 = _loc3_;
               break;
            case class_74.const_1730:
               class_81.var_2491 = _loc3_;
               break;
            case class_74.const_239:
               class_81.var_4543 = _loc3_;
               break;
            case class_74.const_2788:
               class_81.var_683 = _loc3_;
         }
         var _loc4_:class_58;
         (_loc4_ = this.main.method_4489()).updateInfoField(GuiConstants.USER_WINDOW,class_93.var_886,class_91.const_692);
      }
      
      private function method_353(param1:Array) : void
      {
         class_81.var_3705 = Number(param1[3]);
         this.main.method_4489().updateInfoField(GuiConstants.USER_WINDOW,class_93.var_886,class_91.const_1115);
         class_81.var_3732 = parseFloat(param1[4]);
         this.main.method_4489().updateInfoField(GuiConstants.USER_WINDOW,class_93.var_886,class_91.const_1329);
         var _loc2_:class_194 = class_194.getInstance();
         _loc2_.method_1863();
      }
      
      private function method_2723(param1:Array) : void
      {
         class_81.var_5027 = int(param1[3]);
         this.main.method_4489().updateInfoField(GuiConstants.USER_WINDOW,class_93.var_3333,class_91.const_1371);
      }
      
      private function method_2629(param1:Array) : void
      {
      }
      
      private function method_4650(param1:Array) : void
      {
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc2_:int = 2;
         _loc2_++;
         var _loc3_:int = int(param1[++_loc2_]);
         var _loc4_:String = param1[++_loc2_];
         var _loc5_:int = int(param1[++_loc2_]);
         var _loc6_:int = int(param1[++_loc2_]);
         if(map != null)
         {
            if(_loc8_ = map.method_5806(_loc3_,class_308) as class_308)
            {
               if(_loc4_ == class_74.const_472)
               {
                  _loc8_.shield.value = _loc5_;
                  _loc7_ = 3;
               }
               else if(_loc4_ == class_74.const_6)
               {
                  _loc8_.hp.value = _loc5_;
                  _loc7_ = 2;
               }
            }
            if(false)
            {
               map.effects.method_5084(new class_349(map.method_327(_loc3_),_loc6_,_loc7_,true,false));
            }
         }
      }
      
      public function method_916(param1:int, param2:int, param3:int, param4:int) : void
      {
         if(this.hero != null)
         {
            if(false)
            {
               if(this.hero.hp.hp.value > param2 / 10 && param1 <= param2 / 10)
               {
                  class_59.call(class_59.const_2242,[class_59.const_1647]);
               }
            }
            this.hero.hp.hp.value = param1;
            this.hero.hp.const_3026.value = param2;
            this.hero.hp.const_2381.value = param3;
            this.hero.hp.const_805.value = param4;
         }
      }
      
      public function method_1690(param1:int, param2:int) : void
      {
         var _loc3_:* = null;
         if(map != null)
         {
            _loc3_ = map.hero;
            if(_loc3_ != null)
            {
               _loc3_.hp.shield.value = param1;
               _loc3_.hp.maxShield.value = param2;
            }
         }
      }
      
      private function method_2119(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         _loc2_ = param1[3];
         param1.splice(0,4);
         switch(param1.length)
         {
            case 0:
               this.main.method_4489().writeToLog(class_88.getItem(_loc2_));
               break;
            case 1:
               _loc3_ = class_88.getItem(param1[0]);
               if(_loc3_.length == 0)
               {
                  _loc3_ = param1[0];
               }
               this.main.method_4489().writeToLog(class_88.getItem(_loc2_).replace("%!",_loc3_));
               break;
            default:
               _loc4_ = class_88.getItem(_loc2_);
               _loc5_ = 0;
               while(_loc5_ < param1.length)
               {
                  _loc4_ = _loc4_.replace(param1[_loc5_],param1[_loc5_ + 1]);
                  _loc5_++;
                  _loc5_++;
               }
               this.main.method_4489().writeToLog(_loc4_);
         }
         if(_loc2_ == "jump_cpu_failed_attack" || _loc2_ == "jump_cpu_failed_attack2" || _loc2_ == "jump_cpu_failed_attack3" || _loc2_ == "jump_cpu_failed_ontarget" || _loc2_ == "jump_cpu_failed_map" || _loc2_ == "jump_cpu_malfunction" || _loc2_ == "jump_cpu_failed_time" || _loc2_ == "jump_cpu_failed_attack" || _loc2_ == "jumpgate_failed_pvp_map" || _loc2_ == "jumpgate_failed_no_gate")
         {
            class_82.playSoundEffect(class_126.const_3037);
         }
      }
      
      private function method_1716(param1:Array) : void
      {
         var _loc2_:String = param1[3];
         this.main.method_4489().writeToLog(_loc2_);
      }
      
      private function get hero() : class_86
      {
         return !!map ? map.hero : null;
      }
   }
}
