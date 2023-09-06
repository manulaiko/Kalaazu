package package_381
{
   import com.greensock.TweenMax;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import net.bigpoint.darkorbit.map.view3D.display3D.class_2135;
   import package_129.class_372;
   import package_310.class_2249;
   import package_310.class_2484;
   
   public class class_2170 implements IDisposable
   {
       
      
      private var var_3598:class_2249;
      
      private var var_336:class_2484;
      
      private var _ship:class_2135;
      
      private var _effect:class_372;
      
      public function class_2170(param1:class_1211, param2:class_372)
      {
         super();
         this._ship = param1.method_3658.method_6501(param2.source.method_1954(class_306)) as class_2135;
         this._effect = param2;
         var _loc3_:Number = 1;
         var _loc4_:class_306;
         if((_loc4_ = this._effect.source.method_1954(class_306) as class_306) && _loc4_.descriptor && _loc4_.descriptor.display3D.length() > 0)
         {
            if(_loc4_.descriptor.display3D[0].mesh.length() > 0)
            {
               _loc3_ = 1 / (Number(_loc4_.descriptor.display3D[0].mesh[0].@scale) || true);
            }
            else
            {
               _loc3_ = 1 / (Number(_loc4_.descriptor.display3D[0].@scale) || true);
            }
         }
         this.var_3598 = new class_2249(this._effect.color,this._effect.glowStrength,0.5);
         this.var_336 = new class_2484(this._effect.color,_loc3_ / 2);
         this._ship.addMethod(this.var_3598);
         this._ship.addMethod(this.var_336);
         if(this._effect.method_701 > 0)
         {
            TweenMax.to(this.var_3598,this._effect.method_701,{
               "strength":0.5,
               "power":0.8,
               "yoyo":true,
               "repeat":-1
            });
            TweenMax.to(this.var_336,this._effect.method_701,{
               "outlineSize":0,
               "yoyo":true,
               "repeat":-1
            });
         }
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         if(this.var_3598)
         {
            this._ship.method_804(this.var_3598);
            TweenMax.killTweensOf(this.var_3598);
            this.var_3598 = null;
         }
         if(this.var_336)
         {
            this._ship.method_804(this.var_336);
            TweenMax.killTweensOf(this.var_336);
            this.var_336 = null;
         }
      }
   }
}
