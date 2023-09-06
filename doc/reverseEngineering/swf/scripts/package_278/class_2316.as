package package_278
{
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import net.bigpoint.darkorbit.class_18;
   import package_26.class_333;
   import package_26.class_94;
   import package_458.class_2548;
   import package_76.class_215;
   import package_99.class_266;
   
   public class class_2316 extends Sprite
   {
      
      private static const const_1732:int = 6;
       
      
      private var _color:uint;
      
      private var var_711:int;
      
      private var var_4297:TextField;
      
      private var var_2275:int = 0;
      
      private var _maxWidth:int = 2147483647;
      
      private var _maxHeight:int = 2147483647;
      
      private var _toolTip:class_333;
      
      private var var_3572:int = 6;
      
      public function class_2316()
      {
         this.var_4297 = new TextField();
         super();
         var _loc1_:TextFormat = new TextFormat(class_18.const_1629.font,class_18.const_1073);
         _loc1_.color = class_18.WHITE;
         _loc1_.align = TextFormatAlign.LEFT;
         _loc1_.leftMargin = 0;
         _loc1_.rightMargin = 0;
         this.var_4297.embedFonts = class_18.var_3911;
         this.var_4297.autoSize = TextFieldAutoSize.LEFT;
         this.var_4297.defaultTextFormat = _loc1_;
         this.var_4297.selectable = false;
         this.var_4297.filters = [new DropShadowFilter(1,45,0,1,1,1)];
         this._toolTip = class_94.getInstance().method_1211(this,"-");
         this.init();
      }
      
      private function init() : void
      {
         class_215.method_5129(this);
         addChild(this.var_4297);
         this.method_1359();
      }
      
      public function set method_6112(param1:int) : void
      {
         var _loc2_:Number = NaN;
         if(param1 != this.var_711)
         {
            this.var_711 = param1;
            _loc2_ = Number(this.var_4297.width);
            this.var_4297.text = this.var_711.toString();
            if(_loc2_ != this.var_4297.width)
            {
               this.drawBackground();
            }
            this.method_1359();
         }
      }
      
      private function drawBackground() : void
      {
         var _loc1_:Graphics = this.graphics;
         var _loc2_:Array = [this._color,3355443];
         var _loc3_:* = [1,1];
         var _loc4_:* = [0,255];
         var _loc5_:Matrix = new Matrix();
         var _loc6_:int = this.var_4297.width + this.var_2275;
         var _loc7_:int = (_loc7_ = this.var_4297.height + this.var_2275) > this._maxHeight ? int(this._maxHeight) : _loc7_;
         _loc6_ = (_loc6_ = _loc6_ > _loc7_ ? _loc6_ : _loc7_) > this._maxWidth ? int(this._maxWidth) : _loc6_;
         _loc5_.createGradientBox(_loc6_,_loc7_,class_266.method_1180(90));
         _loc1_.clear();
         _loc1_.beginFill(1842204);
         _loc1_.drawRoundRect(0,0,_loc6_,_loc7_,this.var_3572);
         _loc1_.endFill();
         _loc1_.beginGradientFill(GradientType.LINEAR,_loc2_,_loc3_,_loc4_,_loc5_);
         _loc1_.drawRoundRect(this.var_2275,this.var_2275,_loc6_ - Number(this.var_2275) * 2,_loc7_ - Number(this.var_2275) * 2,this.var_3572);
         _loc1_.endFill();
      }
      
      private function method_1359() : void
      {
         this.var_4297.x = (Number(width) - Number(this.var_4297.width)) * 0.5;
         this.var_4297.y = (Number(height) - Number(this.var_4297.height) - 0) * 0.5;
      }
      
      public function set method_4219(param1:int) : void
      {
         if(this.var_2275 != param1)
         {
            this.var_2275 = param1;
         }
         this.method_1359();
      }
      
      public function set maxWidth(param1:int) : void
      {
         this._maxWidth = param1;
         this.method_1359();
      }
      
      public function set maxHeight(param1:int) : void
      {
         if(this._maxHeight != param1)
         {
            this._maxHeight = param1;
            this.method_1359();
            this.drawBackground();
         }
      }
      
      public function set method_1407(param1:Boolean) : void
      {
         if(param1)
         {
            this.method_3136();
         }
         else
         {
            this.method_3138();
         }
      }
      
      private function method_3138() : void
      {
         this.filters = [];
      }
      
      private function method_4024() : GlowFilter
      {
         return new GlowFilter(this._color,10,6,6,2,1,false,false);
      }
      
      private function method_3136() : void
      {
         this.filters = [this.method_4024()];
      }
      
      public function set color(param1:uint) : void
      {
         if(this._color != param1)
         {
            this._color = param1;
            this.drawBackground();
            this.method_1359();
         }
      }
      
      public function set toolTip(param1:String) : void
      {
         this._toolTip.method_1455(param1);
      }
      
      public function set cornerRadius(param1:int) : void
      {
         if(param1 != this.var_3572)
         {
            this.var_3572 = param1;
            this.drawBackground();
         }
      }
   }
}
