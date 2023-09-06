package package_125
{
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_27.class_82;
   import package_37.class_170;
   import package_38.class_531;
   import package_9.class_50;
   
   public class class_1419 extends class_170
   {
       
      
      public function class_1419()
      {
         super();
      }
      
      public static function run(param1:class_531) : void
      {
         switch(param1.var_2836)
         {
            case class_531.const_3059:
               Settings.combatMusicActive = true;
               if(false)
               {
                  class_82.method_2019(class_126.const_1041,true,0.5,0);
                  break;
               }
               break;
            case class_531.const_2434:
               Settings.combatMusicActive = false;
               if(class_50.getInstance().map != null)
               {
                  class_82.method_2019(class_50.getInstance().map.method_1123());
                  break;
               }
         }
      }
   }
}
