package mx.graphics
{
   import flash.display.Graphics;
   import flash.events.EventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   
   public class SolidColor extends EventDispatcher implements IFill
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      private var _alpha:Number = 1;
      
      private var _color:uint = 0;
      
      public function SolidColor(param1:uint = 0, param2:Number = 1)
      {
         super();
         this.color = param1;
         this.alpha = param2;
      }
      
      [Bindable("propertyChange")]
      public function get alpha() : Number
      {
         return this._alpha;
      }
      
      public function set alpha(param1:Number) : void
      {
         var _loc2_:Number = this._alpha;
         if(param1 != _loc2_)
         {
            this._alpha = param1;
            this.dispatchFillChangedEvent("alpha",_loc2_,param1);
         }
      }
      
      [Bindable("propertyChange")]
      public function get color() : uint
      {
         return this._color;
      }
      
      public function set color(param1:uint) : void
      {
         var _loc2_:uint = this._color;
         if(param1 != _loc2_)
         {
            this._color = param1;
            this.dispatchFillChangedEvent("color",_loc2_,param1);
         }
      }
      
      public function begin(param1:Graphics, param2:Rectangle, param3:Point) : void
      {
         param1.beginFill(this.color,this.alpha);
      }
      
      public function end(param1:Graphics) : void
      {
         param1.endFill();
      }
      
      private function dispatchFillChangedEvent(param1:String, param2:*, param3:*) : void
      {
         if(hasEventListener("propertyChange"))
         {
            dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,param1,param2,param3));
         }
      }
   }
}
