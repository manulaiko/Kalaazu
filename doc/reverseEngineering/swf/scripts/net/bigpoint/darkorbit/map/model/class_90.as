package net.bigpoint.darkorbit.map.model
{
   import flash.geom.Point;
   import flash.media.SoundChannel;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.map.model.ship.class_109;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_109.class_329;
   import package_119.class_327;
   import package_120.class_328;
   import package_19.class_70;
   import package_27.class_82;
   import package_29.class_85;
   import package_29.class_89;
   import package_35.EffectManager;
   import package_76.XMLUtils;
   
   public class class_90 extends class_89
   {
      
      private static var var_1304:int = -1;
      
      private static var var_55:Object = {};
      
      private static var var_3575:XML;
      
      private static var var_4244:XML;
      
      public static const const_2663:int = 21000;
      
      public static const const_927:int = 13100;
       
      
      public const storage:Dictionary = new Dictionary(true);
      
      public const const_1216:class_70 = new class_70();
      
      private var var_1560:XML;
      
      private var var_3232:int = -1;
      
      private var var_1799:class_328;
      
      private var _ships:class_109;
      
      private var var_3967:class_327;
      
      private var var_3049:class_329;
      
      private var var_2548:SoundChannel;
      
      private var var_3813:uint;
      
      private var var_3583:int = 21000;
      
      private var var_508:int = 13100;
      
      private var var_2455:int;
      
      private var var_427:Number;
      
      private var var_208:EffectManager;
      
      public function class_90(param1:int)
      {
         this.var_3049 = new class_329();
         this.var_208 = new EffectManager();
         super();
         this.var_2455 = param1;
         this.var_3813 = getTimer();
         this.var_1799 = new class_328();
         this._ships = new class_109();
         this.var_3967 = new class_327();
         this.init();
      }
      
      public static function get method_5486() : int
      {
         return var_1304--;
      }
      
      public static function method_2425() : void
      {
         var_55 = {};
      }
      
      public static function method_3817(param1:String) : int
      {
         var _loc2_:int = int(method_5486);
         var_55[param1] = _loc2_;
         return _loc2_;
      }
      
      public static function init(param1:XML, param2:XML) : void
      {
         var_3575 = param1;
         var_4244 = param2;
      }
      
      public static function method_1717(param1:int) : String
      {
         var _loc2_:XMLList = XMLUtils.method_388(var_3575.map,"id",param1.toString());
         return _loc2_.length() > 0 ? _loc2_.child("gameserverIP") : null;
      }
      
      private static function method_757(param1:int) : XML
      {
         var _loc2_:* = null;
         if(var_4244)
         {
            _loc2_ = XMLUtils.method_388(var_4244.map,"id",param1.toString());
            return _loc2_.length() > 0 ? _loc2_[0] : null;
         }
         return null;
      }
      
      public static function get method_5547() : XML
      {
         return var_3575;
      }
      
      public function get method_5076() : int
      {
         return this.var_3583;
      }
      
      public function get method_1901() : int
      {
         return this.var_508;
      }
      
      public function get mapID() : int
      {
         return this.var_2455;
      }
      
      public function get scaleFactor() : Number
      {
         return this.var_427;
      }
      
      public function get effects() : EffectManager
      {
         return this.var_208;
      }
      
      public function get hero() : class_86
      {
         return method_327(class_81.userID) as class_86;
      }
      
      public function get method_2402() : class_328
      {
         return this.var_1799;
      }
      
      override public function method_4903(param1:class_85) : class_85
      {
         return super.method_4903(param1);
      }
      
      override public function removeEntity(param1:class_85) : class_85
      {
         if(param1)
         {
            this.effects.method_4748(param1.id);
         }
         return super.removeEntity(param1);
      }
      
      public function method_3454(param1:String) : class_85
      {
         return method_327(var_55[param1]);
      }
      
      public function method_3420(param1:String) : class_85
      {
         return method_918(var_55[param1]);
      }
      
      override public function removeAll() : void
      {
         this.effects.method_6442();
         super.removeAll();
      }
      
      public function method_6017(param1:Point, param2:Point) : Point
      {
         return this.var_1799.method_6017(param1,param2);
      }
      
      public function init(param1:XML = null) : void
      {
         this.var_1560 = param1 || method_757(this.mapID) || new XML();
         this.const_1216.dispatch();
         if(this.var_1560.attribute("scaleFactor").length() > 0)
         {
            this.var_427 = Number(this.var_1560.attribute("scaleFactor"));
         }
         else
         {
            this.var_427 = 1;
         }
         this.var_3583 = Number(const_2663) * Number(this.scaleFactor);
         this.var_508 = Number(const_927) * Number(this.scaleFactor);
         this.var_3232 = !!this.var_1560.attribute("music").length() ? int(this.var_1560.attribute("music")) : -1;
         Settings.combatMusicActive = false;
         if(false && false)
         {
            this.method_6148();
         }
         this.method_2778();
      }
      
      public function method_1480() : int
      {
         return this.mapID;
      }
      
      public function cleanup() : void
      {
         this._ships.cleanup();
         this.var_3967.cleanup();
         this.var_1799.cleanup();
         this.var_208.method_6442();
         this.removeAll();
         this.method_2204();
         method_2425();
      }
      
      public function getName() : String
      {
         return this.method_1575();
      }
      
      public function method_1203() : class_109
      {
         return this._ships;
      }
      
      public function method_4000() : class_327
      {
         return this.var_3967;
      }
      
      public function method_1123() : int
      {
         return this.var_3232;
      }
      
      public function method_2778() : void
      {
         if(false)
         {
            if(this.var_2548)
            {
               this.method_2204();
            }
            this.var_2548 = class_82.playSoundEffect(class_126.const_3308,true,false,-1,-1,true,true);
         }
         else
         {
            this.method_2204();
         }
      }
      
      public function method_6148() : void
      {
         if(false && false)
         {
            class_82.method_2019(class_126.const_1041);
         }
         else if(this.var_3232 != -1)
         {
            class_82.method_2019(this.var_3232);
         }
      }
      
      public function method_2204() : void
      {
         if(this.var_2548)
         {
            class_82.method_401(this.var_2548);
         }
      }
      
      private function method_1575() : String
      {
         var _loc1_:String = class_126.instance.var_1524[this.mapID];
         if(_loc1_ == null)
         {
            if(this.var_1560.attribute("name").length() > 0)
            {
               _loc1_ = this.var_1560.attribute("name");
            }
            else
            {
               _loc1_ = "xxx";
            }
         }
         return _loc1_;
      }
      
      public function get method_5762() : int
      {
         return getTimer() - Number(this.var_3813);
      }
      
      public function get method_4929() : class_329
      {
         return this.var_3049;
      }
      
      public function get method_3763() : XML
      {
         return this.var_1560;
      }
   }
}
