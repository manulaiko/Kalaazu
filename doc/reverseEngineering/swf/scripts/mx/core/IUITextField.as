package mx.core
{
   import flash.display.DisplayObject;
   import flash.geom.Rectangle;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import flash.text.TextLineMetrics;
   import mx.managers.IToolTipManagerClient;
   import mx.styles.ISimpleStyleClient;
   
   public interface IUITextField extends IIMESupport, IFlexModule, IInvalidating, ISimpleStyleClient, IToolTipManagerClient, IUIComponent
   {
       
      
      function get alwaysShowSelection() : Boolean;
      
      function set alwaysShowSelection(param1:Boolean) : void;
      
      function get antiAliasType() : String;
      
      function set antiAliasType(param1:String) : void;
      
      function get autoSize() : String;
      
      function set autoSize(param1:String) : void;
      
      function get background() : Boolean;
      
      function set background(param1:Boolean) : void;
      
      function get backgroundColor() : uint;
      
      function set backgroundColor(param1:uint) : void;
      
      function get border() : Boolean;
      
      function set border(param1:Boolean) : void;
      
      function get borderColor() : uint;
      
      function set borderColor(param1:uint) : void;
      
      function get bottomScrollV() : int;
      
      function get caretIndex() : int;
      
      function get condenseWhite() : Boolean;
      
      function set condenseWhite(param1:Boolean) : void;
      
      function get defaultTextFormat() : TextFormat;
      
      function set defaultTextFormat(param1:TextFormat) : void;
      
      function get embedFonts() : Boolean;
      
      function set embedFonts(param1:Boolean) : void;
      
      function get gridFitType() : String;
      
      function set gridFitType(param1:String) : void;
      
      function get htmlText() : String;
      
      function set htmlText(param1:String) : void;
      
      function get length() : int;
      
      function get maxChars() : int;
      
      function set maxChars(param1:int) : void;
      
      function get maxScrollH() : int;
      
      function get maxScrollV() : int;
      
      function get mouseWheelEnabled() : Boolean;
      
      function set mouseWheelEnabled(param1:Boolean) : void;
      
      function get multiline() : Boolean;
      
      function set multiline(param1:Boolean) : void;
      
      function get numLines() : int;
      
      function get displayAsPassword() : Boolean;
      
      function set displayAsPassword(param1:Boolean) : void;
      
      function get restrict() : String;
      
      function set restrict(param1:String) : void;
      
      function get scrollH() : int;
      
      function set scrollH(param1:int) : void;
      
      function get scrollV() : int;
      
      function set scrollV(param1:int) : void;
      
      function get selectable() : Boolean;
      
      function set selectable(param1:Boolean) : void;
      
      function get selectionBeginIndex() : int;
      
      function get selectionEndIndex() : int;
      
      function get sharpness() : Number;
      
      function set sharpness(param1:Number) : void;
      
      function get styleSheet() : StyleSheet;
      
      function set styleSheet(param1:StyleSheet) : void;
      
      function get text() : String;
      
      function set text(param1:String) : void;
      
      function get textColor() : uint;
      
      function set textColor(param1:uint) : void;
      
      function get textHeight() : Number;
      
      function get textWidth() : Number;
      
      function get thickness() : Number;
      
      function set thickness(param1:Number) : void;
      
      function get type() : String;
      
      function set type(param1:String) : void;
      
      function get wordWrap() : Boolean;
      
      function set wordWrap(param1:Boolean) : void;
      
      function appendText(param1:String) : void;
      
      function getCharBoundaries(param1:int) : Rectangle;
      
      function getCharIndexAtPoint(param1:Number, param2:Number) : int;
      
      function getFirstCharInParagraph(param1:int) : int;
      
      function getLineIndexAtPoint(param1:Number, param2:Number) : int;
      
      function getLineIndexOfChar(param1:int) : int;
      
      function getLineLength(param1:int) : int;
      
      function getLineMetrics(param1:int) : TextLineMetrics;
      
      function getLineOffset(param1:int) : int;
      
      function getLineText(param1:int) : String;
      
      function getParagraphLength(param1:int) : int;
      
      function getTextFormat(param1:int = -1, param2:int = -1) : TextFormat;
      
      function replaceSelectedText(param1:String) : void;
      
      function replaceText(param1:int, param2:int, param3:String) : void;
      
      function setSelection(param1:int, param2:int) : void;
      
      function setTextFormat(param1:TextFormat, param2:int = -1, param3:int = -1) : void;
      
      function getImageReference(param1:String) : DisplayObject;
      
      function get useRichTextClipboard() : Boolean;
      
      function set useRichTextClipboard(param1:Boolean) : void;
      
      function get tabEnabled() : Boolean;
      
      function set tabEnabled(param1:Boolean) : void;
      
      function get tabIndex() : int;
      
      function set tabIndex(param1:int) : void;
      
      function get focusRect() : Object;
      
      function set focusRect(param1:Object) : void;
      
      function get mouseEnabled() : Boolean;
      
      function set mouseEnabled(param1:Boolean) : void;
      
      function get doubleClickEnabled() : Boolean;
      
      function set doubleClickEnabled(param1:Boolean) : void;
      
      function get ignorePadding() : Boolean;
      
      function set ignorePadding(param1:Boolean) : void;
      
      function get inheritingStyles() : Object;
      
      function set inheritingStyles(param1:Object) : void;
      
      function get nestLevel() : int;
      
      function set nestLevel(param1:int) : void;
      
      function get nonInheritingStyles() : Object;
      
      function set nonInheritingStyles(param1:Object) : void;
      
      function get nonZeroTextHeight() : Number;
      
      function getStyle(param1:String) : *;
      
      function getUITextFormat() : UITextFormat;
      
      function setColor(param1:uint) : void;
      
      function setFocus() : void;
      
      function truncateToFit(param1:String = null) : Boolean;
   }
}
