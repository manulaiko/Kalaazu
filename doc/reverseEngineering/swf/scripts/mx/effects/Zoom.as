package mx.effects
{
   import mx.core.mx_internal;
   import mx.effects.effectClasses.ZoomInstance;
   
   public class Zoom extends TweenEffect
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static var AFFECTED_PROPERTIES:Array = ["scaleX","scaleY","x","y","width","height"];
       
      
      public var captureRollEvents:Boolean;
      
      public var originX:Number;
      
      public var originY:Number;
      
      public var zoomHeightFrom:Number;
      
      public var zoomHeightTo:Number;
      
      public var zoomWidthFrom:Number;
      
      public var zoomWidthTo:Number;
      
      public function Zoom(param1:Object = null)
      {
         super(param1);
         instanceClass = ZoomInstance;
         mx_internal::applyActualDimensions = false;
         relevantProperties = ["scaleX","scaleY","width","height","visible"];
      }
      
      override public function getAffectedProperties() : Array
      {
         return AFFECTED_PROPERTIES;
      }
      
      override protected function initInstance(param1:IEffectInstance) : void
      {
         var _loc2_:* = null;
         super.initInstance(param1);
         _loc2_ = ZoomInstance(param1);
         _loc2_.zoomWidthFrom = this.zoomWidthFrom;
         _loc2_.zoomWidthTo = this.zoomWidthTo;
         _loc2_.zoomHeightFrom = this.zoomHeightFrom;
         _loc2_.zoomHeightTo = this.zoomHeightTo;
         _loc2_.originX = this.originX;
         _loc2_.originY = this.originY;
         _loc2_.captureRollEvents = this.captureRollEvents;
      }
   }
}
