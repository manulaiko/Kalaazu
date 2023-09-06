package package_381
{
   import com.greensock.TweenLite;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import package_295.class_1752;
   import package_75.class_1882;
   
   public class class_2178 extends class_2160
   {
      
      private static const URL:String = "warp_power_up.zip";
       
      
      private var _ship:class_1752;
      
      public function class_2178(param1:class_1211, param2:class_1882)
      {
         super(param2,URL,param2.source.position);
         this._ship = param1.method_3658.method_6501(param2.source.method_1954(class_306));
         method_3722("explosion",this.method_5568);
      }
      
      private function method_5568() : void
      {
         TweenLite.to(this._ship,0.6,{
            "scaleX":0,
            "scaleY":0,
            "scaleZ":0
         });
      }
   }
}
