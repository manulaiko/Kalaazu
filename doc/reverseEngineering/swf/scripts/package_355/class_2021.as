package package_355
{
   import com.greensock.TweenLite;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.map.model.traits.class_319;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_125.class_352;
   import package_22.class_198;
   import package_22.class_222;
   import package_27.class_82;
   import package_36.class_1819;
   import package_76.class_215;
   import package_9.ResourceManager;
   import package_9.class_50;
   import package_99.class_266;
   
   public class class_2021
   {
      
      private static var var_2026:Dictionary = new Dictionary();
      
      private static const const_2319:int = 50;
       
      
      private var _effect:class_1819;
      
      private var name_25:class_222;
      
      private var laserDamageTypeID:int;
      
      private var _mapView:class_1206;
      
      public function class_2021(param1:class_1206, param2:class_1819)
      {
         super();
         if(Settings.qualityExplosion.value > Settings.QUALITY_LOW)
         {
            this._mapView = param1;
            this._effect = param2;
            if(int(var_2026[this._effect.source]) < 5)
            {
               this.method_30();
            }
         }
      }
      
      protected function method_30() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Number = NaN;
         var _loc9_:* = null;
         switch(this._effect.method_938)
         {
            case class_352.LASER:
            case class_352.ECI:
            case class_352.SINGULARITY:
               this.laserDamageTypeID = class_266.getRandomCount(0,2);
               this.name_25 = class_198.method_1020(class_222.const_964,this.laserDamageTypeID);
               break;
            case class_352.ROCKET:
               this.name_25 = class_198.method_1020(class_222.const_2635,0);
               break;
            case "I":
               this.laserDamageTypeID = class_266.getRandomCount(0,2);
               this.name_25 = class_198.method_1020(class_222.const_964,this.laserDamageTypeID);
               break;
            case class_352.MINE:
               this.name_25 = class_198.method_1020(class_222.const_2635,1);
               break;
            case class_352.PLASMA:
               this.name_25 = class_198.method_1020(class_222.const_2635,2);
               break;
            case "H":
         }
         if(this.name_25 != null)
         {
            _loc2_ = int(this.name_25.method_3142());
            if(_loc2_ != -1)
            {
               class_82.playSoundEffect(_loc2_,false,false,this._effect.source.position.x,this._effect.source.position.y);
            }
            _loc3_ = this.name_25.getResKey();
            if(!ResourceManager.isLoaded(_loc3_))
            {
               ResourceManager.loadAndCall(_loc3_,this.method_30,arguments,1000);
               return;
            }
            _loc4_ = ResourceManager.getMovieClip(_loc3_,"mc");
            _loc6_ = !!(_loc5_ = this._effect.source.method_1954(class_319) as class_319) ? int(_loc5_.clickRadius) : int(const_2319);
            _loc7_ = int(class_266.getRandomCount(0,360));
            if(this._effect.method_938 == "I")
            {
               class_50.getInstance().shakeScreen();
               class_82.playSoundEffect(7);
            }
            _loc8_ = Math.random();
            _loc9_ = Point.polar(_loc6_ * _loc8_ * 0.5,_loc8_ * 10);
            _loc4_.rotation = _loc7_;
            _loc4_.x = _loc9_.x + this._effect.source.position.x;
            _loc4_.y = _loc9_.y + this._effect.source.position.y;
            this._mapView.fxLayer.addChild(_loc4_);
            var_2026[this._effect.source] = int(var_2026[this._effect.source]) + 1;
            TweenLite.to(_loc4_,0.5,{
               "frame":_loc4_.framesLoaded,
               "onComplete":this.method_5763,
               "onCompleteParams":[_loc4_]
            });
         }
      }
      
      private function method_5763(param1:DisplayObject = null) : void
      {
         class_215.removeDisplayObject(param1);
         if(false)
         {
            var_2026[this._effect.source] = -1;
         }
      }
   }
}
