package spark.primitives
{
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.graphics.RectangularDropShadow;
   
   public class RectangularDropShadow extends UIComponent
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      private var dropShadow:mx.graphics.RectangularDropShadow;
      
      private var _alpha:Number = 0.4;
      
      private var _angle:Number = 45;
      
      private var _color:int = 0;
      
      private var _distance:Number = 4;
      
      private var _tlRadius:Number = 0;
      
      private var _trRadius:Number = 0;
      
      private var _blRadius:Number = 0;
      
      private var _brRadius:Number = 0;
      
      private var _blurX:Number = 4;
      
      private var _blurY:Number = 4;
      
      public function RectangularDropShadow()
      {
         mouseEnabled = false;
         super();
      }
      
      override public function get alpha() : Number
      {
         return this._alpha;
      }
      
      override public function set alpha(param1:Number) : void
      {
         if(this._alpha != param1)
         {
            this._alpha = param1;
            invalidateDisplayList();
         }
      }
      
      public function get angle() : Number
      {
         return this._angle;
      }
      
      public function set angle(param1:Number) : void
      {
         if(this._angle != param1)
         {
            this._angle = param1;
            invalidateDisplayList();
         }
      }
      
      public function get color() : int
      {
         return this._color;
      }
      
      public function set color(param1:int) : void
      {
         if(this._color != param1)
         {
            this._color = param1;
            invalidateDisplayList();
         }
      }
      
      public function get distance() : Number
      {
         return this._distance;
      }
      
      public function set distance(param1:Number) : void
      {
         if(this._distance != param1)
         {
            this._distance = param1;
            invalidateDisplayList();
         }
      }
      
      public function get tlRadius() : Number
      {
         return this._tlRadius;
      }
      
      public function set tlRadius(param1:Number) : void
      {
         if(this._tlRadius != param1)
         {
            this._tlRadius = param1;
            invalidateDisplayList();
         }
      }
      
      public function get trRadius() : Number
      {
         return this._trRadius;
      }
      
      public function set trRadius(param1:Number) : void
      {
         if(this._trRadius != param1)
         {
            this._trRadius = param1;
            invalidateDisplayList();
         }
      }
      
      public function get blRadius() : Number
      {
         return this._blRadius;
      }
      
      public function set blRadius(param1:Number) : void
      {
         if(this._blRadius != param1)
         {
            this._blRadius = param1;
            invalidateDisplayList();
         }
      }
      
      public function get brRadius() : Number
      {
         return this._brRadius;
      }
      
      public function set brRadius(param1:Number) : void
      {
         if(this._brRadius != param1)
         {
            this._brRadius = param1;
            invalidateDisplayList();
         }
      }
      
      public function get blurX() : Number
      {
         return this._blurX;
      }
      
      public function set blurX(param1:Number) : void
      {
         if(this._blurX != param1)
         {
            this._blurX = param1;
            invalidateDisplayList();
         }
      }
      
      public function get blurY() : Number
      {
         return this._blurY;
      }
      
      public function set blurY(param1:Number) : void
      {
         if(this._blurY != param1)
         {
            this._blurY = param1;
            invalidateDisplayList();
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         graphics.clear();
         if(!this.dropShadow)
         {
            this.dropShadow = new mx.graphics.RectangularDropShadow();
         }
         this.dropShadow.distance = this._distance;
         this.dropShadow.angle = this._angle;
         this.dropShadow.color = this._color;
         this.dropShadow.blurX = this._blurX;
         this.dropShadow.blurY = this._blurY;
         this.dropShadow.alpha = this._alpha;
         this.dropShadow.tlRadius = isNaN(this._tlRadius) ? 0 : this._tlRadius;
         this.dropShadow.trRadius = isNaN(this._trRadius) ? 0 : this._trRadius;
         this.dropShadow.blRadius = isNaN(this._blRadius) ? 0 : this._blRadius;
         this.dropShadow.brRadius = isNaN(this._brRadius) ? 0 : this._brRadius;
         this.dropShadow.drawShadow(graphics,0,0,param1,param2);
      }
   }
}
