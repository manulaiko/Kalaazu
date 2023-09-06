package net.bigpoint.darkorbit.mvc.common.model.assets
{
   import com.bigpoint.utils.class_73;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.system.System;
   import flash.utils.ByteArray;
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.map.model.traits.class_1180;
   import net.bigpoint.darkorbit.map.model.traits.class_1181;
   import net.bigpoint.darkorbit.map.model.traits.class_1182;
   import net.bigpoint.darkorbit.map.model.traits.class_287;
   import net.bigpoint.darkorbit.map.model.traits.class_299;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import net.bigpoint.darkorbit.map.model.traits.class_308;
   import net.bigpoint.darkorbit.map.model.traits.class_319;
   import package_100.class_1174;
   import package_100.class_313;
   import package_114.class_312;
   import package_114.class_318;
   import package_22.FullResourcePattern;
   import package_29.class_267;
   import package_29.class_85;
   import package_76.XMLUtils;
   
   public class UberAssetsLib
   {
      
      public static const LIB_DEFAULT:String = "lib_assets";
      
      public static const LIB_SHIPS:String = "lib_ships";
      
      public static const LIB_DRONES:String = "lib_drones";
      
      public static const LIB_PORTALS:String = "lib_portals";
      
      public static const LIB_COLLECTABLES:String = "lib_collectables";
      
      public static const LIB_BATTLE_STATION:String = "lib_battlestation";
      
      public static const LIB_MAPS:String = "lib_maps";
      
      public static const ALL_LIBRARIES:Vector.<String> = Vector.<String>([LIB_DEFAULT,LIB_SHIPS,LIB_DRONES,LIB_PORTALS,LIB_COLLECTABLES,LIB_BATTLE_STATION,LIB_MAPS]);
      
      private static const LIB_DEFAULT_XML:Class = UberAssetsLib_LIB_DEFAULT_XML;
      
      private static const LIB_SHIPS_XML:Class = UberAssetsLib_LIB_SHIPS_XML;
      
      private static const LIB_DRONES_XML:Class = UberAssetsLib_LIB_DRONES_XML;
      
      private static const LIB_PORTALS_XML:Class = UberAssetsLib_LIB_PORTALS_XML;
      
      private static const LIB_COLLECTABLES_XML:Class = UberAssetsLib_LIB_COLLECTABLES_XML;
      
      private static const LIB_BATTLE_STATION_XML:Class = UberAssetsLib_LIB_BATTLE_STATION_XML;
      
      private static const LIB_MAPS_XML:Class = UberAssetsLib_LIB_MAPS_XML;
      
      private static const LIB_TEST_XML:Class = UberAssetsLib_LIB_TEST_XML;
      
      public static const instance:UberAssetsLib = new UberAssetsLib();
       
      
      private var _callback:Function;
      
      private var _filesToLoad:Vector.<String>;
      
      private var _libraries:Object;
      
      private var _assetsIdsByLibrary:Object;
      
      private var _assets:Object;
      
      private var _currentLibId:String;
      
      private var _libLoader:URLLoader;
      
      public function UberAssetsLib()
      {
         this._libraries = {};
         this._assetsIdsByLibrary = {};
         this._assets = {};
         super();
      }
      
      public function init(param1:Function) : void
      {
         this.addEmbededLib(LIB_DEFAULT,LIB_DEFAULT_XML);
         this.addEmbededLib(LIB_SHIPS,LIB_SHIPS_XML);
         this.addEmbededLib(LIB_DRONES,LIB_DRONES_XML);
         this.addEmbededLib(LIB_PORTALS,LIB_PORTALS_XML);
         this.addEmbededLib(LIB_COLLECTABLES,LIB_COLLECTABLES_XML);
         this.addEmbededLib(LIB_BATTLE_STATION,LIB_BATTLE_STATION_XML);
         this.addEmbededLib(LIB_MAPS,LIB_MAPS_XML);
         param1();
      }
      
      private function addEmbededLib(param1:String, param2:Class) : void
      {
         var _loc3_:ByteArray = new param2() as ByteArray;
         this.addDefinitions(param1,new XML(_loc3_.readUTFBytes(_loc3_.length)));
      }
      
      public function getLibraryAssetsIds(param1:String) : Vector.<String>
      {
         return this._assetsIdsByLibrary[param1] as Vector.<String>;
      }
      
      public function loadDescriptors(param1:Function = null, param2:Vector.<String> = null) : void
      {
         this._callback = param1;
         if(param2 != null)
         {
            this._filesToLoad = param2;
         }
         else
         {
            this._filesToLoad = ALL_LIBRARIES.concat();
            this._libraries = {};
            this._assets = {};
         }
         this.loadNextFile();
      }
      
      public function getDescriptor(param1:String, param2:String, param3:Boolean = true) : XML
      {
         if(param3 && this._assets[param2 + ":" + param1] == null)
         {
         }
         return this._assets[param2 + ":" + param1] as XML;
      }
      
      public function fillTraits(param1:class_85, param2:String, param3:String, param4:Function = null, param5:Function = null, param6:String = null, param7:Boolean = true) : void
      {
         var _loc9_:* = null;
         var _loc8_:Vector.<class_267> = this.getTraits(param1,this.getDescriptor(param2,param3),param4,param5,param6,param7);
         for each(_loc9_ in _loc8_)
         {
            param1.addTrait(_loc9_);
         }
      }
      
      public function getTraits(param1:class_85, param2:XML, param3:Function = null, param4:Function = null, param5:String = null, param6:Boolean = true) : Vector.<class_267>
      {
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc7_:Vector.<class_267> = new Vector.<class_267>();
         var _loc8_:XML;
         if((_loc8_ = param2) == null)
         {
            return _loc7_;
         }
         var _loc9_:class_306;
         if(_loc9_ = class_306.method_2989(_loc8_,param6))
         {
            _loc7_.push(_loc9_);
         }
         for each(_loc10_ in _loc8_.background2D)
         {
            _loc7_.push(new class_1181(int(_loc10_.@parallaxFactor),int(_loc10_.@layer),String(_loc10_.@descriptorResKey),Vector.<String>(String(_loc10_.@decorators).split(",")),!param6));
         }
         if(param3 != null && _loc8_.click_icon.length() > 0)
         {
            _loc13_ = _loc8_.click_icon[0];
            (_loc14_ = new class_1180(new FullResourcePattern(0,String(_loc13_.@srcKey),String(_loc13_.@resKey)),int(_loc13_.@radius) || true,int(_loc13_.@priority),param1.method_5851(String(_loc13_.@pivotId) || true))).clicked.add(param3);
            _loc7_.push(_loc14_);
         }
         for each(_loc11_ in _loc8_.click_area)
         {
            _loc15_ = new class_319(int(_loc11_.@radius),int(_loc11_.@priority),int(_loc11_.@screenOffsetX),int(_loc11_.@screenOffsetY),param1.method_5851(String(_loc11_.@pivotId) || true));
            if(param4 != null)
            {
               _loc15_.clicked.add(param4);
            }
            if(String(_loc11_.@srcKey).length > 0)
            {
               _loc15_.toolTip = class_88.getItem(String(_loc11_.@toolTipKey));
            }
            _loc7_.push(_loc15_);
         }
         for each(_loc12_ in _loc8_.miniMapIcon)
         {
            if(String(_loc12_.@srcKey).length > 0)
            {
               _loc7_.push(new class_313(String(_loc12_.@resKey),String(_loc12_.@srcKey),int(String(_loc12_.@layer)),Number(String(_loc12_.@scale))));
            }
            else if(String(_loc12_.@color).length > 0)
            {
               _loc7_.push(new class_1174(uint(String(_loc12_.@color)),int(String(_loc12_.@layer))));
            }
         }
         if(_loc8_.label.length() > 0)
         {
            _loc7_.push(new class_1182(param5,int(_loc8_.label.@x),int(_loc8_.label.@y)));
         }
         if(_loc8_.hp.length() > 0)
         {
            (_loc16_ = new class_308()).var_1888 = int(_loc8_.hp.@bar_width);
            _loc7_.push(_loc16_);
         }
         if(_loc8_.attack_target.length() > 0)
         {
            _loc7_.push(new class_287(int(String(_loc8_.attack_target.@lockType)) || false,_loc8_.attack_target.attribute("explosion").length() > 0 ? int(String(_loc8_.attack_target.explosion)) : -1));
         }
         if(_loc8_.attacker.length() > 0)
         {
            _loc17_ = new class_299(new class_312(),new class_318());
            if(_loc8_.attacker.laserCannon.salvo.length() > 0)
            {
            }
            if(_loc8_.attacker.laserCannon.attribute("animation").length() > 0)
            {
               _loc17_.laser.var_698 = _loc8_.attacker.laserCannon.attribute("animation");
            }
            _loc17_.rocketLauncher.name_53 = new class_73(int(_loc8_.attacker.rocketLauncher.@x),int(_loc8_.attacker.rocketLauncher.@y));
            if(_loc8_.attacker.rocketLauncher.attribute("animation").length() > 0)
            {
               _loc17_.rocketLauncher.var_698 = _loc8_.attacker.rocketLauncher.attribute("animation");
            }
            if(_loc8_.attacker.rocketLauncher.attribute("directionX").length() > 0 || _loc8_.attacker.rocketLauncher.attribute("directionY").length() > 0)
            {
               _loc17_.rocketLauncher.direction = new class_73(int(_loc8_.attacker.rocketLauncher.@directionX),int(_loc8_.attacker.rocketLauncher.@directionY));
            }
            _loc7_.push(_loc17_);
         }
         return _loc7_;
      }
      
      private function loadNextFile() : void
      {
         if(this._filesToLoad.length > 0)
         {
            if(this._libLoader == null)
            {
               this._libLoader = new URLLoader();
               this._libLoader.addEventListener(Event.COMPLETE,this.handleConfigLoadComplete);
               this._libLoader.addEventListener(IOErrorEvent.IO_ERROR,this.handleConfigLoadError);
            }
            this._currentLibId = this._filesToLoad.shift();
            this._libLoader.load(new URLRequest("../../config/data/" + this._currentLibId + ".xml?v=" + new Date().getTime()));
         }
         else if(this._callback != null)
         {
            this._callback();
            this._callback = null;
         }
      }
      
      private function handleConfigLoadComplete(param1:Event) : void
      {
         this.addDefinitions(this._currentLibId,new XML(this._libLoader.data));
         this.loadNextFile();
      }
      
      private function handleConfigLoadError(param1:IOErrorEvent) : void
      {
         this.loadNextFile();
      }
      
      private function addDefinitions(param1:String, param2:XML) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc3_:XML = XMLUtils.method_5922(param2);
         var _loc4_:* = {};
         var _loc5_:Vector.<String> = new Vector.<String>();
         for each(_loc7_ in _loc3_.asset)
         {
            _loc6_ = String(_loc7_.@id).split(",");
            for each(_loc8_ in _loc6_)
            {
               _loc4_[_loc8_] = _loc7_;
               this._assets[param1 + ":" + _loc8_] = _loc7_;
               _loc5_.push(_loc8_);
            }
         }
         this._libraries[param1] = _loc4_;
         this._assetsIdsByLibrary[param1] = _loc5_;
         System.disposeXML(param2);
      }
   }
}
