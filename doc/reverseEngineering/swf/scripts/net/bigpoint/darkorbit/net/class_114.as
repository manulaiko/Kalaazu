package net.bigpoint.darkorbit.net
{
   import mx.utils.StringUtil;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.class_9;
   import net.bigpoint.darkorbit.gui.class_58;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.mvc.gui.model.vo.LogMessageVO;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.MapAssetNotification;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_124.class_392;
   import package_135.class_391;
   import package_17.class_62;
   import package_22.class_169;
   import package_22.class_198;
   import package_27.class_82;
   import package_30.class_91;
   import package_33.class_93;
   import package_38.class_163;
   import package_38.class_315;
   import package_38.class_353;
   import package_38.class_387;
   import package_38.class_388;
   import package_38.class_389;
   import package_38.class_390;
   import package_39.class_100;
   import package_9.class_50;
   import package_98.MapNotification;
   
   public class class_114
   {
       
      
      private var main:class_9;
      
      private var var_271:class_62;
      
      private var var_2471:Vector.<class_389>;
      
      private var var_3833:Boolean = false;
      
      public function class_114()
      {
         this.var_2471 = new Vector.<class_389>();
         super();
      }
      
      public function method_3489(param1:class_9) : void
      {
         this.main = param1;
         this.var_271 = class_62.getInstance();
      }
      
      public function method_4126(param1:int, param2:int) : void
      {
         if(param1 == class_81.userID)
         {
            class_81.var_938 = true;
            this.var_271.sendNotification(HeroNotifications.HERO_DIED);
            class_58.instance.method_5249();
         }
         if(this.map != null)
         {
            this.map.method_1203().method_4323(param1,true);
         }
      }
      
      private function get map() : class_90
      {
         return this.main.name_47.map;
      }
      
      public function method_5341(param1:int) : void
      {
         if(this.map != null)
         {
            this.map.method_1203().method_4323(param1,false);
         }
      }
      
      public function method_4525(param1:class_389) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(class_100.getInstance().method_503)
         {
            return;
         }
         if(true)
         {
            return;
         }
         if(param1.name_128 == class_81.userID)
         {
            return;
         }
         if(this.map == null)
         {
            this.var_2471.push(param1);
            return;
         }
         var _loc2_:String = param1.name_126;
         if(param1.var_2708 != null)
         {
            for each(_loc4_ in param1.var_2708)
            {
               if(_loc4_.var_2708 == class_315.const_3214)
               {
                  _loc2_ = _loc4_.var_2522;
               }
            }
         }
         var _loc3_:class_86 = this.map.method_1203().method_765(_loc2_,param1.name_128,param1.x,param1.y,1,param1.var_3438,param1.name_145,this.method_2250(param1.factionId),param1.name_45,param1.name_155.type,param1.name_140,param1.var_4521,param1.var_4196.var_4820,param1.var_3895,param1.npc,param1.var_2565,param1.var_3818);
         if(_loc3_ != null)
         {
            _loc3_.cloaked.value = param1.cloaked;
            if(param1.var_2708 != null)
            {
               for each(_loc5_ in param1.var_2708)
               {
                  class_392.run(_loc5_);
               }
            }
         }
      }
      
      public function method_2250(param1:int) : int
      {
         if(param1 > 4)
         {
            param1 = 0;
         }
         return param1;
      }
      
      public function method_4820(param1:class_388) : void
      {
         var _loc26_:* = null;
         var _loc27_:* = null;
         var _loc2_:class_58 = this.main.method_4489();
         _loc2_.method_5875();
         var _loc3_:int = int(param1.name_128);
         class_81.userID = _loc3_;
         var _loc4_:String = param1.var_3438;
         var _loc5_:String = param1.name_126;
         if(param1.var_2708 != null)
         {
            for each(_loc26_ in param1.var_2708)
            {
               if(_loc26_.var_2708 == class_315.const_3214)
               {
                  _loc5_ = _loc26_.var_2522;
               }
            }
         }
         var _loc6_:Number = Number(param1.speed) * 0.97;
         var _loc7_:int = int(param1.shield);
         var _loc8_:int = int(param1.name_105);
         var _loc9_:int = int(param1.var_1029);
         var _loc10_:int = int(param1.var_1819);
         var _loc11_:int = int(param1.var_2217);
         var _loc12_:int = int(param1.var_1574);
         var _loc13_:int = int(param1.var_4260);
         var _loc14_:int = int(param1.var_2981);
         var _loc15_:int = int(param1.x);
         var _loc16_:int = int(param1.y);
         var _loc17_:int = int(param1.mapId);
         var _loc18_:int = int(param1.factionId);
         _loc18_ = int(this.method_2250(_loc18_));
         var _loc19_:int = int(param1.name_45);
         var _loc20_:Boolean = Boolean(param1.var_4810);
         class_81.name_32 = _loc19_;
         class_81.premium.value = param1.premium;
         class_81.var_5027 = param1.var_4514;
         class_81.var_2369 = param1.var_4025;
         class_81.level = param1.level;
         class_81.var_3705 = param1.credits;
         class_81.var_3732 = param1.uridium;
         class_81.var_4516 = param1.jackpot;
         var _loc21_:int = int(param1.name_140);
         var _loc22_:String = param1.name_145;
         var _loc23_:int = int(param1.var_3895);
         var _loc24_:Boolean = Boolean(param1.cloaked);
         class_81.var_938 = false;
         if(_loc21_ == 21)
         {
            class_81.var_5032 = true;
         }
         else
         {
            class_81.var_5032 = false;
         }
         if(class_81.name_148 != _loc4_)
         {
            class_81.name_148 = _loc4_;
            this.var_271.method_2407(HeroNotifications.UPDATE_USERNAME,class_81.name_148);
         }
         if(StringUtil.trim(_loc22_).length > 0)
         {
            class_81.name_145 = _loc22_;
         }
         class_81.factionID = _loc18_;
         if(Settings.lastMapID != _loc17_)
         {
            class_82.playSoundEffect(class_126.const_2261);
         }
         if(_loc20_)
         {
            if(Settings.lastMapID != _loc17_)
            {
               this.createMap(_loc17_);
               Settings.lastMapID = _loc17_;
            }
            else
            {
               (_loc27_ = class_62.getInstance()).method_2407(MapAssetNotification.CLEANUP);
               this.main.method_6154().var_4619 = true;
            }
            class_62.getInstance().method_2407(class_391.RESET,GuiConstants.SECTOR_CONTROL_WINDOW);
         }
         var _loc25_:class_86;
         if((_loc25_ = this.main.name_47.map.method_1203().method_765(_loc5_,_loc3_,_loc15_,_loc16_,_loc6_,_loc4_,_loc22_,_loc18_,_loc19_,-1,_loc21_,false,class_387.DEFAULT,_loc23_,false)) == null)
         {
            return;
         }
         _loc25_.hp.hp.value = _loc9_;
         _loc25_.hp.const_3026.value = _loc10_;
         _loc25_.hp.const_2381.value = _loc11_;
         _loc25_.hp.const_805.value = _loc12_;
         class_81.const_934.value = _loc14_ - _loc13_;
         class_81.const_227.value = _loc14_;
         _loc25_.hp.shield.value = _loc7_;
         _loc25_.hp.maxShield.value = _loc8_;
         if(_loc17_ == class_126.getInstance().var_1524.indexOf("4-5"))
         {
            _loc25_.position.changed.add(this.method_3272);
         }
         _loc2_.method_5921();
         this.main.name_47.method_1772.method_94();
         _loc2_.method_4717();
         _loc2_.method_440();
         _loc2_.createWindow(GuiConstants.USER_WINDOW);
         _loc2_.createWindow(GuiConstants.SHIP_WINDOW);
         _loc2_.method_1626();
         if(false)
         {
            _loc2_.method_1441();
         }
         _loc2_.method_2474();
         _loc2_.updateInfoField(GuiConstants.USER_WINDOW,class_93.var_886,class_91.const_1115);
         _loc2_.updateInfoField(GuiConstants.USER_WINDOW,class_93.var_886,class_91.const_1329);
         _loc2_.updateInfoField(GuiConstants.USER_WINDOW,class_93.var_886,class_91.const_1026);
         _loc2_.updateInfoField(GuiConstants.USER_WINDOW,class_93.var_3333,class_91.const_1371);
         _loc2_.updateInfoField(GuiConstants.USER_WINDOW,class_93.var_3333,class_91.const_2295);
         _loc2_.updateInfoField(GuiConstants.USER_WINDOW,class_93.var_3333,class_91.const_2982);
         _loc2_.updateInfoField(GuiConstants.USER_WINDOW,class_93.var_3333,class_91.const_2410);
         _loc2_.updateInfoField(GuiConstants.SHIP_WINDOW,class_93.var_3654,class_91.const_744);
         _loc2_.updateInfoField(GuiConstants.SHIP_WINDOW,class_93.var_3654,class_91.const_684);
         _loc2_.updateInfoField(GuiConstants.SHIP_WINDOW,class_93.var_3654,class_91.const_281);
         _loc2_.updateInfoField(GuiConstants.SHIP_WINDOW,class_93.var_1265,class_91.const_1274);
         this.main.method_360(false);
         if(false)
         {
            _loc2_.method_1962();
         }
         _loc2_.method_1081(GuiConstants.LOGOUT_WINDOW);
         _loc25_.cloaked.value = _loc24_;
         this.main.method_6154().var_4072 = true;
         if(_loc20_)
         {
            this.main.method_6154().method_4053();
         }
         while(this.var_2471.length > 0)
         {
            this.method_4525(this.var_2471.pop());
         }
      }
      
      private function method_3272() : void
      {
         var _loc1_:* = null;
         if(this.map)
         {
            _loc1_ = this.map.hero;
            if(_loc1_.x < -6100 || _loc1_.x > this.map.method_5076 + 6100 || _loc1_.y < -6100 || _loc1_.y > this.map.method_1901 + 6100)
            {
               class_62.getInstance().sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_390(class_390.const_3208));
               if(!this.var_3833)
               {
                  class_62.getInstance().sendNotification(GuiNotifications.WRITE_TO_LOG,new LogMessageVO(class_88.getItem("msg_easter_egg_found")));
                  this.var_3833 = true;
               }
            }
         }
      }
      
      private function createMap(param1:int) : void
      {
         class_62.getInstance().method_2407(MapNotification.CLEANUP);
         Settings.mapID = param1;
         var _loc2_:class_90 = new class_90(param1);
         class_50.getInstance().map = _loc2_;
         this.main.method_6154().var_4619 = true;
         class_62.getInstance().sendNotification(MapNotification.NEW_MAP_INIT_FINISHED,param1);
         if(Settings.lastMapID != param1)
         {
            class_58.instance.method_5578(class_88.getItem("map_map") + " " + class_50.getInstance().map.getName(),2,2);
         }
      }
      
      public function method_4296(param1:Vector.<class_353>) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc6_:* = null;
         var _loc2_:* = [];
         _loc2_[class_163.const_98] = 0;
         _loc2_[class_163.const_225] = 0;
         _loc2_[class_163.const_2375] = 0;
         _loc2_[class_163.const_1025] = 0;
         _loc2_[class_163.const_763] = 0;
         _loc2_[class_163.const_2322] = 0;
         _loc2_[class_163.PROMERIUM] = 0;
         _loc2_[class_163.SEPROM] = 0;
         _loc2_[class_163.PALLADIUM] = 0;
         for each(_loc3_ in param1)
         {
            _loc2_[_loc3_.var_4809.var_2008] = _loc3_.count;
         }
         _loc5_ = false;
         for(_loc6_ in _loc2_)
         {
            _loc4_ = class_169(class_198.var_4944[_loc6_]);
            if(_loc2_[_loc6_] != _loc4_.count)
            {
               _loc5_ = true;
               _loc4_.count = _loc2_[_loc6_];
            }
         }
         if(!_loc5_)
         {
            return;
         }
         var _loc7_:class_58;
         (_loc7_ = this.main.method_4489()).method_4627();
         _loc7_.method_144();
         var _loc8_:class_90;
         if((_loc8_ = this.main.name_47.map) != null)
         {
            _loc8_.method_1203().method_3414();
         }
      }
      
      public function method_3163() : void
      {
         var _loc1_:class_90 = this.main.name_47.map;
         if(_loc1_ != null)
         {
            _loc1_.method_1203().method_3459();
         }
         this.var_271.method_2407(MapAssetNotification.DESELECT_TARGET);
      }
   }
}
