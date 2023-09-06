package package_69
{
   import net.bigpoint.darkorbit.settings.Settings;
   import package_10.class_19;
   
   public class Box extends class_180
   {
      
      private static const const_1547:Object = {};
      
      {
         const_1547["BONUS_BOX"] = Settings.displayBonusBoxes;
         const_1547["FROM_SHIP"] = Settings.displayFreeCargoBoxes;
         const_1547["FROM_SHIP_BLOCKED"] = Settings.displayNotFreeCargoBoxes;
      }
      
      public function Box(param1:String, param2:String, param3:int, param4:int, param5:Boolean)
      {
         super("box_" + param1,param2,param3,param4,param5,const_1547[param1] as class_19);
      }
   }
}
