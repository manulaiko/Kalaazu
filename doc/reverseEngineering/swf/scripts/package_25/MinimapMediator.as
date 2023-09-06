package package_25
{
   import com.bigpoint.utils.class_73;
   import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
   import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
   import package_108.GroupProxy;
   import package_17.class_62;
   import package_31.class_92;
   import package_38.class_293;
   import package_46.class_131;
   import package_70.SimpleWindowEvent;
   import package_9.class_302;
   import package_9.class_50;
   
   public class MinimapMediator extends class_92
   {
      
      public static const NAME:String = "MinimapMediator";
      
      private static const const_72:Number = -30;
       
      
      private var var_2642:class_131;
      
      private var var_896:class_78;
      
      public function MinimapMediator(param1:class_78)
      {
         super(NAME,param1);
         this.var_896 = param1;
         this.var_896.const_2351.add(this.method_2905);
         this.var_896.clicked.add(this.method_3205);
      }
      
      override public function onRegister() : void
      {
         super.onRegister();
         this.var_2642 = guiManager.method_468(GuiConstants.MINIMAP_WINDOW);
         if(this.var_2642 == null)
         {
            this.var_2642 = guiManager.method_3615();
         }
         this.var_2642.addEventListener(SimpleWindowEvent.const_402,this.zoomIn);
         this.var_2642.addEventListener(SimpleWindowEvent.const_705,this.zoomOut);
         this.var_896.x = 30;
         this.var_896.y = 20;
         this.var_2642.method_2321().addChild(this.var_896);
         this.method_2905();
      }
      
      public function get method_1374() : class_78
      {
         return this.var_896;
      }
      
      private function zoomIn(param1:SimpleWindowEvent) : void
      {
         this.var_896.zoomIn();
      }
      
      private function zoomOut(param1:SimpleWindowEvent) : void
      {
         this.var_896.zoomOut();
      }
      
      private function method_2905() : void
      {
         this.var_2642.setSize(this.var_896.method_1173 + 25,this.var_896.method_3133 + 45);
         this.method_5554(this.var_2642);
      }
      
      private function method_5554(param1:class_131) : void
      {
         var _loc2_:Number = Number(class_50.method_6533());
         var _loc3_:Number = Number(class_50.method_1269());
         var _loc4_:int = _loc2_ - (param1.resizeDimension.x + const_72);
         var _loc5_:int = _loc3_ - (param1.resizeDimension.y + const_72);
         if(param1.x > _loc4_)
         {
            param1.x = _loc4_;
         }
         if(param1.y > _loc5_)
         {
            param1.y = _loc5_;
         }
         param1.x = Math.max(20,param1.x);
         param1.y = Math.max(20,param1.y);
      }
      
      private function method_3205(param1:int, param2:int) : void
      {
         if(Boolean(this.method_2479) && Boolean(this.method_2479.method_2251))
         {
            this.method_2479.method_2251 = false;
            class_62.getInstance().sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST,new class_293(param1,param2));
            class_302.getInstance().method_6002(new class_73(param1,param2),this.method_1374.map);
         }
         else if(!class_50.getInstance().method_1772.method_5057())
         {
            class_50.getInstance().method_1772.method_1368(param1,param2);
         }
      }
      
      private function get method_2479() : GroupProxy
      {
         return class_62.getInstance().retrieveProxy(GroupProxy.NAME) as GroupProxy;
      }
   }
}
