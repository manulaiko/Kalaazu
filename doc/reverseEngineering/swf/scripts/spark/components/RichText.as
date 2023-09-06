package spark.components
{
   import flash.display.DisplayObject;
   import flashx.textLayout.compose.ISWFContext;
   import flashx.textLayout.conversion.ConversionType;
   import flashx.textLayout.conversion.ITextExporter;
   import flashx.textLayout.conversion.ITextImporter;
   import flashx.textLayout.conversion.TextConverter;
   import flashx.textLayout.elements.Configuration;
   import flashx.textLayout.elements.GlobalSettings;
   import flashx.textLayout.elements.TextFlow;
   import flashx.textLayout.events.DamageEvent;
   import flashx.textLayout.factory.StringTextLineFactory;
   import flashx.textLayout.factory.TextFlowTextLineFactory;
   import flashx.textLayout.factory.TextLineFactoryBase;
   import flashx.textLayout.factory.TruncationOptions;
   import flashx.textLayout.formats.ITextLayoutFormat;
   import flashx.textLayout.tlf_internal;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import spark.components.supportClasses.TextBase;
   import spark.core.CSSTextLayoutFormat;
   import spark.utils.MaskUtil;
   import spark.utils.TextUtil;
   
   public class RichText extends TextBase
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      private static var classInitialized:Boolean = false;
      
      private static var staticStringFactory:StringTextLineFactory;
      
      private static var staticTextFlowFactory:TextFlowTextLineFactory;
      
      private static var staticPlainTextImporter:ITextImporter;
      
      private static var staticPlainTextExporter:ITextExporter;
       
      
      private var hostFormat:ITextLayoutFormat;
      
      private var lastGeneration:uint = 0;
      
      mx_internal var embeddedFontContext:IFlexModuleFactory;
      
      private var factory:TextLineFactoryBase;
      
      private var ignoreDamageEvent:Boolean;
      
      private var textChanged:Boolean = false;
      
      private var source:String = "";
      
      protected var _content:Object;
      
      private var contentChanged:Boolean = false;
      
      private var maskChanged:Boolean;
      
      private var _maskType:String = "clip";
      
      private var maskTypeChanged:Boolean;
      
      private var _luminosityInvert:Boolean = false;
      
      private var luminositySettingsChanged:Boolean;
      
      private var _luminosityClip:Boolean = false;
      
      private var _textFlow:TextFlow;
      
      private var textFlowChanged:Boolean = false;
      
      public function RichText()
      {
         super();
         initClass();
         this.text = "";
      }
      
      private static function initClass() : void
      {
         if(classInitialized)
         {
            return;
         }
         GlobalSettings.resourceStringFunction = TextUtil.getResourceString;
         GlobalSettings.resolveFontLookupFunction = TextUtil.resolveFontLookup;
         GlobalSettings.tlf_internal::enableDefaultTabStops = true;
         staticStringFactory = new StringTextLineFactory();
         staticTextFlowFactory = new TextFlowTextLineFactory();
         staticPlainTextImporter = TextConverter.getImporter(TextConverter.PLAIN_TEXT_FORMAT);
         staticPlainTextExporter = TextConverter.getExporter(TextConverter.PLAIN_TEXT_FORMAT);
         classInitialized = true;
      }
      
      override public function get text() : String
      {
         if(mx_internal::_text == null)
         {
            if(this.contentChanged)
            {
               this._textFlow = this.createTextFlowFromContent(this._content);
               this.lastGeneration = this._textFlow.generation;
            }
            mx_internal::_text = staticPlainTextExporter.export(this._textFlow,ConversionType.STRING_TYPE) as String;
         }
         return mx_internal::_text;
      }
      
      override public function set text(param1:String) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(this.source == "text" && param1 == mx_internal::_text)
         {
            return;
         }
         mx_internal::_text = param1;
         this.textChanged = true;
         this.source = "text";
         this.textFlowChanged = false;
         this.contentChanged = false;
         this.removeDamageHandler();
         this._textFlow = null;
         this._content = null;
         this.factory = staticStringFactory;
         mx_internal::invalidateTextLines();
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get content() : Object
      {
         return this.textFlow;
      }
      
      public function set content(param1:Object) : void
      {
         if(param1 == null)
         {
            this.text = "";
            return;
         }
         if(param1 == this._content)
         {
            return;
         }
         this._content = param1;
         this.contentChanged = true;
         this.source = "content";
         this.textChanged = false;
         this.textFlowChanged = false;
         this.removeDamageHandler();
         mx_internal::_text = null;
         this._textFlow = null;
         this.factory = staticTextFlowFactory;
         mx_internal::invalidateTextLines();
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
      }
      
      override public function set mask(param1:DisplayObject) : void
      {
         if(super.mask == param1)
         {
            return;
         }
         var _loc2_:UIComponent = super.mask as UIComponent;
         super.mask = param1;
         if(Boolean(_loc2_) && _loc2_.mx_internal::$parent === this)
         {
            if(_loc2_.parent is UIComponent)
            {
               UIComponent(_loc2_.parent).mx_internal::childRemoved(_loc2_);
            }
            _loc2_.mx_internal::$parent.removeChild(_loc2_);
         }
         this.maskChanged = true;
         this.maskTypeChanged = true;
         invalidateProperties();
         invalidateDisplayList();
      }
      
      public function get maskType() : String
      {
         return this._maskType;
      }
      
      public function set maskType(param1:String) : void
      {
         if(this._maskType == param1)
         {
            return;
         }
         this._maskType = param1;
         this.maskTypeChanged = true;
         invalidateProperties();
      }
      
      public function get luminosityInvert() : Boolean
      {
         return this._luminosityInvert;
      }
      
      public function set luminosityInvert(param1:Boolean) : void
      {
         if(this._luminosityInvert == param1)
         {
            return;
         }
         this._luminosityInvert = param1;
         this.luminositySettingsChanged = true;
      }
      
      public function get luminosityClip() : Boolean
      {
         return this._luminosityClip;
      }
      
      public function set luminosityClip(param1:Boolean) : void
      {
         if(this._luminosityClip == param1)
         {
            return;
         }
         this._luminosityClip = param1;
         this.luminositySettingsChanged = true;
      }
      
      public function get textFlow() : TextFlow
      {
         if(!this._textFlow)
         {
            if(this._content != null)
            {
               this._textFlow = this.createTextFlowFromContent(this._content);
            }
            else
            {
               this._textFlow = staticPlainTextImporter.importToFlow(mx_internal::_text);
            }
            this.lastGeneration = !!this._textFlow ? this._textFlow.generation : 0;
         }
         this._textFlow.addEventListener(DamageEvent.DAMAGE,this.textFlow_damageHandler);
         if(this._textFlow.flowComposer)
         {
            this._textFlow.flowComposer.swfContext = ISWFContext(mx_internal::getEmbeddedFontContext());
         }
         return this._textFlow;
      }
      
      public function set textFlow(param1:TextFlow) : void
      {
         if(param1 == null)
         {
            this.text = "";
            return;
         }
         if(param1 == this._textFlow)
         {
            return;
         }
         this.removeDamageHandler();
         this._textFlow = param1;
         this.textFlowChanged = true;
         this.source = "textFlow";
         this.textChanged = false;
         this.contentChanged = false;
         mx_internal::_text = null;
         this._content = null;
         this.factory = staticTextFlowFactory;
         mx_internal::invalidateTextLines();
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         if(this.textChanged)
         {
            if(mx_internal::_text.indexOf("\n") != -1 || mx_internal::_text.indexOf("\r") != -1)
            {
               this._textFlow = staticPlainTextImporter.importToFlow(mx_internal::_text);
               this.factory = staticTextFlowFactory;
            }
            this.textChanged = false;
         }
         else if(this.textFlowChanged)
         {
            this.textFlowChanged = false;
         }
         else if(this.contentChanged)
         {
            this._textFlow = this.createTextFlowFromContent(this._content);
            this.contentChanged = false;
         }
         this.lastGeneration = !!this._textFlow ? this._textFlow.generation : 0;
         if(!this.hostFormat)
         {
            this.hostFormat = new CSSTextLayoutFormat(this);
         }
         if(this._textFlow)
         {
            this._textFlow.hostFormat = this.hostFormat;
            this._textFlow.addEventListener(DamageEvent.DAMAGE,this.textFlow_damageHandler);
         }
         if(this.maskChanged)
         {
            if(Boolean(mask) && true)
            {
               addChild(mask);
               MaskUtil.mx_internal::applyMask(mask,null);
            }
            this.maskChanged = false;
         }
         if(this.luminositySettingsChanged)
         {
            MaskUtil.mx_internal::applyLuminositySettings(mask,this._maskType,this._luminosityInvert,this._luminosityClip);
            this.luminositySettingsChanged = false;
         }
         if(this.maskTypeChanged)
         {
            MaskUtil.mx_internal::applyMaskType(mask,this._maskType,this._luminosityInvert,this._luminosityClip,this);
            this.maskTypeChanged = false;
         }
      }
      
      override public function stylesInitialized() : void
      {
         super.stylesInitialized();
         this.hostFormat = null;
      }
      
      override public function styleChanged(param1:String) : void
      {
         super.styleChanged(param1);
         this.hostFormat = null;
         mx_internal::invalidateTextLines();
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         if(!isNaN(mx_internal::_composeHeight) && param2 != mx_internal::_composeHeight)
         {
            mx_internal::invalidateTextLines();
         }
         super.updateDisplayList(param1,param2);
      }
      
      override mx_internal function composeTextLines(param1:Number = NaN, param2:Number = NaN) : Boolean
      {
         var _loc3_:* = null;
         if(isNaN(param1) && !isNaN(explicitMaxWidth))
         {
            param1 = explicitMaxWidth;
         }
         super.mx_internal::composeTextLines(param1,param2);
         this.ignoreDamageEvent = true;
         mx_internal::bounds.x = 0;
         mx_internal::bounds.y = 0;
         mx_internal::bounds.width = param1;
         mx_internal::bounds.height = param2;
         mx_internal::removeTextLines();
         mx_internal::releaseTextLines();
         this.createTextLines();
         if(maxDisplayedLines != 0 && !isTruncated && getStyle("lineBreak") == "toFit")
         {
            _loc3_ = getStyle("blockProgression");
            if(isNaN(param1) && _loc3_ == "tb" || isNaN(param2) && _loc3_ != "tb")
            {
               mx_internal::textLines.length = 0;
               this.createTextLines();
            }
         }
         mx_internal::addTextLines();
         mx_internal::isOverset = mx_internal::isTextOverset(param1,param2);
         mx_internal::invalidateCompose = false;
         this.ignoreDamageEvent = false;
         return true;
      }
      
      private function createTextFlowFromContent(param1:Object) : TextFlow
      {
         var _loc2_:* = null;
         if(param1 is TextFlow)
         {
            _loc2_ = param1 as TextFlow;
         }
         else if(param1 is Array)
         {
            _loc2_ = new TextFlow();
            _loc2_.whiteSpaceCollapse = getStyle("whiteSpaceCollapse");
            _loc2_.mxmlChildren = param1 as Array;
            _loc2_.whiteSpaceCollapse = undefined;
         }
         else
         {
            _loc2_ = new TextFlow();
            _loc2_.whiteSpaceCollapse = getStyle("whiteSpaceCollapse");
            _loc2_.mxmlChildren = [param1];
            _loc2_.whiteSpaceCollapse = undefined;
         }
         return _loc2_;
      }
      
      private function createTextLines() : void
      {
         var _loc1_:* = null;
         mx_internal::textLines.length = 0;
         this.factory.compositionBounds = mx_internal::bounds;
         if(maxDisplayedLines != 0)
         {
            _loc1_ = new TruncationOptions();
            _loc1_.lineCountLimit = maxDisplayedLines;
            _loc1_.truncationIndicator = TextBase.mx_internal::truncationIndicatorResource;
         }
         this.factory.truncationOptions = _loc1_;
         this.mx_internal::embeddedFontContext = mx_internal::getEmbeddedFontContext();
         if(this.factory is StringTextLineFactory)
         {
            staticStringFactory.text = mx_internal::_text;
            staticStringFactory.textFlowFormat = this.hostFormat;
            staticStringFactory.swfContext = ISWFContext(this.mx_internal::embeddedFontContext);
            staticStringFactory.createTextLines(this.addTextLine);
         }
         else if(this.factory is TextFlowTextLineFactory)
         {
            if(Boolean(this._textFlow) && Boolean(this._textFlow.flowComposer))
            {
               this._textFlow.flowComposer.swfContext = ISWFContext(this.mx_internal::embeddedFontContext);
            }
            staticTextFlowFactory.swfContext = ISWFContext(this.mx_internal::embeddedFontContext);
            staticTextFlowFactory.createTextLines(this.addTextLine,this._textFlow);
         }
         mx_internal::bounds = this.factory.getContentBounds();
         mx_internal::setIsTruncated(this.factory.isTruncated);
      }
      
      override mx_internal function createEmptyTextLine(param1:Number = NaN) : void
      {
         mx_internal::textLines.length = 0;
         mx_internal::bounds.x = 0;
         mx_internal::bounds.y = 0;
         mx_internal::bounds.width = !!width ? width : NaN;
         mx_internal::bounds.height = param1;
         staticStringFactory.compositionBounds = mx_internal::bounds;
         staticStringFactory.truncationOptions = null;
         staticStringFactory.text = "";
         staticStringFactory.textFlowFormat = this.hostFormat;
         staticStringFactory.createTextLines(this.addTextLine);
      }
      
      private function addTextLine(param1:DisplayObject) : void
      {
         mx_internal::textLines.push(param1);
      }
      
      private function removeDamageHandler() : void
      {
         if(this._textFlow != null)
         {
            this._textFlow.removeEventListener(DamageEvent.DAMAGE,this.textFlow_damageHandler);
         }
      }
      
      private function textFlow_damageHandler(param1:DamageEvent) : void
      {
         if(this.ignoreDamageEvent || this._textFlow.generation == this.lastGeneration)
         {
            return;
         }
         this.lastGeneration = this._textFlow.generation;
         mx_internal::_text = null;
         this._content = null;
         this.factory = staticTextFlowFactory;
         mx_internal::invalidateTextLines();
         invalidateSize();
         invalidateDisplayList();
      }
   }
}
