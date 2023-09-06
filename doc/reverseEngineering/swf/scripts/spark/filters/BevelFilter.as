package spark.filters
{
   import flash.filters.BevelFilter;
   import flash.filters.BitmapFilter;
   import mx.filters.BaseDimensionFilter;
   import mx.filters.IBitmapFilter;
   
   public class BevelFilter extends BaseDimensionFilter implements IBitmapFilter
   {
       
      
      private var _angle:Number = 45;
      
      private var _distance:Number = 4;
      
      private var _highlightAlpha:Number = 1;
      
      private var _highlightColor:uint = 16777215;
      
      private var _shadowAlpha:Number = 1;
      
      private var _shadowColor:uint = 0;
      
      private var _type:String = "inner";
      
      public function BevelFilter(param1:Number = 4, param2:Number = 45, param3:uint = 16777215, param4:Number = 1, param5:uint = 0, param6:Number = 1, param7:Number = 4, param8:Number = 4, param9:Number = 1, param10:int = 1, param11:String = "inner", param12:Boolean = false)
      {
         super();
         this.distance = param1;
         this.angle = param2;
         this.highlightColor = param3;
         this.highlightAlpha = param4;
         this.shadowColor = param5;
         this.shadowAlpha = param6;
         this.blurX = param7;
         this.blurY = param8;
         this.strength = param9;
         this.quality = param10;
         this.type = param11;
         this.knockout = param12;
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
      
      public function get highlightAlpha() : Number
      {
         return this._highlightAlpha;
      }
      
      public function set highlightAlpha(param1:Number) : void
      {
         if(param1 != this._highlightAlpha)
         {
            this._highlightAlpha = param1;
            notifyFilterChanged();
         }
      }
      
      public function get highlightColor() : uint
      {
         return this._highlightColor;
      }
      
      public function set highlightColor(param1:uint) : void
      {
         if(param1 != this._highlightColor)
         {
            this._highlightColor = param1;
            notifyFilterChanged();
         }
      }
      
      public function get shadowAlpha() : Number
      {
         return this._shadowAlpha;
      }
      
      public function set shadowAlpha(param1:Number) : void
      {
         if(param1 != this._shadowAlpha)
         {
            this._shadowAlpha = param1;
            notifyFilterChanged();
         }
      }
      
      public function get shadowColor() : uint
      {
         return this._shadowColor;
      }
      
      public function set shadowColor(param1:uint) : void
      {
         if(param1 != this._shadowColor)
         {
            this._shadowColor = param1;
            notifyFilterChanged();
         }
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(param1:String) : void
      {
         if(param1 != this._type)
         {
            this._type = param1;
            notifyFilterChanged();
         }
      }
      
      public function clone() : BitmapFilter
      {
         return new flash.filters.BevelFilter(this.distance,this.angle,this.highlightColor,this.highlightAlpha,this.shadowColor,this.shadowAlpha,blurX,blurY,strength,quality,this.type,knockout);
      }
   }
}
