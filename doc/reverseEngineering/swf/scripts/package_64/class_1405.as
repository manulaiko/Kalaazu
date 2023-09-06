package package_64
{
   import net.bigpoint.darkorbit.settings.Settings;
   import package_37.class_170;
   import package_38.class_527;
   
   public class class_1405 extends class_170
   {
       
      
      public function class_1405()
      {
         super();
      }
      
      public static function run(param1:class_527) : void
      {
         Settings.autoBoost = param1.autoBoost;
         Settings.autochangeAmmo = param1.var_1725;
         Settings.autoRefinement = param1.autoRefinement;
         Settings.quickSlotStopAttack = param1.var_2969;
         Settings.doubleclickAttackEnabled = param1.var_960;
         Settings.autoStartEnabled = param1.var_3797;
         Settings.autoBuyBootyKeys = param1.var_2664;
         Settings.displayBattlerayNotifications = param1.showBattlerayNotifications;
         Settings.showLowHpWarnings = param1.var_5022;
      }
   }
}
