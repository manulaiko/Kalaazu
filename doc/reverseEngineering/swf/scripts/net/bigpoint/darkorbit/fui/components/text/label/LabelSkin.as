package net.bigpoint.darkorbit.fui.components.text.label
{
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.utils.Dictionary;
   import net.bigpoint.darkorbit.fui.builder.repository.TextStyleRepository;
   import net.bigpoint.darkorbit.fui.builder.repository.TextStyleVO;
   import net.bigpoint.darkorbit.fui.components.core.skins.BasicSkin;
   import net.bigpoint.darkorbit.fui.components.core.skins.ISkin;
   import net.bigpoint.darkorbit.fui.components.core.skins.SkinLayerNames;
   
   public class LabelSkin extends BasicSkin
   {
      
      private static var _skinLayerDefintions:Dictionary = new Dictionary();
      
      {
         _skinLayerDefintions[SkinLayerNames.NORMAL] = {};
         _skinLayerDefintions[SkinLayerNames.DISABLED] = {};
      }
      
      protected var _msgLabel:TextField;
      
      protected var _fullText:String;
      
      protected var _textStyleName:String;
      
      protected var _useHTML:Boolean = false;
      
      protected var _truncateText:Boolean = false;
      
      public function LabelSkin()
      {
         this._msgLabel = new TextField();
         super();
      }
      
      override public function getSkinLayerDefintions() : Dictionary
      {
         return _skinLayerDefintions;
      }
      
      override public function init() : void
      {
         super.init();
         if(true)
         {
         }
         this.assignTextStyle();
         addChild(this._msgLabel);
      }
      
      protected function assignTextStyle() : void
      {
         var _loc1_:* = null;
         if(this._textStyleName)
         {
            _loc1_ = TextStyleRepository.getInstance().getByName(this._textStyleName);
            if(Boolean(_loc1_) && Boolean(this._msgLabel))
            {
               _loc1_.assign(this._msgLabel);
            }
         }
      }
      
      public function set textStyleName(param1:String) : void
      {
         this._textStyleName = param1;
         this.assignTextStyle();
      }
      
      public function set text(param1:String) : void
      {
         if(Boolean(this._msgLabel) && param1 != null)
         {
            if(this._useHTML)
            {
               this._msgLabel.htmlText = param1;
            }
            else
            {
               this._fullText = param1;
               this._msgLabel.text = this._fullText;
               if(this._truncateText)
               {
                  this.truncateLabelText();
               }
               if(this._msgLabel.autoSize != TextFieldAutoSize.NONE)
               {
                  this.width = this._msgLabel.width;
               }
            }
         }
      }
      
      public function set useHTML(param1:Boolean) : void
      {
         this._useHTML = param1;
      }
      
      public function set truncateText(param1:Boolean) : void
      {
         this._truncateText = param1;
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         if(this._msgLabel)
         {
            this._msgLabel.width = param1;
            if(this._fullText)
            {
               this._msgLabel.text = this._fullText;
               if(this._truncateText)
               {
                  this.truncateLabelText();
               }
            }
         }
      }
      
      private function truncateLabelText() : void
      {
         while(this._msgLabel.textWidth + 4 > this._msgLabel.width && this._msgLabel.text.length >= 4)
         {
            this._msgLabel.text = this._msgLabel.text.substr(0,this._msgLabel.text.length - 4) + "...";
         }
      }
      
      override public function set height(param1:Number) : void
      {
         super.height = param1;
         if(this._msgLabel)
         {
            this._msgLabel.height = param1;
         }
      }
      
      override public function get height() : Number
      {
         return super.height;
      }
      
      override public function get width() : Number
      {
         return super.width;
      }
      
      public function get textField() : TextField
      {
         return this._msgLabel;
      }
      
      override public function clone() : ISkin
      {
         var _loc1_:LabelSkin = new LabelSkin();
         _clone_(_loc1_,_skinLayerDefintions);
         _loc1_.truncateText = this._truncateText;
         return _loc1_;
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
