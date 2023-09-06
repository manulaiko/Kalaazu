package net.bigpoint.darkorbit.net
{
   import com.bigpoint.utils.class_122;
   import com.hurlant.math.BigInteger;
   import flash.events.Event;
   import flash.system.System;
   import flash.utils.ByteArray;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.class_9;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.map.model.ship.class_109;
   import net.bigpoint.darkorbit.mvc.common.utils.TextUtils;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_14.class_52;
   import package_17.class_62;
   import package_27.class_82;
   import package_29.class_85;
   import package_30.class_91;
   import package_33.class_93;
   import package_36.class_98;
   import package_37.ICommand;
   import package_37.class_107;
   import package_38.class_102;
   import package_38.class_105;
   import package_38.class_111;
   import package_38.class_115;
   import package_38.class_117;
   import package_38.class_118;
   import package_38.class_120;
   import package_38.class_127;
   import package_38.class_128;
   import package_38.class_99;
   import package_39.class_100;
   import package_40.class_103;
   import package_41.GameNotifications;
   import package_42.ProfileProxy;
   import package_43.class_121;
   import package_44.GroupSystemNotification;
   import package_45.class_125;
   import package_9.class_50;
   
   public class class_53 implements class_52
   {
      
      public static var var_775:uint = 1;
      
      public static var var_4711:uint = 2;
      
      public static var var_1334:String = "|";
      
      public static var var_4667:String = ",";
      
      public static var var_4310:String = "%!";
      
      public static var var_2930:String = "%2!";
       
      
      private var var_5013:String;
      
      public var port:int = 8080;
      
      private var var_574:class_9;
      
      public var var_1061:Array;
      
      private var var_1279:class_97;
      
      private var var_4540:class_108;
      
      private var var_944:class_119;
      
      private var var_4254:class_104;
      
      private var var_1150:class_124;
      
      private var var_4807:class_112;
      
      public var petAssembly:class_123;
      
      private var var_2134:class_110;
      
      private var var_2988:class_114;
      
      private var var_3849:class_101;
      
      private var var_2351:class_106;
      
      private var var_3284:class_116;
      
      private var var_3828:class_103;
      
      private var var_1034:String;
      
      public var var_4619:Boolean = false;
      
      public var var_4072:Boolean = false;
      
      private var var_4018:Boolean;
      
      private var _tpf:Number = 0;
      
      private var var_3701:Number = 0;
      
      private var var_1931:Boolean = false;
      
      public var var_2375:class_107;
      
      private var name_20:class_62;
      
      private var var_353:BigInteger;
      
      private var var_2020:Function;
      
      private var var_4246:Vector.<ICommand>;
      
      public var var_362:Boolean = false;
      
      private var var_4786:int;
      
      private var var_2287:int;
      
      private var var_4787:int;
      
      private var var_2295:int;
      
      private var hash:String;
      
      private var nextMapID:int;
      
      private var var_2365:int;
      
      private var var_3936:String;
      
      private var var_1465:String;
      
      private var typeID:int;
      
      private var category:String;
      
      private var amount:int;
      
      private var currency:String;
      
      private var selectedConfiguration:int;
      
      private var var_3113:String;
      
      public function class_53(param1:class_9)
      {
         this.var_1061 = [];
         this.var_4246 = new Vector.<ICommand>();
         super();
         this.var_4018 = false;
         this.var_574 = param1;
         this.name_20 = class_62.getInstance();
         this.method_1030(var_775);
         this.method_3140();
         this.method_5555();
      }
      
      public function disable() : void
      {
         if(this.var_2375)
         {
            this.var_2375.disable();
         }
      }
      
      private function method_5555() : void
      {
         this.var_1279 = class_97.getInstance();
         this.var_1150 = class_124.getInstance();
         this.var_4540 = class_108.getInstance();
         this.var_4254 = class_104.getInstance();
         this.var_4254.method_6219(var_4310,var_2930);
         this.petAssembly = class_123.getInstance();
         this.var_2134 = new class_110();
         this.var_2134.method_3489(this.var_574);
         this.var_2988 = new class_114();
         this.var_2988.method_3489(this.var_574);
         this.var_3849 = new class_101();
         this.var_3849.method_3489(this.var_574);
         this.var_2351 = new class_106();
         this.var_2351.method_3489(this.var_574);
         this.var_3284 = class_116.getInstance();
      }
      
      private function method_3140() : void
      {
         this.var_2375 = new class_107();
         this.var_2375.addEventListener(class_107.CONNECTION_SUCCESS,this.method_2410);
         this.var_2375.addEventListener(class_107.CONNECTION_LOST,this.method_2192);
         this.var_2375.addEventListener(class_107.CONNECTION_ERROR,this.method_4118);
      }
      
      public function method_403() : void
      {
         this.var_1931 = true;
         this.method_1297();
      }
      
      private function method_1297() : void
      {
         this.sendRequest(new class_105());
         class_121.instance.ping();
      }
      
      private function method_3394() : void
      {
         class_50.method_5621(this);
      }
      
      private function method_6411() : void
      {
         class_50.removeObserver(this);
         this.var_1931 = true;
      }
      
      public function updateTimer(param1:Number) : void
      {
         this._tpf += param1;
         if(this._tpf > 499)
         {
            if(!this.var_2375.method_282())
            {
               if(true)
               {
                  this.var_574.method_360(false);
                  this.var_574.method_4489().method_5023();
                  this.method_6411();
               }
            }
            this._tpf = 0;
         }
         if(this.var_1931)
         {
            this.var_3701 += param1;
            if(this.var_3701 > class_121.const_713)
            {
               this.method_1297();
               this.var_3701 -= 0;
            }
         }
      }
      
      public function connectToMap(param1:int) : void
      {
         var _loc2_:* = null;
         Settings.mapID = param1;
         this.var_1279 = class_97.getInstance();
         if(false)
         {
            this.connect(Settings.defaultGameServer);
         }
         else
         {
            _loc2_ = class_90.method_1717(param1);
            this.connect(_loc2_);
         }
      }
      
      public function connect(param1:String) : void
      {
         this.method_6411();
         this.var_1034 = param1;
         this.var_5013 = param1;
         this.var_2375.connect(param1,this.port);
      }
      
      private function method_2192(param1:Event) : void
      {
         this.var_4072 = false;
         this.name_20.method_2407(GroupSystemNotification.CLEANUP);
         if(true || Boolean(class_100.getInstance().method_503))
         {
            if(this.var_574.method_2045())
            {
               if(!this.var_574.var_4954)
               {
                  this.connectToMap(Settings.nextMapID);
               }
            }
            else
            {
               Settings.lastMapID = -1;
               this.var_574.method_4489().method_5921();
               this.var_574.method_4489().method_5023();
            }
         }
         this.petAssembly.method_3808();
         var _loc2_:class_90 = this.var_574.name_47.map;
         var _loc3_:class_109 = _loc2_.method_1203();
         if(Boolean(_loc2_.hero) && _loc2_.hero.pet != null)
         {
            _loc3_.method_4323(_loc2_.hero.pet.id);
         }
      }
      
      private function method_4118(param1:Event = null) : void
      {
         if(this.var_2375.method_282())
         {
            this.var_574.method_360(false);
            this.method_2192(new Event(Event.CLOSE));
         }
      }
      
      public function method_1673() : String
      {
         return this.var_5013;
      }
      
      public function sendRequest(param1:ICommand) : void
      {
         this.var_2020(param1);
      }
      
      protected function method_2881(param1:ICommand) : void
      {
         var _loc2_:int = int(param1.method_1330());
         switch(_loc2_)
         {
            case class_128.ID:
               if(!this.var_362)
               {
                  this.var_4246.push(param1);
                  return;
               }
               break;
         }
         this.var_2375.method_1776(param1);
      }
      
      public function method_4227() : void
      {
         var _loc1_:* = null;
         while(this.var_4246.length > 0)
         {
            _loc1_ = this.var_4246.pop();
            this.method_2881(_loc1_);
         }
      }
      
      protected function method_4416(param1:ICommand) : void
      {
         var _loc2_:int = int(param1.method_1330());
         switch(_loc2_)
         {
            case class_120.ID:
            case class_118.ID:
            case class_102.ID:
            case class_99.ID:
            case class_105.ID:
               this.var_2375.method_1776(param1);
         }
      }
      
      public function method_1030(param1:uint) : void
      {
         switch(param1)
         {
            case var_775:
               this.var_2020 = this.method_2881;
               break;
            case var_4711:
               this.var_2020 = this.method_4416;
         }
      }
      
      public function sendCommand(param1:String, param2:Array = null) : String
      {
         if(!this.var_2375.method_282())
         {
            return "";
         }
         var _loc3_:String = param1;
         if(param2 != null)
         {
            _loc3_ += var_1334 + param2.join(var_1334);
         }
         this.sendRequest(this.method_4939(_loc3_));
         return _loc3_;
      }
      
      public function method_3390(param1:String) : void
      {
         if(!this.var_2375.method_282())
         {
            return;
         }
         this.sendRequest(this.method_4939(param1));
      }
      
      private function method_4939(param1:String) : class_111
      {
         var _loc2_:class_111 = new class_111();
         _loc2_.message = param1;
         return _loc2_;
      }
      
      public function method_4053() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(Boolean(this.var_4072) && Boolean(this.var_4619))
         {
            _loc1_ = new class_128(class_50.getInstance().method_3528.method_3826);
            this.sendRequest(_loc1_);
            _loc2_ = new class_128(class_128.const_130);
            this.sendRequest(_loc2_);
            if(Settings.displayNotifications.value || Settings.allowAutoQuality.value)
            {
               ProfileProxy(class_62.getInstance().retrieveProxy(ProfileProxy.NAME)).getProfiler().start();
            }
            this.name_20.method_2407(GameNotifications.HERO_INIT);
         }
      }
      
      public function method_2410(param1:Event) : void
      {
         this.var_1931 = false;
         this.method_1667();
      }
      
      private function method_1667() : void
      {
         this.method_1030(var_775);
         this.method_3394();
         this.method_2171();
      }
      
      public function method_171(param1:Boolean, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:* = null;
         if(param1)
         {
            if((_loc5_ = new class_120()).major == param2 && _loc5_.minor == param3 && _loc5_.build == param4)
            {
               this.method_3394();
               this.method_2269();
            }
            else
            {
               this.method_4118();
            }
         }
         else
         {
            this.method_4118();
         }
      }
      
      protected function method_2269() : void
      {
         this.sendRequest(new class_118());
      }
      
      public function injectObfuscation(param1:ByteArray, param2:uint) : void
      {
         this.var_2375.method_2946.injectObfuscation(param1,param2,this.method_5908);
      }
      
      private function method_5908() : void
      {
         this.method_3167();
      }
      
      private function method_3167() : void
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc1_:String = new String();
         var _loc2_:int = 0;
         while(_loc2_ < 128)
         {
            if((_loc6_ = (_loc5_ = Math.random() * 256).toString(16)).length == 1)
            {
               _loc6_ = "0" + _loc6_;
            }
            _loc1_ += _loc6_;
            _loc2_++;
         }
         this.var_353 = new BigInteger(_loc1_,16);
         var _loc3_:BigInteger = class_127.const_1751.modPow(this.var_353,class_127.const_1433);
         var _loc4_:class_102;
         (_loc4_ = new class_102()).var_4027 = _loc3_.toByteArray();
         this.sendRequest(_loc4_);
      }
      
      public function method_2171() : void
      {
         var _loc1_:int = 0;
         var _loc2_:class_99 = new class_99();
         _loc2_.userID = class_81.userID;
         _loc2_.factionID = class_81.factionID;
         _loc2_.sessionID = class_81.sessionID;
         while(_loc2_.sessionID.charAt(_loc2_.sessionID.length - 1) == " ")
         {
            _loc2_.sessionID = _loc2_.sessionID.slice(0,_loc2_.sessionID.length - 1);
         }
         _loc2_.version = "8.3.2";
         _loc2_.instanceId = _loc1_;
         this.sendRequest(_loc2_);
      }
      
      public function method_3574(param1:Event) : void
      {
         param1.stopPropagation();
         this.var_574.method_360(false);
         this.method_2192(new Event(Event.CLOSE));
      }
      
      public function method_5616(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Boolean = false;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = 0;
         _loc2_ = param1.split(var_1334);
         loop1:
         switch(_loc2_[1])
         {
            case class_74.PET:
               this.petAssembly.method_5080(_loc2_);
               break;
            case class_74.const_3164:
               this.var_4786 = int(_loc2_[2]);
               this.var_2287 = int(_loc2_[3]);
               if(_loc2_[4] == "H")
               {
                  _loc3_ = true;
               }
               _loc4_ = int(_loc2_[5]);
               _loc5_ = int(_loc2_[6]);
               _loc6_ = Boolean(int(_loc2_[7]));
               if(this.map != null)
               {
                  _loc11_ = this.map.method_327(this.var_4786);
                  _loc12_ = this.map.method_327(this.var_2287);
                  if(Boolean(_loc11_) && Boolean(_loc12_))
                  {
                     this.map.effects.method_269(new class_98(_loc11_,_loc12_,_loc4_,_loc3_,_loc5_,_loc6_));
                     break;
                  }
                  break;
               }
               break;
            case class_74.const_1926:
               if(this.var_944 == null)
               {
                  this.var_944 = class_119.getInstance();
               }
               this.var_944.method_5080(_loc2_);
               break;
            case class_74.const_3307:
               if(this.var_4807 == null)
               {
                  this.var_4807 = class_112.getInstance();
               }
               this.var_4807.method_5080(_loc2_);
               break;
            case class_74.const_310:
               this.hash = _loc2_[2];
               if(this.map != null)
               {
                  this.map.method_3420(this.hash);
                  break;
               }
               break;
            case class_74.const_670:
               this.var_574.method_360(true);
               this.nextMapID = int(_loc2_[2]);
               this.var_2365 = int(_loc2_[3]);
               Settings.nextMapID = this.nextMapID;
               class_82.playSoundEffect(class_126.const_175);
               this.var_574.method_4489().method_5120(GuiConstants.LOGOUT_WINDOW);
               break;
            case class_113.SELECT:
               this.var_3936 = _loc2_[2];
               switch(this.var_3936)
               {
                  case class_113.const_1193:
                     this.selectedConfiguration = int(_loc2_[3]);
                     Settings.selectedConfiguration = this.selectedConfiguration;
                     this.var_574.method_4489().updateInfoField(GuiConstants.SHIP_WINDOW,class_93.var_3654,class_91.const_2130);
                     this.var_574.method_4489().method_4214();
               }
               break;
            case class_74.const_2258:
               this.method_2219(int(_loc2_[2]));
               break;
            case class_74.const_3321:
            case class_74.const_2118:
               this.var_4254.method_5709(_loc2_);
               break;
            case class_74.const_1503:
               this.var_4540.method_5080(_loc2_);
               break;
            case class_74.const_2615:
               this.var_2134.method_5080(_loc2_);
               break;
            case class_74.const_1396:
               this.var_1465 = _loc2_[2];
               _loc7_ = int(_loc2_[4]);
               this.var_574.method_4489().method_2001(this.var_1465,_loc7_);
               break;
            case class_74.const_3190:
               this.var_1465 = _loc2_[2];
               _loc8_ = int(_loc2_[4]);
               break;
            case class_74.const_1854:
               break;
            case class_74.const_2909:
               break;
            case class_74.const_1418:
               break;
            case class_74.const_1148:
               _loc9_ = Boolean(int(_loc2_[2]));
               _loc10_ = this.map.method_5540(class_125);
               for each(_loc13_ in _loc10_)
               {
                  class_125(_loc13_).isEnabled = _loc9_;
               }
               break;
            case class_74.const_627:
               this.var_574.method_4489().writeToLog(class_88.getItem("loadfull"));
               if(false)
               {
                  class_59.call(class_59.const_2242,[class_59.const_627]);
                  break;
               }
               break;
            case class_74.const_2153:
               this.var_574.method_4489().writeToLog(class_88.getItem("resourcedisabled"));
               break;
            case class_74.const_181:
               this.hash = _loc2_[2];
               this.map.method_3420(this.hash);
               break;
            case class_74.const_74:
               if(this.var_3284 == null)
               {
                  this.var_3284 = class_116.getInstance();
               }
               this.var_3284.method_5080(_loc2_);
               break;
            case class_74.LOGOUT:
               this.var_574.method_4489().method_3445();
               this.var_574.var_4954 = true;
               this.var_574.method_360(true);
               class_59.call(class_59.const_339,[""],System.exit,[0]);
               break;
            case class_74.const_3082:
               this.var_574.method_4489().method_975();
               break;
            case class_74.const_208:
               switch(_loc2_[2])
               {
                  case class_74.const_1719:
                     this.category = _loc2_[3];
                     _loc14_ = TextUtils.getTranslationByType(String(_loc2_[4]),class_117.const_2693);
                     this.amount = int(_loc2_[5]);
                     if(this.category == "b")
                     {
                        this.var_574.method_4489().writeToLog(class_88.getItem("bought_bat").replace("%TYPE%",_loc14_).replace("%COUNT%",class_122.method_98(this.amount)));
                        break loop1;
                     }
                     if(this.category == "r")
                     {
                        this.var_574.method_4489().writeToLog(class_88.getItem("bought_rok").replace("%TYPE%",_loc14_).replace("%COUNT%",class_122.method_98(this.amount)));
                        break loop1;
                     }
                     break loop1;
                  case class_74.const_2688:
                     switch(_loc2_[3])
                     {
                        case class_74.const_1537:
                           this.currency = _loc2_[4];
                           if(this.currency == "U")
                           {
                              this.var_574.method_4489().writeToLog(class_88.getItem("ammobuy_fail_uri"));
                              break loop1;
                           }
                           if(this.currency == "C")
                           {
                              this.var_574.method_4489().writeToLog(class_88.getItem("ammobuy_fail_cre"));
                              break loop1;
                           }
                           break loop1;
                        case class_74.const_1650:
                           this.var_574.method_4489().writeToLog(class_88.getItem("ammobuy_fail_space"));
                     }
               }
               break;
            case class_74.const_1348:
               this.var_574.method_4489().method_3126();
               break;
            case class_74.const_1847:
               this.var_3113 = class_88.getItem("jumplevelfalse").replace(/%!/,_loc2_[2]);
               this.var_574.method_4489().writeToLog(this.var_3113);
               class_82.playSoundEffect(class_126.const_3037);
               break;
            case class_74.const_2873:
               this.var_1279.method_5080(_loc2_);
               break;
            case class_74.const_2772:
               this.var_1150.method_5080(_loc2_);
               break;
            case class_74.const_1440:
               this.method_2707();
         }
         loop5:
         switch(_loc2_[0])
         {
            case class_74.ERROR:
               _loc15_ = int(_loc2_[1]);
               switch(_loc15_)
               {
                  case class_74.const_64:
                     this.method_4118();
                     break loop5;
                  case class_74.const_3258:
                     this.var_574.method_360(true);
                     this.var_574.method_4489().method_5921();
                     this.var_574.guiManager.method_3916(class_88.getItem("notloggedin"));
                     break loop5;
                  case class_74.const_2521:
                     this.var_574.method_360(true);
                     this.var_574.method_4489().method_5921();
                     this.var_574.guiManager.method_3916(class_88.getItem("doubleloggedin"));
                     break loop5;
                  case class_74.const_248:
                     break loop5;
                  case class_74.const_1473:
                  case class_74.const_2080:
               }
               break;
            case class_74.const_2859:
         }
      }
      
      public function method_2219(param1:int) : void
      {
         var _loc2_:class_115 = new class_115();
         _loc2_.close = true;
         this.sendRequest(_loc2_);
         this.var_574.method_360(true);
         Settings.nextMapID = param1;
      }
      
      public function method_2707() : void
      {
         this.var_4072 = false;
         this.var_4619 = false;
      }
      
      public function get method_3579() : Boolean
      {
         return this.var_4018;
      }
      
      public function set method_3579(param1:Boolean) : void
      {
         this.var_4018 = param1;
         if(this.var_4018)
         {
            this.var_3828 = class_103.instance;
         }
      }
      
      public function method_2939() : BigInteger
      {
         var _loc1_:BigInteger = this.var_353;
         this.var_353 = null;
         return _loc1_;
      }
      
      public function method_1182(param1:ByteArray) : void
      {
         this.var_2375.method_2946.method_1757(param1);
      }
      
      public function method_989(param1:Object) : void
      {
         this.var_2375.method_2946.method_989(param1);
      }
      
      public function method_2820() : class_116
      {
         return this.var_3284;
      }
      
      public function method_1696() : class_106
      {
         return this.var_2351;
      }
      
      public function method_752() : class_114
      {
         return this.var_2988;
      }
      
      public function method_562() : class_123
      {
         return this.petAssembly;
      }
      
      public function method_5306() : class_101
      {
         return this.var_3849;
      }
      
      public function method_6226() : class_108
      {
         return this.var_4540;
      }
      
      public function method_3783() : class_104
      {
         return this.var_4254;
      }
      
      public function get method_4689() : class_110
      {
         return this.var_2134;
      }
      
      private function get map() : class_90
      {
         return class_50.getInstance().map;
      }
      
      public function get method_2547() : String
      {
         return this.var_1034;
      }
   }
}
