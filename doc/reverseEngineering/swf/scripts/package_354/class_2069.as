package package_354
{
   import com.greensock.TweenNano;
   import net.bigpoint.darkorbit.map.view2D.class_1206;
   import net.bigpoint.darkorbit.mvc.battleStation.BattleStation;
   import net.bigpoint.darkorbit.mvc.battleStation.BattleStationModule;
   import package_286.class_2019;
   import package_35.class_348;
   
   public class class_2069 extends class_2019
   {
       
      
      public function class_2069(param1:class_1206, param2:class_348)
      {
         super(param1,param2,true,true,true);
      }
      
      override protected function method_30() : void
      {
         if(method_6135 is BattleStation)
         {
            var_1714.scaleX = 1.94;
            var_1714.scaleY = 1.94;
         }
         else if(method_6135 is BattleStationModule)
         {
            var_1714.scaleX = 1.16;
            var_1714.scaleY = 1.16;
         }
         else
         {
            var_1714.scaleX = 1;
            var_1714.scaleY = 1;
         }
         start();
      }
      
      override public function disposeView(param1:Boolean = false) : void
      {
         TweenNano.killTweensOf(clip);
         TweenNano.killTweensOf(this);
         TweenNano.to(this,0.5,{
            "alpha":0,
            "onComplete":super.disposeView
         });
      }
      
      override public function method_6420(param1:Boolean = true, param2:int = 1, param3:Boolean = true, param4:Boolean = false, param5:Boolean = false) : void
      {
         if(method_6135 is BattleStation)
         {
            super.method_6420(param1,param2,param3,param4,param5);
         }
         else
         {
            TweenNano.killTweensOf(clip);
            clip.visible = true;
            clip.alpha = 0;
            this.method_3222();
         }
      }
      
      public function method_3222() : void
      {
         TweenNano.to(clip,3,{
            "alpha":(false ? 0.2 : 1),
            "onComplete":this.method_3222
         });
      }
   }
}
