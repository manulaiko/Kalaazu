package net.bigpoint.darkorbit.gui.windows
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import net.bigpoint.darkorbit.class_126;
   import net.bigpoint.darkorbit.class_18;
   import net.bigpoint.darkorbit.class_81;
   import package_11.class_39;
   import package_30.class_1192;
   import package_9.ResourceManager;
   
   public class class_1691 extends Sprite
   {
       
      
      private var id:int;
      
      private var var_1975:class_1192;
      
      public var var_3626:int;
      
      private var var_3156:Bitmap;
      
      private var textField:TextField;
      
      public function class_1691(param1:class_1192, param2:int, param3:int)
      {
         super();
         this.id = param2;
         this.var_1975 = param1;
         this.var_3626 = param3;
         this.init();
      }
      
      public function method_848() : void
      {
         var _loc1_:class_39 = class_39(ResourceManager.name_15.getFinisher("ui"));
         var _loc2_:Bitmap = _loc1_.getEmbeddedBitmap("ctb_undefined");
         this.addChildAt(_loc2_,0);
      }
      
      private function init() : void
      {
         var _loc1_:class_39 = class_39(ResourceManager.name_15.getFinisher("ui"));
         var _loc2_:Bitmap = _loc1_.getEmbeddedBitmap("company_symbol_" + this.var_3626);
         _loc2_.x = 3.5;
         this.addChild(_loc2_);
         this.var_3156 = _loc1_.getEmbeddedBitmap("home_symbol");
         this.var_3156.x = 17;
         this.addChild(this.var_3156);
      }
      
      public function update(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!this.var_1975.contains(this))
         {
            this.var_1975.addChild(this);
         }
         if(param1 == 0)
         {
            this.var_3156.visible = true;
            if(this.textField != null)
            {
               this.textField.visible = false;
            }
         }
         else
         {
            this.var_3156.visible = false;
            if(this.textField == null)
            {
               _loc3_ = new TextFormat(class_18.const_1629.font,11,16777215);
               this.textField = new TextField();
               this.textField.x = 17;
               this.textField.y = -3;
               this.textField.defaultTextFormat = _loc3_;
               this.textField.embedFonts = class_18.var_620;
               this.textField.wordWrap = true;
               this.textField.antiAliasType = AntiAliasType.ADVANCED;
               this.textField.width = Number(this.var_1975.method_5979().width) - Number(this.textField.x);
               this.textField.height = 10;
               this.textField.selectable = false;
               this.addChild(this.textField);
            }
            this.textField.visible = true;
            _loc2_ = class_126.instance.var_1524[param1];
            this.textField.text = _loc2_;
         }
      }
      
      public function getID() : int
      {
         return this.id;
      }
      
      public function get name_13() : int
      {
         return this.var_3626;
      }
      
      public function set name_13(param1:int) : void
      {
         this.var_3626 = param1;
      }
   }
}
