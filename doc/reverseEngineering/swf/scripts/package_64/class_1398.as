package package_64
{
   import net.bigpoint.darkorbit.settings.Settings;
   import package_17.class_62;
   import package_37.class_170;
   import package_38.class_611;
   import package_81.class_237;
   
   public class class_1398 extends class_170
   {
       
      
      public function class_1398()
      {
         super();
      }
      
      public static function run(param1:class_611) : void
      {
         Settings.questsAvailableFilter = param1.var_4496;
         Settings.questsUnavailableFilter = param1.var_749;
         Settings.questsCompletedFilter = param1.var_692;
         Settings.questsLevelOrderDescending = param1.var_2129;
         Settings.challengesUnattemptedFilter = param1.var_4496;
         Settings.challengesAttemptedFilter = param1.var_749;
         class_62.getInstance().sendNotification(class_237.const_1919);
         class_62.getInstance().sendNotification(class_237.const_2537);
      }
   }
}
