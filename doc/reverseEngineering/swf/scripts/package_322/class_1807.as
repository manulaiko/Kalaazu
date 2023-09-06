package package_322
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;
   import net.bigpoint.darkorbit.net.class_59;
   import package_27.class_82;
   import package_29.class_85;
   import package_38.class_445;
   import package_38.class_868;
   
   public class class_1807 extends class_85
   {
      
      private static const const_1896:Object = {};
      
      {
         const_1896[class_445.const_603] = "hangar_home";
         const_1896[class_445.const_784] = "hangar_outpost";
      }
      
      public function class_1807(param1:class_868)
      {
         super(param1.name_115,new class_73(param1.var_4787,param1.var_2295));
         UberAssetsLib.instance.fillTraits(this,"undefined_" + param1.factionId,UberAssetsLib.LIB_DEFAULT,!!param1.var_4985 ? this.handleIconClick : null);
      }
      
      private function handleIconClick() : void
      {
         class_59.referToURL(class_59.const_3051,"seo_tittle_hangar",class_59.const_1316);
         class_82.playSoundEffect(class_126.const_1753);
      }
   }
}
