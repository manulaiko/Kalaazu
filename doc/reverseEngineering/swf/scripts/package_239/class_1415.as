package package_239
{
   import net.bigpoint.darkorbit.fui.UISystem;
   import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import net.bigpoint.darkorbit.settings.Settings;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import package_11.class_262;
   import package_176.class_1847;
   import package_333.TargetedOfferWindowMediator;
   import package_333.class_1843;
   import package_333.class_1846;
   import package_334.class_1845;
   import package_38.class_536;
   import package_84.class_243;
   
   public class class_1415 extends class_243
   {
      
      private static const const_1267:String = "targetedOffersWindow";
       
      
      private var var_4108:class_536;
      
      public function class_1415()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         this.var_4108 = param1.getBody() as class_536;
         if(retrieveProxy(class_1847.NAME))
         {
            return;
         }
         registerProxy(new class_1847(this.var_4108.name_73,Settings.dynamicHost + this.var_4108.link,this.var_4108.var_360));
         this.method_3655();
      }
      
      private function method_3655() : void
      {
         sendNotification(AssetNotifications.LOAD_ASSET,[const_1267,this.method_1617]);
      }
      
      private function method_1617(param1:class_262) : void
      {
         var _loc2_:XML = param1.method_4925();
         var _loc3_:class_1843 = new class_1843(this.var_4108.key,this.var_4108.var_2700);
         UISystem.getInstance().loadAndBuild(_loc2_,_loc3_,this.method_4827,[_loc3_]);
      }
      
      private function method_4827(param1:class_1843) : void
      {
         var _loc2_:uint = uint(this.var_4108.alignment.var_4112);
         var _loc3_:class_1846 = new class_1846(guiManager,guiProxy.getFeatureWindowById(this.name_85),param1,_loc2_);
         registerMediator(new TargetedOfferWindowMediator(_loc3_));
         registerCommand(class_1845.CLEANUP,class_1844);
         param1.method_866();
      }
      
      private function get name_85() : String
      {
         return GuiConstants.TARGETED_OFFERS_WINDOW;
      }
   }
}
