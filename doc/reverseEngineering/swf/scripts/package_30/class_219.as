package package_30
{
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import net.bigpoint.darkorbit.class_18;
   
   public class class_219 extends class_91
   {
       
      
      private var _textField:TextField;
      
      private var var_4982:int;
      
      private var var_2881:int;
      
      private var text:String;
      
      private var align:String;
      
      private var format:TextFormat;
      
      private var border:Boolean;
      
      public function class_219(param1:int, param2:int, param3:TextFormat, param4:String = null, param5:String = "center", param6:Boolean = false)
      {
         super(class_91.const_586);
         this.var_4982 = param1;
         this.var_2881 = param2;
         this.format = param3;
         this.text = param4;
         this.align = param5;
         this.border = param6;
         this.init();
      }
      
      public function init() : void
      {
         this.format.align = this.align;
         this._textField = new TextField();
         this._textField.defaultTextFormat = this.format;
         this._textField.embedFonts = class_18.var_620;
         this._textField.wordWrap = true;
         this._textField.antiAliasType = AntiAliasType.ADVANCED;
         this.method_1283();
         this.method_1502();
         this._textField.border = this.border;
         this._textField.selectable = false;
         if(this.text != null)
         {
            this._textField.text = this.text;
         }
         this.addChild(this._textField);
      }
      
      private function method_1502() : void
      {
         this._textField.height = this.var_2881;
      }
      
      private function method_1283() : void
      {
         this._textField.width = this.var_4982;
      }
      
      public function method_1455(param1:String) : void
      {
         this._textField.text = param1;
      }
      
      public function get textField() : TextField
      {
         return this._textField;
      }
      
      public function set name_147(param1:int) : void
      {
         if(param1 != this.var_2881)
         {
            this.var_2881 = param1;
            this.method_1502();
         }
      }
      
      public function set name_96(param1:int) : void
      {
         if(param1 != this.var_4982)
         {
            this.var_4982 = param1;
            this.method_1283();
         }
      }
   }
}
