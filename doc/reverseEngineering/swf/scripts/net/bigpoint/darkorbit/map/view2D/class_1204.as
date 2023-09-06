package net.bigpoint.darkorbit.map.view2D
{
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import net.bigpoint.darkorbit.map.class_87;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.map.model.traits.class_287;
   import net.bigpoint.darkorbit.mvc.mapElements.assets.MapAssetNotification;
   import net.bigpoint.darkorbit.mvc.mapElements.common.model.assetProxy.MapAssetLoadVo;
   import package_10.class_305;
   import package_109.class_329;
   import package_17.class_62;
   import package_195.class_1203;
   import package_29.class_85;
   
   public class class_1204 extends class_1203
   {
       
      
      private var _view:MovieClip;
      
      private var _target:class_287;
      
      private var var_3049:class_329;
      
      public function class_1204(param1:class_87)
      {
         super(param1,new class_305());
         cacheAsBitmap = true;
         class_62.getInstance().sendNotification(MapAssetNotification.LOAD_GRAPHICS_FOR_MAPASSET,new MapAssetLoadVo(this.method_2942,"ui",new <String>["ship_border"],DisplayObject,null,false));
      }
      
      public function set map(param1:class_90) : void
      {
         if(this.var_3049)
         {
            this.var_3049.targetChanged.remove(this.method_1788);
         }
         this.var_3049 = !!param1 ? param1.method_4929 : null;
         if(this.var_3049)
         {
            this.var_3049.targetChanged.add(this.method_1788);
         }
      }
      
      private function method_3736() : void
      {
         if(this._view)
         {
            this._view.alpha = 0;
            if(this._target)
            {
               this._target.lockType.changed.add(this.method_5829);
            }
            this.method_5829();
            TweenLite.killTweensOf(this._view);
            TweenLite.to(this._view,0.3,{"autoAlpha":1});
         }
      }
      
      private function method_1390() : void
      {
         if(this._target)
         {
            this._target.lockType.changed.remove(this.method_5829);
         }
         if(this._view != null)
         {
            TweenLite.killTweensOf(this._view);
            TweenLite.to(this._view,0.3,{"autoAlpha":0});
         }
      }
      
      private function method_1788(param1:class_85) : void
      {
         this.method_1390();
         this._target = !!param1 ? param1.method_1954(class_287) as class_287 : null;
         if(this._target)
         {
            var_727 = this._target.owner.position;
            this.method_3736();
         }
      }
      
      private function method_2942(param1:MovieClip) : void
      {
         this._view = param1;
         this.method_5829();
         addChild(this._view);
         this._view.alpha = 0;
      }
      
      private function method_5829() : void
      {
         if(Boolean(this._view) && Boolean(this._target))
         {
            if(this._target.lockType.value <= this._view.totalFrames)
            {
               this._view.gotoAndStop(this._target.lockType.value);
            }
            else
            {
               this._view.gotoAndStop(1);
            }
         }
      }
   }
}
