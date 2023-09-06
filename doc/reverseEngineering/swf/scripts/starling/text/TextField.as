package starling.text
{
   import flash.display.BitmapData;
   import flash.display.StageQuality;
   import flash.display3D.Context3DTextureFormat;
   import flash.filters.BitmapFilter;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.text.AntiAliasType;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   import starling.core.RenderSupport;
   import starling.core.Starling;
   import starling.display.DisplayObject;
   import starling.display.DisplayObjectContainer;
   import starling.display.Image;
   import starling.display.Quad;
   import starling.display.QuadBatch;
   import starling.display.Sprite;
   import starling.events.Event;
   import starling.textures.Texture;
   import starling.utils.HAlign;
   import starling.utils.RectangleUtil;
   import starling.utils.VAlign;
   import starling.utils.deg2rad;
   
   public class TextField extends DisplayObjectContainer
   {
      
      private static const BITMAP_FONT_DATA_NAME:String = "starling.display.TextField.BitmapFonts";
      
      private static var sDefaultTextureFormat:String = "BGRA_PACKED" in Context3DTextureFormat ? "bgraPacked4444" : "bgra";
      
      private static var sHelperMatrix:Matrix = new Matrix();
      
      private static var sNativeTextField:flash.text.TextField = new flash.text.TextField();
       
      
      private var mFontSize:Number;
      
      private var mColor:uint;
      
      private var mText:String;
      
      private var mFontName:String;
      
      private var mHAlign:String;
      
      private var mVAlign:String;
      
      private var mBold:Boolean;
      
      private var mItalic:Boolean;
      
      private var mUnderline:Boolean;
      
      private var mAutoScale:Boolean;
      
      private var mAutoSize:String;
      
      private var mKerning:Boolean;
      
      private var mNativeFilters:Array;
      
      private var mRequiresRedraw:Boolean;
      
      private var mIsRenderedText:Boolean;
      
      private var mTextBounds:Rectangle;
      
      private var mBatchable:Boolean;
      
      private var mHitArea:Rectangle;
      
      private var mBorder:DisplayObjectContainer;
      
      private var mImage:Image;
      
      private var mQuadBatch:QuadBatch;
      
      public function TextField(param1:int, param2:int, param3:String, param4:String = "Verdana", param5:Number = 12, param6:uint = 0, param7:Boolean = false)
      {
         super();
         this.mText = !!param3 ? param3 : "";
         this.mFontSize = param5;
         this.mColor = param6;
         this.mHAlign = HAlign.CENTER;
         this.mVAlign = VAlign.CENTER;
         this.mBorder = null;
         this.mKerning = true;
         this.mBold = param7;
         this.mAutoSize = TextFieldAutoSize.NONE;
         this.mHitArea = new Rectangle(0,0,param1,param2);
         this.fontName = param4;
         addEventListener(Event.FLATTEN,this.onFlatten);
      }
      
      public static function get defaultTextureFormat() : String
      {
         return sDefaultTextureFormat;
      }
      
      public static function set defaultTextureFormat(param1:String) : void
      {
         sDefaultTextureFormat = param1;
      }
      
      public static function registerBitmapFont(param1:BitmapFont, param2:String = null) : String
      {
         if(param2 == null)
         {
            param2 = param1.name;
         }
         bitmapFonts[param2.toLowerCase()] = param1;
         return param2;
      }
      
      public static function unregisterBitmapFont(param1:String, param2:Boolean = true) : void
      {
         param1 = param1.toLowerCase();
         if(param2 && bitmapFonts[param1] != undefined)
         {
            bitmapFonts[param1].dispose();
         }
         delete bitmapFonts[param1];
      }
      
      public static function getBitmapFont(param1:String) : BitmapFont
      {
         return bitmapFonts[param1.toLowerCase()];
      }
      
      private static function get bitmapFonts() : Dictionary
      {
         var _loc1_:Dictionary = Starling.current.contextData[BITMAP_FONT_DATA_NAME] as Dictionary;
         if(_loc1_ == null)
         {
            _loc1_ = new Dictionary();
            Starling.current.contextData[BITMAP_FONT_DATA_NAME] = _loc1_;
         }
         return _loc1_;
      }
      
      override public function dispose() : void
      {
         removeEventListener(Event.FLATTEN,this.onFlatten);
         if(this.mImage)
         {
            this.mImage.texture.dispose();
         }
         if(this.mQuadBatch)
         {
            this.mQuadBatch.dispose();
         }
         super.dispose();
      }
      
      private function onFlatten() : void
      {
         if(this.mRequiresRedraw)
         {
            this.redraw();
         }
      }
      
      override public function render(param1:RenderSupport, param2:Number) : void
      {
         if(this.mRequiresRedraw)
         {
            this.redraw();
         }
         super.render(param1,param2);
      }
      
      public function redraw() : void
      {
         if(this.mRequiresRedraw)
         {
            if(this.mIsRenderedText)
            {
               this.createRenderedContents();
            }
            else
            {
               this.createComposedContents();
            }
            this.updateBorder();
            this.mRequiresRedraw = false;
         }
      }
      
      private function createRenderedContents() : void
      {
         var bitmapData:BitmapData;
         var format:String;
         var scale:Number = NaN;
         var texture:Texture = null;
         if(this.mQuadBatch)
         {
            this.mQuadBatch.removeFromParent(true);
            this.mQuadBatch = null;
         }
         if(this.mTextBounds == null)
         {
            this.mTextBounds = new Rectangle();
         }
         scale = 0;
         bitmapData = this.renderText(scale,this.mTextBounds);
         format = sDefaultTextureFormat;
         this.mHitArea.width = bitmapData.width / scale;
         this.mHitArea.height = bitmapData.height / scale;
         texture = Texture.fromBitmapData(bitmapData,false,false,scale,format);
         texture.root.onRestore = function():void
         {
            if(mTextBounds == null)
            {
               mTextBounds = new Rectangle();
            }
            texture.root.uploadBitmapData(renderText(scale,mTextBounds));
         };
         bitmapData.dispose();
         if(this.mImage == null)
         {
            this.mImage = new Image(texture);
            this.mImage.touchable = false;
            addChild(this.mImage);
         }
         else
         {
            this.mImage.texture.dispose();
            this.mImage.texture = texture;
            this.mImage.readjustSize();
         }
      }
      
      protected function formatText(param1:flash.text.TextField, param2:TextFormat) : void
      {
      }
      
      private function renderText(param1:Number, param2:Rectangle) : BitmapData
      {
         var _loc3_:Number = this.mHitArea.width * param1;
         var _loc4_:Number = this.mHitArea.height * param1;
         var _loc5_:String = this.mHAlign;
         var _loc6_:String = this.mVAlign;
         if(this.isHorizontalAutoSize)
         {
            _loc3_ = 0;
            _loc5_ = "null";
         }
         if(this.isVerticalAutoSize)
         {
            _loc4_ = 0;
            _loc6_ = "null";
         }
         var _loc7_:TextFormat;
         (_loc7_ = new TextFormat(this.mFontName,this.mFontSize * param1,this.mColor,this.mBold,this.mItalic,this.mUnderline,null,null,_loc5_)).kerning = this.mKerning;
         sNativeTextField.defaultTextFormat = _loc7_;
         sNativeTextField.width = _loc3_;
         sNativeTextField.height = _loc4_;
         sNativeTextField.antiAliasType = AntiAliasType.ADVANCED;
         sNativeTextField.selectable = false;
         sNativeTextField.multiline = true;
         sNativeTextField.wordWrap = true;
         sNativeTextField.text = this.mText;
         sNativeTextField.embedFonts = true;
         sNativeTextField.filters = this.mNativeFilters;
         if(false)
         {
            sNativeTextField.embedFonts = false;
         }
         this.formatText(sNativeTextField,_loc7_);
         if(this.mAutoScale)
         {
            this.autoScaleNativeTextField(sNativeTextField);
         }
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         if(this.isHorizontalAutoSize)
         {
            sNativeTextField.width = _loc3_ = Math.ceil(_loc8_ + 5);
         }
         if(this.isVerticalAutoSize)
         {
            sNativeTextField.height = _loc4_ = Math.ceil(_loc9_ + 4);
         }
         if(_loc3_ < 1)
         {
            _loc3_ = 1;
         }
         if(_loc4_ < 1)
         {
            _loc4_ = 1;
         }
         var _loc10_:Number = 0;
         if(_loc5_ == HAlign.LEFT)
         {
            _loc10_ = 2;
         }
         else if(_loc5_ == HAlign.CENTER)
         {
            _loc10_ = (_loc3_ - _loc8_) / 2;
         }
         else if(_loc5_ == HAlign.RIGHT)
         {
            _loc10_ = _loc3_ - _loc8_ - 2;
         }
         var _loc11_:Number = 0;
         if(_loc6_ == VAlign.TOP)
         {
            _loc11_ = 2;
         }
         else if(_loc6_ == VAlign.CENTER)
         {
            _loc11_ = (_loc4_ - _loc9_) / 2;
         }
         else if(_loc6_ == VAlign.BOTTOM)
         {
            _loc11_ = _loc4_ - _loc9_ - 2;
         }
         var _loc12_:Point = this.calculateFilterOffset(sNativeTextField,_loc5_,_loc6_);
         var _loc13_:BitmapData = new BitmapData(_loc3_,_loc4_,true,0);
         var _loc14_:Matrix = new Matrix(1,0,0,1,_loc12_.x,_loc12_.y + int(_loc11_) - 2);
         if(("drawWithQuality" in _loc13_ ? _loc13_["drawWithQuality"] : null) is Function)
         {
            null.call(_loc13_,sNativeTextField,_loc14_,null,null,null,false,StageQuality.MEDIUM);
         }
         else
         {
            _loc13_.draw(sNativeTextField,_loc14_);
         }
         sNativeTextField.text = "";
         param2.setTo((_loc10_ + _loc12_.x) / param1,(_loc11_ + _loc12_.y) / param1,_loc8_ / param1,_loc9_ / param1);
         return _loc13_;
      }
      
      private function autoScaleNativeTextField(param1:flash.text.TextField) : void
      {
         var _loc5_:* = null;
         var _loc2_:Number = Number(param1.defaultTextFormat.size);
         var _loc3_:int = param1.height - 4;
         var _loc4_:int = param1.width - 4;
         while(param1.textWidth > _loc4_ || param1.textHeight > _loc3_)
         {
            if(_loc2_ <= 4)
            {
               break;
            }
            (_loc5_ = param1.defaultTextFormat).size = _loc2_--;
            param1.setTextFormat(_loc5_);
         }
      }
      
      private function calculateFilterOffset(param1:flash.text.TextField, param2:String, param3:String) : Point
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:* = null;
         var _loc4_:Point = new Point();
         var _loc5_:Array;
         if((_loc5_ = param1.filters) != null && _loc5_.length > 0)
         {
            _loc6_ = param1.textWidth;
            _loc7_ = param1.textHeight;
            _loc8_ = new Rectangle();
            for each(_loc9_ in _loc5_)
            {
               _loc10_ = "blurX" in _loc9_ ? Number(_loc9_["blurX"]) : 0;
               _loc11_ = "blurY" in _loc9_ ? Number(_loc9_["blurY"]) : 0;
               _loc12_ = "angle" in _loc9_ ? Number(_loc9_["angle"]) : 0;
               _loc13_ = "distance" in _loc9_ ? Number(_loc9_["distance"]) : 0;
               _loc14_ = deg2rad(_loc12_);
               _loc15_ = _loc10_ * 1.33;
               _loc16_ = _loc11_ * 1.33;
               _loc17_ = Math.cos(_loc14_) * _loc13_ - _loc15_ / 2;
               _loc18_ = Math.sin(_loc14_) * _loc13_ - _loc16_ / 2;
               _loc19_ = new Rectangle(_loc17_,_loc18_,_loc6_ + _loc15_,_loc7_ + _loc16_);
               _loc8_ = _loc8_.union(_loc19_);
            }
            if(param2 == HAlign.LEFT && _loc8_.x < 0)
            {
               _loc4_.x = -_loc8_.x;
            }
            else if(param2 == HAlign.RIGHT && _loc8_.y > 0)
            {
               _loc4_.x = -(_loc8_.right - _loc6_);
            }
            if(param3 == VAlign.TOP && _loc8_.y < 0)
            {
               _loc4_.y = -_loc8_.y;
            }
            else if(param3 == VAlign.BOTTOM && _loc8_.y > 0)
            {
               _loc4_.y = -(_loc8_.bottom - _loc7_);
            }
         }
         return _loc4_;
      }
      
      private function createComposedContents() : void
      {
         if(this.mImage)
         {
            this.mImage.removeFromParent(true);
            this.mImage.texture.dispose();
            this.mImage = null;
         }
         if(this.mQuadBatch == null)
         {
            this.mQuadBatch = new QuadBatch();
            this.mQuadBatch.touchable = false;
            addChild(this.mQuadBatch);
         }
         else
         {
            this.mQuadBatch.reset();
         }
         var _loc1_:BitmapFont = getBitmapFont(this.mFontName);
         if(_loc1_ == null)
         {
            throw new Error("Bitmap font not registered: " + this.mFontName);
         }
         var _loc2_:Number = this.mHitArea.width;
         var _loc3_:Number = this.mHitArea.height;
         var _loc4_:String = this.mHAlign;
         var _loc5_:String = this.mVAlign;
         if(this.isHorizontalAutoSize)
         {
            _loc2_ = 0;
            _loc4_ = "null";
         }
         if(this.isVerticalAutoSize)
         {
            _loc3_ = 0;
            _loc5_ = "null";
         }
         _loc1_.fillQuadBatch(this.mQuadBatch,_loc2_,_loc3_,this.mText,this.mFontSize,this.mColor,_loc4_,_loc5_,this.mAutoScale,this.mKerning);
         this.mQuadBatch.batchable = this.mBatchable;
         if(this.mAutoSize != TextFieldAutoSize.NONE)
         {
            this.mTextBounds = this.mQuadBatch.getBounds(this.mQuadBatch,this.mTextBounds);
            if(this.isHorizontalAutoSize)
            {
               this.mHitArea.width = this.mTextBounds.x + this.mTextBounds.width;
            }
            if(this.isVerticalAutoSize)
            {
               this.mHitArea.height = this.mTextBounds.y + this.mTextBounds.height;
            }
         }
         else
         {
            this.mTextBounds = null;
         }
      }
      
      private function updateBorder() : void
      {
         if(this.mBorder == null)
         {
            return;
         }
         var _loc1_:Number = this.mHitArea.width;
         var _loc2_:Number = this.mHitArea.height;
         var _loc3_:Quad = this.mBorder.getChildAt(0) as Quad;
         var _loc4_:Quad = this.mBorder.getChildAt(1) as Quad;
         var _loc5_:Quad = this.mBorder.getChildAt(2) as Quad;
         var _loc6_:Quad = this.mBorder.getChildAt(3) as Quad;
         _loc3_.width = _loc1_;
         _loc3_.height = 1;
         _loc5_.width = _loc1_;
         _loc5_.height = 1;
         _loc6_.width = 1;
         _loc6_.height = _loc2_;
         _loc4_.width = 1;
         _loc4_.height = _loc2_;
         _loc4_.x = _loc1_ - 1;
         _loc5_.y = _loc2_ - 1;
         _loc3_.color = _loc4_.color = _loc5_.color = _loc6_.color = this.mColor;
      }
      
      private function get isHorizontalAutoSize() : Boolean
      {
         return this.mAutoSize == TextFieldAutoSize.HORIZONTAL || this.mAutoSize == TextFieldAutoSize.BOTH_DIRECTIONS;
      }
      
      private function get isVerticalAutoSize() : Boolean
      {
         return this.mAutoSize == TextFieldAutoSize.VERTICAL || this.mAutoSize == TextFieldAutoSize.BOTH_DIRECTIONS;
      }
      
      public function get textBounds() : Rectangle
      {
         if(this.mRequiresRedraw)
         {
            this.redraw();
         }
         if(this.mTextBounds == null)
         {
            this.mTextBounds = this.mQuadBatch.getBounds(this.mQuadBatch);
         }
         return this.mTextBounds.clone();
      }
      
      override public function getBounds(param1:DisplayObject, param2:Rectangle = null) : Rectangle
      {
         if(this.mRequiresRedraw)
         {
            this.redraw();
         }
         getTransformationMatrix(param1,sHelperMatrix);
         return RectangleUtil.getBounds(this.mHitArea,sHelperMatrix,param2);
      }
      
      override public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
      {
         if(param2 && (!visible || !touchable))
         {
            return null;
         }
         if(this.mHitArea.containsPoint(param1))
         {
            return this;
         }
         return null;
      }
      
      override public function set width(param1:Number) : void
      {
         this.mHitArea.width = param1;
         this.mRequiresRedraw = true;
      }
      
      override public function set height(param1:Number) : void
      {
         this.mHitArea.height = param1;
         this.mRequiresRedraw = true;
      }
      
      public function get text() : String
      {
         return this.mText;
      }
      
      public function set text(param1:String) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(this.mText != param1)
         {
            this.mText = param1;
            this.mRequiresRedraw = true;
         }
      }
      
      public function get fontName() : String
      {
         return this.mFontName;
      }
      
      public function set fontName(param1:String) : void
      {
         if(this.mFontName != param1)
         {
            if(param1 == BitmapFont.MINI && bitmapFonts[param1] == undefined)
            {
               registerBitmapFont(new BitmapFont());
            }
            this.mFontName = param1;
            this.mRequiresRedraw = true;
            this.mIsRenderedText = getBitmapFont(param1) == null;
         }
      }
      
      public function get fontSize() : Number
      {
         return this.mFontSize;
      }
      
      public function set fontSize(param1:Number) : void
      {
         if(this.mFontSize != param1)
         {
            this.mFontSize = param1;
            this.mRequiresRedraw = true;
         }
      }
      
      public function get color() : uint
      {
         return this.mColor;
      }
      
      public function set color(param1:uint) : void
      {
         if(this.mColor != param1)
         {
            this.mColor = param1;
            this.mRequiresRedraw = true;
         }
      }
      
      public function get hAlign() : String
      {
         return this.mHAlign;
      }
      
      public function set hAlign(param1:String) : void
      {
         if(!HAlign.isValid(param1))
         {
            throw new ArgumentError("Invalid horizontal align: " + param1);
         }
         if(this.mHAlign != param1)
         {
            this.mHAlign = param1;
            this.mRequiresRedraw = true;
         }
      }
      
      public function get vAlign() : String
      {
         return this.mVAlign;
      }
      
      public function set vAlign(param1:String) : void
      {
         if(!VAlign.isValid(param1))
         {
            throw new ArgumentError("Invalid vertical align: " + param1);
         }
         if(this.mVAlign != param1)
         {
            this.mVAlign = param1;
            this.mRequiresRedraw = true;
         }
      }
      
      public function get border() : Boolean
      {
         return this.mBorder != null;
      }
      
      public function set border(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(param1 && this.mBorder == null)
         {
            this.mBorder = new Sprite();
            addChild(this.mBorder);
            _loc2_ = 0;
            while(_loc2_ < 4)
            {
               this.mBorder.addChild(new Quad(1,1));
               _loc2_++;
            }
            this.updateBorder();
         }
         else if(!param1 && this.mBorder != null)
         {
            this.mBorder.removeFromParent(true);
            this.mBorder = null;
         }
      }
      
      public function get bold() : Boolean
      {
         return this.mBold;
      }
      
      public function set bold(param1:Boolean) : void
      {
         if(this.mBold != param1)
         {
            this.mBold = param1;
            this.mRequiresRedraw = true;
         }
      }
      
      public function get italic() : Boolean
      {
         return this.mItalic;
      }
      
      public function set italic(param1:Boolean) : void
      {
         if(this.mItalic != param1)
         {
            this.mItalic = param1;
            this.mRequiresRedraw = true;
         }
      }
      
      public function get underline() : Boolean
      {
         return this.mUnderline;
      }
      
      public function set underline(param1:Boolean) : void
      {
         if(this.mUnderline != param1)
         {
            this.mUnderline = param1;
            this.mRequiresRedraw = true;
         }
      }
      
      public function get kerning() : Boolean
      {
         return this.mKerning;
      }
      
      public function set kerning(param1:Boolean) : void
      {
         if(this.mKerning != param1)
         {
            this.mKerning = param1;
            this.mRequiresRedraw = true;
         }
      }
      
      public function get autoScale() : Boolean
      {
         return this.mAutoScale;
      }
      
      public function set autoScale(param1:Boolean) : void
      {
         if(this.mAutoScale != param1)
         {
            this.mAutoScale = param1;
            this.mRequiresRedraw = true;
         }
      }
      
      public function get autoSize() : String
      {
         return this.mAutoSize;
      }
      
      public function set autoSize(param1:String) : void
      {
         if(this.mAutoSize != param1)
         {
            this.mAutoSize = param1;
            this.mRequiresRedraw = true;
         }
      }
      
      public function get batchable() : Boolean
      {
         return this.mBatchable;
      }
      
      public function set batchable(param1:Boolean) : void
      {
         this.mBatchable = param1;
         if(this.mQuadBatch)
         {
            this.mQuadBatch.batchable = param1;
         }
      }
      
      public function get nativeFilters() : Array
      {
         return this.mNativeFilters;
      }
      
      public function set nativeFilters(param1:Array) : void
      {
         if(!this.mIsRenderedText)
         {
            throw new Error("The TextField.nativeFilters property cannot be used on Bitmap fonts.");
         }
         this.mNativeFilters = param1.concat();
         this.mRequiresRedraw = true;
      }
   }
}
