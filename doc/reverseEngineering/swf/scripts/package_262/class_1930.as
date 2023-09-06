package package_262
{
   import flash.display.Shape;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import net.bigpoint.darkorbit.class_18;
   import package_33.class_93;
   import package_83.class_1926;
   
   public class class_1930
   {
       
      
      private var var_4183:TextField;
      
      private var var_1192:TextField;
      
      private var var_2052:Shape;
      
      private var var_1697:TextField;
      
      private var var_2390:TextField;
      
      public function class_1930(param1:class_93)
      {
         super();
         this.decorate(param1);
      }
      
      private function decorate(param1:class_93) : void
      {
         this.var_4183 = new TextField();
         this.var_1192 = new TextField();
         this.var_1697 = new TextField();
         this.var_2390 = new TextField();
         this.var_2052 = new Shape();
         this.var_2052.graphics.drawRect(0,0,0,class_1926.const_505);
         var _loc2_:TextFormat = new TextFormat(class_18.const_740,class_18.const_2081,16777215,false);
         this.var_2390.defaultTextFormat = this.var_1192.defaultTextFormat = this.var_1697.defaultTextFormat = this.var_4183.defaultTextFormat = _loc2_;
         this.var_1192.defaultTextFormat.align = TextFormatAlign.RIGHT;
         this.var_4183.defaultTextFormat.align = TextFormatAlign.RIGHT;
         this.var_1697.embedFonts = this.var_2390.embedFonts = this.var_4183.embedFonts = this.var_1192.embedFonts = class_18.var_3911;
         this.var_1192.autoSize = this.var_4183.autoSize = TextFieldAutoSize.RIGHT;
         this.var_2390.autoSize = this.var_1697.autoSize = TextFieldAutoSize.LEFT;
         this.var_2390.selectable = this.var_1697.selectable = this.var_1192.selectable = this.var_4183.selectable = false;
         param1.addElement(this.var_1697,class_93.const_3298);
         param1.addElement(this.var_4183,class_93.const_2568);
         param1.addElement(this.var_2390,class_93.const_3298);
         param1.addElement(this.var_1192,class_93.const_2568);
         param1.addElement(this.var_2052,class_93.const_3298);
         this.method_1803();
      }
      
      private function method_1803() : void
      {
         this.var_2390.x = this.var_1192.x = this.var_1697.x = this.var_4183.x = 0;
         this.var_1192.width = this.var_4183.width = class_1926.const_1271;
      }
      
      public function get method_3880() : TextField
      {
         return this.var_4183;
      }
      
      public function get name_11() : TextField
      {
         return this.var_1192;
      }
      
      public function get method_264() : TextField
      {
         return this.var_1697;
      }
      
      public function get method_3721() : TextField
      {
         return this.var_2390;
      }
   }
}
