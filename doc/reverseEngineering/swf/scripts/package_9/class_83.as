package package_9
{
   import com.bigpoint.utils.class_73;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.utils.ByteArray;
   import flash.utils.clearTimeout;
   import flash.utils.getTimer;
   import flash.utils.setTimeout;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.gui.class_194;
   import net.bigpoint.darkorbit.gui.class_58;
   import net.bigpoint.darkorbit.managers.hotkeysHandlers.class_291;
   import net.bigpoint.darkorbit.managers.hotkeysHandlers.class_295;
   import net.bigpoint.darkorbit.managers.keyboardManager.KeyboardMapper;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.map.model.traits.class_287;
   import net.bigpoint.darkorbit.map.model.traits.class_299;
   import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.MapAssetNotification;
   import net.bigpoint.darkorbit.net.class_113;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_101.class_271;
   import package_107.class_294;
   import package_108.GroupProxy;
   import package_109.class_297;
   import package_17.class_62;
   import package_29.class_85;
   import package_38.class_288;
   import package_38.class_293;
   import package_38.class_296;
   import package_38.class_298;
   import package_38.class_301;
   import package_69.Box;
   import package_69.class_180;
   import package_69.class_181;
   import package_69.class_292;
   import package_76.class_300;
   
   public class class_83
   {
      
      public static var var_2066:int = 0;
      
      public static var var_4302:int = 0;
      
      public static var var_1488:int = 0;
      
      private static var var_2225:String;
      
      private static var var_1082:String;
      
      public static const RADTODEG:Number = 57.29577951308232;
      
      private static const const_1673:int = 45;
       
      
      private const const_324:class_73 = new class_73();
      
      private var var_1209:GroupProxy;
      
      private var var_2117:Boolean;
      
      private var var_1352:Sprite;
      
      private var var_4955:Boolean;
      
      private var var_4697:Boolean = false;
      
      private var keyDown:Array;
      
      private var var_4490:Number = 0;
      
      private var name_20:class_62;
      
      private var var_1512:KeyboardMapper;
      
      private var var_4867:class_297;
      
      private var _stage:Stage;
      
      private var var_3627:int = -200;
      
      private var var_3399:int;
      
      private var var_2299:Boolean = false;
      
      private var _map:class_90;
      
      public function class_83(param1:Stage, param2:Sprite)
      {
         this.keyDown = [];
         super();
         this._stage = param1;
         this.var_1512 = KeyboardMapper.getInstance();
         this.name_20 = class_62.getInstance();
         this.var_4867 = new class_297();
         this.var_1352 = param2;
         var _loc3_:* = [1471336,779449449,1819490874,1416195429,1915712617,1667967017];
         var _loc4_:int = _loc3_.length;
         var _loc5_:ByteArray = new ByteArray();
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_.writeInt(_loc3_[_loc6_]);
            _loc6_++;
         }
         _loc5_.writeInt(0);
         _loc5_.position = 0;
         var_2225 = _loc5_.readUTF();
         _loc5_.clear();
         _loc3_ = [1131896,1952805486,1634486638,1952805478];
         _loc6_ = 0;
         while(_loc6_ < _loc4_)
         {
            _loc5_.writeInt(_loc3_[_loc6_]);
            _loc6_++;
         }
         _loc5_.writeInt(0);
         _loc5_.position = 0;
         var_1082 = _loc5_.readUTF();
         _loc5_.clear();
         this.addEventListeners();
      }
      
      public function get method_3265() : Boolean
      {
         return this.var_2299;
      }
      
      public function get map() : class_90
      {
         return this._map;
      }
      
      public function set map(param1:class_90) : void
      {
         this._map = param1;
         this.var_4867.map = param1;
      }
      
      private function get hero() : class_86
      {
         return !!this._map ? this._map.hero : null;
      }
      
      private function get method_20() : class_299
      {
         return !!this._map ? this._map.method_5806(class_81.userID,class_299) as class_299 : null;
      }
      
      public function method_2112() : void
      {
         if(this.hero)
         {
            this.method_1368(this.hero.x,this.hero.y);
         }
      }
      
      public function method_1368(param1:int, param2:int, param3:class_180 = null, param4:Boolean = false) : class_73
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(this.var_4697)
         {
            return null;
         }
         if(this.hero != null)
         {
            if(Boolean(this.method_3265) && !param3)
            {
               param1 = int(this.method_2071(this.hero.position.x,param1));
               param2 = int(this.method_5035(this.hero.position.y,param2));
            }
            if((_loc5_ = this.map.method_6017(this.hero.position.method_3137(),new Point(param1,param2))) != null)
            {
               param1 = _loc5_.x;
               param2 = _loc5_.y;
            }
            if(_loc6_ = new Error().getStackTrace())
            {
               if(Boolean(class_294.endsWith(_loc6_,var_2225)) || Boolean(class_294.contains(_loc6_,var_1082)))
               {
                  var_1488 = 8388608;
               }
            }
            this.method_802(param1,param2);
            this.hero.goto(param1,param2,this.method_3807,[param3,param1,param2]);
            class_194.getInstance().closeWindow(null);
            return new class_73(param1,param2);
         }
         return null;
      }
      
      public function method_5656() : void
      {
         this.method_2112();
         this.var_4697 = true;
      }
      
      public function method_711() : void
      {
         this.var_4697 = false;
      }
      
      public function method_5917() : void
      {
         this.var_4955 = true;
         this.var_2117 = true;
      }
      
      public function method_94() : void
      {
         this.var_4955 = false;
         this.var_2117 = false;
      }
      
      public function method_5361() : void
      {
         this.var_2117 = true;
      }
      
      public function method_3851() : void
      {
         this.var_2117 = false;
      }
      
      public function mirrorControls() : void
      {
         this.var_2299 = true;
      }
      
      public function method_6216() : void
      {
         this.var_2299 = false;
      }
      
      public function method_1571() : void
      {
         var _loc2_:int = 0;
         if(this.hero == null)
         {
            return;
         }
         var _loc1_:class_85 = this.map.method_4929.target;
         if(_loc1_ != null)
         {
            _loc2_ = int(_loc1_.id);
            if(_loc2_ != -1)
            {
               if(this.method_20.target != null)
               {
                  this.name_20.sendNotification(MapAssetNotification.ABORT_LASER_ATTACK,[true,class_81.userID,false]);
               }
               else
               {
                  this.method_6517(_loc2_);
               }
            }
         }
         else
         {
            this.name_20.sendNotification(MapAssetNotification.ABORT_LASER_ATTACK,[true,class_81.userID,true]);
         }
      }
      
      public function method_6517(param1:int) : void
      {
         var _loc2_:class_288 = new class_288();
         var _loc3_:class_85 = this.map.method_1203().method_3338();
         var _loc4_:class_73 = new class_73(0,0);
         if(_loc3_)
         {
            _loc4_ = _loc3_.position;
         }
         _loc2_.name_150 = param1;
         _loc2_.name_141 = _loc4_.x;
         _loc2_.name_18 = _loc4_.y;
         if((_loc2_.name_141 + _loc2_.name_18) % 3 == 0)
         {
            ++_loc2_.name_141;
         }
         class_62.getInstance().sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,_loc2_);
         this.method_20.target = _loc3_.method_1954(class_287) as class_287;
      }
      
      public function method_991(param1:int) : void
      {
         class_62.getInstance().sendNotification(ConnectionNotifications.SEND_COMMAND,[class_113.SELECT,[class_113.const_1193,param1.toString(),class_81.userID.toString(),class_81.sessionID.toString()]]);
      }
      
      public function isKeyDown(param1:int) : Boolean
      {
         return Boolean(this.keyDown[param1]);
      }
      
      private function addEventListeners() : void
      {
         this.var_1352.addEventListener(MouseEvent.MOUSE_DOWN,this.method_793);
         this.var_1352.addEventListener(MouseEvent.MOUSE_MOVE,this.method_4905);
         this.var_1352.addEventListener(MouseEvent.MOUSE_OUT,this.handleMouseOut);
         this._stage.addEventListener(MouseEvent.MOUSE_UP,this.method_5463);
         this._stage.addEventListener(KeyboardEvent.KEY_DOWN,this.handleKeyDown);
         this._stage.addEventListener(KeyboardEvent.KEY_UP,this.method_3365);
         this.var_1352.addEventListener(MouseEvent.MOUSE_WHEEL,this.method_962);
         this._stage.focus = this.var_1352;
      }
      
      private function method_802(param1:int, param2:int) : void
      {
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:* = null;
         clearTimeout(this.var_3399);
         if(this.hero == null)
         {
            return;
         }
         var _loc3_:int = getTimer();
         var _loc4_:int;
         if((_loc4_ = _loc3_ - Number(this.var_3627)) < 200)
         {
            this.var_3399 = setTimeout(this.method_802,200 - _loc4_,param1,param2);
         }
         else
         {
            this.var_3627 = _loc3_;
            _loc5_ = param1;
            _loc6_ = param2;
            if(_loc5_ > 0)
            {
               _loc5_ &= 8388607;
               _loc5_ = _loc5_ & 8388607 | Number(var_2066);
            }
            if(_loc6_ > 0)
            {
               _loc6_ &= 8388607;
               _loc6_ = _loc6_ & 8388607 | Number(var_4302);
            }
            if(((_loc7_ = new class_296(this.hero.position.x,_loc6_,_loc5_,this.hero.position.y)).var_15 + _loc5_) % 3 == 0)
            {
               ++_loc7_.var_15;
            }
            if(_loc7_.var_3280 > 0)
            {
               _loc7_.var_3280 &= 8388607;
               _loc7_.var_3280 |= var_1488;
            }
            if((_loc7_.var_15 + _loc5_) % 3 == 0)
            {
               ++_loc7_.var_15;
            }
            _loc7_.var_3280 -= (_loc7_.var_3280 + _loc6_) % 3;
            var_1488 ^= var_1488;
            var_2066 ^= var_2066;
            var_4302 ^= var_4302;
            class_62.getInstance().sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,_loc7_);
            class_300.track();
         }
      }
      
      private function method_5035(param1:Number, param2:int) : Number
      {
         return param1 - (param2 - param1);
      }
      
      private function method_2071(param1:Number, param2:int) : Number
      {
         return param1 - (param2 - param1);
      }
      
      private function method_3807(param1:class_180 = null, param2:int = -1, param3:int = -1) : void
      {
         var _loc4_:* = null;
         if(this.map == null || this.hero == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         class_81.var_608 = param1;
         if(param1 is class_181)
         {
            class_62.getInstance().sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_301(param1.hash));
         }
         else if(param1 is Box || param1 is class_292)
         {
            (_loc4_ = new class_298(param1.hash,param2,param3)).var_4787 = this.hero.position.x;
            _loc4_.var_2295 = this.hero.position.y;
            if((_loc4_.var_701 + _loc4_.var_4787 + _loc4_.var_2295) % 3 == 0)
            {
               ++_loc4_.var_2295;
            }
            class_62.getInstance().sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,_loc4_);
         }
      }
      
      private function handleMouseOut(param1:MouseEvent) : void
      {
         this.var_4867.method_4391();
      }
      
      private function method_962(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         if(Boolean(this.hero) && param1.altKey)
         {
            _loc2_ = Number(this.hero.drones.const_2113.value);
            if(param1.delta < 0)
            {
               _loc2_ -= 0.1;
            }
            else if(param1.delta > 0)
            {
               _loc2_ += 0.1;
            }
            this.hero.drones.const_2113.value = Math.max(0.5,Math.min(_loc2_,2));
         }
      }
      
      private function method_793(param1:MouseEvent) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:* = 0;
         var _loc7_:* = null;
         if(this.var_4955)
         {
            return;
         }
         this._stage.focus = null;
         var _loc2_:int = int(this._stage.mouseX);
         var _loc3_:int = int(this._stage.mouseY);
         var _loc4_:Boolean = false;
         if(false)
         {
            _loc5_ = getTimer();
            if(this.var_4490 > 0)
            {
               if((_loc6_ = _loc5_ - Number(this.var_4490)) < 500)
               {
                  _loc4_ = Boolean(this.var_4867.method_6250(_loc2_,_loc3_));
               }
            }
            this.var_4490 = _loc5_;
         }
         if(!this.var_1209)
         {
            this.var_1209 = this.name_20.retrieveProxy(GroupProxy.NAME) as GroupProxy;
         }
         if(Boolean(this.var_1209) && Boolean(this.var_1209.method_2251))
         {
            if(this.hero != null)
            {
               _loc7_ = class_50.getInstance().method_574(_loc2_,_loc3_);
               this.name_20.method_2407(ConnectionNotifications.SEND_NETTY_REQUEST,new class_293(_loc7_.x,_loc7_.y));
               class_302.getInstance().method_6002(_loc7_,this.map);
               this.var_1209.method_2251 = false;
               return;
            }
         }
         if(this.map)
         {
            if(!(_loc4_ = Boolean(this.var_4867.method_2186(_loc2_,_loc3_))))
            {
               if(this.hero)
               {
                  class_271(this.hero.method_1954(class_271)).destinationMarkerVisible = false;
               }
               this.method_2514();
               this._stage.addEventListener(Event.ENTER_FRAME,this.method_2514);
            }
         }
      }
      
      private function method_4905(param1:MouseEvent = null) : void
      {
         if(!this.var_4955 && this.hero != null)
         {
            this.var_1352.useHandCursor = this.var_1352.buttonMode = this.var_4867.method_6447(this._stage.mouseX,this._stage.mouseY);
         }
      }
      
      private function method_2514(param1:Event = null) : void
      {
         if(Boolean(this.var_4955) || this.map == null || this.hero == null)
         {
            return;
         }
         class_50.getInstance().method_3528.method_574(this._stage.mouseX,this._stage.mouseY,this.const_324);
         var _loc2_:Number = Number(this.hero.position.method_3849(this.const_324.x,this.const_324.y,0));
         if(_loc2_ > this.hero.hitArea.clickRadius + const_1673)
         {
            this.method_1368(this.const_324.x,this.const_324.y);
         }
      }
      
      private function method_5463(param1:MouseEvent) : void
      {
         this._stage.removeEventListener(Event.ENTER_FRAME,this.method_2514);
         if(false)
         {
            class_58.instance.method_2675();
            class_58.instance.method_3053();
         }
      }
      
      private function method_3365(param1:KeyboardEvent) : void
      {
         this.keyDown[param1.keyCode] = false;
      }
      
      private function handleKeyDown(param1:KeyboardEvent) : void
      {
         if(this.keyDown[param1.keyCode])
         {
            return;
         }
         this.keyDown[param1.keyCode] = true;
         if(this.var_2117)
         {
            return;
         }
         if(param1.target is TextField)
         {
            return;
         }
         this.var_1512.method_4777(param1.keyCode);
         class_291.instance.method_1553(param1);
         if(false)
         {
            class_295.instance.method_1553(param1);
         }
      }
      
      public function method_5057() : Boolean
      {
         return this.var_4955;
      }
      
      public function get method_5321() : class_297
      {
         return this.var_4867;
      }
   }
}
