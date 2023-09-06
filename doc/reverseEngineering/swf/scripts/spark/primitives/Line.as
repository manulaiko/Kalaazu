package spark.primitives
{
   import flash.display.Graphics;
   import flash.display.GraphicsStroke;
   import flash.display.IGraphicsData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.core.mx_internal;
   import spark.primitives.supportClasses.StrokedElement;
   
   public class Line extends StrokedElement
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      private var _xFrom:Number = 0;
      
      private var _xTo:Number = 0;
      
      private var _yFrom:Number = 0;
      
      private var _yTo:Number = 0;
      
      public function Line()
      {
         super();
      }
      
      public function get xFrom() : Number
      {
         return this._xFrom;
      }
      
      public function set xFrom(param1:Number) : void
      {
         if(param1 != this._xFrom)
         {
            this._xFrom = param1;
            invalidateSize();
            invalidateDisplayList();
         }
      }
      
      public function get xTo() : Number
      {
         return this._xTo;
      }
      
      public function set xTo(param1:Number) : void
      {
         if(param1 != this._xTo)
         {
            this._xTo = param1;
            invalidateSize();
            invalidateDisplayList();
         }
      }
      
      public function get yFrom() : Number
      {
         return this._yFrom;
      }
      
      public function set yFrom(param1:Number) : void
      {
         if(param1 != this._yFrom)
         {
            this._yFrom = param1;
            invalidateSize();
            invalidateDisplayList();
         }
      }
      
      public function get yTo() : Number
      {
         return this._yTo;
      }
      
      public function set yTo(param1:Number) : void
      {
         if(param1 != this._yTo)
         {
            this._yTo = param1;
            invalidateSize();
            invalidateDisplayList();
         }
      }
      
      override protected function canSkipMeasurement() : Boolean
      {
         return false;
      }
      
      override protected function measure() : void
      {
         measuredWidth = Math.abs(this.xFrom - this.xTo);
         measuredHeight = Math.abs(this.yFrom - this.yTo);
         measuredX = Math.min(this.xFrom,this.xTo);
         measuredY = Math.min(this.yFrom,this.yTo);
      }
      
      override protected function beginDraw(param1:Graphics) : void
      {
         var _loc2_:* = null;
         if(stroke)
         {
            _loc2_ = GraphicsStroke(stroke.createGraphicsStroke(new Rectangle(drawX + measuredX,drawY + measuredY,Math.max(width,stroke.weight),Math.max(height,stroke.weight)),new Point(drawX + measuredX,drawY + measuredY)));
         }
         if(_loc2_)
         {
            param1.drawGraphicsData(new <IGraphicsData>[_loc2_]);
         }
         else
         {
            super.beginDraw(param1);
         }
      }
      
      override protected function draw(param1:Graphics) : void
      {
         var _loc2_:Number = measuredX + drawX;
         var _loc3_:Number = measuredY + drawY;
         var _loc4_:Number = measuredX + drawX + width;
         var _loc5_:Number = measuredY + drawY + height;
         if(this.xFrom <= this.xTo == this.yFrom <= this.yTo)
         {
            param1.moveTo(_loc2_,_loc3_);
            param1.lineTo(_loc4_,_loc5_);
         }
         else
         {
            param1.moveTo(_loc2_,_loc5_);
            param1.lineTo(_loc4_,_loc3_);
         }
      }
   }
}
