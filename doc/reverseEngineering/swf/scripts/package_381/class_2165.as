package package_381
{
   import com.greensock.easing.Quad;
   import net.bigpoint.darkorbit.map.common.IDisposable;
   import net.bigpoint.darkorbit.map.common.class_80;
   import net.bigpoint.darkorbit.map.model.ship.class_86;
   import net.bigpoint.darkorbit.map.model.traits.class_306;
   import net.bigpoint.darkorbit.map.view3D.class_1211;
   import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;
   import package_373.class_2134;
   import package_75.class_403;
   
   public class class_2165 implements class_80, IDisposable
   {
       
      
      private var var_2976:class_2134;
      
      private var _effect:class_403;
      
      private var var_1242:Number = 1;
      
      private var var_560:Number = 0;
      
      private var _mapView:class_1211;
      
      public function class_2165(param1:class_1211, param2:class_403)
      {
         super();
         this._effect = param2;
         this._mapView = param1;
         this.var_2976 = new class_2134(UberAssetsLib.instance.getDescriptor("icy-cube-effect",UberAssetsLib.LIB_DEFAULT).display3D[0]);
         this.var_2976.rotationY = class_86(this._effect.source).rotation.degrees;
         this._mapView.method_1164(this);
         this._mapView.method_1616.addChild(this.var_2976);
      }
      
      public function updateObj(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:* = null;
         if(this.var_2976)
         {
            this.var_2976.moveTo(this._effect.source.method_1474,this._effect.source.method_1121,this._effect.source.method_6123);
            _loc2_ = 0;
            _loc3_ = this._effect.source.method_1954(class_306) as class_306;
            if(_loc3_)
            {
               _loc2_ = Number(_loc3_.method_4449);
            }
            if(this.var_1242 != _loc2_ && !isNaN(_loc2_))
            {
               this.var_1242 = _loc2_;
               this.var_560 = 0;
            }
            this.var_560 += param1;
            this.var_2976.scaleX = this.var_2976.scaleY = this.var_2976.scaleZ = Quad.easeInOut(Math.min(this.var_560,0.5),this.var_2976.scaleX,Number(this.var_1242) - Number(this.var_2976.scaleX),0.5);
         }
      }
      
      public function disposeView(param1:Boolean = false) : void
      {
         if(this.var_2976)
         {
            this.var_2976.disposeView(true);
            this.var_2976 = null;
            this._mapView.method_3592(this);
         }
      }
   }
}
