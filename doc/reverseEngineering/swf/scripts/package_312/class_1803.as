package package_312
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.class_81;
   import net.bigpoint.darkorbit.map.model.traits.class_1783;
   import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;
   import net.bigpoint.darkorbit.mvc.sectorControlWindow.SectorControlWindowNotifications;
   import package_17.class_62;
   import package_29.class_85;
   import package_38.class_868;
   
   public class class_1803 extends class_85
   {
       
      
      public function class_1803(param1:class_868)
      {
         super(param1.name_115,new class_73(param1.var_4787,param1.var_2295));
         UberAssetsLib.instance.fillTraits(this,"sectorControlExit_" + param1.factionId,UberAssetsLib.LIB_DEFAULT,Boolean(param1.var_4985) && param1.factionId == class_81.factionID ? this.method_3349 : null);
         addTrait(new class_1783());
      }
      
      private function method_3349() : void
      {
         class_62.getInstance().sendNotification(SectorControlWindowNotifications.const_107);
      }
   }
}
