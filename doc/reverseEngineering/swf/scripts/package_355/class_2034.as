package package_355
{
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_22.class_222;
   import package_27.class_82;
   import package_286.class_1734;
   import package_36.class_184;
   
   public class class_2034 extends class_1734
   {
       
      
      private var var_2302:class_222;
      
      private var _effect:class_184;
      
      private var _mapView:class_1206;
      
      public function class_2034(param1:class_1206, param2:class_184)
      {
         this._mapView = param1;
         this._effect = param2;
         this.var_2302 = param2.name_25;
         if(Settings.qualityExplosion.value > Settings.QUALITY_LOW)
         {
            this.name_92();
            super(param1,param2);
         }
      }
      
      override protected function method_30() : void
      {
         this._mapView.fxLayer.addChild(clip);
         clip.x = this._effect.x;
         clip.y = this._effect.y;
         method_6420(false,1,true,true);
         if(Boolean(this.var_2302.rotatable) && Settings.qualityExplosion.value >= Settings.QUALITY_GOOD && Settings.autoQualityReduction.value < Settings.AQ_LOW_EXPLOSION_DETAIL_LIMIT && Settings.autoQualityReduction.value < Settings.AQ_NO_EXPLOSION_LIMIT)
         {
            this.rotation = Math.random() * 360;
         }
      }
      
      private function name_92() : void
      {
         var _loc1_:int = int(this.var_2302.method_3142());
         if(_loc1_ != -1)
         {
            class_82.playSoundEffect(_loc1_,false,false,this._effect.x,this._effect.y);
         }
      }
   }
}
