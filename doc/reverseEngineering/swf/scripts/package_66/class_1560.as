package package_66
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import net.bigpoint.darkorbit.class_18;
   import package_11.class_39;
   import package_9.ResourceManager;
   
   public class class_1560 extends Sprite
   {
       
      
      private var var_2779:class_1045;
      
      public var textField:TextField;
      
      public function class_1560(param1:class_1045)
      {
         super();
         this.var_2779 = param1;
         this.init();
      }
      
      private function init() : void
      {
         var _loc1_:class_39 = class_39(ResourceManager.name_15.getFinisher("refinement"));
         var _loc2_:Bitmap = _loc1_.getEmbeddedBitmap("labelSlot");
         this.addChild(_loc2_);
         this.textField = new TextField();
         this.textField.defaultTextFormat = class_18.const_693;
         this.textField.embedFonts = class_18.var_603;
         this.textField.width = _loc2_.width;
         this.textField.multiline = false;
         this.textField.wordWrap = false;
         this.textField.autoSize = TextFieldAutoSize.CENTER;
         this.textField.textColor = 16777215;
         this.textField.antiAliasType = "advanced";
         this.textField.selectable = false;
         this.addChild(this.textField);
      }
      
      public function setText(param1:String) : void
      {
         this.textField.text = param1;
         this.textField.textColor = 16777215;
      }
   }
}
