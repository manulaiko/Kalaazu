package package_286
{
   import com.greensock.TweenLite;
   import flash.display.MovieClip;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import package_11.class_39;
   import package_22.class_339;
   import package_35.Effect;
   import package_76.class_1733;
   import package_9.ResourceManager;
   
   public class class_1734 extends class_1733 implements IDisposable
   {
       
      
      protected var var_1714:MovieClip;
      
      private var _mapView:class_1206;
      
      private var var_1752:Boolean;
      
      private var _effect:Effect;
      
      public function class_1734(param1:class_1206, param2:Effect, param3:Boolean = true)
      {
         super();
         this.var_1752 = param3;
         this._effect = param2;
         this._mapView = param1;
         this.load();
      }
      
      public function get effect() : Effect
      {
         return this._effect;
      }
      
      public function get id() : int
      {
         return this._effect.id;
      }
      
      protected function get pattern() : class_339
      {
         return this._effect.pattern;
      }
      
      protected function get method_3013() : String
      {
         return "mc";
      }
      
      override public function disposeView(param1:Boolean = false) : void
      {
         if(Boolean(this._effect.pattern) && Boolean(this._effect.pattern.resKey))
         {
            ResourceManager.name_15.method_2379(this._effect.pattern.resKey,this.method_3619);
         }
         stopAnimation();
         if(clip)
         {
            TweenLite.killTweensOf(this.clip);
         }
         if(this.var_1714)
         {
            TweenLite.killTweensOf(this.var_1714);
         }
         TweenLite.killTweensOf(this);
         if(parent)
         {
            parent.removeChild(this);
         }
         super.disposeView(param1);
      }
      
      protected function method_30() : void
      {
      }
      
      protected function start() : void
      {
         method_6420();
      }
      
      protected function load() : void
      {
         if(Boolean(this._effect.pattern) && Boolean(this._effect.pattern.resKey))
         {
            ResourceManager.name_15.load(this._effect.pattern.resKey,this.method_3619);
         }
         else
         {
            this.method_30();
         }
      }
      
      private function method_3619(param1:class_39) : void
      {
         if(param1.hasEmbeddedObject(this.method_3013))
         {
            this.var_1714 = param1.getEmbeddedMovieClip(this.method_3013);
            method_2332(this.var_1714,this.var_1752);
         }
         if(Boolean(this._effect) && !method_2650)
         {
            this.method_30();
         }
      }
      
      public function get method_3528() : class_1206
      {
         return this._mapView;
      }
   }
}
