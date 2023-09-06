package mx.graphics
{
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.core.mx_internal;
   
   public class RadialGradient extends GradientBase implements IFill
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static var commonMatrix:Matrix = new Matrix();
       
      
      private var _focalPointRatio:Number = 0;
      
      private var _scaleX:Number;
      
      private var _scaleY:Number;
      
      public function RadialGradient()
      {
         super();
      }
      
      [Bindable("propertyChange")]
      public function get focalPointRatio() : Number
      {
         return this._focalPointRatio;
      }
      
      public function set focalPointRatio(param1:Number) : void
      {
         var _loc2_:Number = this._focalPointRatio;
         if(param1 != _loc2_)
         {
            this._focalPointRatio = param1;
            mx_internal::dispatchGradientChangedEvent("focalPointRatio",_loc2_,param1);
         }
      }
      
      override public function set matrix(param1:Matrix) : void
      {
         this.scaleX = NaN;
         this.scaleY = NaN;
         super.matrix = param1;
      }
      
      [Bindable("propertyChange")]
      public function get scaleX() : Number
      {
         return !!compoundTransform ? 0 : this._scaleX;
      }
      
      public function set scaleX(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         if(param1 != this.scaleX)
         {
            _loc2_ = this.scaleX;
            if(compoundTransform)
            {
               if(!isNaN(param1))
               {
                  compoundTransform.scaleX = param1;
               }
            }
            else
            {
               this._scaleX = param1;
            }
            mx_internal::dispatchGradientChangedEvent("scaleX",_loc2_,param1);
         }
      }
      
      [Bindable("propertyChange")]
      public function get scaleY() : Number
      {
         return !!compoundTransform ? 0 : this._scaleY;
      }
      
      public function set scaleY(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         if(param1 != this.scaleY)
         {
            _loc2_ = this.scaleY;
            if(compoundTransform)
            {
               if(!isNaN(param1))
               {
                  compoundTransform.scaleY = param1;
               }
            }
            else
            {
               this._scaleY = param1;
            }
            mx_internal::dispatchGradientChangedEvent("scaleY",_loc2_,param1);
         }
      }
      
      public function begin(param1:Graphics, param2:Rectangle, param3:Point) : void
      {
         var _loc4_:Number = !isNaN(this.scaleX) ? this.scaleX : param2.width;
         var _loc5_:Number = !isNaN(this.scaleY) ? this.scaleY : param2.height;
         var _loc6_:Number = !isNaN(x) ? x + param3.x : param2.left + param2.width / 2;
         var _loc7_:Number = !isNaN(y) ? y + param3.y : param2.top + param2.height / 2;
         commonMatrix.identity();
         if(!compoundTransform)
         {
            commonMatrix.scale(_loc4_ / GRADIENT_DIMENSION,_loc5_ / GRADIENT_DIMENSION);
            commonMatrix.rotate(!isNaN(mx_internal::_angle) ? Number(mx_internal::_angle) : Number(mx_internal::rotationInRadians));
            commonMatrix.translate(_loc6_,_loc7_);
         }
         else
         {
            commonMatrix.scale(1 / GRADIENT_DIMENSION,1 / GRADIENT_DIMENSION);
            commonMatrix.concat(compoundTransform.matrix);
            commonMatrix.translate(param3.x,param3.y);
         }
         param1.beginGradientFill(GradientType.RADIAL,mx_internal::colors,mx_internal::alphas,mx_internal::ratios,commonMatrix,spreadMethod,interpolationMethod,this.focalPointRatio);
      }
      
      public function end(param1:Graphics) : void
      {
         param1.endFill();
      }
   }
}
