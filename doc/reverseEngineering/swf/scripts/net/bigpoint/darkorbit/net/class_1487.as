package net.bigpoint.darkorbit.net
{
   import net.bigpoint.as3toolbox.bplocale.class_88;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.map.model.ship.class_1860;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.map.model.traits.class_287;
   import net.bigpoint.darkorbit.mvc.battleStation.BattleStation;
   import net.bigpoint.darkorbit.mvc.battleStation.BattleStationModule;
   import package_113.class_310;
   import package_115.class_316;
   import package_129.class_1872;
   import package_129.class_373;
   import package_22.class_198;
   import package_22.class_222;
   import package_29.class_85;
   import package_35.EffectManager;
   import package_35.class_338;
   import package_35.class_348;
   import package_36.class_184;
   import package_38.class_315;
   import package_45.class_1805;
   import package_75.MouseCursorChangeEffect;
   import package_75.class_1816;
   import package_75.class_1862;
   import package_75.class_1867;
   import package_75.class_1868;
   import package_75.class_1869;
   import package_75.class_1870;
   import package_75.class_1871;
   import package_75.class_1873;
   import package_75.class_1874;
   import package_75.class_1875;
   import package_75.class_1876;
   import package_75.class_1877;
   import package_75.class_1878;
   import package_75.class_1879;
   import package_75.class_1880;
   import package_75.class_1881;
   import package_75.class_1882;
   import package_75.class_1883;
   import package_75.class_1884;
   import package_75.class_1885;
   import package_75.class_1886;
   import package_75.class_1887;
   import package_75.class_1888;
   import package_75.class_1889;
   import package_75.class_1890;
   import package_75.class_1891;
   import package_75.class_1892;
   import package_75.class_1893;
   import package_9.class_50;
   
   public class class_1487 extends class_96
   {
      
      private static var instance:class_1487;
       
      
      public function class_1487(param1:Function)
      {
         super();
         if(param1 !== method_336)
         {
            throw new Error("VisualModifierAssembly is a Singleton and can only be accessed through VisualModifierAssembly.getInstance()");
         }
      }
      
      public static function getInstance() : class_1487
      {
         if(instance == null)
         {
            instance = new class_1487(method_336);
         }
         return instance;
      }
      
      private static function method_336() : void
      {
      }
      
      public function method_3743(param1:class_315) : void
      {
         var _loc4_:int = 0;
         var _loc6_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc2_:class_50 = var_574.name_47;
         if(_loc2_.map == null)
         {
            return;
         }
         var _loc3_:class_86 = _loc2_.map.hero;
         _loc4_ = int(param1.name_128);
         var _loc5_:class_85 = _loc2_.map.method_327(_loc4_);
         if(!(_loc6_ = _loc2_.map.method_327(param1.name_128)) || !_loc3_)
         {
            return;
         }
         var _loc7_:EffectManager = _loc2_.map.effects;
         switch(param1.var_2708)
         {
            case class_315.const_2034:
               if(param1.activated)
               {
                  if(_loc6_.method_1954(class_1860) == null)
                  {
                     _loc6_.addTrait(new class_1860());
                     break;
                  }
                  break;
               }
               _loc6_.method_2049(class_1860);
               break;
            case class_315.INACTIVE:
               if(_loc9_ = class_50.getInstance().map.method_327(_loc4_) as class_1805)
               {
                  _loc9_.deactivate();
                  break;
               }
               break;
            case class_315.const_2166:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1878(_loc6_));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_1085);
               break;
            case class_315.const_1307:
               break;
            case class_315.const_434:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1869(_loc6_));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_3003);
               break;
            case class_315.const_91:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1883(_loc6_));
                  if(_loc5_ is BattleStation)
                  {
                     _loc7_.method_5565(new class_1892(_loc5_,param1.attribute,40));
                     break;
                  }
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_3);
               _loc7_.method_3217(_loc6_.id,class_338.const_701);
               break;
            case class_315.const_3246:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1892(_loc5_,param1.attribute,40));
                  break;
               }
               _loc7_.method_3217(_loc5_.id,class_338.const_701);
               break;
            case class_315.const_2862:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1879(_loc5_));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_1669);
               break;
            case class_315.const_637:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1868(_loc6_));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_557);
               break;
            case class_315.const_1964:
               if(param1.activated)
               {
                  if(_loc6_ is BattleStationModule)
                  {
                     _loc7_.method_5565(new class_1877(_loc6_));
                     break;
                  }
                  if(_loc6_ is BattleStation)
                  {
                     _loc7_.method_5565(new class_1868(_loc6_));
                     break;
                  }
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_3320);
               _loc7_.method_3217(_loc6_.id,class_338.const_557);
               break;
            case class_315.const_622:
               _loc7_.method_3217(_loc6_.id,class_338.const_841);
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1872(_loc6_,30464));
                  break;
               }
               break;
            case class_315.const_2128:
               _loc7_.method_3217(_loc6_.id,class_338.const_841);
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1872(_loc6_,16755200));
                  break;
               }
               break;
            case class_315.const_2519:
               _loc7_.method_3217(_loc6_.id,class_338.const_314);
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1874(_loc6_,class_1874.const_826));
                  break;
               }
               break;
            case class_315.const_1689:
               _loc7_.method_3217(_loc6_.id,class_338.const_314);
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1874(_loc6_,class_1874.const_226));
                  break;
               }
               break;
            case class_315.const_957:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1884(_loc6_,param1.attribute,param1.count));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_957);
               break;
            case class_315.const_2214:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1873(_loc6_));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_2643);
               break;
            case class_315.const_1205:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1891(_loc6_));
                  break;
               }
               _loc7_.method_3217(param1.name_128,class_338.const_215);
               break;
            case class_315.const_2207:
               if(param1.activated)
               {
                  _loc7_.method_3217(_loc6_.id,class_338.const_493);
                  _loc7_.method_5565(new class_1889(_loc6_));
                  break;
               }
               _loc7_.method_3217(param1.name_128,class_338.const_3113);
               break;
            case class_315.const_320:
               if(param1.activated)
               {
                  _loc7_.method_3217(_loc6_.id,class_338.const_3113);
                  _loc7_.method_5565(new class_1870(_loc6_));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_493);
               break;
            case class_315.const_253:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1888(_loc6_));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_3279);
               break;
            case class_315.const_1899:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1862(null,_loc6_,class_1862.NORMAL));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_920);
               if(param1.attribute == class_126.const_1401)
               {
                  _loc7_.method_269(new class_184(_loc6_.x,_loc6_.y,_loc6_.z,class_198.method_1020(class_222.const_273,class_126.const_2471)));
                  break;
               }
               break;
            case class_315.const_1265:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1862(null,_loc6_,class_1862.const_1782));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_920);
               if(param1.attribute == class_126.const_1401)
               {
                  _loc7_.method_269(new class_184(_loc6_.x,_loc6_.y,_loc6_.z,class_198.method_1020(class_222.const_273,class_126.const_2471)));
                  break;
               }
               break;
            case class_315.const_1405:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1886(_loc6_));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_2918);
               break;
            case class_315.const_431:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1887(_loc6_));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_2376);
               break;
            case class_315.const_1237:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1882(_loc6_));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_2505);
               break;
            case class_315.const_1330:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1867(_loc6_,param1.count));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_1100);
               break;
            case class_315.const_197:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_373(_loc6_));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_1531);
               break;
            case class_315.const_2546:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1871(_loc6_,map));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_1573);
               break;
            case class_315.const_2219:
               _loc10_ = _loc6_.method_1954(class_287) as class_287;
               if(param1.activated)
               {
                  var_574.method_4489().writeToLog(class_88.getItem("msg_own_targeting_harmed_through_DRAW_FIRE"));
                  if(_loc10_)
                  {
                     _loc10_.lockType.value = class_287.const_1969;
                  }
                  _loc7_.method_5084(new MouseCursorChangeEffect("shockwaves","drawFireSmall"));
                  _loc7_.method_5565(new class_1880(_loc6_));
                  break;
               }
               var_574.method_4489().writeToLog(class_88.getItem("msg_own_targeting_recovered_from_DRAW_FIRE"));
               _loc11_ = _loc6_.method_1954(class_310) as class_310;
               if(_loc10_)
               {
                  _loc10_.lockType.value = !!_loc11_ ? int(class_287.method_5240(_loc11_.name_155.value)) : int(class_287.const_1101);
               }
               _loc7_.method_2947(class_338.const_1807);
               _loc7_.method_3217(_loc6_.id,class_338.const_2946);
               break;
         }
         var _loc8_:class_86;
         if(!(_loc8_ = _loc6_ as class_86))
         {
            return;
         }
         switch(param1.var_2708)
         {
            case class_315.const_61:
               _loc8_.legendary.value = param1.activated;
               break;
            case class_315.const_1659:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1876(_loc8_,true));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_511);
               break;
            case class_315.const_501:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1885(_loc8_));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_1745);
               break;
            case class_315.const_2040:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1890(_loc8_));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_2810);
               break;
            case class_315.const_3214:
               if(_loc8_.shipPattern.getPatternID() != param1.var_2522)
               {
                  if(!(_loc12_ = class_198.var_2667[param1.var_2522]))
                  {
                     return;
                  }
                  _loc8_.shipPattern = _loc12_;
                  break;
               }
               break;
            case class_315.const_3238:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1881(_loc8_));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_1961);
               break;
            case class_315.const_734:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_348(class_338.const_1465,_loc8_));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_1465);
               break;
            case class_315.const_3311:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_348(class_338.const_817,_loc8_));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_817);
               break;
            case class_315.const_762:
               if(param1.activated)
               {
                  _loc7_.method_5565(new class_1875(_loc8_,int(param1.var_2522)));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_3063);
               break;
            case class_315.const_513:
               if(param1.activated)
               {
                  map.effects.method_5565(new class_1816(class_338.const_1081,_loc8_ as class_86,"_tech_battle_robot",1));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_1081);
               break;
            case class_315.ENERGY_LEECH_ARRAY:
               if(param1.activated)
               {
                  map.effects.method_5565(new class_1893(_loc8_));
                  break;
               }
               _loc7_.method_3217(_loc6_.id,class_338.const_1105);
               break;
         }
      }
      
      public function method_337(param1:class_315) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc2_:class_50 = var_574.name_47;
         if(_loc2_.map != null)
         {
            _loc3_ = _loc2_.map.method_1203().method_2455(param1.name_128);
            if(_loc3_ != null)
            {
               _loc4_ = _loc3_.const_2106.length - 1;
               while(_loc4_ >= 0)
               {
                  if((_loc5_ = _loc3_.const_2106[_loc4_]).var_2708 == param1.var_2708)
                  {
                     _loc3_.const_2106.splice(_loc4_,1);
                  }
                  _loc4_--;
               }
               if(param1.activated)
               {
                  _loc3_.const_2106.push(param1);
               }
            }
         }
      }
   }
}
