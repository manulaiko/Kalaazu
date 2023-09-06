package package_354
{
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import net.bigpoint.darkorbit.settings.Settings;
   import package_286.class_2019;
   import package_75.class_398;
   
   public class class_2043 extends class_2019
   {
       
      
      private var _effect:class_398;
      
      private var _mapView:class_1206;
      
      public function class_2043(param1:class_1206, param2:class_398)
      {
         this._mapView = param1;
         this._effect = param2;
         super(param1,param2,true,true,true);
      }
      
      override protected function method_30() : void
      {
         fps = 25;
         method_6420(false,1,true,true);
         if(Settings.qualityExplosion.value >= Settings.QUALITY_GOOD && Settings.autoQualityReduction.value < Settings.AQ_LOW_EXPLOSION_DETAIL_LIMIT && Settings.autoQualityReduction.value < Settings.AQ_NO_EXPLOSION_LIMIT)
         {
            this.rotation = Math.random() * 360;
         }
      }
   }
}
