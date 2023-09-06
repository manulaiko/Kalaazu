package package_115
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.class_126;
   import package_22.FullResourcePattern;
   
   public class class_316
   {
      
      public static const const_2279:String = "player";
      
      public static const const_788:String = "pet";
      
      public static const const_2761:String = "npc";
      
      private static const NO_RES_KEY:String = "NO_RES_KEY";
      
      public static const const_1756:uint = 4294901760;
       
      
      private const NO_OVERLAY:String = "NO_OVERLAY";
      
      public var playLoop:Boolean;
      
      public var laserClassID:int;
      
      public var rocketClassID:int;
      
      public var expansionClassID:int = -1;
      
      private var labelVisible:Boolean = true;
      
      private var labelYOffset:int;
      
      private var energyVisible:Boolean = true;
      
      private var energyYOffset:int;
      
      private var selectionYOffset:int;
      
      private var explodeTypeID:int;
      
      private var laserDamageTypeID:int;
      
      private var rocketDamageTypeID:int;
      
      private var engineTypeID:int;
      
      private var engineSmokeID:int;
      
      public var enginePositionClassID:int = -1;
      
      public var var_4908:int = -1;
      
      public var effects:Array;
      
      private var var_4891:int = -1;
      
      public var var_3852:int = 100;
      
      private var seekInterval:int = 200;
      
      public var clickRadius:int = 45;
      
      public var clickPriority:int = -1;
      
      private var var_1125:class_73;
      
      private var spaceball:Boolean;
      
      public var megaExplosion:Boolean;
      
      public var showCrap:Boolean;
      
      public var showPilot:int;
      
      public var pilotDistance:int;
      
      public var rotatable:Boolean = true;
      
      public var var_3766:int = 0;
      
      public var soundIDs:Array;
      
      public var var_2258:Vector.<String>;
      
      public var podType:int;
      
      public var var_700:Boolean = false;
      
      public var playEngineSoundIfNoEnginePresent:Boolean = false;
      
      public var isLegendaryEventNPC:Boolean = false;
      
      private var var_1300:String;
      
      private var var_1582:uint = 4294901760;
      
      private var var_1659:Vector.<FullResourcePattern>;
      
      private var var_1353:String;
      
      private var var_487:String;
      
      private var var_685:String = null;
      
      private var var_4343:String;
      
      private var var_120:Vector.<FullResourcePattern>;
      
      private var var_4210:String;
      
      private var var_4888:Vector.<FullResourcePattern>;
      
      private var var_1803:String;
      
      public var var_2888:Vector.<Vector.<class_73>>;
      
      public var var_682:Vector.<Vector.<String>>;
      
      public var var_3325:Object;
      
      public var name_115:String;
      
      public function class_316(param1:String, param2:String, param3:Vector.<FullResourcePattern> = null, param4:String = null, param5:String = null)
      {
         this.effects = [];
         this.var_1125 = new class_73();
         this.podType = class_126.const_576;
         super();
         this.var_1659 = param3;
         this.var_685 = param2;
         this.var_1353 = param4;
         this.var_487 = param5;
         this.var_4343 = param1;
      }
      
      public function method_5218(param1:Boolean) : void
      {
         this.playLoop = param1;
      }
      
      public function method_6389() : Boolean
      {
         if(this.expansionClassID == -1)
         {
            return false;
         }
         return true;
      }
      
      public function method_5609(param1:Boolean) : void
      {
         this.labelVisible = param1;
      }
      
      public function method_1418(param1:int) : void
      {
         this.labelYOffset = param1;
      }
      
      public function method_1867(param1:Boolean) : void
      {
         this.energyVisible = param1;
      }
      
      public function method_2486(param1:int) : void
      {
         this.energyYOffset = param1;
      }
      
      public function method_4052(param1:int) : void
      {
         this.selectionYOffset = param1;
      }
      
      public function method_2593(param1:int) : void
      {
         this.explodeTypeID = param1;
      }
      
      public function method_2672() : int
      {
         return this.explodeTypeID;
      }
      
      public function method_2465(param1:int) : void
      {
         this.laserDamageTypeID = param1;
      }
      
      public function method_502(param1:int) : void
      {
         this.rocketDamageTypeID = param1;
      }
      
      public function method_5812(param1:int) : void
      {
         this.engineTypeID = param1;
      }
      
      public function method_2493() : int
      {
         return this.engineTypeID;
      }
      
      public function method_316(param1:int) : void
      {
         this.enginePositionClassID = param1;
      }
      
      public function method_3225() : int
      {
         return this.enginePositionClassID;
      }
      
      public function method_4746() : int
      {
         return this.engineSmokeID;
      }
      
      public function method_4972(param1:int) : void
      {
         this.engineSmokeID = param1;
      }
      
      public function method_6310() : int
      {
         return this.var_1125.x;
      }
      
      public function method_3348(param1:int) : void
      {
         this.var_1125.x = param1;
      }
      
      public function method_2708() : int
      {
         return this.var_1125.y;
      }
      
      public function method_5796(param1:int) : void
      {
         this.var_1125.y = param1;
      }
      
      public function method_6454(param1:Boolean) : void
      {
         this.spaceball = param1;
      }
      
      public function method_3373(param1:int) : void
      {
         this.seekInterval = param1;
      }
      
      public function get minimapIcon() : String
      {
         return this.var_1300;
      }
      
      public function set minimapIcon(param1:String) : void
      {
         this.var_1300 = param1;
      }
      
      public function set minimapColor(param1:uint) : void
      {
         this.var_1582 = param1;
      }
      
      public function set method_3073(param1:Vector.<FullResourcePattern>) : void
      {
         this.var_1659 = param1;
      }
      
      public function getResKey(param1:int) : String
      {
         var _loc2_:* = null;
         var _loc3_:int = !!this.var_1659 ? int(this.var_1659.length) : 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(this.var_1659[_loc4_].id == param1)
            {
               _loc2_ = this.var_1659[_loc4_];
               break;
            }
            _loc4_++;
         }
         return !!_loc2_ ? _loc2_.srcKey : this.var_1659[0].srcKey;
      }
      
      public function get atlasXml() : String
      {
         return this.var_487;
      }
      
      public function set atlasXml(param1:String) : void
      {
         this.var_487 = param1;
      }
      
      public function clone() : class_316
      {
         var _loc1_:class_316 = new class_316(this.var_4343,this.var_685,this.var_1659);
         _loc1_.playLoop = this.playLoop;
         _loc1_.laserClassID = this.laserClassID;
         _loc1_.rocketClassID = this.rocketClassID;
         _loc1_.expansionClassID = this.expansionClassID;
         _loc1_.labelVisible = this.labelVisible;
         _loc1_.labelYOffset = this.labelYOffset;
         _loc1_.energyVisible = this.energyVisible;
         _loc1_.energyYOffset = this.energyYOffset;
         _loc1_.selectionYOffset = this.selectionYOffset;
         _loc1_.explodeTypeID = this.explodeTypeID;
         _loc1_.laserDamageTypeID = this.laserDamageTypeID;
         _loc1_.rocketDamageTypeID = this.rocketDamageTypeID;
         _loc1_.engineTypeID = this.engineTypeID;
         _loc1_.engineTypeID = this.engineTypeID;
         _loc1_.enginePositionClassID = this.enginePositionClassID;
         _loc1_.var_4908 = this.var_4908;
         _loc1_.effects = this.effects;
         _loc1_.var_4891 = this.var_4891;
         _loc1_.var_3852 = this.var_3852;
         _loc1_.seekInterval = this.seekInterval;
         _loc1_.clickRadius = this.clickRadius;
         _loc1_.method_3348(this.var_1125.x);
         _loc1_.method_5796(this.var_1125.y);
         _loc1_.spaceball = this.spaceball;
         _loc1_.megaExplosion = this.megaExplosion;
         _loc1_.showCrap = this.showCrap;
         _loc1_.showPilot = this.showPilot;
         _loc1_.pilotDistance = this.pilotDistance;
         _loc1_.rotatable = this.rotatable;
         _loc1_.var_3766 = this.var_3766;
         _loc1_.soundIDs = this.soundIDs;
         _loc1_.var_2888 = this.var_2888;
         _loc1_.var_3325 = this.var_3325;
         _loc1_.var_682 = this.var_682;
         _loc1_.var_2258 = this.var_2258;
         _loc1_.podType = this.podType;
         _loc1_.var_700 = this.var_700;
         _loc1_.playEngineSoundIfNoEnginePresent = this.playEngineSoundIfNoEnginePresent;
         _loc1_.isLegendaryEventNPC = this.isLegendaryEventNPC;
         _loc1_.minimapIcon = this.var_1300;
         _loc1_.minimapColor = this.var_1582;
         _loc1_.method_3073 = this.var_1659;
         _loc1_.atlasXml = this.atlasXml;
         _loc1_.var_685 = this.var_685;
         _loc1_.method_4146 = this.var_120;
         _loc1_.method_2328 = this.var_4888;
         _loc1_.name_163 = this.var_4210;
         return _loc1_;
      }
      
      public function getPatternID() : String
      {
         return this.var_4343;
      }
      
      public function set name_126(param1:String) : void
      {
         this.var_4343 = param1;
      }
      
      public function method_1505(param1:int) : FullResourcePattern
      {
         var _loc2_:* = null;
         var _loc3_:int = !!this.var_120 ? int(this.var_120.length) : 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(this.var_120[_loc4_].id == param1)
            {
               _loc2_ = this.var_120[_loc4_];
               break;
            }
            _loc4_++;
         }
         return !!_loc2_ ? _loc2_ : new FullResourcePattern(-1,"NO_OVERLAY","NO_OVERLAY");
      }
      
      public function set method_4146(param1:Vector.<FullResourcePattern>) : void
      {
         this.var_120 = param1;
      }
      
      public function set name_163(param1:String) : void
      {
         this.var_4210 = param1;
      }
      
      public function get name_163() : String
      {
         return this.var_4210;
      }
      
      public function set method_2328(param1:Vector.<FullResourcePattern>) : void
      {
         this.var_4888 = param1;
      }
      
      public function method_41(param1:int) : FullResourcePattern
      {
         var _loc2_:* = null;
         var _loc3_:int = !!this.var_4888 ? int(this.var_4888.length) : 0;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(this.var_4888[_loc4_].id == param1)
            {
               _loc2_ = this.var_4888[_loc4_];
               break;
            }
            _loc4_++;
         }
         return !!_loc2_ ? _loc2_ : this.var_4888[0];
      }
      
      public function set comment(param1:String) : void
      {
         this.var_1803 = param1;
      }
      
      public function get comment() : String
      {
         return this.var_1803;
      }
      
      public function get name_126() : String
      {
         return this.var_4343;
      }
      
      public function get name_7() : String
      {
         return this.var_685;
      }
      
      public function get method_3073() : Vector.<FullResourcePattern>
      {
         return this.var_1659;
      }
   }
}
