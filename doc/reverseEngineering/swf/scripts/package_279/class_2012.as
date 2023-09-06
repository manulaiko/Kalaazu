package package_279
{
   import com.bigpoint.utils.class_73;
   import com.greensock.TweenLite;
   import com.greensock.easing.Strong;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.model.traits.class_1493;
   import package_11.class_39;
   import package_35.class_348;
   import package_75.class_423;
   import package_9.ResourceManager;
   
   public class class_2012 extends Sprite implements IDisposable
   {
       
      
      private const RADTODEG:Number = 57.29577951308232;
      
      private var var_1714:MovieClip;
      
      private var _effect:class_423;
      
      public function class_2012(param1:class_1493, param2:DisplayObject)
      {
         super();
         this._effect = param1.effect;
         this.load();
      }
      
      private function load() : void
      {
         ResourceManager.name_15.load("locator",this.method_3619);
      }
      
      private function method_3619(param1:class_39) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1.hasEmbeddedObject("mc"))
         {
            this.var_1714 = param1.getEmbeddedMovieClip("mc");
            addChild(this.var_1714);
            this.alpha = 0;
            TweenLite.to(this.var_1714,0.5,{"autoAlpha":1});
            _loc2_ = this._effect.icon;
            _loc3_ = new Sprite();
            _loc4_ = class_39(ResourceManager.name_15.getFinisher("locator")).getEmbeddedMovieClip("iconframe");
            _loc2_.x = -_loc2_.width * 0.5;
            _loc2_.y = -_loc2_.height * 0.5;
            _loc3_.y = -110;
            _loc3_.addChild(_loc4_);
            _loc3_.addChild(_loc2_);
            this.var_1714.addChild(_loc3_);
            this.y = -20;
            this.var_1714.addChild(_loc3_);
            this._effect.update.add(this.method_5146);
         }
      }
      
      public function method_5146(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         var _loc8_:int = 0;
         _loc3_ = param1;
         var _loc4_:int = param2;
         var _loc5_:class_73;
         var _loc6_:int = int((_loc5_ = (this._effect as class_348).source.position).x);
         var _loc7_:int = int(_loc5_.y);
         if(_loc3_ == -1 && _loc4_ == -1)
         {
            this.alpha = 0.2;
         }
         else
         {
            this.alpha = 1;
            if((_loc8_ = Math.round(Math.atan2(_loc4_ - _loc7_,_loc6_ - _loc3_) * 57.29577951308232) + 90) != Math.round(this.var_1714.rotation) && _loc8_ != 360 + Math.round(this.var_1714.rotation))
            {
               TweenLite.to(this.var_1714,1,{
                  "rotation":-_loc8_,
                  "ease":Strong.easeOut
               });
            }
         }
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         TweenLite.killTweensOf(this._effect);
         this._effect.update.remove(this.method_5146);
      }
   }
}
