package spark.components.supportClasses
{
   import flash.display.DisplayObject;
   import mx.core.FlexVersion;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import spark.components.Group;
   import spark.core.DisplayObjectSharingMode;
   import spark.core.IGraphicElement;
   import spark.skins.IHighlightBitmapCaptureClient;
   
   public class Skin extends Group implements IHighlightBitmapCaptureClient
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static var exclusionAlphaValues:Array;
       
      
      public function Skin()
      {
         super();
      }
      
      public function get focusSkinExclusions() : Array
      {
         return null;
      }
      
      public function beginHighlightBitmapCapture() : Boolean
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc1_:Array = this.focusSkinExclusions;
         if(!_loc1_)
         {
            if("hostComponent" in this && this["hostComponent"] is SkinnableComponent)
            {
               _loc1_ = SkinnableComponent(this["hostComponent"]).suggestedFocusSkinExclusions;
            }
         }
         var _loc2_:Number = _loc1_ == null ? 0 : _loc1_.length;
         exclusionAlphaValues = [];
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            if(_loc1_[_loc4_] in this)
            {
               if((_loc5_ = this[_loc1_[_loc4_]]) is UIComponent)
               {
                  exclusionAlphaValues[_loc4_] = (_loc5_ as UIComponent).mx_internal::$alpha;
                  (_loc5_ as UIComponent).mx_internal::$alpha = 0;
               }
               else if(_loc5_ is DisplayObject)
               {
                  exclusionAlphaValues[_loc4_] = (_loc5_ as DisplayObject).alpha;
                  (_loc5_ as DisplayObject).alpha = 0;
               }
               else if(_loc5_ is IGraphicElement)
               {
                  if((_loc6_ = _loc5_ as IGraphicElement).displayObjectSharingMode == DisplayObjectSharingMode.OWNS_UNSHARED_OBJECT)
                  {
                     exclusionAlphaValues[_loc4_] = _loc6_.displayObject.alpha;
                     _loc6_.displayObject.alpha = 0;
                  }
                  else
                  {
                     exclusionAlphaValues[_loc4_] = _loc6_.alpha;
                     _loc6_.alpha = 0;
                     _loc3_ = true;
                  }
               }
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function endHighlightBitmapCapture() : Boolean
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc1_:Array = this.focusSkinExclusions;
         if(!_loc1_)
         {
            if(this["hostComponent"] is SkinnableComponent)
            {
               _loc1_ = SkinnableComponent(this["hostComponent"]).suggestedFocusSkinExclusions;
            }
         }
         var _loc2_:Number = _loc1_ == null ? 0 : _loc1_.length;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            if(_loc1_[_loc4_] in this)
            {
               if((_loc5_ = this[_loc1_[_loc4_]]) is UIComponent)
               {
                  (_loc5_ as UIComponent).mx_internal::$alpha = exclusionAlphaValues[_loc4_];
               }
               else if(_loc5_ is DisplayObject)
               {
                  (_loc5_ as DisplayObject).alpha = exclusionAlphaValues[_loc4_];
               }
               else if(_loc5_ is IGraphicElement)
               {
                  if((_loc6_ = _loc5_ as IGraphicElement).displayObjectSharingMode == DisplayObjectSharingMode.OWNS_UNSHARED_OBJECT)
                  {
                     _loc6_.displayObject.alpha = exclusionAlphaValues[_loc4_];
                  }
                  else
                  {
                     _loc6_.alpha = exclusionAlphaValues[_loc4_];
                     _loc3_ = true;
                  }
               }
            }
            _loc4_++;
         }
         exclusionAlphaValues = null;
         return _loc3_;
      }
      
      override protected function initializeAccessibility() : void
      {
      }
      
      override public function get explicitMinWidth() : Number
      {
         var _loc1_:Number = NaN;
         if(parent is SkinnableComponent)
         {
            _loc1_ = Number(SkinnableComponent(parent).explicitMinWidth);
            if(!isNaN(_loc1_))
            {
               return _loc1_;
            }
         }
         return super.explicitMinWidth;
      }
      
      override public function get explicitMinHeight() : Number
      {
         var _loc1_:Number = NaN;
         if(parent is SkinnableComponent)
         {
            _loc1_ = Number(SkinnableComponent(parent).explicitMinHeight);
            if(!isNaN(_loc1_))
            {
               return _loc1_;
            }
         }
         return super.explicitMinHeight;
      }
      
      override public function get explicitMaxWidth() : Number
      {
         var _loc1_:Number = NaN;
         if(parent is SkinnableComponent)
         {
            _loc1_ = Number(SkinnableComponent(parent).explicitMaxWidth);
            if(!isNaN(_loc1_))
            {
               return _loc1_;
            }
         }
         return super.explicitMaxWidth;
      }
      
      override public function get explicitMaxHeight() : Number
      {
         var _loc1_:Number = NaN;
         if(parent is SkinnableComponent)
         {
            _loc1_ = Number(SkinnableComponent(parent).explicitMaxHeight);
            if(!isNaN(_loc1_))
            {
               return _loc1_;
            }
         }
         return super.explicitMaxHeight;
      }
      
      override protected function canSkipMeasurement() : Boolean
      {
         if(false)
         {
            return super.canSkipMeasurement();
         }
         return false;
      }
   }
}
