package spark.core
{
   import flash.accessibility.AccessibilityProperties;
   
   public interface IEditableText extends IDisplayText
   {
       
      
      function get accessibilityProperties() : AccessibilityProperties;
      
      function set accessibilityProperties(param1:AccessibilityProperties) : void;
      
      function get displayAsPassword() : Boolean;
      
      function set displayAsPassword(param1:Boolean) : void;
      
      function get editable() : Boolean;
      
      function set editable(param1:Boolean) : void;
      
      function get enabled() : Boolean;
      
      function set enabled(param1:Boolean) : void;
      
      function get focusEnabled() : Boolean;
      
      function set focusEnabled(param1:Boolean) : void;
      
      function get horizontalScrollPosition() : Number;
      
      function set horizontalScrollPosition(param1:Number) : void;
      
      function get lineBreak() : String;
      
      function set lineBreak(param1:String) : void;
      
      function get maxChars() : int;
      
      function set maxChars(param1:int) : void;
      
      function get multiline() : Boolean;
      
      function set multiline(param1:Boolean) : void;
      
      function get restrict() : String;
      
      function set restrict(param1:String) : void;
      
      function get selectable() : Boolean;
      
      function set selectable(param1:Boolean) : void;
      
      function get selectionActivePosition() : int;
      
      function get selectionAnchorPosition() : int;
      
      function get tabIndex() : int;
      
      function set tabIndex(param1:int) : void;
      
      function get verticalScrollPosition() : Number;
      
      function set verticalScrollPosition(param1:Number) : void;
      
      function scrollToRange(param1:int, param2:int) : void;
      
      function insertText(param1:String) : void;
      
      function appendText(param1:String) : void;
      
      function selectRange(param1:int, param2:int) : void;
      
      function selectAll() : void;
      
      function setFocus() : void;
   }
}
