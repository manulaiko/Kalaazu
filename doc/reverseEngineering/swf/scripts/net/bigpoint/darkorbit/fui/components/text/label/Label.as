package net.bigpoint.darkorbit.fui.components.text.label
{
   import flash.text.TextFieldAutoSize;
   import net.bigpoint.darkorbit.fui.UISystem;
   import net.bigpoint.darkorbit.fui.builder.repository.TextStyleRepository;
   import net.bigpoint.darkorbit.fui.components.core.Coreponent;
   import net.bigpoint.darkorbit.fui.components.core.InvalidationType;
   import net.bigpoint.darkorbit.fui.components.text.IText;
   
   public class Label extends Coreponent implements IText
   {
       
      
      protected var _text:String;
      
      protected var _textStyleName:String;
      
      protected var _useHTML:Boolean;
      
      public function Label()
      {
         super();
      }
      
      protected function drawText() : void
      {
         var _loc1_:* = null;
         if(_skin)
         {
            _loc1_ = _skin as LabelSkin;
            _loc1_.useHTML = this._useHTML;
            _loc1_.textStyleName = this._textStyleName;
            _loc1_.text = this._text;
            if(_height == 0)
            {
               _height = _loc1_.height;
            }
            if(_width == 0 || TextStyleRepository.getInstance().getByName(this._textStyleName).autoSize != TextFieldAutoSize.NONE)
            {
               _width = _loc1_.width;
            }
         }
      }
      
      override protected function draw() : void
      {
         super.draw();
         if(isInvalidate(InvalidationType.TEXT))
         {
            this.drawText();
         }
         validate(InvalidationType.TEXT);
      }
      
      public function set localizedText(param1:String) : void
      {
         this.text = UISystem.localize(param1);
      }
      
      public function set text(param1:String) : void
      {
         if(this._text != param1)
         {
            this._text = param1;
            if(this._text == null)
            {
               this._text = "";
            }
            invalidate(InvalidationType.TEXT);
         }
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function set registeredTextStyleName(param1:String) : void
      {
         this._textStyleName = param1;
         invalidate(InvalidationType.SKIN);
      }
      
      public function getDisplayedText() : String
      {
         return (_skin as LabelSkin).textField.text;
      }
      
      public function set useHTML(param1:Boolean) : void
      {
         if(this._useHTML != param1)
         {
            this._useHTML = param1;
            invalidate(InvalidationType.TEXT);
         }
      }
      
      override public function getCalculatedWidth() : Number
      {
         if(_width == 0 && !_autoSizeWidth && _skin is LabelSkin)
         {
            return (_skin as LabelSkin).width;
         }
         return super.getCalculatedWidth();
      }
      
      override public function getCalculatedHeight() : Number
      {
         if(_height == 0 && !_autoSizeHeight && _skin is LabelSkin)
         {
            return (_skin as LabelSkin).height;
         }
         return super.getCalculatedHeight();
      }
   }
}
