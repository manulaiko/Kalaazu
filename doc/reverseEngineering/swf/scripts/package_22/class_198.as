package package_22
{
   import com.bigpoint.utils.class_73;
   import flash.utils.Dictionary;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.mvc.common.utils.ParserUtility;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_115.class_1063;
   import package_115.class_1085;
   import package_115.class_1087;
   import package_115.class_316;
   import package_116.class_1077;
   import package_116.class_1086;
   import package_116.class_397;
   import package_126.class_1091;
   import package_176.class_1071;
   import package_177.class_1076;
   import package_27.class_1007;
   
   public class class_198
   {
      
      private static var var_2816:Array = new Array();
      
      private static var var_2392:Dictionary = new Dictionary();
      
      private static var var_395:int = 0;
      
      public static var var_4417:Array;
      
      public static var var_5023:Array;
      
      public static var var_4406:Array;
      
      public static var var_2667:Array;
      
      public static var var_4079:Array;
      
      public static var var_4738:Array;
      
      public static var var_4696:Array;
      
      public static var var_4506:Array = [];
      
      public static var var_4473:Dictionary = new Dictionary();
      
      public static var var_3703:Array;
      
      public static var laserDefinitions:Array;
      
      public static var var_4284:Array;
      
      public static var var_103:Array;
      
      public static var var_264:Array;
      
      public static var var_4756:Array;
      
      public static var var_3392:Array;
      
      public static var var_441:Array;
      
      public static var var_2598:Array;
      
      public static var var_4122:Array;
      
      public static var var_3937:Array;
      
      private static var var_4746:Object;
      
      public static var var_3286:Array;
      
      public static var var_1757:Array;
      
      public static var var_4944:Array;
      
      public static var var_3786:Array;
      
      public static var var_3139:Array;
      
      public static var var_4854:Array;
      
      public static var var_584:Array;
      
      public static var var_2281:Array;
      
      public static var var_1980:Dictionary = new Dictionary();
      
      public static var var_3938:Dictionary = new Dictionary();
      
      public static var var_1840:Array;
      
      public static var var_3933:Array;
      
      public static var var_1357:Array;
      
      public static var var_1616:Array;
      
      public static var var_4779:Vector.<class_1066>;
      
      private static var var_426:Dictionary = new Dictionary();
      
      private static var var_4298:Object;
       
      
      public function class_198()
      {
         super();
      }
      
      public static function method_3072(param1:XML) : void
      {
         method_1886(param1);
         method_4066(param1);
         method_3798(param1);
         method_524(param1);
         method_981(param1);
         method_3638(param1);
         method_1296(param1);
         method_410(param1);
         method_5280(param1.patterns.laserDefinitions as XMLList);
         method_3298(param1);
         method_5386(param1);
         method_666(param1);
         method_5915(param1);
         method_573(param1);
         method_4608(param1);
         method_339(param1);
         method_1651(param1);
         method_5680(param1);
         method_5029(param1);
         method_1990(param1);
         method_2752(param1);
         method_4798(param1);
         method_3143(param1);
         method_661(param1);
         method_5383(param1);
         method_4788(param1);
         method_2217(param1);
         method_3829(param1);
         method_3398(param1);
         method_2350(param1);
         method_4976(param1);
         method_2424(param1);
         method_1582(param1);
         method_1531(param1);
         method_685(param1);
         method_2326(param1);
         method_1844(param1);
         method_6042(param1);
         method_5279(param1);
      }
      
      public static function method_3975(param1:XML, param2:XMLList) : void
      {
         method_5280(param2);
         method_3298(param1);
      }
      
      private static function method_5279(param1:XML) : void
      {
         var _loc3_:* = null;
         var _loc2_:XMLList = param1.child("patterns").child("hudIcons").child("hudIcon");
         for each(_loc3_ in _loc2_)
         {
            var_426[_loc3_.attribute("id").toString()] = new FullResourcePattern(-1,_loc3_.attribute("srcKey"),_loc3_.attribute("resKey"));
         }
      }
      
      private static function method_6042(param1:XML) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:XMLList = param1.child("patterns").child("preloadLists").child("pack");
         for each(_loc3_ in _loc2_)
         {
            _loc4_ = new Vector.<String>();
            for each(_loc5_ in _loc3_.child("item"))
            {
               _loc4_.push(_loc5_.text());
            }
            var_2392[_loc3_.attribute("id").toString()] = _loc4_;
         }
      }
      
      private static function method_1844(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:int = 0;
         var _loc12_:* = null;
         var_4779 = new Vector.<class_1066>();
         for each(_loc12_ in param1.patterns.poizones.poizone)
         {
            _loc3_ = int(_loc12_.@id);
            _loc4_ = _loc12_.@designType;
            _loc4_ = _loc12_.@designType;
            if(_loc12_.attribute("useCustomShader"))
            {
               _loc9_ = ParserUtility.parseBooleanFromString(_loc12_.@useCustomShader);
            }
            else
            {
               _loc9_ = false;
            }
            if(_loc12_.attribute("radiusOffset"))
            {
               _loc10_ = parseInt(_loc12_.attribute("radiusOffset"));
            }
            else
            {
               _loc10_ = 0;
            }
            switch(_loc4_)
            {
               case class_1066.const_2303:
                  _loc5_ = _loc12_.@backgroundID;
                  _loc6_ = _loc12_.@simpleBackgroundID;
                  _loc2_ = new class_1075(_loc3_,_loc4_,int(_loc5_),int(_loc6_),_loc9_,int(_loc12_.@size));
                  break;
               case class_1066.const_2109:
                  _loc7_ = _loc12_.@resKey;
                  _loc8_ = ParserUtility.parseBooleanFromString(_loc12_.@repeat);
                  _loc2_ = new class_1069(_loc3_,_loc4_,_loc7_,_loc8_,_loc9_,int(_loc12_.@size));
                  break;
               case class_1066.const_3244:
                  _loc2_ = new class_1075(_loc3_,_loc4_,0,int(_loc6_),_loc9_,int(_loc12_.@size));
                  break;
            }
            _loc2_.radiusOffset = _loc10_;
            while(_loc3_ > var_4779.length)
            {
               var_4779[var_4779.length] = null;
            }
            var_4779[_loc3_] = _loc2_;
         }
      }
      
      private static function method_2326(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc7_:* = null;
         var_1616 = [];
         for each(_loc7_ in param1.patterns.effects.effect)
         {
            _loc3_ = int(_loc7_.@id);
            _loc5_ = _loc7_.@resKey;
            if(_loc7_.attribute("radius").length() > 0)
            {
               _loc4_ = int(_loc7_.@radius);
               _loc2_ = new class_339(_loc3_,_loc5_,_loc4_);
            }
            else
            {
               _loc2_ = new class_339(_loc3_,_loc5_);
            }
            var_1616[_loc3_] = _loc2_;
         }
      }
      
      private static function method_685(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var_1357 = [];
         for each(_loc7_ in param1.patterns.petBuffs.buff)
         {
            _loc3_ = int(_loc7_.@id);
            _loc4_ = _loc7_.@resKey;
            _loc5_ = _loc7_.@languageKey;
            _loc6_ = int(method_37(String(_loc7_.@effect)));
            _loc2_ = new class_414(_loc3_,_loc4_,_loc5_,_loc6_);
            var_1357[_loc3_] = _loc2_;
         }
      }
      
      private static function method_37(param1:String) : int
      {
         var _loc2_:int = 0;
         if(param1 == "")
         {
            _loc2_ = -1;
         }
         else
         {
            _loc2_ = int(param1);
         }
         return _loc2_;
      }
      
      private static function method_1531(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc12_:* = null;
         var_3933 = [];
         var _loc10_:String = param1.patterns.petgears.@normalState;
         var _loc11_:String = param1.patterns.petgears.@activeState;
         for each(_loc12_ in param1.patterns.petgears.gear)
         {
            _loc3_ = int(_loc12_.@id);
            _loc7_ = _loc12_.@effectTarget;
            _loc8_ = _loc12_.@targetList;
            _loc9_ = _loc12_.@suffix;
            _loc6_ = class_88.getItem("pet_gear_" + _loc12_.@name);
            _loc5_ = _loc12_.@resKey;
            _loc4_ = int(method_37(_loc12_.@effect));
            _loc2_ = new class_1083(_loc3_,_loc6_,_loc5_,_loc4_,_loc10_,_loc11_,_loc8_,_loc9_);
            var_3933[_loc3_] = _loc2_;
         }
      }
      
      private static function method_1886(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:Boolean = false;
         var _loc5_:* = null;
         var_4417 = [];
         for each(_loc2_ in param1.patterns.preloadedResources.resource)
         {
            _loc3_ = _loc2_.@resKey;
            _loc4_ = false;
            if(_loc2_.@precache.length() > 0)
            {
               _loc4_ = Boolean(int(_loc2_.@precache));
            }
            _loc5_ = new class_1082(var_395,_loc3_,_loc4_);
            var _loc8_:*;
            var_4417[_loc8_ = var_395++] = _loc5_;
         }
      }
      
      private static function method_4976(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = false;
         var _loc10_:* = null;
         for each(_loc2_ in param1.patterns.bannerads.bannerad)
         {
            _loc3_ = int(_loc2_.@id);
            _loc4_ = String(_loc2_.@baseKey);
            _loc5_ = String(_loc2_.@enumName);
            _loc6_ = int(_loc2_.@assetCount);
            _loc7_ = String(_loc2_.@url);
            _loc8_ = null;
            if(String(_loc2_.@jsFunctionName).length)
            {
               _loc8_ = _loc2_.@jsFunctionName;
            }
            _loc9_ = _loc2_.@showWindowTitle == "true";
            _loc10_ = new class_1074(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
            if(_loc2_.@footer.length() > 0)
            {
               _loc10_.var_4232 = "bannerad_footer_" + String(_loc2_.@footer);
            }
            var_1980[_loc5_] = _loc10_;
         }
      }
      
      private static function method_2424(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         for each(_loc2_ in param1.patterns.targetedOffers.targetedOffer)
         {
            _loc3_ = _loc2_.@id;
            _loc4_ = String(_loc2_.@gfxKey);
            _loc5_ = new class_1071(_loc3_,_loc4_);
            var_3938[_loc3_] = _loc5_;
         }
      }
      
      private static function method_1582(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_1840 = [];
         for each(_loc2_ in param1.patterns.techs.tech)
         {
            _loc3_ = int(_loc2_.@id);
            _loc4_ = String(_loc2_.@linkageID);
            _loc5_ = new class_1064(_loc3_,_loc4_);
            if(_loc2_.@hasDuration.length() > 0)
            {
               _loc5_.hasDuration = ParserUtility.parseBooleanFromString(String(_loc2_.@hasDuration));
            }
            var_1840[_loc3_] = _loc5_;
         }
      }
      
      private static function method_4788(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var_1757 = [];
         for each(_loc2_ in param1.patterns.boosters.booster)
         {
            _loc3_ = int(_loc2_.@id);
            _loc4_ = int(_loc2_.@infoFieldID);
            _loc5_ = _loc2_.@resKey;
            _loc6_ = _loc2_.@barKey;
            var_1757[int(_loc3_)] = new class_206(_loc3_,_loc4_,_loc5_,_loc6_);
         }
      }
      
      private static function method_3398(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var_3139 = [];
         for each(_loc2_ in param1.hitpointColors.hitpointColor)
         {
            _loc3_ = int(_loc2_.@id);
            _loc4_ = int("0x" + _loc2_.@code);
            var_3139[int(_loc3_)] = _loc4_;
         }
      }
      
      private static function method_2217(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var_4944 = [];
         for each(_loc2_ in param1.patterns.ores.ore)
         {
            _loc3_ = int(_loc2_.@type);
            _loc4_ = _loc2_.@resKey;
            _loc5_ = _loc2_.@languageKey;
            _loc6_ = new class_169(_loc3_,_loc4_,_loc5_);
            if(_loc2_.@refiner.length() > 0)
            {
               _loc6_.method_4543(_loc2_.@refiner);
            }
            var_4944[int(_loc3_)] = _loc6_;
         }
      }
      
      private static function method_2350(param1:XML) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var_2281 = [];
         var _loc2_:int = 0;
         for each(_loc3_ in param1.patterns.achievements.achievement)
         {
            _loc4_ = int(_loc3_.@id);
            _loc2_++;
            _loc5_ = _loc3_.@languageKey;
            _loc6_ = new class_1089(_loc4_,_loc5_);
            var_2281[int(_loc4_)] = _loc6_;
         }
         class_1089.var_3787 = _loc2_;
      }
      
      private static function method_981(param1:XML) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var_2667 = [];
         var _loc2_:XMLList = param1.child("patterns").child("ships").child("ship");
         for each(_loc3_ in _loc2_)
         {
            _loc4_ = String(_loc3_.@type);
            _loc5_ = _loc3_.@resKey;
            _loc6_ = new class_316(_loc4_,String(_loc3_.@defaultCharacter));
            method_512(_loc3_,_loc6_);
            method_4690(_loc3_,_loc6_);
            var_2667[_loc4_] = _loc6_;
         }
      }
      
      private static function method_512(param1:XML, param2:class_316) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = 0;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         if(param1.attribute("type").length() > 0)
         {
            param2.name_126 = param1.attribute("type");
         }
         if(param1.attribute("class").length() > 0)
         {
            param2.name_163 = param1.attribute("class");
            param2.comment = param1.attribute("comment");
         }
         if(param1.child("resKey").length() > 0)
         {
            _loc3_ = new Vector.<FullResourcePattern>();
            _loc4_ = param1.child("resKey");
            for each(_loc5_ in _loc4_)
            {
               _loc6_ = int(_loc5_.attribute("factionId"));
               _loc3_.push(new FullResourcePattern(_loc6_,_loc5_.attribute("srcKey"),_loc5_.attribute("resKey")));
            }
            param2.method_3073 = _loc3_;
         }
         param2.name_115 = param2.name_126;
         if(param1.attribute("loopPlay").length() > 0)
         {
            param2.method_5218(ParserUtility.parseBooleanFromString(param1.@loopPlay));
         }
         if(param1.attribute("laserClassID").length() > 0)
         {
            param2.laserClassID = int(param1.@laserClassID);
         }
         if(param1.attribute("rocketClassID").length() > 0)
         {
            param2.rocketClassID = int(param1.@rocketClassID);
         }
         if(param1.attribute("expansionClassID").length() > 0)
         {
            param2.expansionClassID = int(param1.@expansionClassID);
         }
         if(param1.attribute("labelVisible").length() > 0)
         {
            param2.method_5609(ParserUtility.parseBooleanFromString(param1.@labelVisible));
         }
         if(param1.attribute("labelYOffset").length() > 0)
         {
            param2.method_1418(int(param1.@labelYOffset));
         }
         if(param1.attribute("energyVisible").length() > 0)
         {
            param2.method_1867(ParserUtility.parseBooleanFromString(param1.@energyVisible));
         }
         if(param1.attribute("energyYOffset").length() > 0)
         {
            param2.method_2486(int(param1.@energyYOffset));
         }
         if(param1.attribute("selectionYOffset").length() > 0)
         {
            param2.method_4052(int(param1.@selectionYOffset));
         }
         if(param1.attribute("explodeTypeID").length() > 0)
         {
            param2.method_2593(int(param1.@explodeTypeID));
         }
         if(param1.attribute("laserDamageTypeID").length() > 0)
         {
            param2.method_2465(int(param1.@laserDamageTypeID));
         }
         if(param1.attribute("rocketDamageTypeID").length() > 0)
         {
            param2.method_502(int(param1.@rocketDamageTypeID));
         }
         if(param1.attribute("engineTypeID").length() > 0)
         {
            param2.method_5812(int(param1.@engineTypeID));
         }
         if(param1.attribute("spaceball").length() > 0)
         {
            param2.method_6454(ParserUtility.parseBooleanFromString(param1.@spaceball));
         }
         if(param1.attribute("engineSmokeID").length() > 0)
         {
            param2.method_4972(int(param1.@engineSmokeID));
         }
         if(param1.attribute("enginePositionClassID").length() > 0)
         {
            param2.method_316(int(param1.@enginePositionClassID));
         }
         if(param1.attribute("moveRadius").length() > 0)
         {
            _loc7_ = int(param1.@moveRadius);
            param2.var_3852 = _loc7_ * _loc7_;
         }
         if(param1.attribute("clickRadius").length() > 0)
         {
            param2.clickRadius = int(param1.@clickRadius);
         }
         if(param1.attribute("clickPriority").length() > 0)
         {
            param2.clickPriority = int(param1.@clickPriority);
         }
         if(param1.attribute("clickOffsetX").length() > 0)
         {
            param2.method_3348(int(param1.@clickOffsetX));
         }
         if(param1.attribute("clickOffsetY").length() > 0)
         {
            param2.method_5796(int(param1.@clickOffsetY));
         }
         if(param1.attribute("seekInterval").length() > 0)
         {
            param2.method_3373(int(param1.@seekInterval));
         }
         if(param1.attribute("megaExplosion").length() > 0)
         {
            param2.megaExplosion = ParserUtility.parseBooleanFromString(param1.@megaExplosion);
         }
         if(param1.attribute("showCrap").length() > 0)
         {
            param2.showCrap = ParserUtility.parseBooleanFromString(param1.@showCrap);
         }
         if(param1.attribute("showPilot").length() > 0)
         {
            param2.showPilot = int(param1.@showPilot);
         }
         if(param1.attribute("pilotDistance").length() > 0)
         {
            param2.pilotDistance = int(param1.@pilotDistance);
         }
         if(param1.attribute("rotatable").length() > 0)
         {
            param2.rotatable = ParserUtility.parseBooleanFromString(param1.@rotatable);
         }
         if(param1.attribute("effect").length() > 0)
         {
            param2.effects = String(param1.@effect).split(",");
         }
         if(param1.attribute("soundIDs").length() > 0)
         {
            _loc8_ = String(param1.@soundIDs).split(",");
            param2.soundIDs = _loc8_;
         }
         if(param1.attribute("podType").length() > 0)
         {
            param2.podType = int(param1.@podType);
         }
         if(param1.attribute("hasFactionLayers").length() > 0)
         {
            param2.var_700 = ParserUtility.parseBooleanFromString(param1.@hasFactionLayers);
         }
         if(param1.attribute("playEngineSoundIfNoEnginePresent").length() > 0)
         {
            param2.playEngineSoundIfNoEnginePresent = ParserUtility.parseBooleanFromString(param1.@playEngineSoundIfNoEnginePresent);
         }
         if(param1.attribute("isLegendaryEventNPC").length() > 0)
         {
            param2.isLegendaryEventNPC = ParserUtility.parseBooleanFromString(param1.@isLegendaryEventNPC);
         }
         if(param1.attribute("minimapIcon").length() > 0)
         {
            param2.minimapIcon = param1.@minimapIcon;
         }
         if(param1.attribute("minimapColor").length() > 0)
         {
            _loc9_ = uint(param1.@minimapColor);
            param2.minimapColor = _loc9_;
         }
         if(param1.child("resources") != null)
         {
            _loc10_ = param1.child("resources").child("resource");
            _loc11_ = new Vector.<String>();
            for each(_loc12_ in _loc10_)
            {
               if(_loc15_ = String(_loc12_.attribute("resKey")))
               {
                  _loc11_.push(_loc15_);
               }
            }
            if((_loc13_ = param1.child("resources").child("podOverlay")).length() > 0 && param2.podType != class_126.const_576)
            {
               _loc16_ = new Vector.<FullResourcePattern>();
               for each(_loc17_ in _loc13_)
               {
                  _loc16_.push(new FullResourcePattern(int(_loc17_.attribute("factionId")),_loc17_.attribute("srcKey"),_loc17_.attribute("resKey")));
               }
               param2.method_2328 = _loc16_;
            }
            if((_loc14_ = param1.child("resources").child("factionOverlay")).length() > 0 && Boolean(param2.var_700))
            {
               _loc18_ = new Vector.<FullResourcePattern>();
               for each(_loc19_ in _loc14_)
               {
                  _loc18_.push(new FullResourcePattern(int(_loc19_.attribute("factionId")),_loc19_.attribute("srcKey"),_loc19_.attribute("resKey")));
               }
               param2.method_4146 = _loc18_;
            }
            if(_loc11_.length > 0)
            {
               param2.var_2258 = _loc11_;
            }
         }
      }
      
      private static function method_4690(param1:XML, param2:class_316) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:XMLList = param1.child("designs").children();
         for each(_loc5_ in _loc3_)
         {
            _loc4_ = param2.clone();
            method_512(_loc5_,_loc4_);
            var_2667[_loc4_.getPatternID()] = _loc4_;
         }
      }
      
      private static function method_1296(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         for each(_loc2_ in param1.patterns.portalAssets.portalAsset)
         {
            _loc3_ = int(_loc2_.@id);
            _loc4_ = _loc2_.@resKey;
            _loc5_ = new class_168(_loc3_,_loc4_);
            var_4473[_loc3_] = _loc5_;
         }
      }
      
      private static function method_410(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         var_584 = [];
         for each(_loc3_ in param1.patterns.fireworks.type)
         {
            _loc4_ = _loc3_.attribute("id");
            _loc5_ = new Vector.<class_1068>();
            for each(_loc6_ in _loc3_.child("firework"))
            {
               _loc7_ = String(_loc6_.attribute("id"));
               _loc8_ = new Dictionary();
               for each(_loc9_ in _loc6_.children())
               {
                  _loc10_ = int(String(_loc9_.localName()).split("color").join(""));
                  _loc11_ = String(_loc9_.toString());
                  _loc8_[_loc10_] = _loc11_;
               }
               _loc5_.push(new class_1068(_loc7_,_loc8_));
            }
            _loc2_ = new class_1070(_loc4_,_loc5_);
            var_584[_loc4_] = _loc2_;
         }
         method_2145(param1);
      }
      
      private static function method_2145(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         for each(_loc2_ in param1.patterns.fireworkDescriptors.fireworkDescriptor)
         {
            _loc3_ = _loc2_.attribute("firework");
            _loc4_ = String(_loc2_.attribute("order")).split(",");
            _loc5_ = new class_1067(_loc3_,_loc4_);
            var_2816[_loc3_] = _loc5_;
         }
      }
      
      private static function method_3829(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = 0;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var_3786 = [];
         for each(_loc2_ in param1.patterns.minePulseColors.minePulseColor)
         {
            _loc3_ = int(_loc2_.@id);
            _loc4_ = _loc2_.@resKey;
            _loc5_ = uint("0x" + _loc2_.@color);
            _loc6_ = Number(_loc2_.@alpha);
            _loc7_ = Number(_loc2_.@scale);
            var_3786[_loc3_] = new class_1091(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,String(_loc2_.@resKey3D));
         }
      }
      
      private static function method_5280(param1:XMLList) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         laserDefinitions = [];
         for each(_loc2_ in param1.laser)
         {
            _loc3_ = int(_loc2_.@salvoID);
            _loc4_ = _loc2_.@resKey;
            _loc5_ = int(_loc2_.@fireRate);
            (_loc6_ = new class_1088(_loc3_,_loc4_,_loc5_)).xml = _loc2_;
            if(_loc2_.@soundID.length() > 0)
            {
               _loc6_.method_3465(int(_loc2_.@soundID));
            }
            if(_loc2_.@laserLength.length() > 0)
            {
               _loc6_.laserLength = int(_loc2_.@laserLength);
            }
            if(_loc2_.@absorber.length() > 0)
            {
               _loc6_.method_3084(ParserUtility.parseBooleanFromString(_loc2_.@absorber));
            }
            if(_loc2_.@speed.length() > 0)
            {
               _loc6_.setSpeed(_loc2_.@speed);
            }
            if(_loc2_.@playLoop.length() > 0)
            {
               _loc6_.method_5218(ParserUtility.parseBooleanFromString(_loc2_.@playLoop));
            }
            if(_loc2_.@playLoopRotated.length() > 0)
            {
               _loc6_.method_3919(ParserUtility.parseBooleanFromString(_loc2_.@playLoopRotated));
            }
            if(_loc2_.@attackLength.length() > 0)
            {
               _loc6_.method_3469(int(_loc2_.@attackLength));
            }
            if(_loc2_.@skillResKey.length() > 0)
            {
               _loc6_.skillResKey = _loc2_.@skillResKey;
            }
            if(_loc2_.@ignoreLaserPoints.length() > 0)
            {
               _loc6_.ignoreLaserPoints = _loc2_.@ignoreLaserPoints;
            }
            if(_loc2_.@muzzleFlashResKey.length() > 0)
            {
               _loc6_.muzzleFlashResKey = _loc2_.@muzzleFlashResKey;
            }
            if(_loc2_.@lightColor.length() > 0)
            {
               _loc6_.lightColor = parseInt("0x" + _loc2_.@lightColor);
            }
            if(_loc2_.@laserType.length() > 0)
            {
               _loc6_.laserType = _loc2_.@laserType;
            }
            laserDefinitions[_loc3_] = _loc6_;
         }
      }
      
      private static function method_3298(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var_3703 = [];
         for each(_loc2_ in param1.patterns.lasers.laser)
         {
            _loc3_ = int(_loc2_["class"]);
            _loc4_ = int(_loc2_.@type);
            if(true)
            {
               var_3703[_loc3_] = [];
            }
            _loc5_ = new class_1080(_loc3_,_loc4_);
            for each(_loc6_ in _loc2_.salvo)
            {
               _loc5_.method_2961(laserDefinitions[_loc6_.@salvoID]);
            }
            var_3703[_loc3_][_loc4_] = _loc5_;
         }
      }
      
      private static function method_5680(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var_3392 = [];
         for each(_loc2_ in param1.patterns.pyroEffects.pyroEffect)
         {
            _loc3_ = int(_loc2_["class"]);
            if(true)
            {
               var_3392[_loc3_] = [];
            }
            _loc4_ = int(_loc2_.@id);
            _loc5_ = _loc2_.@resKey;
            _loc6_ = new class_222(_loc3_,_loc4_,_loc5_,_loc2_.@has3D != "false");
            if(_loc2_.@soundID.length() > 0)
            {
               _loc6_.method_3465(int(_loc2_.@soundID));
            }
            if(_loc2_.@useBitmapClip.length() > 0)
            {
               _loc6_.useBitmapClip = ParserUtility.parseBooleanFromString(_loc2_.@useBitmapClip);
            }
            if(_loc2_.@precache.length() > 0)
            {
               _loc6_.precache = ParserUtility.parseBooleanFromString(_loc2_.@precache);
            }
            if(_loc2_.@shockwaveId.length() > 0)
            {
               _loc6_.shockwaveId = int(_loc2_.@shockwaveId);
            }
            if(_loc2_.@rotatable.length() > 0)
            {
               _loc6_.rotatable = ParserUtility.parseBooleanFromString(_loc2_.@rotatable);
            }
            else
            {
               _loc6_.rotatable = true;
            }
            if(_loc2_.@soundID.length() > 0)
            {
               _loc6_.method_3465(int(_loc2_.@soundID));
            }
            if(_loc2_.@soundID.length() > 0)
            {
               _loc6_.method_3465(int(_loc2_.@soundID));
            }
            var_3392[_loc3_][_loc4_] = _loc6_;
         }
      }
      
      private static function method_5029(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var_4854 = [];
         for each(_loc2_ in param1.patterns.shockwaves.shockwave)
         {
            _loc3_ = int(_loc2_.@id);
            _loc4_ = _loc2_.@resKey;
            _loc5_ = int(_loc2_.@soundID);
            (_loc6_ = new class_1079(_loc3_,_loc4_)).method_3465(_loc5_);
            if(_loc2_.@radius.length() > 0)
            {
               _loc6_.radius = _loc2_.@radius;
            }
            if(_loc2_.@duration.length() > 0)
            {
               _loc6_.duration = _loc2_.@duration;
            }
            if(_loc2_.@beginScale.length() > 0)
            {
               _loc6_.beginScale = _loc2_.@beginScale;
            }
            if(_loc2_.@endScale.length() > 0)
            {
               _loc6_.endScale = _loc2_.@endScale;
            }
            if(_loc2_.@maxShockwaves.length() > 0)
            {
               _loc6_.maxShockwaves = _loc2_.@maxShockwaves;
            }
            if(_loc2_.@shakeScreen.length() > 0)
            {
               _loc6_.shakeScreen = ParserUtility.parseBooleanFromString(_loc2_.@shakeScreen);
            }
            var_4854[_loc3_] = _loc6_;
         }
      }
      
      private static function method_4066(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var_4696 = [];
         var_4506 = [];
         for each(_loc2_ in param1.patterns.drones.drone)
         {
            _loc3_ = int(_loc2_.@id);
            _loc4_ = _loc2_.@design;
            _loc5_ = int(class_1086.const_1617[_loc4_]);
            if(true)
            {
               var_4696[_loc3_] = [];
            }
            if(!var_4696[_loc3_][_loc5_])
            {
               var_4696[_loc3_][_loc5_] = [];
            }
            _loc6_ = int(_loc2_.@level);
            _loc7_ = _loc2_.@resKey;
            _loc8_ = "drone_" + _loc3_ + "_" + _loc4_ + "_" + _loc6_;
            _loc9_ = new class_1077(_loc3_,_loc7_,_loc6_,_loc8_);
            var_4696[_loc3_][_loc5_][_loc6_] = _loc9_;
            var_4506.push(_loc9_);
         }
      }
      
      private static function method_3798(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:Number = NaN;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:int = 0;
         class_397.var_63 = new Dictionary();
         for each(_loc2_ in param1.patterns.droneFormations.formation)
         {
            _loc3_ = _loc2_.display2D.length() > 0 ? _loc2_.display2D[0] : _loc2_;
            _loc4_ = int(_loc2_.@id);
            _loc5_ = _loc2_.@name;
            _loc6_ = Number(_loc3_.scale);
            _loc7_ = _loc3_.positionsList.@data;
            _loc8_ = new Array();
            for each(_loc9_ in _loc7_.split(";"))
            {
               _loc12_ = _loc9_.split(",");
               _loc8_.push(new class_73(int(_loc12_[0]),int(_loc12_[1]),_loc12_.length > 2 ? int(_loc12_[2]) : 0));
            }
            _loc10_ = new Array();
            for each(_loc11_ in _loc3_.usedPositions)
            {
               _loc13_ = int(_loc11_.@droneCount);
               _loc14_ = new Array();
               if((_loc15_ = _loc11_.@positionIDlist) != "")
               {
                  for each(_loc16_ in _loc15_.split(","))
                  {
                     _loc14_.push(_loc16_);
                  }
               }
               _loc10_[_loc13_] = _loc14_;
            }
            class_397.var_63[_loc4_] = new class_397(_loc8_,_loc10_,_loc6_,_loc4_,_loc5_);
         }
      }
      
      private static function method_524(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:Number = NaN;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:int = 0;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:* = null;
         var _loc20_:int = 0;
         var _loc21_:* = null;
         for each(_loc2_ in param1.patterns.droneFormations.formation)
         {
            if(_loc2_.display3D.length() > 0)
            {
               _loc3_ = _loc2_.display3D[0];
               _loc4_ = int(_loc2_.@id);
               _loc5_ = _loc2_.@name;
               _loc6_ = Number(_loc3_.scale);
               _loc7_ = _loc3_.positionsList.@data;
               _loc8_ = new Array();
               for each(_loc9_ in _loc7_.split(";"))
               {
                  _loc15_ = _loc9_.split(",");
                  _loc8_.push(new class_73(int(_loc15_[0]),int(_loc15_[1]),_loc15_.length > 2 ? int(_loc15_[2]) : 0));
               }
               _loc10_ = new Array();
               for each(_loc12_ in _loc3_.usedPositions)
               {
                  _loc16_ = int(_loc12_.@droneCount);
                  _loc17_ = new Array();
                  if((_loc11_ = _loc12_.@positionIDlist) != "")
                  {
                     for each(_loc18_ in _loc11_.split(","))
                     {
                        _loc17_.push(_loc18_);
                     }
                  }
                  _loc10_[_loc16_] = _loc17_;
               }
               _loc13_ = new Array();
               for each(_loc14_ in _loc3_.rotationGroup)
               {
                  _loc19_ = new Array();
                  _loc11_ = _loc14_.@droneIds;
                  for each(_loc20_ in _loc11_.split(","))
                  {
                     _loc19_.push(Number(_loc20_));
                  }
                  _loc21_ = new class_1076(_loc19_,_loc14_);
                  _loc13_.push(_loc21_);
               }
               class_397.var_912[_loc4_] = new class_397(_loc8_,_loc10_,_loc6_,_loc4_,_loc5_);
               class_397.var_912[_loc4_].rotationGroups = _loc13_;
            }
         }
      }
      
      private static function method_3638(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var_4079 = [];
         for each(_loc2_ in param1.patterns.expansions.expansion)
         {
            _loc3_ = int(_loc2_["class"]);
            if(true)
            {
               var_4079[_loc3_] = [];
            }
            _loc5_ = {};
            for each(_loc6_ in _loc2_.positionsList)
            {
               _loc5_[String(_loc6_.@name)] = ParserUtility.parseCommaCoordinatesList(String(_loc6_.@data));
            }
            for each(_loc7_ in _loc2_.stage)
            {
               _loc8_ = int(_loc7_.@id);
               _loc9_ = new Vector.<Vector.<String>>();
               for each(_loc10_ in _loc7_.salvo)
               {
                  _loc9_.push(Vector.<String>(String(_loc10_.@laser).split(",")));
               }
               _loc4_ = new class_1085(_loc8_,String(_loc7_.@resKey),_loc9_,_loc5_);
               if(Settings.qualityShip.value == Settings.QUALITY_HIGH && false && _loc4_.resKey.length > 0)
               {
                  _loc4_.method_2511(true);
               }
               var_4079[_loc3_][_loc8_] = _loc4_;
            }
            var_4079[_loc3_][0] = var_4079[_loc3_][1];
         }
      }
      
      private static function method_5386(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var_4284 = [];
         for each(_loc2_ in param1.patterns.rockets.rocket)
         {
            _loc3_ = int(_loc2_["class"]);
            if(true)
            {
               var_4284[_loc3_] = [];
            }
            _loc4_ = int(_loc2_.@id);
            _loc5_ = _loc2_.@resKey;
            _loc6_ = new class_426(_loc3_,_loc4_,_loc5_);
            if(_loc2_.@soundID.length() > 0)
            {
               _loc6_.method_3465(int(_loc2_.@soundID));
            }
            var_4284[_loc3_][_loc4_] = _loc6_;
         }
      }
      
      private static function method_666(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var_4738 = [];
         for each(_loc2_ in param1.patterns.planets.planet)
         {
            _loc3_ = int(_loc2_.@id);
            _loc4_ = _loc2_.@resKey;
            _loc5_ = int(_loc2_.@radius);
            var_4738[_loc3_] = new class_1065(_loc3_,_loc4_,_loc5_);
         }
      }
      
      public static function method_4608(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_4756 = [];
         for each(_loc2_ in param1.patterns.music.track)
         {
            _loc3_ = int(_loc2_.@id);
            _loc4_ = _loc2_.@resKey;
            (_loc5_ = new class_1007(_loc3_,null)).resKey = _loc4_;
            if(_loc2_.@volume.length() > 0)
            {
               _loc5_.method_1533(_loc2_.@volume);
            }
            var_4756[_loc3_] = _loc5_;
         }
      }
      
      public static function method_3070(param1:String) : Vector.<class_316>
      {
         var _loc3_:* = null;
         var _loc2_:Vector.<class_316> = new Vector.<class_316>();
         for each(_loc3_ in var_2667)
         {
            if(_loc3_.name_7 == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      private static function method_5915(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:Boolean = false;
         var _loc7_:* = null;
         var _loc8_:Boolean = false;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = false;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:Boolean = false;
         var _loc22_:Boolean = false;
         var _loc23_:Boolean = false;
         var _loc24_:Boolean = false;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:Number = NaN;
         var _loc28_:* = null;
         var _loc29_:* = null;
         var _loc30_:* = null;
         var _loc31_:* = null;
         var _loc32_:* = null;
         var _loc33_:* = null;
         var _loc34_:* = null;
         var _loc35_:* = null;
         var _loc36_:* = null;
         var _loc37_:* = null;
         var _loc38_:* = null;
         var _loc39_:* = null;
         var _loc40_:* = null;
         var _loc41_:* = null;
         var _loc42_:* = null;
         var _loc43_:* = 0;
         var_103 = [];
         for each(_loc28_ in param1.patterns.backgrounds.background)
         {
            _loc2_ = _loc28_.@content;
            _loc3_ = int(_loc28_.@type);
            if(_loc2_ == "resource")
            {
               _loc4_ = _loc28_.@resKey;
               _loc5_ = _loc28_.@resKeyStarling || false;
               _loc6_ = ParserUtility.parseBooleanFromString(_loc28_.@isTiled);
               _loc7_ = _loc28_.@atlasXml || false;
               _loc8_ = ParserUtility.parseBooleanFromString(_loc28_.@isReloadable);
               _loc9_ = int(_loc28_.@tileWidth);
               _loc10_ = int(_loc28_.@tileHeight);
               _loc13_ = _loc28_.@order;
               _loc11_ = int(_loc28_.@width);
               _loc12_ = int(_loc28_.@height);
               _loc14_ = _loc28_.@showInStarlingMode != "false";
               if((_loc29_ = _loc28_.attribute("geometry").toString()) == null)
               {
                  _loc30_ = [];
               }
               else
               {
                  _loc30_ = _loc29_.length > 0 ? _loc29_.split(",") : [];
               }
               _loc15_ = Vector.<String>(_loc30_);
               if((_loc31_ = _loc28_.attribute("deepTiles").toString()) == null)
               {
                  _loc32_ = [];
               }
               else
               {
                  _loc32_ = _loc31_.split(",");
               }
               _loc16_ = Vector.<String>(_loc32_);
               if((_loc33_ = _loc28_.attribute("textureDiff").toString()) == null || _loc33_ == "")
               {
                  _loc34_ = [];
               }
               else
               {
                  _loc34_ = _loc33_.split(",");
               }
               _loc17_ = Vector.<String>(_loc34_);
               if((_loc35_ = _loc28_.attribute("textureNormal").toString()) == null || _loc35_ == "")
               {
                  _loc36_ = [];
               }
               else
               {
                  _loc36_ = _loc35_.split(",");
               }
               _loc18_ = Vector.<String>(_loc36_);
               if((_loc37_ = _loc28_.attribute("textureSpecular").toString()) == null || _loc37_ == "")
               {
                  _loc38_ = [];
               }
               else
               {
                  _loc38_ = _loc37_.split(",");
               }
               _loc19_ = Vector.<String>(_loc38_);
               if((_loc39_ = _loc28_.attribute("textureAlphaMask").toString()) == null || _loc39_ == "")
               {
                  _loc40_ = [];
               }
               else
               {
                  _loc40_ = _loc39_.split(",");
               }
               _loc20_ = Vector.<String>(_loc40_);
               _loc21_ = ParserUtility.parseBooleanFromString(_loc28_.@randomGeometryRotation);
               _loc22_ = ParserUtility.parseBooleanFromString(_loc28_.@alphaBlending);
               _loc23_ = _loc28_.@alphaPremultiplied == undefined || ParserUtility.parseBooleanFromString(_loc28_.@alphaPremultiplied);
               _loc24_ = _loc28_.@useLights == undefined || ParserUtility.parseBooleanFromString(_loc28_.@useLights);
               _loc25_ = int(_loc28_.@ySpread);
               _loc26_ = int(_loc28_.@additionalTilesInGrid);
               _loc27_ = Number(Number(_loc28_.@enlargeInnerTilesFactor) || true);
               _loc41_ = new class_1078(_loc15_,_loc16_,_loc17_,_loc18_,_loc19_,_loc20_,_loc21_,_loc22_,_loc23_,_loc24_,_loc25_,_loc26_,_loc27_);
               (_loc42_ = new class_1084(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc13_,_loc11_,_loc12_,_loc14_,_loc41_)).offsetX = int(_loc28_.@offsetX);
               _loc42_.offsetY = int(_loc28_.@offsetY);
               var_103[_loc3_] = _loc42_;
            }
            else if(_loc2_ == "custom")
            {
               _loc11_ = int(_loc28_.@width);
               _loc12_ = int(_loc28_.@height);
               _loc43_ = uint("0x" + _loc28_.@color);
               var_103[_loc3_] = new class_1073(_loc3_,_loc11_,_loc12_,_loc43_);
            }
         }
      }
      
      private static function method_573(param1:XML) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var_264 = [];
         for each(_loc4_ in param1.patterns.backgroundMasks.backgroundMask)
         {
            _loc2_ = int(_loc4_.@type);
            _loc3_ = _loc4_.@resKey;
            var_264[_loc2_] = new class_168(_loc2_,_loc3_);
         }
      }
      
      private static function method_339(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var_5023 = [];
         for each(_loc2_ in param1.colors.color)
         {
            _loc3_ = _loc2_.@key;
            _loc4_ = _loc2_.@color;
            var_5023[_loc3_] = _loc4_;
         }
      }
      
      private static function method_1651(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var_4406 = [];
         for each(_loc2_ in param1.colors.videoWindow.color)
         {
            _loc3_ = _loc2_.@key;
            _loc4_ = _loc2_.@color;
            var_4406[_loc3_] = _loc4_;
         }
      }
      
      private static function method_1990(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_441 = [];
         for each(_loc2_ in param1.patterns.engines.engine)
         {
            _loc3_ = int(_loc2_.@type);
            _loc4_ = _loc2_.@resKey;
            _loc5_ = new class_221(_loc3_,_loc4_);
            if(_loc2_.@soundID.length() > 0)
            {
               _loc5_.method_3465(int(_loc2_.@soundID));
            }
            var_441[_loc3_] = _loc5_;
         }
      }
      
      private static function method_2752(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_2598 = [];
         for each(_loc2_ in param1.patterns.engineSmokes.engineSmoke)
         {
            _loc3_ = int(_loc2_.@id);
            _loc4_ = _loc2_.@resKey;
            _loc5_ = new class_1063(_loc3_,_loc4_);
            if(_loc2_.@rotation.length() > 0)
            {
               _loc5_.method_1310(ParserUtility.parseBooleanFromString(_loc2_.@rotation));
            }
            if(_loc2_.@poolSize.length() > 0)
            {
               _loc5_.poolSize = int(_loc2_.@poolSize);
            }
            var_2598[_loc3_] = _loc5_;
         }
      }
      
      private static function method_4798(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:Number = NaN;
         var _loc7_:* = null;
         var_4122 = [];
         for each(_loc2_ in param1.patterns.rocketSmokes.rocketSmoke)
         {
            _loc3_ = int(_loc2_.@id);
            _loc4_ = _loc2_.@resKey;
            _loc5_ = int(_loc2_.@particleInterval);
            _loc6_ = Number(_loc2_.@particleDuration);
            _loc7_ = new class_1090(_loc3_,_loc4_,_loc5_,_loc6_,_loc2_.@fx3D);
            if(_loc2_.@poolSize.length() > 0)
            {
               _loc7_.poolSize = int(_loc2_.@poolSize);
            }
            var_4122[_loc3_] = _loc7_;
         }
      }
      
      private static function method_661(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var_4746 = {};
         for each(_loc2_ in param1.patterns.repairRobots.robot)
         {
            var_4746[String(_loc2_.@loot_id)] = new class_1081(0,String(_loc2_.@resKeyPrefix),String(_loc2_.@robotClip),int(_loc2_.@robotsNum),int(_loc2_.@offsetX),int(_loc2_.@offsetY),String(_loc2_.@asset3D));
         }
         var_4298 = {};
         for each(_loc3_ in param1.patterns.repairRobots.sparks)
         {
            var_4298[String(_loc3_.@repairSkillLevel)] = new class_1081(0,String(_loc3_.@resKeyPrefix),String(_loc3_.@robotClip),int(_loc3_.@robotsNum),int(_loc3_.@offsetX),int(_loc3_.@offsetY),String(_loc3_.@asset3D));
         }
      }
      
      public static function method_5383(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var_3286 = [];
         for each(_loc2_ in param1.patterns.sounds.sound)
         {
            _loc3_ = int(_loc2_.@id);
            _loc4_ = _loc2_.@soundbank;
            _loc5_ = new class_1007(_loc3_,_loc4_);
            if(_loc2_.@volume.length() > 0)
            {
               _loc5_.method_1533(_loc2_.@volume);
            }
            if(_loc2_.@loop.length() > 0)
            {
               _loc5_.method_1104(ParserUtility.parseBooleanFromString(_loc2_.@loop));
            }
            if(_loc2_.@isVoice.length() > 0)
            {
               _loc5_.method_1753(ParserUtility.parseBooleanFromString(_loc2_.@isVoice));
            }
            if(_loc2_.@interval.length() > 0)
            {
               _loc5_.interval = Number(_loc2_.@interval);
            }
            if(_loc2_.@intervalFluctuation.length() > 0)
            {
               _loc5_.intervalFluctuation = int(_loc2_.@intervalFluctuation);
            }
            for each(_loc6_ in _loc2_.child("reskeys").child("reskey"))
            {
               _loc5_.resKey = _loc6_.attribute("resKey").toString();
            }
            var_3286[_loc3_] = _loc5_;
         }
      }
      
      private static function method_3143(param1:XML) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var_3937 = [];
         for each(_loc2_ in param1.patterns.enginePositions.enginePosition)
         {
            _loc3_ = int(_loc2_["class"]);
            if(true)
            {
               var_3937[_loc3_] = [];
            }
            _loc4_ = new Dictionary();
            for each(_loc5_ in _loc2_.positionsList)
            {
               _loc4_[String(_loc5_.@name)] = ParserUtility.parseCommaCoordinatesList(String(_loc5_.@data));
            }
            _loc6_ = null;
            if(_loc2_.lowPositionsList.length() > 0)
            {
               _loc6_ = new Dictionary();
            }
            for each(_loc7_ in _loc2_.lowPositionsList)
            {
               _loc6_[String(_loc7_.@name)] = ParserUtility.parseCommaCoordinatesList(String(_loc7_.@data));
            }
            _loc9_ = [];
            for each(_loc10_ in _loc4_)
            {
               _loc9_.push(_loc10_);
            }
            _loc11_ = null;
            if(_loc6_ != null)
            {
               _loc11_ = [];
               for each(_loc12_ in _loc6_)
               {
                  _loc11_.push(_loc12_);
               }
            }
            _loc8_ = new class_1087(_loc3_,_loc9_,_loc11_);
            var_3937[_loc3_] = _loc8_;
         }
      }
      
      public static function method_1337(param1:int, param2:int) : class_1080
      {
         var _loc3_:Array = false || false;
         return _loc3_[param2] || _loc3_[0] || var_3703[0][param2];
      }
      
      public static function method_2454(param1:int, param2:int) : class_1085
      {
         var _loc3_:Array = var_4079[int(param1)];
         var _loc4_:class_1085;
         if((_loc4_ = !!_loc3_ ? _loc3_[int(param2)] : null) == null && Boolean(_loc3_))
         {
            _loc4_ = _loc3_[0];
         }
         return _loc4_;
      }
      
      public static function method_620(param1:int) : class_1087
      {
         return var_3937[int(param1)];
      }
      
      public static function method_1020(param1:int, param2:int) : class_222
      {
         var _loc3_:Array = var_3392[int(param1)];
         return _loc3_[int(param2)];
      }
      
      public static function method_4446(param1:int, param2:int) : class_426
      {
         var _loc3_:Array = var_4284[int(param1)];
         return _loc3_[int(param2)];
      }
      
      public static function method_3169(param1:int, param2:int, param3:int) : class_1077
      {
         return var_4696[int(param1)][int(param2)][int(param3)];
      }
      
      public static function method_3347(param1:String) : Vector.<String>
      {
         return var_2392[param1] as Vector.<String>;
      }
      
      public static function method_3705(param1:int) : class_1067
      {
         return !true ? var_2816[param1] : var_2816[1];
      }
      
      public static function method_2393(param1:String) : FullResourcePattern
      {
         return var_426[param1];
      }
      
      public static function method_5078(param1:String) : class_1081
      {
         return var_4746[param1] as class_1081;
      }
      
      public static function method_1466(param1:int) : class_1081
      {
         return var_4298[String(param1)] as class_1081;
      }
   }
}
