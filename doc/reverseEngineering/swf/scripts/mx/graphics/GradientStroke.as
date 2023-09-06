package mx.graphics
{
   import flash.display.CapsStyle;
   import flash.display.Graphics;
   import flash.display.GraphicsGradientFill;
   import flash.display.GraphicsStroke;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import mx.core.mx_internal;
   
   public class GradientStroke extends GradientBase implements IStroke
   {
       
      
      private var _caps:String = "round";
      
      private var _joints:String = "round";
      
      private var _miterLimit:Number = 3;
      
      private var _pixelHinting:Boolean = false;
      
      private var _scaleMode:String = "normal";
      
      private var _weight:Number;
      
      public function GradientStroke(param1:Number = 1, param2:Boolean = false, param3:String = "normal", param4:String = "round", param5:String = "round", param6:Number = 3)
      {
         super();
         this.weight = param1;
         this.pixelHinting = param2;
         this.scaleMode = param3;
         this.caps = param4;
         this.joints = param5;
         this.miterLimit = param6;
      }
      
      [Bindable("propertyChange")]
      public function get caps() : String
      {
         return this._caps;
      }
      
      public function set caps(param1:String) : void
      {
         var _loc2_:String = this._caps;
         if(param1 != _loc2_)
         {
            this._caps = param1;
            mx_internal::dispatchGradientChangedEvent("caps",_loc2_,param1);
         }
      }
      
      [Bindable("propertyChange")]
      public function get joints() : String
      {
         return this._joints;
      }
      
      public function set joints(param1:String) : void
      {
         var _loc2_:String = this._joints;
         if(param1 != _loc2_)
         {
            this._joints = param1;
            mx_internal::dispatchGradientChangedEvent("joints",_loc2_,param1);
         }
      }
      
      [Bindable("propertyChange")]
      public function get miterLimit() : Number
      {
         return this._miterLimit;
      }
      
      public function set miterLimit(param1:Number) : void
      {
         var _loc2_:Number = this._miterLimit;
         if(param1 != _loc2_)
         {
            this._miterLimit = param1;
            mx_internal::dispatchGradientChangedEvent("miterLimit",_loc2_,param1);
         }
      }
      
      [Bindable("propertyChange")]
      public function get pixelHinting() : Boolean
      {
         return this._pixelHinting;
      }
      
      public function set pixelHinting(param1:Boolean) : void
      {
         var _loc2_:Boolean = this._pixelHinting;
         if(param1 != _loc2_)
         {
            this._pixelHinting = param1;
            mx_internal::dispatchGradientChangedEvent("pixelHinting",_loc2_,param1);
         }
      }
      
      [Bindable("propertyChange")]
      public function get scaleMode() : String
      {
         return this._scaleMode;
      }
      
      public function set scaleMode(param1:String) : void
      {
         var _loc2_:String = this._scaleMode;
         if(param1 != _loc2_)
         {
            this._scaleMode = param1;
            mx_internal::dispatchGradientChangedEvent("scaleMode",_loc2_,param1);
         }
      }
      
      [Bindable("propertyChange")]
      public function get weight() : Number
      {
         return this._weight;
      }
      
      public function set weight(param1:Number) : void
      {
         var _loc2_:Number = this._weight;
         if(param1 != _loc2_)
         {
            this._weight = param1;
            mx_internal::dispatchGradientChangedEvent("weight",_loc2_,param1);
         }
      }
      
      public function apply(param1:Graphics, param2:Rectangle, param3:Point) : void
      {
      }
      
      public function createGraphicsStroke(param1:Rectangle, param2:Point) : GraphicsStroke
      {
         var _loc3_:GraphicsStroke = new GraphicsStroke();
         _loc3_.thickness = this.weight;
         _loc3_.miterLimit = this.miterLimit;
         _loc3_.pixelHinting = this.pixelHinting;
         _loc3_.scaleMode = this.scaleMode;
         _loc3_.caps = !this.caps ? "null" : this.caps;
         var _loc4_:GraphicsGradientFill;
         (_loc4_ = new GraphicsGradientFill()).colors = mx_internal::colors;
         _loc4_.alphas = mx_internal::alphas;
         _loc4_.ratios = mx_internal::ratios;
         _loc4_.spreadMethod = spreadMethod;
         _loc4_.interpolationMethod = interpolationMethod;
         _loc3_.fill = _loc4_;
         return _loc3_;
      }
   }
}
