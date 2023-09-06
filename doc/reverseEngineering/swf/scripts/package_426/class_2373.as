package package_426
{
   import com.greensock.TweenMax;
   import flash.display.Bitmap;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.common.class_80;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
   import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
   import package_11.class_65;
   import package_17.class_62;
   import package_22.class_1074;
   import package_289.class_2366;
   import package_359.class_2082;
   import package_45.class_1820;
   
   public class class_2373 implements class_2366, class_80, IDisposable
   {
       
      
      private var var_3816:Number;
      
      private var var_3803:Number;
      
      private var var_127:class_2082;
      
      private var var_176:class_306;
      
      private var _data:Object;
      
      public function class_2373()
      {
         super();
      }
      
      public function method_1804(param1:class_306, param2:class_2082, param3:Object) : void
      {
         var _loc4_:* = null;
         this.var_176 = param1;
         this.var_127 = param2;
         this._data = param3;
         this.var_127.alpha = 0;
         this.var_3816 = Number(param3.xml.@oscillationDuration) || false;
         this.var_3803 = Number(param3.xml.@oscillationAmplitude) || false;
         if(param1.owner is class_1820)
         {
            if((_loc4_ = class_1820(param1.owner).bannerAdPattern).assetCount > 0)
            {
               class_62.getInstance().sendNotification(AssetNotifications.LOAD_ASSET,[_loc4_.method_1403(),this.method_756,null,AssetsProxy.LOCALIZED]);
            }
            else
            {
               this.fadeIn();
            }
         }
         else
         {
            this.fadeIn();
         }
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         TweenMax.killTweensOf(this);
      }
      
      public function updateObj(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         if(Boolean(this.var_3816) && Boolean(this.var_3803))
         {
            _loc2_ = new Date().getTime() / 1000 / Number(this.var_3816);
            _loc2_ *= 0;
            this.var_127.y = this.var_176.owner.position.y + Math.sin(_loc2_) * Number(this.var_3803);
         }
      }
      
      private function method_756(param1:class_65) : void
      {
         var _loc3_:* = null;
         var _loc2_:Bitmap = param1.getBitmap();
         if(_loc2_)
         {
            _loc3_ = new Bitmap(_loc2_.bitmapData.clone());
            _loc3_.x = int(this._data.xml.@advertX) || false;
            _loc3_.y = int(this._data.xml.@advertY) || false;
            this.var_127.addChild(_loc3_);
         }
         this.fadeIn();
      }
      
      private function fadeIn() : void
      {
         TweenMax.to(this,0.85,{"alpha":1});
      }
   }
}
