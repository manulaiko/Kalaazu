package net.bigpoint.darkorbit.fui.components.custom
{
   import com.greensock.TimelineMax;
   import com.greensock.TweenMax;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.Sprite;
   import flash.filters.BevelFilter;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.BitmapFilterType;
   import flash.filters.DropShadowFilter;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import net.bigpoint.darkorbit.fui.UISystem;
   import net.bigpoint.darkorbit.fui.builder.repository.TextStyleRepository;
   import net.bigpoint.darkorbit.fui.builder.repository.TextStyleVO;
   import net.bigpoint.darkorbit.fui.components.text.IText;
   import package_76.class_215;
   
   public class ResultLabel extends Sprite implements IText
   {
      
      private static const BEVEL:BevelFilter = new BevelFilter(1,45,16777215,1,0,1,1,1,1,BitmapFilterQuality.HIGH,BitmapFilterType.INNER,true);
      
      private static const BEVEL_FILTER:Array = [BEVEL];
      
      private static const DROP_SHADOW:DropShadowFilter = new DropShadowFilter(1,45,0,1,1,1);
      
      private static const DROP_SHADOW_FILTER:Array = [DROP_SHADOW];
      
      {
         DROP_SHADOW.quality = BitmapFilterQuality.HIGH;
      }
      
      private var _textField1:TextField;
      
      private var _textField2:TextField;
      
      private var _gradient:Sprite;
      
      private var _texture:Sprite;
      
      private var _shine:Bitmap;
      
      private var _textureContainer:Sprite;
      
      private var _background:Sprite;
      
      private var _width:Number = 0;
      
      private var _height:Number = 0;
      
      private var _flash:Bitmap;
      
      public function ResultLabel()
      {
         var _loc1_:* = null;
         this._textField1 = new TextField();
         this._textField2 = new TextField();
         this._gradient = new Sprite();
         this._texture = new Sprite();
         this._shine = new Bitmap();
         this._textureContainer = new Sprite();
         this._background = new Sprite();
         this._flash = new Bitmap();
         super();
         this._textField1.antiAliasType = this._textField2.antiAliasType = AntiAliasType.ADVANCED;
         this._textField2.autoSize = this._textField1.autoSize = TextFieldAutoSize.CENTER;
         this._textField2.selectable = this._textField1.selectable = false;
         _loc1_ = new Sprite();
         this._textureContainer.cacheAsBitmap = this._textField1.cacheAsBitmap = true;
         this._textureContainer.addChild(this._gradient);
         this._textureContainer.addChild(this._texture);
         this._textureContainer.addChild(this._shine);
         _loc1_.addChild(this._textureContainer);
         _loc1_.addChild(this._textField1);
         this._textureContainer.mask = this._textField1;
         _loc1_.addChild(this._textField2);
         _loc1_.filters = DROP_SHADOW_FILTER;
         this._textField2.filters = BEVEL_FILTER;
         addChild(this._background);
         addChild(this._flash);
         addChild(_loc1_);
      }
      
      public function set textFormat(param1:TextFormat) : void
      {
         this._textField2.defaultTextFormat = this._textField1.defaultTextFormat = param1;
      }
      
      public function set text(param1:String) : void
      {
         this._textField2.text = this._textField1.text = param1;
         var _loc2_:* = -this._textField1.height * 0.5 + this._height * 0.5;
         this._textField1.y = -this._textField1.height * 0.5 + this._height * 0.5;
         this._textField2.y = _loc2_;
         _loc2_ = -this._textField1.width * 0.5 + this._width * 0.5;
         this._textField1.x = -this._textField1.width * 0.5 + this._width * 0.5;
         this._textField2.x = _loc2_;
      }
      
      private function doTextureTween() : void
      {
         if(this._texture)
         {
            TweenMax.to(this._texture,5,{"alpha":1});
         }
      }
      
      private function doShineTween() : void
      {
         if(Boolean(this._shine) && Boolean(parent))
         {
            this._shine.x = 0;
            TweenMax.to(this._shine,3,{
               "x":this._textureContainer.width + this._shine.width,
               "onComplete":this.doShineTween
            });
         }
      }
      
      public function set shine(param1:BitmapData) : void
      {
         this._shine.bitmapData = param1;
         if(param1)
         {
            this.doShineTween();
         }
         else
         {
            TweenMax.killTweensOf(this._shine);
         }
      }
      
      public function set background(param1:BitmapData) : void
      {
         class_215.method_5129(this._background);
         this._background.addChild(new Bitmap(param1));
         this.updatelayout();
      }
      
      private function updatelayout() : void
      {
      }
      
      public function set gradient(param1:BitmapData) : void
      {
         this._gradient.graphics.clear();
         this._gradient.graphics.beginBitmapFill(param1);
         this._gradient.graphics.drawRect(0,0,this._width,this._height);
         this._gradient.graphics.endFill();
      }
      
      public function set flash(param1:BitmapData) : void
      {
         var _loc2_:* = null;
         this._flash.bitmapData = param1;
         if(param1)
         {
            this._flash.x = -this._flash.width * 0.5 + this._width * 0.5;
            this._flash.y = -this._flash.height * 0.5 + this._height * 0.5;
            _loc2_ = new TimelineMax();
            _loc2_.append(TweenMax.to(this._flash,0,{"transformAroundCenter":{
               "scaleX":0,
               "scaleY":0
            }}));
            _loc2_.append(TweenMax.to(this._flash,1,{
               "delay":1,
               "transformAroundCenter":{
                  "scaleX":1,
                  "scaleY":1
               }
            }));
            _loc2_.append(TweenMax.to(this._flash,0.5,{
               "delay":1.5,
               "transformAroundCenter":{
                  "scaleX":0,
                  "scaleY":0
               }
            }));
            _loc2_.play();
         }
      }
      
      public function set texture(param1:BitmapData) : void
      {
         this._texture.graphics.clear();
         this._texture.graphics.beginBitmapFill(param1,null,false);
         this._texture.graphics.drawRect(0,0,this._width,this._height);
         this._texture.graphics.endFill();
         this._texture.alpha = 0;
         this._texture.blendMode = BlendMode.MULTIPLY;
         if(param1)
         {
            this.doTextureTween();
         }
      }
      
      public function get text() : String
      {
         return this._textField1.text;
      }
      
      public function set localizedText(param1:String) : void
      {
         this.text = UISystem.localize(param1);
      }
      
      public function set registeredTextStyleName(param1:String) : void
      {
         var _loc2_:TextStyleVO = TextStyleRepository.getInstance().getByName(param1);
         _loc2_.assign(this._textField1);
         _loc2_.assign(this._textField2);
      }
      
      override public function set width(param1:Number) : void
      {
         this._textField1.width = this._textField2.width = param1;
         this._width = param1;
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = param1;
         this._textField1.height = this._textField2.height = param1;
      }
      
      public function set embededFonts(param1:Boolean) : void
      {
         this._textField1.embedFonts = this._textField2.embedFonts = param1;
      }
   }
}
