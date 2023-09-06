package package_297
{
   import com.greensock.TweenLite;
   import flash.geom.Vector3D;
   import net.bigpoint.darkorbit.map.common.class_80;
   
   public class class_2457 extends Vector3D implements class_80
   {
       
      
      private var var_988:Number = 0;
      
      private var _timeScale:Number = 1;
      
      public function class_2457(param1:Number, param2:Number = 0)
      {
         super();
         this._timeScale = 1 / param1;
         param2 = param2;
         this.var_988 = param2;
      }
      
      public function updateObj(param1:Number) : void
      {
         this.var_988 += param1 * Number(this._timeScale);
         var _loc2_:Number = Math.sin(this.var_988);
         var _loc3_:Number = Math.cos(this.var_988);
         setTo(_loc2_ * _loc3_,_loc2_ * _loc2_,_loc3_ * _loc2_);
      }
      
      public function stop() : void
      {
         this.var_988 = 0;
         TweenLite.to(this,0.5,{
            "x":0,
            "y":0,
            "z":0
         });
      }
   }
}
