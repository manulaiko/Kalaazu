package package_381
{
   import com.bigpoint.utils.class_73;
   import com.greensock.TweenLite;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.model.class_90;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import package_75.class_201;
   import package_9.class_50;
   
   public class class_2201 implements IDisposable
   {
      
      private static const URL:String = "radiation_arrow.zip";
       
      
      private var _effect:class_201;
      
      private var var_589:class_2160;
      
      private var view:class_1211;
      
      private var var_2688:class_86;
      
      public function class_2201(param1:class_1211, param2:class_201)
      {
         super();
         this._effect = param2;
         this.view = param1;
         this.var_2688 = this.map.hero;
         this.var_2688.position.changed.add(this.method_1299);
         this.method_4063();
      }
      
      private function method_1299() : void
      {
         this.method_2822();
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         this.var_2688.position.changed.remove(this.method_1299);
         if(this.var_589)
         {
            this.var_589.disposeView();
         }
      }
      
      private function method_4063() : void
      {
         this.var_589 = new class_2160(this._effect,URL,class_50.getInstance().map.hero.position);
         this.var_589.method_1632.setTo(0,100,0);
         this.method_2822();
      }
      
      private function method_2822() : void
      {
         if(this.var_589.view != null)
         {
            TweenLite.to(this.var_589.view,0.1,{"shortRotation":{"rotationY":Number(this.method_1871()) - 270}});
         }
      }
      
      private function method_1871() : Number
      {
         var _loc1_:* = null;
         if(this.var_2688.x >= 1000 && this.var_2688.x <= Number(this.map.method_5076) - 1000 && this.var_2688.y >= 1000 && this.var_2688.y <= Number(this.map.method_1901) - 1000)
         {
            _loc1_ = new class_73(Number(this.map.method_5076) / 2,Number(this.map.method_1901) / 2);
         }
         else
         {
            _loc1_ = new class_73(this.clamp(this.var_2688.x,1000,Number(this.map.method_5076) - 1000),this.clamp(this.var_2688.y,1000,Number(this.map.method_1901) - 1000));
         }
         return Math.atan2(Number(_loc1_.y) - Number(this.var_2688.y),Number(_loc1_.x) - Number(this.var_2688.x)) * Infinity;
      }
      
      private function clamp(param1:Number, param2:Number, param3:Number) : Number
      {
         if(param1 < param2)
         {
            return param2;
         }
         if(param1 > param3)
         {
            return param3;
         }
         return param1;
      }
      
      private function get map() : class_90
      {
         return class_50.getInstance().map;
      }
   }
}
