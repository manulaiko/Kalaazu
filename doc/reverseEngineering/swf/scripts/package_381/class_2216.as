package package_381
{
   import com.greensock.TweenMax;
   import com.greensock.easing.Linear;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import package_36.class_399;
   import package_75.class_1888;
   import package_9.class_50;
   
   public class class_2216 extends class_2160
   {
      
      private static const const_48:String = "polarity_power_up.zip";
       
      
      private var _effect:class_1888;
      
      public function class_2216(param1:class_1211, param2:class_1888)
      {
         this._effect = param2;
         this.method_4703();
         super(param2,const_48,param2.source.position);
         completed.addOnce(this.method_1939);
      }
      
      private function method_4703() : void
      {
         (this._effect.source as class_86).rotation.degrees += 360;
         TweenMax.to((this._effect.source as class_86).rotation,0.9,{
            "degrees":0,
            "onComplete":this.method_4703,
            "ease":Linear.easeNone
         });
      }
      
      private function method_1939() : void
      {
         TweenMax.killTweensOf((this._effect.source as class_86).rotation);
         class_50.getInstance().map.effects.method_5084(new class_399(this._effect.source,false,true));
      }
      
      override public function disposeView(param1:Boolean = false) : void
      {
         super.disposeView(param1);
         TweenMax.killTweensOf(this._effect.source);
      }
   }
}
