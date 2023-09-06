package spark.components
{
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.geom.Rectangle;
   import flash.text.engine.EastAsianJustifier;
   import flash.text.engine.ElementFormat;
   import flash.text.engine.FontDescription;
   import flash.text.engine.FontLookup;
   import flash.text.engine.FontMetrics;
   import flash.text.engine.Kerning;
   import flash.text.engine.LineJustification;
   import flash.text.engine.SpaceJustifier;
   import flash.text.engine.TextBaseline;
   import flash.text.engine.TextBlock;
   import flash.text.engine.TextElement;
   import flash.text.engine.TextLine;
   import flash.text.engine.TypographicCase;
   import flashx.textLayout.compose.ISWFContext;
   import flashx.textLayout.compose.TextLineRecycler;
   import flashx.textLayout.formats.BaselineShift;
   import flashx.textLayout.formats.TLFTypographicCase;
   import mx.core.IEmbeddedFontRegistry;
   import mx.core.IFlexModuleFactory;
   import mx.core.Singleton;
   import mx.core.mx_internal;
   import spark.components.supportClasses.TextBase;
   
   public class Label extends TextBase
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static var staticTextBlock:TextBlock;
      
      private static var staticTextElement:TextElement;
      
      private static var staticSpaceJustifier:SpaceJustifier;
      
      private static var staticEastAsianJustifier:EastAsianJustifier;
      
      private static var recreateTextLine:Function;
      
      private static var _embeddedFontRegistry:IEmbeddedFontRegistry;
      
      {
         initClass();
      }
      
      private var embeddedFontContext:IFlexModuleFactory;
      
      private var elementFormat:ElementFormat;
      
      public function Label()
      {
         super();
      }
      
      private static function initClass() : void
      {
         staticTextBlock = new TextBlock();
         staticTextElement = new TextElement();
         staticSpaceJustifier = new SpaceJustifier();
         staticEastAsianJustifier = new EastAsianJustifier();
         if("recreateTextLine" in staticTextBlock)
         {
            recreateTextLine = staticTextBlock["recreateTextLine"];
         }
      }
      
      private static function get embeddedFontRegistry() : IEmbeddedFontRegistry
      {
         if(!_embeddedFontRegistry)
         {
            _embeddedFontRegistry = IEmbeddedFontRegistry(Singleton.getInstance("mx.core::IEmbeddedFontRegistry"));
         }
         return _embeddedFontRegistry;
      }
      
      private static function getNumberOrPercentOf(param1:Object, param2:Number) : Number
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         if(param1 is Number)
         {
            return Number(param1);
         }
         if(param1 is String)
         {
            _loc3_ = int(String(param1).length);
            if(_loc3_ >= 1 && param1.charAt(_loc3_ - 1) == "%")
            {
               return (_loc4_ = Number(param1.substring(0,_loc3_ - 1))) / 100 * param2;
            }
         }
         return NaN;
      }
      
      override public function stylesInitialized() : void
      {
         super.stylesInitialized();
         this.elementFormat = null;
      }
      
      override public function styleChanged(param1:String) : void
      {
         super.styleChanged(param1);
         this.elementFormat = null;
      }
      
      override mx_internal function composeTextLines(param1:Number = NaN, param2:Number = NaN) : Boolean
      {
         super.mx_internal::composeTextLines(param1,param2);
         if(!this.elementFormat)
         {
            this.elementFormat = this.createElementFormat();
         }
         mx_internal::bounds.x = 0;
         mx_internal::bounds.y = 0;
         mx_internal::bounds.width = param1;
         mx_internal::bounds.height = param2;
         mx_internal::removeTextLines();
         mx_internal::releaseTextLines();
         var _loc3_:Boolean = this.createTextLines(this.elementFormat);
         var _loc4_:String = getStyle("lineBreak");
         if(text != null && false && maxDisplayedLines && !this.doesComposedTextFit(param2,param1,_loc3_,maxDisplayedLines,_loc4_))
         {
            this.truncateText(param1,param2,_loc4_);
         }
         this.releaseLinesFromTextBlock();
         mx_internal::addTextLines();
         mx_internal::isOverset = mx_internal::isTextOverset(param1,param2);
         mx_internal::invalidateCompose = false;
         return _loc3_;
      }
      
      private function createElementFormat() : ElementFormat
      {
         var _loc1_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         this.embeddedFontContext = mx_internal::getEmbeddedFontContext();
         var _loc2_:FontDescription = new FontDescription();
         _loc1_ = getStyle("cffHinting");
         if(_loc1_ != null)
         {
            _loc2_.cffHinting = _loc1_;
         }
         _loc1_ = getStyle("fontLookup");
         if(_loc1_ != null)
         {
            if(_loc1_ == "auto")
            {
               _loc1_ = !!this.embeddedFontContext ? "null" : FontLookup.DEVICE;
            }
            else if(_loc1_ == FontLookup.EMBEDDED_CFF && !this.embeddedFontContext)
            {
               _loc1_ = "null";
            }
            _loc2_.fontLookup = _loc1_;
         }
         _loc1_ = getStyle("fontFamily");
         if(_loc1_ != null)
         {
            _loc2_.fontName = _loc1_;
         }
         _loc1_ = getStyle("fontStyle");
         if(_loc1_ != null)
         {
            _loc2_.fontPosture = _loc1_;
         }
         _loc1_ = getStyle("fontWeight");
         if(_loc1_ != null)
         {
            _loc2_.fontWeight = _loc1_;
         }
         _loc1_ = getStyle("renderingMode");
         if(_loc1_ != null)
         {
            _loc2_.renderingMode = _loc1_;
         }
         var _loc3_:ElementFormat = new ElementFormat();
         _loc3_.fontSize = getStyle("fontSize");
         _loc1_ = getStyle("alignmentBaseline");
         if(_loc1_ != null)
         {
            _loc3_.alignmentBaseline = _loc1_;
         }
         _loc3_.alpha = getStyle("textAlpha");
         this.setBaselineShift(_loc3_);
         _loc3_.color = getStyle("color");
         _loc1_ = getStyle("digitCase");
         if(_loc1_ != null)
         {
            _loc3_.digitCase = _loc1_;
         }
         _loc1_ = getStyle("digitWidth");
         if(_loc1_ != null)
         {
            _loc3_.digitWidth = _loc1_;
         }
         _loc1_ = getStyle("dominantBaseline");
         if(_loc1_ != null)
         {
            if(_loc1_ == "auto")
            {
               _loc1_ = "null";
               if((_loc4_ = getStyle("locale")) != null)
               {
                  if((_loc5_ = _loc4_.toLowerCase()).indexOf("ja") == 0 || _loc5_.indexOf("zh") == 0)
                  {
                     _loc1_ = "null";
                  }
               }
            }
            _loc3_.dominantBaseline = _loc1_;
         }
         _loc3_.fontDescription = _loc2_;
         this.setKerning(_loc3_);
         _loc1_ = getStyle("ligatureLevel");
         if(_loc1_ != null)
         {
            _loc3_.ligatureLevel = _loc1_;
         }
         _loc1_ = getStyle("locale");
         if(_loc1_ != null)
         {
            _loc3_.locale = _loc1_;
         }
         this.setTracking(_loc3_);
         this.setTypographicCase(_loc3_);
         return _loc3_;
      }
      
      private function setBaselineShift(param1:ElementFormat) : void
      {
         var _loc4_:* = null;
         var _loc2_:* = getStyle("baselineShift");
         var _loc3_:Number = param1.fontSize;
         if(_loc2_ == BaselineShift.SUPERSCRIPT || _loc2_ == BaselineShift.SUBSCRIPT)
         {
            if(this.embeddedFontContext)
            {
               _loc4_ = this.embeddedFontContext.callInContext(param1.getFontMetrics,param1,null);
            }
            else
            {
               _loc4_ = param1.getFontMetrics();
            }
            if(_loc2_ == BaselineShift.SUPERSCRIPT)
            {
               param1.baselineShift = _loc4_.superscriptOffset * _loc3_;
               param1.fontSize = _loc4_.superscriptScale * _loc3_;
            }
            else
            {
               param1.baselineShift = _loc4_.subscriptOffset * _loc3_;
               param1.fontSize = _loc4_.subscriptScale * _loc3_;
            }
         }
         else
         {
            _loc2_ = getNumberOrPercentOf(_loc2_,_loc3_);
            if(!isNaN(_loc2_))
            {
               param1.baselineShift = -_loc2_;
            }
         }
      }
      
      private function setKerning(param1:ElementFormat) : void
      {
         var _loc2_:Object = getStyle("kerning");
         if(_loc2_ === "default")
         {
            _loc2_ = Kerning.AUTO;
         }
         else if(_loc2_ === true)
         {
            _loc2_ = Kerning.ON;
         }
         else if(_loc2_ === false)
         {
            _loc2_ = Kerning.OFF;
         }
         if(_loc2_ != null)
         {
            param1.kerning = String(_loc2_);
         }
      }
      
      private function setTracking(param1:ElementFormat) : void
      {
         var _loc4_:Number = NaN;
         var _loc2_:Object = getStyle("trackingLeft");
         var _loc3_:Object = getStyle("trackingRight");
         var _loc5_:Number = param1.fontSize;
         _loc4_ = getNumberOrPercentOf(_loc2_,_loc5_);
         if(!isNaN(_loc4_))
         {
            param1.trackingLeft = _loc4_;
         }
         _loc4_ = getNumberOrPercentOf(_loc3_,_loc5_);
         if(!isNaN(_loc4_))
         {
            param1.trackingRight = _loc4_;
         }
      }
      
      private function setTypographicCase(param1:ElementFormat) : void
      {
         var _loc2_:String = getStyle("typographicCase");
         if(_loc2_ != null)
         {
            switch(_loc2_)
            {
               case TLFTypographicCase.LOWERCASE_TO_SMALL_CAPS:
                  param1.typographicCase = TypographicCase.CAPS_AND_SMALL_CAPS;
                  break;
               case TLFTypographicCase.CAPS_TO_SMALL_CAPS:
                  param1.typographicCase = TypographicCase.SMALL_CAPS;
                  break;
               default:
                  param1.typographicCase = _loc2_;
            }
         }
      }
      
      private function createTextLines(param1:ElementFormat) : Boolean
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc2_:String = getStyle("direction");
         var _loc3_:String = getStyle("justificationRule");
         var _loc4_:String = getStyle("justificationStyle");
         var _loc5_:String = getStyle("textAlign");
         var _loc6_:String = getStyle("textAlignLast");
         var _loc7_:String = getStyle("textJustify");
         if(_loc3_ == "auto")
         {
            _loc3_ = "space";
            if((_loc9_ = getStyle("locale")) != null)
            {
               if((_loc10_ = _loc9_.toLowerCase()).indexOf("ja") == 0 || _loc10_.indexOf("zh") == 0)
               {
                  _loc3_ = "eastAsian";
               }
            }
         }
         if(_loc4_ == "auto")
         {
            _loc4_ = "pushInKinsoku";
         }
         staticTextElement.text = text != null && false ? text : " ";
         staticTextElement.elementFormat = param1;
         staticTextBlock.content = staticTextElement;
         staticTextBlock.bidiLevel = _loc2_ == "ltr" ? 0 : 1;
         if(_loc5_ == "justify")
         {
            _loc8_ = _loc6_ == "justify" ? "null" : LineJustification.ALL_BUT_LAST;
         }
         else
         {
            _loc8_ = "null";
         }
         if(_loc3_ == "space")
         {
            staticSpaceJustifier.lineJustification = _loc8_;
            staticSpaceJustifier.letterSpacing = _loc7_ == "distribute";
            staticTextBlock.textJustifier = staticSpaceJustifier;
         }
         else
         {
            staticEastAsianJustifier.lineJustification = _loc8_;
            staticEastAsianJustifier.justificationStyle = _loc4_;
            staticTextBlock.textJustifier = staticEastAsianJustifier;
         }
         return this.createTextLinesFromTextBlock(staticTextBlock,mx_internal::textLines,mx_internal::bounds);
      }
      
      private function createTextLinesFromTextBlock(param1:TextBlock, param2:Vector.<DisplayObject>, param3:Rectangle) : Boolean
      {
         var _loc21_:Number = NaN;
         var _loc25_:* = null;
         var _loc27_:* = null;
         var _loc30_:Boolean = false;
         var _loc41_:* = null;
         var _loc49_:int = 0;
         var _loc50_:Number = NaN;
         var _loc51_:* = null;
         var _loc52_:* = null;
         var _loc53_:* = null;
         var _loc54_:* = null;
         var _loc55_:* = null;
         mx_internal::releaseTextLines(param2);
         var _loc4_:String = getStyle("direction");
         var _loc5_:String = getStyle("lineBreak");
         var _loc6_:Object = getStyle("lineHeight");
         var _loc7_:Boolean = getStyle("lineThrough");
         var _loc8_:Number = getStyle("paddingBottom");
         var _loc9_:Number = getStyle("paddingLeft");
         var _loc10_:Number = getStyle("paddingRight");
         var _loc11_:Number = getStyle("paddingTop");
         var _loc12_:String = getStyle("textAlign");
         var _loc13_:String = getStyle("textAlignLast");
         var _loc14_:String = getStyle("textDecoration");
         var _loc15_:String = getStyle("verticalAlign");
         var _loc16_:Number = param3.width - _loc9_ - _loc10_;
         var _loc17_:Number = param3.height - _loc11_ - _loc8_;
         var _loc18_:Boolean;
         if(_loc18_ = isNaN(_loc16_))
         {
            _loc16_ = maxWidth;
         }
         var _loc19_:Number = _loc5_ == "explicit" ? 0 : _loc16_;
         if(_loc16_ < 0 || _loc17_ < 0 || !param1)
         {
            param3.width = 0;
            param3.height = 0;
            return false;
         }
         var _loc20_:Number = staticTextElement.elementFormat.fontSize;
         if(_loc6_ is Number)
         {
            _loc21_ = Number(_loc6_);
         }
         else if(_loc6_ is String)
         {
            _loc49_ = int(_loc6_.length);
            _loc21_ = (_loc50_ = Number(String(_loc6_).substring(0,_loc49_ - 1))) / 100 * _loc20_;
         }
         if(isNaN(_loc21_))
         {
            _loc21_ = 1.2 * _loc20_;
         }
         var _loc22_:Number = 0;
         var _loc23_:Number = 0;
         var _loc24_:int = 0;
         var _loc26_:Number = 0;
         var _loc28_:ISWFContext = ISWFContext(this.embeddedFontContext);
         var _loc29_:* = false;
         while(true)
         {
            if(_loc51_ = TextLineRecycler.getLineForReuse())
            {
               if(_loc28_)
               {
                  _loc25_ = _loc28_.callInContext(param1["recreateTextLine"],param1,[_loc51_,_loc27_,_loc19_]);
               }
               else
               {
                  _loc25_ = recreateTextLine(_loc51_,_loc27_,_loc19_);
               }
            }
            else if(_loc28_)
            {
               _loc25_ = _loc28_.callInContext(param1.createTextLine,param1,[_loc27_,_loc19_]);
            }
            else
            {
               _loc25_ = param1.createTextLine(_loc27_,_loc19_);
            }
            if(!_loc25_)
            {
               _loc29_ = !_loc30_;
               break;
            }
            _loc26_ += _loc24_ == 0 ? _loc25_.ascent : _loc21_;
            if(_loc15_ == "top" && _loc26_ - _loc25_.ascent > _loc17_)
            {
               if(_loc30_)
               {
                  break;
               }
               _loc30_ = true;
            }
            _loc27_ = _loc25_;
            var _loc56_:*;
            param2[_loc56_ = _loc24_++] = _loc27_;
            _loc27_.y = _loc26_;
            _loc22_ = Math.max(_loc22_,_loc27_.textWidth);
            _loc23_ += _loc27_.textHeight;
            if(_loc7_ || _loc14_ == "underline")
            {
               _loc52_ = TextElement(param1.content).elementFormat;
               if(this.embeddedFontContext)
               {
                  _loc53_ = this.embeddedFontContext.callInContext(_loc52_.getFontMetrics,_loc52_,null);
               }
               else
               {
                  _loc53_ = _loc52_.getFontMetrics();
               }
               _loc55_ = (_loc54_ = new Shape()).graphics;
               if(_loc7_)
               {
                  _loc55_.lineStyle(_loc53_.strikethroughThickness,_loc52_.color,_loc52_.alpha);
                  _loc55_.moveTo(0,_loc53_.strikethroughOffset);
                  _loc55_.lineTo(_loc27_.textWidth,_loc53_.strikethroughOffset);
               }
               if(_loc14_ == "underline")
               {
                  _loc55_.lineStyle(_loc53_.underlineThickness,_loc52_.color,_loc52_.alpha);
                  _loc55_.moveTo(0,_loc53_.underlineOffset);
                  _loc55_.lineTo(_loc27_.textWidth,_loc53_.underlineOffset);
               }
               _loc27_.addChild(_loc54_);
            }
         }
         if(_loc24_ == 0)
         {
            param3.width = _loc9_ + _loc10_;
            param3.height = _loc11_ + _loc8_;
            return false;
         }
         if(_loc18_)
         {
            _loc16_ = _loc22_;
         }
         if(isNaN(param3.height))
         {
            _loc17_ = _loc27_.y + _loc27_.descent;
         }
         _loc16_ = Math.ceil(_loc16_);
         _loc17_ = Math.ceil(_loc17_);
         var _loc31_:Boolean = _loc12_ == "start" && _loc4_ == "ltr" || _loc12_ == "end" && _loc4_ == "rtl" || _loc12_ == "left" || _loc12_ == "justify";
         var _loc32_:* = _loc12_ == "center";
         var _loc33_:Boolean = _loc12_ == "start" && _loc4_ == "rtl" || _loc12_ == "end" && _loc4_ == "ltr" || _loc12_ == "right";
         var _loc34_:Number;
         var _loc35_:Number = (_loc34_ = param3.left + _loc9_) + _loc16_ / 2;
         var _loc36_:Number = _loc34_ + _loc16_;
         var _loc37_:Number = param3.top + _loc11_;
         var _loc38_:Number;
         var _loc39_:Number = (_loc38_ = _loc17_ - (_loc27_.y + _loc27_.descent)) / 2;
         _loc38_ += _loc37_;
         _loc39_ += _loc37_;
         var _loc40_:Number = (_loc17_ - _loc23_) / (_loc24_ - 1);
         var _loc42_:Number = 0;
         var _loc43_:Boolean = _loc12_ == "justify" && _loc29_;
         var _loc44_:Number = _loc16_;
         var _loc45_:Number = _loc17_;
         var _loc46_:Number = 0;
         var _loc47_:Boolean = !!_loc24_ ? param2[_loc24_ - 1].y + TextLine(param2[_loc24_ - 1]).descent > _loc17_ : false;
         var _loc48_:int = 0;
         while(_loc48_ < _loc24_)
         {
            _loc27_ = TextLine(param2[_loc48_]);
            if(_loc43_ && _loc48_ == _loc24_ - 1)
            {
               _loc31_ = _loc13_ == "start" && _loc4_ == "ltr" || _loc13_ == "end" && _loc4_ == "rtl" || _loc13_ == "left" || _loc13_ == "justify";
               _loc32_ = _loc13_ == "center";
               _loc33_ = _loc13_ == "start" && _loc4_ == "rtl" || _loc13_ == "end" && _loc4_ == "ltr" || _loc13_ == "right";
            }
            if(_loc31_)
            {
               _loc27_.x = _loc34_;
            }
            else if(_loc32_)
            {
               _loc27_.x = _loc35_ - _loc27_.textWidth / 2;
            }
            else if(_loc33_)
            {
               _loc27_.x = _loc36_ - _loc27_.textWidth;
            }
            if(_loc15_ == "top" || !_loc29_ || _loc47_)
            {
               _loc27_.y += _loc37_;
            }
            else if(_loc15_ == "middle")
            {
               _loc27_.y += _loc39_;
            }
            else if(_loc15_ == "bottom")
            {
               _loc27_.y += _loc38_;
            }
            else if(_loc15_ == "justify")
            {
               _loc42_ += _loc48_ == 0 ? _loc37_ + _loc27_.ascent : _loc41_.descent + _loc40_ + _loc27_.ascent;
               _loc27_.y = _loc42_;
               _loc41_ = _loc27_;
            }
            _loc44_ = Math.min(_loc44_,_loc27_.x);
            _loc45_ = Math.min(_loc45_,_loc27_.y - _loc27_.ascent);
            _loc46_ = Math.max(_loc46_,_loc27_.x + _loc27_.textWidth);
            _loc48_++;
         }
         param3.x = _loc44_ - _loc9_;
         param3.y = _loc45_ - _loc11_;
         param3.right = _loc46_ + _loc10_;
         param3.bottom = _loc27_.y + _loc27_.descent + _loc8_;
         return _loc29_;
      }
      
      override mx_internal function createEmptyTextLine(param1:Number = NaN) : void
      {
         staticTextElement.text = " ";
         mx_internal::bounds.width = NaN;
         mx_internal::bounds.height = param1;
         this.createTextLinesFromTextBlock(staticTextBlock,mx_internal::textLines,mx_internal::bounds);
         this.releaseLinesFromTextBlock();
      }
      
      private function doesComposedTextFit(param1:Number, param2:Number, param3:Boolean, param4:int, param5:String) : Boolean
      {
         if(!param3)
         {
            return false;
         }
         if(param4 != -1 && mx_internal::textLines.length > param4)
         {
            return false;
         }
         if(param5 == "explicit")
         {
            if(mx_internal::bounds.right > param2)
            {
               return false;
            }
         }
         if(true || isNaN(param1))
         {
            return true;
         }
         var _loc7_:Number;
         var _loc6_:TextLine;
         return (_loc7_ = (_loc6_ = TextLine(mx_internal::textLines[-1])).y + _loc6_.descent) <= param1;
      }
      
      private function truncateText(param1:Number, param2:Number, param3:String) : void
      {
         var _loc7_:Boolean = false;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:Boolean = false;
         var _loc11_:* = null;
         var _loc12_:Number = NaN;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:Boolean = false;
         var _loc16_:int = 0;
         var _loc17_:Number = NaN;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc4_:int = maxDisplayedLines;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         if(param3 == "explicit")
         {
            this.truncateExplicitLineBreakText(param1,param2);
            return;
         }
         if((_loc6_ = this.computeLastAllowedLineIndex(param2,_loc4_)) + 1 < mx_internal::textLines.length)
         {
            _loc6_++;
            _loc7_ = true;
         }
         if(_loc6_ >= 0)
         {
            staticTextElement.text = mx_internal::truncationIndicatorResource;
            _loc8_ = new Vector.<DisplayObject>();
            _loc9_ = new Rectangle(0,0,param1,NaN);
            _loc10_ = this.createTextLinesFromTextBlock(staticTextBlock,_loc8_,_loc9_);
            this.releaseLinesFromTextBlock();
            if((_loc6_ -= _loc8_.length - 1) >= 0 && _loc10_)
            {
               _loc12_ = (_loc11_ = TextLine(_loc8_[_loc8_.length - 1])).specifiedWidth - _loc11_.unjustifiedTextWidth;
               _loc11_ = null;
               mx_internal::releaseTextLines(_loc8_);
               _loc13_ = this.getTruncationPosition(TextLine(mx_internal::textLines[_loc6_]),_loc12_,_loc7_);
               do
               {
                  _loc14_ = text.slice(0,_loc13_) + mx_internal::truncationIndicatorResource;
                  mx_internal::bounds.x = 0;
                  mx_internal::bounds.y = 0;
                  mx_internal::bounds.width = param1;
                  mx_internal::bounds.height = param2;
                  staticTextElement.text = _loc14_;
                  _loc15_ = this.createTextLinesFromTextBlock(staticTextBlock,mx_internal::textLines,mx_internal::bounds);
                  if(this.doesComposedTextFit(param2,param1,_loc15_,_loc4_,param3))
                  {
                     _loc5_ = true;
                     break;
                  }
                  if(_loc13_ == 0)
                  {
                     break;
                  }
                  _loc16_ = _loc13_;
                  _loc13_ = this.getNextTruncationPosition(_loc6_,_loc13_);
               }
               while(_loc16_ != _loc13_);
               
            }
         }
         if(!_loc5_)
         {
            mx_internal::releaseTextLines();
            _loc17_ = getStyle("paddingBottom");
            _loc18_ = getStyle("paddingLeft");
            _loc19_ = getStyle("paddingRight");
            _loc20_ = getStyle("paddingTop");
            mx_internal::bounds.x = 0;
            mx_internal::bounds.y = 0;
            mx_internal::bounds.width = _loc18_ + _loc19_;
            mx_internal::bounds.height = _loc20_ + _loc17_;
         }
         mx_internal::setIsTruncated(true);
      }
      
      private function truncateExplicitLineBreakText(param1:Number, param2:Number) : void
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         staticTextElement.text = mx_internal::truncationIndicatorResource;
         var _loc3_:Vector.<DisplayObject> = new Vector.<DisplayObject>();
         var _loc4_:Rectangle = new Rectangle(0,0,param1,NaN);
         this.createTextLinesFromTextBlock(staticTextBlock,_loc3_,_loc4_);
         this.releaseLinesFromTextBlock();
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            if((_loc7_ = mx_internal::textLines[_loc6_] as TextLine).x + _loc7_.width > param1)
            {
               _loc8_ = _loc7_.rawTextLength;
               while(--_loc8_ > 0)
               {
                  _loc9_ = (_loc9_ = text.substr(_loc7_.textBlockBeginIndex,_loc8_)) + mx_internal::truncationIndicatorResource;
                  staticTextElement.text = _loc9_;
                  _loc10_ = new Vector.<DisplayObject>();
                  this.createTextLinesFromTextBlock(staticTextBlock,_loc10_,_loc4_);
                  this.releaseLinesFromTextBlock();
                  if(_loc10_.length == 1 && _loc10_[0].x + _loc10_[0].width <= param1)
                  {
                     _loc10_[0].x = _loc7_.x;
                     _loc10_[0].y = _loc7_.y;
                     mx_internal::textLines[_loc6_] = _loc10_[0];
                     break;
                  }
               }
            }
            _loc6_++;
         }
      }
      
      private function computeLastAllowedLineIndex(param1:Number, param2:int) : int
      {
         var _loc4_:* = null;
         var _loc3_:int = -1;
         if(_loc3_ < 0)
         {
            return _loc3_;
         }
         if(!isNaN(param1))
         {
            while((_loc4_ = TextLine(mx_internal::textLines[_loc3_])).y + _loc4_.descent > param1)
            {
               _loc3_--;
               if(_loc3_ < 0)
               {
                  break;
               }
            }
         }
         if(param2 != -1 && param2 <= _loc3_)
         {
            _loc3_ = param2 - 1;
         }
         return _loc3_;
      }
      
      private function getTruncationPosition(param1:TextLine, param2:Number, param3:Boolean) : int
      {
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc4_:Number = 0;
         var _loc5_:int = param1.textBlockBeginIndex;
         while(_loc5_ < param1.textBlockBeginIndex + param1.rawTextLength)
         {
            _loc6_ = param1.getAtomIndexAtCharIndex(_loc5_);
            if(param3)
            {
               if(_loc5_ != param1.textBlockBeginIndex && param1.getAtomWordBoundaryOnLeft(_loc6_))
               {
                  break;
               }
            }
            else
            {
               _loc7_ = param1.getAtomBounds(_loc6_);
               if((_loc4_ += _loc7_.width) > param2)
               {
                  break;
               }
            }
            _loc5_ = param1.getAtomTextBlockEndIndex(_loc6_);
         }
         return _loc5_;
      }
      
      private function getNextTruncationPosition(param1:int, param2:int) : int
      {
         param2--;
         var _loc3_:TextLine = TextLine(mx_internal::textLines[param1]);
         while(!(param2 >= _loc3_.textBlockBeginIndex && param2 < _loc3_.textBlockBeginIndex + _loc3_.rawTextLength))
         {
            if(param2 < _loc3_.textBlockBeginIndex)
            {
               param1--;
               if(param1 < 0)
               {
                  return param2;
               }
            }
            else
            {
               param1++;
               if(param1 >= mx_internal::textLines.length)
               {
                  return param2;
               }
            }
            _loc3_ = TextLine(mx_internal::textLines[param1]);
         }
         var _loc4_:int = _loc3_.getAtomIndexAtCharIndex(param2);
         return _loc3_.getAtomTextBlockBeginIndex(_loc4_);
      }
      
      private function releaseLinesFromTextBlock() : void
      {
         var _loc1_:TextLine = staticTextBlock.firstLine;
         var _loc2_:TextLine = staticTextBlock.lastLine;
         if(_loc1_)
         {
            staticTextBlock.releaseLines(_loc1_,_loc2_);
         }
      }
   }
}
