package spark.filters
{
   import flash.filters.BitmapFilter;
   import flash.filters.DropShadowFilter;
   import mx.filters.BaseDimensionFilter;
   import mx.filters.IBitmapFilter;
   
   public class DropShadowFilter extends BaseDimensionFilter implements IBitmapFilter
   {
       
      
      private var _alpha:Number = 1;
      
      private var _angle:Number = 45;
      
      private var _color:uint = 0;
      
      private var _distance:Number = 4;
      
      private var _hideObject:Boolean = false;
      
      private var _inner:Boolean = false;
      
      public function DropShadowFilter(param1:Number = 4, param2:Number = 45, param3:uint = 0, param4:Number = 1, param5:Number = 4, param6:Number = 4, param7:Number = 1, param8:int = 1, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         this.distance = param1;
         this.angle = param2;
         this.color = param3;
         this.alpha = param4;
         this.blurX = param5;
         this.blurY = param6;
         this.strength = param7;
         this.quality = param8;
         this.inner = param9;
         this.knockout = param10;
         this.hideObject = param11;
      }
      
      public function get alpha() : Number
      {
         return this._alpha;
      }
      
      public function set alpha(param1:Number) : void
      {
         if(param1 != this._alpha)
         {
            this._alpha = param1;
            notifyFilterChanged();
         }
      }
      
      public function get angle() : Number
      {
         return this._angle;
      }
      
      public function set angle(param1:Number) : void
      {
         if(param1 != this._angle)
         {
            this._angle = param1;
            notifyFilterChanged();
         }
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function set color(param1:uint) : void
      {
         if(param1 != this._color)
         {
            this._color = param1;
            notifyFilterChanged();
         }
      }
      
      public function get distance() : Number
      {
         return this._distance;
      }
      
      public function set distance(param1:Number) : void
      {
         if(param1 != this._distance)
         {
            this._distance = param1;
            notifyFilterChanged();
         }
      }
      
      public function get hideObject() : Boolean
      {
         return this._hideObject;
      }
      
      public function set hideObject(param1:Boolean) : void
      {
         if(param1 != this._hideObject)
         {
            this._hideObject = param1;
            notifyFilterChanged();
         }
      }
      
      public function get inner() : Boolean
      {
         return this._inner;
      }
      
      public function set inner(param1:Boolean) : void
      {
         if(param1 != this._inner)
         {
            this._inner = param1;
            notifyFilterChanged();
         }
      }
      
      public function clone() : BitmapFilter
      {
         return new flash.filters.DropShadowFilter(this.distance,this.angle,this.color,this.alpha,blurX,blurY,strength,quality,this.inner,knockout,this.hideObject);
      }
   }
}
