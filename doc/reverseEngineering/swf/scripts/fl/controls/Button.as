package fl.controls
{
   import fl.core.InvalidationType;
   import fl.core.UIComponent;
   import fl.managers.IFocusManagerComponent;
   import flash.display.DisplayObject;
   
   public class Button extends LabelButton implements IFocusManagerComponent
   {
      
      private static var defaultStyles:Object = {
         "emphasizedSkin":"Button_emphasizedSkin",
         "emphasizedPadding":2
      };
      
      public static var createAccessibilityImplementation:Function;
       
      
      protected var _emphasized:Boolean = false;
      
      protected var emphasizedBorder:DisplayObject;
      
      public function Button()
      {
         super();
      }
      
      public static function getStyleDefinition() : Object
      {
         return UIComponent.mergeStyles(LabelButton.getStyleDefinition(),defaultStyles);
      }
      
      public function set emphasized(param1:Boolean) : void
      {
         _emphasized = param1;
         invalidate(InvalidationType.STYLES);
      }
      
      override protected function initializeAccessibility() : void
      {
         if(false)
         {
            Button.createAccessibilityImplementation(this);
         }
      }
      
      protected function drawEmphasized() : void
      {
         var _loc2_:Number = NaN;
         if(emphasizedBorder != null)
         {
            removeChild(emphasizedBorder);
         }
         emphasizedBorder = null;
         if(!_emphasized)
         {
            return;
         }
         var _loc1_:Object = getStyleValue("emphasizedSkin");
         if(_loc1_ != null)
         {
            emphasizedBorder = getDisplayObjectInstance(_loc1_);
         }
         if(emphasizedBorder != null)
         {
            addChildAt(emphasizedBorder,0);
            _loc2_ = Number(getStyleValue("emphasizedPadding"));
            var _loc3_:* = -_loc2_;
            emphasizedBorder.y = -_loc2_;
            emphasizedBorder.x = _loc3_;
            emphasizedBorder.width = width + _loc2_ * 2;
            emphasizedBorder.height = height + _loc2_ * 2;
         }
      }
      
      public function get emphasized() : Boolean
      {
         return _emphasized;
      }
      
      override protected function draw() : void
      {
         if(isInvalid(InvalidationType.STYLES) || isInvalid(InvalidationType.SIZE))
         {
            drawEmphasized();
         }
         super.draw();
         if(emphasizedBorder != null)
         {
            setChildIndex(emphasizedBorder,numChildren - 1);
         }
      }
      
      override public function drawFocus(param1:Boolean) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:* = undefined;
         super.drawFocus(param1);
         if(param1)
         {
            _loc2_ = Number(getStyleValue("emphasizedPadding"));
            if(_loc2_ < 0 || !_emphasized)
            {
               _loc2_ = 0;
            }
            _loc3_ = getStyleValue("focusRectPadding");
            _loc3_ = _loc3_ == null ? 2 : _loc3_;
            _loc3_ += _loc2_;
            uiFocusRect.x = -_loc3_;
            uiFocusRect.y = -_loc3_;
            uiFocusRect.width = width + _loc3_ * 2;
            uiFocusRect.height = height + _loc3_ * 2;
         }
      }
   }
}
