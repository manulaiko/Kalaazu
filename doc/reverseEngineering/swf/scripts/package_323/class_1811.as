package package_323
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.gui.windows.class_57;
   import net.bigpoint.darkorbit.map.model.traits.class_1180;
   import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
   import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;
   import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
   import package_17.class_62;
   import package_29.class_85;
   import package_38.class_530;
   import package_38.class_868;
   
   public class class_1811 extends class_85
   {
       
      
      public function class_1811(param1:class_868)
      {
         super(param1.name_115,new class_73(param1.var_4787,param1.var_2295));
         UberAssetsLib.instance.fillTraits(this,"tdm_enter",UberAssetsLib.LIB_DEFAULT,!!param1.var_4985 ? this.handleIconClick : null);
         var _loc2_:class_1180 = method_1954(class_1180) as class_1180;
         if(_loc2_)
         {
            _loc2_.const_3038.add(this.method_1860);
         }
      }
      
      private function handleIconClick() : void
      {
         class_62.getInstance().sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_530());
      }
      
      private function method_1860() : void
      {
         class_62.getInstance().sendNotification(GuiNotifications.CLOSE_WINDOW_BY_TYPE,class_57.const_378);
      }
   }
}
