package package_64
{
   import net.bigpoint.darkorbit.settings.Settings;
   import package_37.class_170;
   import package_38.class_448;
   
   public class class_1397 extends class_170
   {
       
      
      public function class_1397()
      {
         super();
      }
      
      public static function run(param1:class_448) : void
      {
         Settings.qualityAttack.value = param1.qualityAttack;
         Settings.qualityBackground.value = param1.qualityBackground;
         Settings.qualityPresetting = param1.qualityPresetting;
         Settings.qualityCustomized = param1.qualityCustomized;
         Settings.qualityPoizone.value = param1.var_1652;
         Settings.qualityShip.value = param1.qualityShip;
         Settings.qualityEngine.value = param1.qualityEngine;
         Settings.qualityExplosion.value = param1.qualityExplosion;
         Settings.qualityCollectable.value = param1.var_3831;
         Settings.qualityEffect.value = param1.qualityEffect;
      }
   }
}
