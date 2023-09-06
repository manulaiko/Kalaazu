package package_278
{
   import flash.display.Bitmap;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.MapAssetNotification;
   import net.bigpoint.darkorbit.mvc.mapElements.common.model.assetProxy.MapAssetLoadVo;
   import package_17.class_62;
   import package_26.class_333;
   import package_26.class_94;
   import package_39.class_1052;
   import package_39.class_1561;
   
   public class class_2003 extends class_1687
   {
      
      private static const const_708:int = 7;
      
      private static const const_1481:int = 4;
      
      private static const const_2239:String = "not_set";
       
      
      private const const_315:int = 60;
      
      private const const_2547:int = 255;
      
      private const const_1765:int = 65280;
      
      private const const_527:int = 16776960;
      
      private var var_3341:class_1561;
      
      private var var_1662:class_1052;
      
      private var var_2536:class_1052;
      
      private var var_206:class_1052;
      
      private var var_165:class_333;
      
      private var var_2615:class_333;
      
      private var var_4181:class_333;
      
      private var var_2068:Bitmap;
      
      private var var_675:class_62;
      
      public function class_2003()
      {
         this.var_675 = class_62.getInstance();
         this.init();
         super();
      }
      
      override protected function method_511() : void
      {
         super.method_511();
      }
      
      private function init() : void
      {
         this.var_1662 = new class_1052(65280,null,this.method_1903(65280));
         this.var_1662.mouseChildren = false;
         this.var_2536 = new class_1052(16776960,null,this.method_1903(16776960));
         this.var_2536.mouseChildren = false;
         this.var_206 = new class_1052(255,null,this.method_1903(255));
         this.var_206.mouseChildren = false;
         this.var_675.method_2407(MapAssetNotification.LOAD_GRAPHICS_FOR_MAPASSET,new MapAssetLoadVo(this.initBars,"ui",new <String>["empty_bar.png"],Bitmap,null,false));
      }
      
      private function initBars(param1:Bitmap) : void
      {
         this.var_2068 = param1;
         this.method_2233();
         this.method_6062();
         this.method_1492();
      }
      
      private function method_1492() : void
      {
         this.var_2536.x = this.var_206.x;
         this.var_2536.y = this.var_206.y + const_708;
         this.var_4181 = class_94.getInstance().method_1211(this.var_2536,const_2239 + "nano");
         addChild(this.var_2536);
      }
      
      private function method_6062() : void
      {
         this.var_206.x = this.var_1662.x;
         this.var_206.y = this.var_1662.y + const_708;
         this.var_165 = class_94.getInstance().method_1211(this.var_206,const_2239 + "shield");
         addChild(this.var_206);
      }
      
      private function method_2233() : void
      {
         this.var_1662.x = 25;
         this.var_1662.y = -2;
         this.var_2615 = class_94.getInstance().method_1211(this.var_1662,const_2239 + "hp");
         addChild(this.var_1662);
      }
      
      public function get method_42() : class_1052
      {
         return this.var_1662;
      }
      
      public function get method_4259() : class_1052
      {
         return this.var_2536;
      }
      
      public function get method_4971() : class_1052
      {
         return this.var_206;
      }
      
      public function get method_5347() : class_333
      {
         return this.var_165;
      }
      
      public function get method_875() : class_333
      {
         return this.var_2615;
      }
      
      public function get method_6264() : class_333
      {
         return this.var_4181;
      }
      
      public function method_1903(param1:uint) : class_1561
      {
         if(!this.var_3341)
         {
            this.var_3341 = new class_1561();
         }
         this.var_3341.gap = 1;
         this.var_3341.var_3145 = 60;
         this.var_3341.var_1175 = const_1481;
         this.var_3341.backgroundColor = 1842204;
         this.var_3341.barColor = param1;
         this.var_3341.var_4104 = false;
         return this.var_3341.clone();
      }
   }
}
