package package_163
{
   import mx.collections.ArrayCollection;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.gui.windows.class_57;
   import net.bigpoint.darkorbit.mvc.battleStation.BattleStationViewNotifications;
   import net.bigpoint.darkorbit.mvc.battlestationswindow.BattleStationNotification;
   import net.bigpoint.darkorbit.mvc.battlestationswindow.class_1023;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import net.bigpoint.darkorbit.net.class_53;
   import org.puremvc.as3.multicore.interfaces.IProxy;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   import package_14.class_52;
   import package_38.class_439;
   import package_38.class_547;
   import package_38.class_572;
   import package_38.class_640;
   import package_38.class_677;
   import package_38.class_720;
   import package_38.class_729;
   import package_38.class_788;
   import package_38.class_831;
   import package_38.class_863;
   import package_38.class_920;
   import package_50.class_154;
   import package_9.class_50;
   
   public class BattleStationProxy extends Proxy implements IProxy, class_52
   {
      
      public static var var_3360:Array;
      
      public static const NAME:String = "BattleStationProxy";
      
      private static const UPDATE_INTERVAL:int = 1;
       
      
      public var var_1742:class_53;
      
      private var var_902:Boolean = false;
      
      private var var_2744:ArrayCollection;
      
      private var var_1523:class_1018;
      
      private var var_3319:Boolean;
      
      private var var_90:class_1536;
      
      private var var_1018:class_1017;
      
      private var var_1916:class_1017;
      
      private var var_1912:Vector.<class_1908>;
      
      public function BattleStationProxy()
      {
         var_3360 = [];
         var_3360[class_439.NONE] = "factionLogoNeutral";
         var_3360[class_439.EIC] = "factionLogoEIC";
         var_3360[class_439.MMO] = "factionLogoMMO";
         var_3360[class_439.VRU] = "factionLogoVRU";
         super(NAME);
      }
      
      public static function method_4619(param1:Number, param2:Number) : Number
      {
         return Math.floor(Math.random() * (param2 - param1 + 1)) + param1;
      }
      
      public function method_4704(param1:class_640) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         this.var_2744 = new ArrayCollection();
         var _loc2_:int = 0;
         while(_loc2_ < param1.modules.length)
         {
            _loc3_ = param1.modules[_loc2_];
            (_loc4_ = new class_1520()).init(_loc3_);
            this.var_2744.addItem(_loc4_);
            _loc2_++;
         }
         if(this.var_902)
         {
            sendNotification(BattleStationNotification.const_1455);
         }
      }
      
      public function method_3555(param1:class_677, param2:String = null, param3:Boolean = true) : void
      {
         this.var_1523 = new class_1018();
         this.var_1523.var_2469 = param2;
         this.var_1523.state = class_1018.const_1368;
         this.var_1523.method_1306(param1.equipment);
         this.var_1523.var_3184 = param1.var_3184;
         this.var_1523.var_1529 = param1.var_1529;
         this.var_1523.name_65 = param1.name_65;
         this.var_1523.name_142 = param1.name_142;
         this.var_1523.attackRating = param1.attackRating;
         this.var_1523.defenceRating = param1.defenceRating;
         this.var_1523.repairRating = param1.repairRating;
         this.var_1523.var_5034 = param1.var_5034;
         this.var_1523.var_1627 = param1.var_1627;
         this.var_1523.damageBoosterRating = param1.damageBoosterRating;
         this.var_90 = new class_1536(param1.name_65,param1.name_103,param1.name_83,param1.name_142);
         this.var_1523.method_6431 = this.var_90;
         this.var_1523.var_1094 = param1.var_4281;
         this.method_3402();
         if(this.var_902)
         {
            if(param3)
            {
               sendNotification(BattleStationNotification.const_2225,this.var_1523);
            }
            else
            {
               sendNotification(BattleStationNotification.const_37,this.var_1523);
            }
         }
      }
      
      public function method_3819(param1:int, param2:int, param3:String, param4:class_547) : void
      {
         this.var_1523 = new class_1018();
         this.var_1523.state = class_1018.const_2500;
         this.var_1523.var_3184 = param1;
         this.var_1523.var_1529 = param2;
         this.var_1523.var_2469 = param3;
         this.method_2792(param4);
         if(this.var_902)
         {
            sendNotification(BattleStationNotification.const_2731,this.var_1523);
         }
      }
      
      public function method_2792(param1:class_547) : void
      {
         if(this.var_1523 == null)
         {
            return;
         }
         this.var_1523.method_1306(param1.state);
         this.var_1523.var_3652 = param1.var_3652;
         this.var_1523.owningClanName = param1.var_4903;
         this.var_1523.var_4415 = param1.var_4415;
         this.var_1523.var_740 = param1.var_740;
         this.var_1523.var_3060 = param1.var_4098;
         if(this.var_902)
         {
            sendNotification(BattleStationNotification.const_2731,this.var_1523);
         }
      }
      
      public function method_5469(param1:Array) : void
      {
         var _loc2_:int = int(param1[0]);
         var _loc3_:int = int(param1[1]);
         var _loc4_:class_788;
         (_loc4_ = new class_788()).var_1529 = _loc2_;
         _loc4_.itemId = _loc3_;
         this.var_1742.sendRequest(_loc4_);
      }
      
      public function method_4203(param1:Array) : void
      {
         var _loc2_:int = int(param1[0]);
         var _loc3_:int = int(param1[1]);
         var _loc4_:int = int(param1[2]);
         var _loc5_:Boolean = Boolean(param1[3]);
         var _loc6_:class_729;
         (_loc6_ = new class_729()).var_1529 = _loc2_;
         _loc6_.itemId = _loc4_;
         _loc6_.slotId = _loc3_;
         _loc6_.replace = _loc5_;
         this.var_1742.sendRequest(_loc6_);
      }
      
      public function method_2983(param1:Array = null, param2:Array = null) : void
      {
      }
      
      public function method_2747() : void
      {
         this.var_902 = false;
      }
      
      public function method_5530(param1:uint) : void
      {
         sendNotification(BattleStationNotification.const_234,param1);
      }
      
      public function method_5603(param1:Array) : void
      {
         var _loc2_:class_863 = new class_863();
         _loc2_.var_1529 = param1[0] as int;
         _loc2_.var_2260 = param1[1] as int;
         this.var_1742.sendRequest(_loc2_);
      }
      
      public function method_178(param1:Array) : void
      {
         var _loc2_:class_572 = new class_572();
         _loc2_.var_1529 = param1[0] as int;
         _loc2_.minutes = param1[1] as int;
         this.var_1742.sendRequest(_loc2_);
      }
      
      public function method_1679(param1:class_920) : void
      {
         if(this.var_1523 == null)
         {
            this.var_1523 = new class_1018();
            this.var_1523.var_1529 = param1.var_1529;
            this.var_1523.var_3184 = param1.var_3184;
         }
         this.var_1523.state = class_1018.const_2805;
         this.var_1523.method_3089 = param1.var_3563.faction;
         this.var_1523.owningClanName = param1.var_3896;
         this.var_1523.var_994 = param1.var_3073;
         this.var_1523.method_5995(this.var_1523.var_994);
         this.var_1523.method_5995(param1.var_3073);
         if(this.var_902)
         {
            this.method_6053();
            this.method_4147(this.var_1523);
         }
         sendNotification(BattleStationViewNotifications.OPEN_BUILDING_UI_BUBBLE,this.var_1523.var_3184);
      }
      
      public function method_4147(param1:class_1018) : void
      {
         var _loc2_:class_154 = class_154(class_57.getInstance().createWindow(class_57.const_264));
         _loc2_.title = param1.var_2469;
         _loc2_.method_4130(class_88.getItem("popup_bswin_message_battle_station_build_time"),class_88.getItem("popup_bswin_title_battle_station_build_time"),param1.owningClanName);
         _loc2_.method_2317(param1.method_3700);
         _loc2_.method_4592(param1.name_11,0);
      }
      
      public function method_3235(param1:Array) : void
      {
         var _loc2_:class_720 = new class_720();
         _loc2_.var_1529 = param1[0] as int;
         _loc2_.slotId = param1[1] as int;
         this.var_1742.sendRequest(_loc2_);
      }
      
      public function updateTimer(param1:Number) : void
      {
         this.var_90.name_12 += param1;
         var _loc2_:int = 1000 * Number(UPDATE_INTERVAL);
         while(this.var_90.name_12 > _loc2_)
         {
            this.var_90.name_12 -= _loc2_;
            if(this.var_90.name_103 <= 0)
            {
               class_50.removeObserver(this);
            }
            else if(this.var_90.name_65)
            {
               this.var_90.method_5584(1);
            }
            else
            {
               this.var_90.method_6254(Number(this.var_90.name_142) / 60 * Number(UPDATE_INTERVAL));
            }
         }
         if(this.var_90.name_12 < 0)
         {
            return;
         }
         sendNotification(BattleStationNotification.const_2732,this.var_90);
      }
      
      public function method_3402() : void
      {
         if(!this.var_3319)
         {
            class_50.method_5621(this);
            this.var_3319 = true;
         }
      }
      
      public function get name_156() : ArrayCollection
      {
         return this.var_2744;
      }
      
      public function get method_2339() : class_1017
      {
         return this.var_1018;
      }
      
      public function set method_2339(param1:class_1017) : void
      {
         this.var_1018 = param1;
      }
      
      public function get method_3727() : class_1017
      {
         return this.var_1916;
      }
      
      public function set method_3727(param1:class_1017) : void
      {
         this.var_1916 = param1;
      }
      
      public function method_4687(param1:class_1841) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(this.var_1523)
         {
            if(param1.name_159 == this.var_1523.var_1529)
            {
               _loc2_ = 0;
               while(_loc2_ != this.var_1523.modules.length)
               {
                  if(this.var_1523.modules[_loc2_].slotOccupying == param1.slotId)
                  {
                     _loc3_ = this.var_1523.modules[_loc2_].clone();
                     _loc3_.currentHitpoints = param1.name_90;
                     _loc3_.maxHitpoints = param1.name_37;
                     _loc3_.currentShield = param1.shield;
                     _loc3_.maxShield = param1.name_105;
                     _loc3_.emergencyRepairSecondsLeft = param1.emergencyRepairSecondsLeft;
                     _loc3_.emergencyRepairSecondsTotal = param1.emergencyRepairSecondsTotal;
                     _loc3_.installationSecondsLeft = param1.installationSecondsLeft;
                     this.var_1523.modules[_loc2_] = _loc3_;
                     sendNotification(BattleStationNotification.const_2564,_loc3_);
                  }
                  _loc2_++;
               }
            }
         }
      }
      
      public function method_6053() : void
      {
         this.var_902 = false;
         sendNotification(GuiNotifications.CLOSE_WINDOW_BY_TYPE,class_57.const_2120);
         sendNotification(GuiNotifications.CLOSE_WINDOW_BY_TYPE,class_57.const_2902);
         sendNotification(GuiNotifications.CLOSE_WINDOW_BY_TYPE,class_57.const_716);
         sendNotification(GuiNotifications.CLOSE_WINDOW_BY_TYPE,class_57.const_264);
         sendNotification(GuiNotifications.CLOSE_WINDOW_BY_TYPE,class_57.const_3015);
         sendNotification(GuiNotifications.CLOSE_WINDOW_BY_TYPE,class_57.const_468);
         sendNotification(GuiNotifications.CLOSE_WINDOW_BY_TYPE,class_57.const_394);
         sendNotification(GuiNotifications.CLOSE_WINDOW_BY_TYPE,class_57.const_602);
      }
      
      public function get method_5495() : class_1018
      {
         return this.var_1523;
      }
      
      public function get method_613() : Boolean
      {
         return this.var_902;
      }
      
      public function set method_613(param1:Boolean) : void
      {
         this.var_902 = param1;
      }
      
      public function method_2065(param1:class_1908) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_1912)
         {
            if(_loc2_.category == param1.category)
            {
               _loc2_.selected = _loc2_.selected;
            }
         }
      }
      
      public function get method_4562() : Vector.<class_1908>
      {
         if(!this.var_1912)
         {
            this.var_1912 = new <class_1908>[new class_1908(class_1023.const_2224),new class_1908(class_1023.const_1277),new class_1908(class_1023.const_2380),new class_1908(class_1023.const_2001),new class_1908(class_1023.const_1144),new class_1908(class_1023.const_2758),new class_1908(class_1023.SHOW_ALL)];
         }
         return this.var_1912;
      }
      
      public function get method_1481() : Boolean
      {
         var _loc1_:int = int(this.method_4562.length);
         var _loc2_:int = 0;
         while(_loc2_ != _loc1_)
         {
            if(!this.method_4562[_loc2_].selected)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
   }
}
