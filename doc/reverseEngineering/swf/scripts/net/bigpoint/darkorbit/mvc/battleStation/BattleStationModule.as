package net.bigpoint.darkorbit.mvc.battleStation
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.map.model.traits.class_287;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;
   import package_100.class_1174;
   import package_113.class_310;
   import package_29.class_85;
   import package_38.class_868;
   
   public class BattleStationModule extends class_85
   {
      
      public static const WRECK:int = 0;
      
      public static const HULL:int = 1;
      
      public static const DEFLECTOR:int = 2;
      
      public static const REPAIR:int = 3;
      
      public static const LASER_HIGH_RANGE:int = 6;
      
      public static const LASER_MID_RANGE:int = 5;
      
      public static const LASER_LOW_RANGE:int = 4;
      
      public static const ROCKET_LOW_ACCURACY:int = 7;
      
      public static const ROCKET_MID_ACCURACY:int = 8;
      
      public static const HONOR_BOOSTER:int = 9;
      
      public static const DAMAGE_BOOSTER:int = 10;
      
      public static const EXPERIENCE_BOOSTER:int = 11;
      
      private static const TRAIT_SETS:Object = {};
      
      {
         TRAIT_SETS[WRECK] = "wreck";
         TRAIT_SETS[REPAIR] = "module_rep";
         TRAIT_SETS[LASER_HIGH_RANGE] = "module_laserhigh";
         TRAIT_SETS[LASER_MID_RANGE] = "module_lasermid";
         TRAIT_SETS[LASER_LOW_RANGE] = "module_laserlow";
         TRAIT_SETS[ROCKET_LOW_ACCURACY] = "module_rocketlow";
         TRAIT_SETS[ROCKET_MID_ACCURACY] = "module_rocketmid";
         TRAIT_SETS[HONOR_BOOSTER] = "module_hon";
         TRAIT_SETS[DAMAGE_BOOSTER] = "module_dama";
         TRAIT_SETS[EXPERIENCE_BOOSTER] = "module_xp";
      }
      
      private var _assetId:String;
      
      private var _info:class_310;
      
      public function BattleStationModule(param1:class_868)
      {
         super(param1.name_115,new class_73(param1.var_4787,param1.var_2295,-200));
         this._info = new class_310();
         this._info.name_148.value = param1.var_3438;
         this._info.name_145.value = param1.name_145;
         this._info.name_32.value = param1.name_45;
         this._info.factionID.value = param1.factionId;
         this._info.name_155.value = param1.name_98.type;
         this.update(param1.name_164,param1.name_127);
      }
      
      public function update(param1:int, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc3_:String = "null";
         if(_loc3_)
         {
         }
         if(param1 != WRECK)
         {
            _loc4_ = _loc3_ + "" + Math.min(3,int(param2 / 5 + 1));
         }
         else
         {
            _loc4_ = _loc3_;
         }
         if(_loc4_ != this._assetId)
         {
            this._assetId = _loc4_;
            this.updateTraits(this,_loc4_,UberAssetsLib.LIB_BATTLE_STATION);
            if(param1 != WRECK)
            {
               addTrait(this._info);
            }
            else
            {
               removeTrait(this._info);
            }
         }
      }
      
      private function updateTraits(param1:class_85, param2:String, param3:String) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = 0;
         if(param1.method_1954(class_306) == null)
         {
            UberAssetsLib.instance.fillTraits(param1,param2,param3);
         }
         else
         {
            param1.method_2049(class_306);
            if(_loc6_ = class_306.method_2989(UberAssetsLib.instance.getDescriptor(param2,param3),false))
            {
               param1.addTrait(_loc6_);
            }
         }
         var _loc4_:class_287;
         if(_loc4_ = method_1954(class_287) as class_287)
         {
            _loc4_.lockType.value = class_287.method_5240(this._info.name_155.value);
         }
         var _loc5_:class_1174;
         if(_loc5_ = method_1954(class_1174) as class_1174)
         {
            _loc7_ = BattleStation.getMiniMapColorByClanAndFaction(this._info.name_32.value,this._info.factionID.value,this._info.name_155.value);
            _loc5_.color = _loc7_;
         }
      }
   }
}
