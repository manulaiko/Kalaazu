package mx.controls
{
   import mx.core.UITextField;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   
   public class Text extends Label
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
       
      
      private var lastUnscaledWidth:Number = NaN;
      
      private var widthChanged:Boolean = true;
      
      public function Text()
      {
         super();
         selectable = true;
         truncateToFit = false;
         addEventListener(FlexEvent.UPDATE_COMPLETE,this.updateCompleteHandler);
      }
      
      override public function set explicitWidth(param1:Number) : void
      {
         if(param1 != explicitWidth)
         {
            this.widthChanged = true;
            invalidateProperties();
            invalidateSize();
         }
         super.explicitWidth = param1;
      }
      
      override public function set maxWidth(param1:Number) : void
      {
         if(param1 != maxWidth)
         {
            this.widthChanged = true;
            invalidateProperties();
            invalidateSize();
         }
         super.maxWidth = param1;
      }
      
      override public function set percentWidth(param1:Number) : void
      {
         if(param1 != percentWidth)
         {
            this.widthChanged = true;
            invalidateProperties();
            invalidateSize();
         }
         super.percentWidth = param1;
      }
      
      override protected function childrenCreated() : void
      {
         super.childrenCreated();
         textField.wordWrap = true;
         textField.multiline = true;
         textField.mouseWheelEnabled = false;
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(this.widthChanged)
         {
            textField.wordWrap = !isNaN(explicitWidth) || !isNaN(explicitMaxWidth) || !isNaN(percentWidth);
            this.widthChanged = false;
         }
      }
      
      override protected function measure() : void
      {
         var _loc1_:Number = NaN;
         if(this.isSpecialCase())
         {
            if(!isNaN(this.lastUnscaledWidth))
            {
               this.measureUsingWidth(this.lastUnscaledWidth);
            }
            else
            {
               measuredWidth = 0;
               measuredHeight = 0;
            }
            return;
         }
         if(!isNaN(explicitWidth))
         {
            _loc1_ = explicitWidth;
         }
         else if(!isNaN(explicitMaxWidth))
         {
            _loc1_ = explicitMaxWidth;
         }
         this.measureUsingWidth(_loc1_);
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc7_:Boolean = false;
         if(this.isSpecialCase())
         {
            _loc7_ = isNaN(this.lastUnscaledWidth) || this.lastUnscaledWidth != param1;
            this.lastUnscaledWidth = param1;
            if(_loc7_)
            {
               invalidateSize();
               return;
            }
         }
         var _loc3_:Number = getStyle("paddingLeft");
         var _loc4_:Number = getStyle("paddingTop");
         var _loc5_:Number = getStyle("paddingRight");
         var _loc6_:Number = getStyle("paddingBottom");
         textField.setActualSize(param1 - _loc3_ - _loc5_,param2 - _loc4_ - _loc6_);
         textField.x = _loc3_;
         textField.y = _loc4_;
         if(Math.floor(width) < Math.floor(measuredWidth))
         {
            textField.wordWrap = true;
         }
      }
      
      private function isSpecialCase() : Boolean
      {
         var _loc1_:Number = getStyle("left");
         var _loc2_:Number = getStyle("right");
         return (!isNaN(percentWidth) || !isNaN(_loc1_) && !isNaN(_loc2_)) && isNaN(explicitHeight) && isNaN(percentHeight);
      }
      
      private function measureUsingWidth(param1:Number) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Boolean = false;
         var _loc2_:Number = getStyle("paddingLeft");
         var _loc3_:Number = getStyle("paddingTop");
         _loc4_ = getStyle("paddingRight");
         _loc5_ = getStyle("paddingBottom");
         textField.validateNow();
         textField.autoSize = "left";
         if(!isNaN(param1))
         {
            textField.width = param1 - _loc2_ - _loc4_;
            measuredWidth = Math.ceil(textField.textWidth) + UITextField.mx_internal::TEXT_WIDTH_PADDING;
            measuredHeight = Math.ceil(textField.textHeight) + UITextField.mx_internal::TEXT_HEIGHT_PADDING;
         }
         else
         {
            _loc6_ = false;
            textField.wordWrap = false;
            measuredWidth = Math.ceil(textField.textWidth) + UITextField.mx_internal::TEXT_WIDTH_PADDING;
            measuredHeight = Math.ceil(textField.textHeight) + UITextField.mx_internal::TEXT_HEIGHT_PADDING;
            textField.wordWrap = _loc6_;
         }
         textField.autoSize = "none";
         measuredWidth += _loc2_ + _loc4_;
         measuredHeight += _loc3_ + _loc5_;
         if(isNaN(explicitWidth))
         {
            measuredMinWidth = DEFAULT_MEASURED_MIN_WIDTH;
            measuredMinHeight = DEFAULT_MEASURED_MIN_HEIGHT;
         }
         else
         {
            measuredMinWidth = measuredWidth;
            measuredMinHeight = measuredHeight;
         }
      }
      
      private function updateCompleteHandler(param1:FlexEvent) : void
      {
         this.lastUnscaledWidth = NaN;
      }
   }
}
