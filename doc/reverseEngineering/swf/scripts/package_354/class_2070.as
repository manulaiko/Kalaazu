package package_354
{
   import com.greensock.TweenLite;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.Event;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import package_18.class_2357;
   import package_286.class_1734;
   import package_286.class_2024;
   import package_35.EffectManager;
   import package_35.class_338;
   import package_35.class_348;
   import package_75.class_1876;
   import package_9.class_50;
   
   public class class_2070 extends class_2024
   {
       
      
      private var var_134:Boolean;
      
      private var var_150:Boolean = true;
      
      private var _map:class_90;
      
      private var _mapView:class_1206;
      
      private var _effect:class_1876;
      
      private var var_397:Boolean;
      
      public function class_2070(param1:class_1206, param2:class_1876)
      {
         this._effect = param2;
         this._map = class_50.getInstance().map;
         this.var_150 = param2.method_3897;
         this.var_134 = false;
         this._mapView = param1;
         super(param1,param2);
      }
      
      override protected function method_30() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:EffectManager = class_50.getInstance().map.effects;
         var _loc2_:class_348 = _loc1_.method_4909(ship.id,class_338.const_920);
         if(_loc2_)
         {
            _loc3_ = this._mapView.method_1850.method_1766(_loc2_);
            if(_loc2_ && method_5878 && this._effect.source == _loc2_.source)
            {
               if((_loc4_ = method_5878).getChildIndex(this) > _loc4_.getChildIndex(_loc3_))
               {
                  _loc4_.swapChildren(this,_loc3_);
               }
            }
         }
         if(clip != null)
         {
            this.method_260(null);
         }
         else
         {
            (_loc5_ = new class_2357()).addEventListener(class_2357.ASSET_LOADED,this.method_260);
            _loc5_.loadAsset(pattern.resKey);
         }
      }
      
      private function method_260(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(this.var_150)
         {
            _loc2_ = "";
            switch(ship.info.factionID.value)
            {
               case 1:
                  _loc2_ = "mmo";
                  break;
               case 2:
                  _loc2_ = "eic";
                  break;
               case 3:
                  _loc2_ = "vru";
            }
            _loc3_ = 0;
            while(_loc3_ < var_1714.numChildren)
            {
               if(var_1714.getChildAt(_loc3_) != var_1714.getChildByName(_loc2_) && var_1714.getChildAt(_loc3_) is MovieClip)
               {
                  var_1714.getChildAt(_loc3_).visible = false;
               }
               _loc3_++;
            }
         }
         TweenLite.to(ship.rotation,1,{
            "shortRotation":{"degrees":270},
            "onComplete":this.method_5538
         });
      }
      
      private function method_5538() : void
      {
         method_6420(false,1,this.var_134,false);
      }
      
      override public function disposeView(param1:Boolean = false) : void
      {
         class_50.getInstance().method_1772.method_711();
         TweenLite.killTweensOf(ship.rotation);
         if(ship)
         {
            ship.rotation.degrees = 270;
            ship.method_3687 = true;
         }
         if(method_5878)
         {
            method_5878.visible = true;
         }
         if(Boolean(var_1714) && !this.var_397)
         {
            this.var_397 = true;
            method_6420(false,var_1714.totalFrames,this.var_134,true,true);
         }
         else
         {
            super.disposeView(param1);
         }
      }
   }
}
