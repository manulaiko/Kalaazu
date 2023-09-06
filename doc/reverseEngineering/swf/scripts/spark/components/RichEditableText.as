package spark.components
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.system.IME;
   import flash.system.IMEConversionMode;
   import flash.text.engine.ElementFormat;
   import flash.text.engine.FontDescription;
   import flash.text.engine.FontLookup;
   import flash.text.engine.TextBlock;
   import flash.text.engine.TextElement;
   import flash.text.engine.TextLine;
   import flash.ui.Keyboard;
   import flashx.textLayout.compose.ISWFContext;
   import flashx.textLayout.container.TextContainerManager;
   import flashx.textLayout.conversion.ConversionType;
   import flashx.textLayout.conversion.ITextExporter;
   import flashx.textLayout.conversion.ITextImporter;
   import flashx.textLayout.conversion.TextConverter;
   import flashx.textLayout.edit.EditManager;
   import flashx.textLayout.edit.EditingMode;
   import flashx.textLayout.edit.IEditManager;
   import flashx.textLayout.edit.ISelectionManager;
   import flashx.textLayout.edit.SelectionState;
   import flashx.textLayout.elements.Configuration;
   import flashx.textLayout.elements.GlobalSettings;
   import flashx.textLayout.elements.InlineGraphicElementStatus;
   import flashx.textLayout.elements.TextFlow;
   import flashx.textLayout.events.CompositionCompleteEvent;
   import flashx.textLayout.events.DamageEvent;
   import flashx.textLayout.events.FlowOperationEvent;
   import flashx.textLayout.events.SelectionEvent;
   import flashx.textLayout.events.StatusChangeEvent;
   import flashx.textLayout.factory.StringTextLineFactory;
   import flashx.textLayout.factory.TextFlowTextLineFactory;
   import flashx.textLayout.formats.BlockProgression;
   import flashx.textLayout.formats.Category;
   import flashx.textLayout.formats.ITextLayoutFormat;
   import flashx.textLayout.formats.TextLayoutFormat;
   import flashx.textLayout.operations.CopyOperation;
   import flashx.textLayout.operations.CutOperation;
   import flashx.textLayout.operations.DeleteTextOperation;
   import flashx.textLayout.operations.FlowOperation;
   import flashx.textLayout.operations.FlowTextOperation;
   import flashx.textLayout.operations.InsertTextOperation;
   import flashx.textLayout.operations.PasteOperation;
   import flashx.textLayout.tlf_internal;
   import flashx.undo.IUndoManager;
   import mx.core.FlexVersion;
   import mx.core.IFlexModuleFactory;
   import mx.core.IIMESupport;
   import mx.core.ISystemCursorClient;
   import mx.core.UIComponent;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.managers.IFocusManager;
   import mx.managers.IFocusManagerComponent;
   import mx.utils.StringUtil;
   import spark.components.supportClasses.RichEditableTextContainerManager;
   import spark.core.CSSTextLayoutFormat;
   import spark.core.IEditableText;
   import spark.core.IViewport;
   import spark.core.NavigationUnit;
   import spark.events.TextOperationEvent;
   import spark.utils.TextUtil;
   
   public class RichEditableText extends UIComponent implements IFocusManagerComponent, IIMESupport, ISystemCursorClient, IViewport, IEditableText
   {
      
      mx_internal static const VERSION:String = "4.6.0.23201";
      
      mx_internal static var createAccessibilityImplementation:Function;
      
      private static var classInitialized:Boolean = false;
      
      private static var staticStringFactory:StringTextLineFactory;
      
      private static var staticTextFlowFactory:TextFlowTextLineFactory;
      
      private static var staticPlainTextImporter:ITextImporter;
      
      private static var staticPlainTextExporter:ITextExporter;
      
      private static const ALL_NEWLINES_REGEXP:RegExp = /\n/g;
       
      
      mx_internal var unbounded:Rectangle;
      
      private var hostFormatChanged:Boolean;
      
      private var ascent:Number = NaN;
      
      private var descent:Number = NaN;
      
      private var source:String = "text";
      
      private var lastGeneration:uint = 0;
      
      private var lastContentBoundsGeneration:int = 0;
      
      private var dispatchChangeAndChangingEvents:Boolean = true;
      
      private var inMeasureMethod:Boolean = false;
      
      private var inUpdateDLMethod:Boolean = false;
      
      private var remeasuringText:Boolean = false;
      
      mx_internal var preserveSelectionOnSetText:Boolean = false;
      
      mx_internal var passwordChar:String = "package_1";
      
      mx_internal var undoManager:IUndoManager;
      
      mx_internal var clearUndoOnFocusOut:Boolean = true;
      
      mx_internal var embeddedFontContext:IFlexModuleFactory;
      
      mx_internal var batchTextInput:Boolean = true;
      
      private var mouseDown:Boolean = false;
      
      private var priorEditingMode:String;
      
      private var widthConstraint:Number = NaN;
      
      private var heightConstraint:Number = NaN;
      
      private var hasProgrammaticSelectionRange:Boolean = false;
      
      mx_internal var autoSize:Boolean = false;
      
      private var lastMeasuredWidth:Number = NaN;
      
      private var lastMeasuredHeight:Number = NaN;
      
      private var lastUnscaledWidth:Number;
      
      private var lastUnscaledHeight:Number;
      
      private var enabledChanged:Boolean = false;
      
      private var _clipAndEnableScrolling:Boolean = false;
      
      private var clipAndEnableScrollingChanged:Boolean = false;
      
      private var _contentHeight:Number = 0;
      
      private var _contentWidth:Number = 0;
      
      private var _horizontalScrollPosition:Number = 0;
      
      private var horizontalScrollPositionChanged:Boolean = false;
      
      private var _verticalScrollPosition:Number = 0;
      
      private var verticalScrollPositionChanged:Boolean = false;
      
      private var _content:Object;
      
      private var contentChanged:Boolean = false;
      
      private var _displayAsPassword:Boolean = false;
      
      private var displayAsPasswordChanged:Boolean = false;
      
      private var _editable:Boolean = true;
      
      private var editableChanged:Boolean = false;
      
      private var _heightInLines:Number = NaN;
      
      private var heightInLinesChanged:Boolean = false;
      
      private var _imeMode:String = null;
      
      private var _maxChars:int = 0;
      
      private var _multiline:Boolean = true;
      
      private var _restrict:String = null;
      
      private var _selectable:Boolean = true;
      
      private var selectableChanged:Boolean = false;
      
      private var _selectionActivePosition:int = -1;
      
      private var _selectionAnchorPosition:int = -1;
      
      private var _selectionHighlighting:String = "whenFocused";
      
      private var selectionFormatsChanged:Boolean = false;
      
      private var _text:String = "";
      
      private var textChanged:Boolean = false;
      
      private var _textContainerManager:RichEditableTextContainerManager;
      
      private var _textFlow:TextFlow;
      
      private var textFlowChanged:Boolean = false;
      
      private var typicalTextChanged:Boolean;
      
      private var _typicalText:String;
      
      private var _typicalTextFlow:TextFlow;
      
      private var _widthInChars:Number = NaN;
      
      private var widthInCharsChanged:Boolean = true;
      
      public function RichEditableText()
      {
         this.mx_internal::unbounded = new Rectangle(0,0,NaN,NaN);
         super();
         initClass();
         this.text = "";
         this._textContainerManager = this.mx_internal::createTextContainerManager();
         addEventListener(Event.REMOVED_FROM_STAGE,this.removedFromStageHandler);
         this._textContainerManager.addEventListener(CompositionCompleteEvent.COMPOSITION_COMPLETE,this.textContainerManager_compositionCompleteHandler);
         this._textContainerManager.addEventListener(DamageEvent.DAMAGE,this.textContainerManager_damageHandler);
         this._textContainerManager.addEventListener(Event.SCROLL,this.textContainerManager_scrollHandler);
         this._textContainerManager.addEventListener(SelectionEvent.SELECTION_CHANGE,this.textContainerManager_selectionChangeHandler);
         this._textContainerManager.addEventListener(FlowOperationEvent.FLOW_OPERATION_BEGIN,this.textContainerManager_flowOperationBeginHandler);
         this._textContainerManager.addEventListener(FlowOperationEvent.FLOW_OPERATION_END,this.textContainerManager_flowOperationEndHandler);
         this._textContainerManager.addEventListener(FlowOperationEvent.FLOW_OPERATION_COMPLETE,this.textContainerManager_flowOperationCompleteHandler);
         this._textContainerManager.addEventListener(StatusChangeEvent.INLINE_GRAPHIC_STATUS_CHANGE,this.textContainerManager_inlineGraphicStatusChangeHandler);
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
         staticPlainTextImporter = TextConverter.getImporter(TextConverter.PLAIN_TEXT_FORMAT);
         staticPlainTextImporter.throwOnError = true;
         staticPlainTextExporter = TextConverter.getExporter(TextConverter.PLAIN_TEXT_FORMAT);
         classInitialized = true;
      }
      
      public static function getNumberOrPercentOf(param1:Object, param2:Number) : Number
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
      
      private static function splice(param1:String, param2:int, param3:int, param4:String) : String
      {
         return param1.substring(0,param2) + param4 + param1.substring(param3,param1.length);
      }
      
      override public function get baselinePosition() : Number
      {
         return getStyle("paddingTop") + this.ascent;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         if(param1 == super.enabled)
         {
            return;
         }
         super.enabled = param1;
         this.enabledChanged = true;
         invalidateProperties();
         invalidateDisplayList();
      }
      
      override public function set explicitHeight(param1:Number) : void
      {
         super.explicitHeight = param1;
         this.heightConstraint = NaN;
         invalidateSize();
         invalidateDisplayList();
      }
      
      override public function set explicitWidth(param1:Number) : void
      {
         super.explicitWidth = param1;
         this.widthConstraint = NaN;
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get isTruncated() : Boolean
      {
         return false;
      }
      
      override public function set percentHeight(param1:Number) : void
      {
         super.percentHeight = param1;
         this.heightConstraint = NaN;
         invalidateSize();
         invalidateDisplayList();
      }
      
      override public function set percentWidth(param1:Number) : void
      {
         super.percentWidth = param1;
         this.widthConstraint = NaN;
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get showSystemCursor() : Boolean
      {
         return this.editable;
      }
      
      public function get clipAndEnableScrolling() : Boolean
      {
         return this._clipAndEnableScrolling;
      }
      
      public function set clipAndEnableScrolling(param1:Boolean) : void
      {
         if(param1 == this._clipAndEnableScrolling)
         {
            return;
         }
         this._clipAndEnableScrolling = param1;
         this.clipAndEnableScrollingChanged = true;
         invalidateProperties();
      }
      
      [Bindable("propertyChange")]
      public function get contentHeight() : Number
      {
         return this._contentHeight;
      }
      
      [Bindable("propertyChange")]
      public function get contentWidth() : Number
      {
         return this._contentWidth;
      }
      
      [Bindable("propertyChange")]
      public function get horizontalScrollPosition() : Number
      {
         return this._horizontalScrollPosition;
      }
      
      public function set horizontalScrollPosition(param1:Number) : void
      {
         if(isNaN(param1))
         {
            param1 = 0;
         }
         if(param1 == this._horizontalScrollPosition)
         {
            return;
         }
         this._horizontalScrollPosition = param1;
         this.horizontalScrollPositionChanged = true;
         invalidateProperties();
      }
      
      [Bindable("propertyChange")]
      public function get verticalScrollPosition() : Number
      {
         return this._verticalScrollPosition;
      }
      
      public function set verticalScrollPosition(param1:Number) : void
      {
         if(isNaN(param1))
         {
            param1 = 0;
         }
         if(param1 == this._verticalScrollPosition)
         {
            return;
         }
         this._verticalScrollPosition = param1;
         this.verticalScrollPositionChanged = true;
         invalidateProperties();
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
         this._text = null;
         this._textFlow = null;
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
         dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
      }
      
      public function get displayAsPassword() : Boolean
      {
         return this._displayAsPassword;
      }
      
      public function set displayAsPassword(param1:Boolean) : void
      {
         if(param1 == this._displayAsPassword)
         {
            return;
         }
         this._displayAsPassword = param1;
         this.displayAsPasswordChanged = true;
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get editable() : Boolean
      {
         return this._editable;
      }
      
      public function set editable(param1:Boolean) : void
      {
         if(param1 == this._editable)
         {
            return;
         }
         this._editable = param1;
         this.editableChanged = true;
         invalidateProperties();
         invalidateDisplayList();
      }
      
      private function get editingMode() : String
      {
         if(this.enabledChanged || this.editableChanged || this.selectableChanged)
         {
            this.updateEditingMode();
            this.enabledChanged = false;
            this.editableChanged = false;
            this.selectableChanged = false;
         }
         return this._textContainerManager.editingMode;
      }
      
      private function set editingMode(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:String = this._textContainerManager.editingMode;
         if(_loc2_ == param1)
         {
            return;
         }
         this._textContainerManager.editingMode = param1;
         if(param1 != EditingMode.READ_ONLY && this._selectionAnchorPosition != -1 && this._selectionActivePosition != -1)
         {
            _loc3_ = this._textContainerManager.beginInteraction();
            _loc3_.selectRange(this._selectionAnchorPosition,this._selectionActivePosition);
            this._textContainerManager.endInteraction();
         }
      }
      
      public function get enableIME() : Boolean
      {
         return this.editable && !this.displayAsPassword;
      }
      
      public function get heightInLines() : Number
      {
         return this._heightInLines;
      }
      
      public function set heightInLines(param1:Number) : void
      {
         if(param1 == this._heightInLines)
         {
            return;
         }
         this._heightInLines = param1;
         this.heightInLinesChanged = true;
         this.heightConstraint = NaN;
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get imeMode() : String
      {
         return this._imeMode;
      }
      
      public function set imeMode(param1:String) : void
      {
         this._imeMode = param1;
      }
      
      public function get lineBreak() : String
      {
         return getStyle("lineBreak");
      }
      
      public function set lineBreak(param1:String) : void
      {
         setStyle("lineBreak",param1);
      }
      
      public function get maxChars() : int
      {
         return this._maxChars;
      }
      
      public function set maxChars(param1:int) : void
      {
         this._maxChars = param1;
      }
      
      public function get multiline() : Boolean
      {
         return this._multiline;
      }
      
      public function set multiline(param1:Boolean) : void
      {
         this._multiline = param1;
      }
      
      public function get restrict() : String
      {
         return this._restrict;
      }
      
      public function set restrict(param1:String) : void
      {
         this._restrict = param1;
      }
      
      public function get selectable() : Boolean
      {
         return this._selectable;
      }
      
      public function set selectable(param1:Boolean) : void
      {
         if(param1 == this._selectable)
         {
            return;
         }
         this._selectable = param1;
         this.selectableChanged = true;
         invalidateProperties();
         invalidateDisplayList();
      }
      
      [Bindable("selectionChange")]
      public function get selectionActivePosition() : int
      {
         return this._selectionActivePosition;
      }
      
      [Bindable("selectionChange")]
      public function get selectionAnchorPosition() : int
      {
         return this._selectionAnchorPosition;
      }
      
      public function get selectionHighlighting() : String
      {
         return this._selectionHighlighting;
      }
      
      public function set selectionHighlighting(param1:String) : void
      {
         if(param1 == this._selectionHighlighting)
         {
            return;
         }
         this._selectionHighlighting = param1;
         this.selectionFormatsChanged = true;
         invalidateProperties();
         invalidateDisplayList();
      }
      
      [Bindable("change")]
      public function get text() : String
      {
         if(this._textContainerManager && !this.textChanged && !this.textFlowChanged && !this.contentChanged && !this.displayAsPassword)
         {
            return this._textContainerManager.getText("\n");
         }
         if(this._text == null)
         {
            if(this._content != null)
            {
               this._textFlow = this.createTextFlowFromContent(this._content);
            }
            this._text = staticPlainTextExporter.export(this._textFlow,ConversionType.STRING_TYPE) as String;
         }
         return this._text;
      }
      
      public function set text(param1:String) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         if(this.source == "text" && this.text == param1)
         {
            return;
         }
         this._text = param1;
         this.textChanged = true;
         this.source = "text";
         this.textFlowChanged = false;
         this.contentChanged = false;
         this._textFlow = null;
         this._content = null;
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
         dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
      }
      
      mx_internal function get textContainerManager() : TextContainerManager
      {
         return this._textContainerManager;
      }
      
      public function get textFlow() : TextFlow
      {
         if(!this._textFlow)
         {
            if(this._content != null)
            {
               this._textFlow = this.createTextFlowFromContent(this._content);
               this._content = null;
            }
            else
            {
               this._textFlow = staticPlainTextImporter.importToFlow(this._text);
            }
            this.textFlowChanged = true;
         }
         if(this.textChanged || this.contentChanged || this.textFlowChanged)
         {
            this._textContainerManager.setTextFlow(this._textFlow);
            this.textChanged = this.contentChanged = this.textFlowChanged = false;
         }
         if(this.editingMode != EditingMode.READ_ONLY)
         {
            this._textContainerManager.beginInteraction();
            this._textContainerManager.endInteraction();
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
         this._textFlow = param1;
         this.textFlowChanged = true;
         this.source = "textFlow";
         this.textChanged = false;
         this.contentChanged = false;
         this._text = null;
         this._content = null;
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
         dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
      }
      
      public function get typicalText() : String
      {
         return this._typicalText;
      }
      
      public function set typicalText(param1:String) : void
      {
         if(param1 == this._typicalText)
         {
            return;
         }
         this._typicalText = param1;
         this.typicalTextChanged = true;
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
      }
      
      public function get widthInChars() : Number
      {
         return this._widthInChars;
      }
      
      public function set widthInChars(param1:Number) : void
      {
         if(param1 == this._widthInChars)
         {
            return;
         }
         this._widthInChars = param1;
         this.widthInCharsChanged = true;
         this.widthConstraint = NaN;
         invalidateProperties();
         invalidateSize();
         invalidateDisplayList();
      }
      
      override protected function initializeAccessibility() : void
      {
         if(false)
         {
            RichEditableText.mx_internal::createAccessibilityImplementation(this);
         }
      }
      
      override public function parentChanged(param1:DisplayObjectContainer) : void
      {
         if(focusManager)
         {
            focusManager.removeEventListener(FlexEvent.FLEX_WINDOW_ACTIVATE,this._textContainerManager.activateHandler);
            focusManager.removeEventListener(FlexEvent.FLEX_WINDOW_DEACTIVATE,this._textContainerManager.deactivateHandler);
         }
         super.parentChanged(param1);
         if(focusManager)
         {
            this.addActivateHandlers();
         }
         else if(systemManager)
         {
            systemManager.getSandboxRoot().addEventListener(FlexEvent.ADD_FOCUS_MANAGER,this.addFocusManagerHandler,true,0,true);
         }
         else
         {
            addEventListener(Event.ADDED_TO_STAGE,this.addedToStageHandler);
         }
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         if(!param1.parent)
         {
            return param1;
         }
         if(param1.parent == this)
         {
            return super.removeChild(param1);
         }
         return param1.parent.removeChild(param1);
      }
      
      override protected function commitProperties() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         super.commitProperties();
         this.updateStylesIfChanged();
         var _loc1_:int = this._selectionAnchorPosition;
         var _loc2_:int = this._selectionActivePosition;
         if(this.enabledChanged || this.selectableChanged || this.editableChanged)
         {
            this.updateEditingMode();
            this.enabledChanged = false;
            this.editableChanged = false;
            this.selectableChanged = false;
         }
         if(this.textChanged)
         {
            if(false)
            {
               this.mx_internal::preserveSelectionOnSetText = true;
            }
            if(this._text.indexOf("\n") != -1 || this._text.indexOf("\r") != -1)
            {
               this._textFlow = staticPlainTextImporter.importToFlow(this._text);
               this._textContainerManager.setTextFlow(this._textFlow);
            }
            else
            {
               this._textContainerManager.setText(this._text);
            }
         }
         else if(this.textFlowChanged)
         {
            this._textContainerManager.setTextFlow(this._textFlow);
         }
         else if(this.contentChanged)
         {
            this._textFlow = this.createTextFlowFromContent(this._content);
            this._textContainerManager.setTextFlow(this._textFlow);
            this._content = null;
         }
         if(this.textChanged || this.textFlowChanged || this.contentChanged)
         {
            this.lastGeneration = !!this._textFlow ? this._textFlow.generation : 0;
            this.lastContentBoundsGeneration = 0;
            if(this.displayAsPassword)
            {
               this.displayAsPasswordChanged = true;
            }
            this.widthConstraint = NaN;
            this.heightConstraint = NaN;
            this.textChanged = false;
            this.textFlowChanged = false;
            this.contentChanged = false;
            invalidateSize();
            invalidateDisplayList();
         }
         if(this.displayAsPasswordChanged)
         {
            this.mx_internal::preserveSelectionOnSetText = true;
            if(this.displayAsPassword)
            {
               this._text = this._textContainerManager.getText("\n");
               _loc3_ = StringUtil.repeat(this.mx_internal::passwordChar,this._text.length);
               this._textContainerManager.setText(_loc3_);
            }
            else
            {
               this._textContainerManager.setText(this._text);
            }
            this._textFlow = null;
            this.lastGeneration = 0;
            this.lastContentBoundsGeneration = 0;
            this.displayAsPasswordChanged = false;
         }
         if(this.mx_internal::preserveSelectionOnSetText)
         {
            this.mx_internal::preserveSelectionOnSetText = false;
            if(_loc1_ != -1)
            {
               if(_loc4_ = this._textContainerManager.beginInteraction())
               {
                  _loc4_.selectRange(_loc1_,_loc2_);
                  this._textContainerManager.endInteraction();
               }
            }
         }
         if(this.clipAndEnableScrollingChanged)
         {
            this._textContainerManager.horizontalScrollPolicy = "auto";
            this._textContainerManager.verticalScrollPolicy = "auto";
            this.clipAndEnableScrollingChanged = false;
         }
         if(this.horizontalScrollPositionChanged)
         {
            _loc5_ = this._textContainerManager.horizontalScrollPosition;
            this._textContainerManager.horizontalScrollPosition = this._horizontalScrollPosition;
            dispatchPropertyChangeEvent("horizontalScrollPosition",_loc5_,this._horizontalScrollPosition);
            this.horizontalScrollPositionChanged = false;
         }
         if(this.verticalScrollPositionChanged)
         {
            _loc6_ = this._textContainerManager.verticalScrollPosition;
            this._textContainerManager.verticalScrollPosition = this._verticalScrollPosition;
            dispatchPropertyChangeEvent("verticalScrollPosition",_loc6_,this._verticalScrollPosition);
            this.verticalScrollPositionChanged = false;
         }
      }
      
      override protected function canSkipMeasurement() : Boolean
      {
         this.mx_internal::autoSize = false;
         return super.canSkipMeasurement();
      }
      
      override protected function measure() : void
      {
         var _loc1_:* = null;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         this.inMeasureMethod = true;
         this.lastMeasuredWidth = measuredWidth;
         this.lastMeasuredHeight = measuredHeight;
         super.measure();
         this.updateStylesIfChanged();
         if(this.mx_internal::isMeasureFixed())
         {
            this.mx_internal::autoSize = false;
            if(this.typicalText)
            {
               if(this.typicalTextChanged)
               {
                  if(this._typicalText.indexOf("\n") != -1 || this._typicalText.indexOf("\r") != -1)
                  {
                     this._typicalTextFlow = staticPlainTextImporter.importToFlow(this._typicalText);
                     this._typicalTextFlow.hostFormat = this._textContainerManager.hostFormat;
                  }
                  else
                  {
                     this._typicalTextFlow = null;
                  }
                  this.typicalTextChanged = false;
               }
               if(this._typicalTextFlow)
               {
                  if(!staticTextFlowFactory)
                  {
                     staticTextFlowFactory = new TextFlowTextLineFactory();
                     staticTextFlowFactory.compositionBounds = this.mx_internal::unbounded;
                  }
                  if(this._typicalTextFlow.flowComposer)
                  {
                     this._typicalTextFlow.flowComposer.swfContext = ISWFContext(this.mx_internal::embeddedFontContext);
                  }
                  staticTextFlowFactory.swfContext = ISWFContext(this.mx_internal::embeddedFontContext);
                  staticTextFlowFactory.createTextLines(this.tossTextLine,this._typicalTextFlow);
                  _loc1_ = staticTextFlowFactory.getContentBounds();
               }
               else
               {
                  if(!staticStringFactory)
                  {
                     staticStringFactory = new StringTextLineFactory();
                     staticStringFactory.compositionBounds = this.mx_internal::unbounded;
                  }
                  staticStringFactory.text = this._typicalText;
                  staticStringFactory.textFlowFormat = this._textContainerManager.hostFormat;
                  staticStringFactory.swfContext = ISWFContext(this.mx_internal::embeddedFontContext);
                  staticStringFactory.createTextLines(this.tossTextLine);
                  _loc1_ = staticStringFactory.getContentBounds();
               }
               measuredWidth = Math.ceil(_loc1_.width);
               measuredHeight = Math.ceil(_loc1_.height);
            }
            else
            {
               measuredWidth = !isNaN(explicitWidth) ? explicitWidth : Math.ceil(this.calculateWidthInChars());
               measuredHeight = !isNaN(explicitHeight) ? explicitHeight : Math.ceil(this.calculateHeightInLines());
            }
         }
         else
         {
            this.mx_internal::autoSize = true;
            if(!isNaN(this.widthConstraint) || !isNaN(explicitWidth) || !isNaN(this.widthInChars))
            {
               if(!isNaN(this.widthConstraint))
               {
                  _loc2_ = this.widthConstraint;
               }
               else if(!isNaN(explicitWidth))
               {
                  _loc2_ = explicitWidth;
               }
               else
               {
                  _loc2_ = Math.ceil(this.calculateWidthInChars());
               }
               _loc1_ = this.measureTextSize(_loc2_);
               if(!isNaN(explicitWidth) || !isNaN(this.widthInChars))
               {
                  measuredWidth = this.mx_internal::textContainerManager.compositionWidth;
               }
               else
               {
                  measuredWidth = Math.ceil(_loc1_.width);
               }
               measuredHeight = Math.ceil(_loc1_.bottom);
            }
            else if(!isNaN(this.heightConstraint) || !isNaN(explicitHeight) || !isNaN(this._heightInLines))
            {
               if(!isNaN(this.heightConstraint))
               {
                  _loc3_ = this.heightConstraint;
               }
               else if(!isNaN(explicitHeight))
               {
                  _loc3_ = explicitHeight;
               }
               else
               {
                  _loc3_ = this.calculateHeightInLines();
               }
               _loc1_ = this.measureTextSize(NaN,_loc3_);
               measuredWidth = Math.ceil(_loc1_.right);
               measuredHeight = _loc3_;
               if(_loc1_.bottom > _loc3_)
               {
                  this.mx_internal::autoSize = false;
               }
            }
            else
            {
               _loc1_ = this.measureTextSize(NaN);
               measuredWidth = Math.ceil(_loc1_.right);
               measuredHeight = Math.ceil(_loc1_.bottom);
            }
            if(isNaN(explicitHeight))
            {
               if(!isNaN(explicitMinHeight) && measuredHeight < explicitMinHeight)
               {
                  measuredHeight = explicitMinHeight;
               }
               if(!isNaN(explicitMaxHeight) && measuredHeight > explicitMaxHeight)
               {
                  measuredHeight = explicitMaxHeight;
                  this.mx_internal::autoSize = false;
               }
            }
            if(this.mx_internal::autoSize && getStyle("lineBreak") == "toFit")
            {
               this._textContainerManager.horizontalScrollPosition = 0;
               this._textContainerManager.verticalScrollPosition = 0;
            }
            if(this.remeasuringText && this.lastMeasuredWidth == measuredWidth && this.lastMeasuredHeight == measuredHeight)
            {
               this._textContainerManager.updateContainer();
            }
         }
         this.remeasuringText = false;
         this.inMeasureMethod = false;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         this.inUpdateDLMethod = true;
         this.updateStylesIfChanged();
         if(this.mx_internal::autoSize && this.lastUnscaledHeight == param2 && this.lastUnscaledWidth == param1 && this.remeasureText(param1,param2))
         {
            this.inUpdateDLMethod = false;
            return;
         }
         super.updateDisplayList(param1,param2);
         if(!this.mx_internal::autoSize)
         {
            this._textContainerManager.compositionWidth = param1;
            this._textContainerManager.compositionHeight = param2;
         }
         if(this.clipAndEnableScrolling && this._textContainerManager.tlf_internal::composeState != TextContainerManager.tlf_internal::COMPOSE_COMPOSER)
         {
            this._textContainerManager.tlf_internal::convertToTextFlowWithComposer();
         }
         if(this.mx_internal::autoSize && !isNaN(this.lastUnscaledWidth) && (this.lastUnscaledWidth != param1 || this.lastUnscaledHeight != param2))
         {
            if(this._textContainerManager.tlf_internal::composeState == TextContainerManager.tlf_internal::COMPOSE_COMPOSER)
            {
               this._textContainerManager.getTextFlow().flowComposer.getControllerAt(0).tlf_internal::shapesInvalid = true;
            }
            else if(!this._textContainerManager.isDamaged())
            {
               this._textContainerManager.drawBackgroundAndSetScrollRect(0,0);
            }
         }
         this._textContainerManager.updateContainer();
         this.lastUnscaledWidth = param1;
         this.lastUnscaledHeight = param2;
         this.inUpdateDLMethod = false;
      }
      
      override public function setLayoutBoundsSize(param1:Number, param2:Number, param3:Boolean = true) : void
      {
         this.heightConstraint = param2;
         super.setLayoutBoundsSize(param1,param2,param3);
         if(this.widthConstraint == param1)
         {
            return;
         }
         if(getStyle("lineBreak") == "explicit")
         {
            return;
         }
         if(super.canSkipMeasurement())
         {
            return;
         }
         if(!isNaN(explicitHeight))
         {
            return;
         }
         var _loc4_:Boolean;
         if(!(_loc4_ = !isNaN(param1) && param1 != measuredWidth && param1 != 0))
         {
            return;
         }
         if(param3 && hasComplexLayoutMatrix)
         {
            return;
         }
         this.widthConstraint = param1;
         invalidateSize();
      }
      
      override public function stylesInitialized() : void
      {
         super.stylesInitialized();
         this.ascent = NaN;
         this.descent = NaN;
         this.hostFormatChanged = true;
      }
      
      override public function styleChanged(param1:String) : void
      {
         super.styleChanged(param1);
         if(param1 == null || param1 == "styleName")
         {
            this.hostFormatChanged = true;
            this.selectionFormatsChanged = true;
            this.ascent = NaN;
            this.descent = NaN;
         }
         else if(param1 == "focusedTextSelectionColor" || param1 == "unfocusedTextSelectionColor" || param1 == "inactiveTextSelectionColor")
         {
            this.selectionFormatsChanged = true;
         }
         else
         {
            this.hostFormatChanged = true;
            if(param1.indexOf("font") == 0 || param1 == "cffHinting")
            {
               this.ascent = NaN;
               this.descent = NaN;
            }
         }
         invalidateProperties();
      }
      
      override public function setFocus() : void
      {
         if(this.editingMode != EditingMode.READ_ONLY && this._textContainerManager.tlf_internal::composeState != TextContainerManager.tlf_internal::COMPOSE_COMPOSER)
         {
            this._textContainerManager.beginInteraction();
            this._textContainerManager.endInteraction();
         }
         super.setFocus();
      }
      
      override public function drawFocus(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            _loc2_ = focusManager;
            if(Boolean(_loc2_) && _loc2_.getFocus() != this)
            {
               return;
            }
         }
         super.drawFocus(param1);
      }
      
      public function getHorizontalScrollPositionDelta(param1:uint) : Number
      {
         var _loc2_:Rectangle = scrollRect;
         if(!_loc2_)
         {
            return 0;
         }
         var _loc3_:Number = this.contentWidth - _loc2_.right;
         var _loc4_:Number = -_loc2_.left;
         var _loc5_:Number = getStyle("fontSize");
         switch(param1)
         {
            case NavigationUnit.LEFT:
               return _loc2_.left <= 0 ? 0 : Math.max(_loc4_,-_loc5_);
            case NavigationUnit.RIGHT:
               return _loc2_.right >= this.contentWidth ? 0 : Math.min(_loc3_,_loc5_);
            case NavigationUnit.PAGE_LEFT:
               return Math.max(_loc4_,-_loc2_.width);
            case NavigationUnit.PAGE_RIGHT:
               return Math.min(_loc3_,_loc2_.width);
            case NavigationUnit.HOME:
               return _loc4_;
            case NavigationUnit.END:
               return _loc3_;
            default:
               return 0;
         }
      }
      
      public function getVerticalScrollPositionDelta(param1:uint) : Number
      {
         var _loc2_:Rectangle = scrollRect;
         if(!_loc2_)
         {
            return 0;
         }
         var _loc3_:Number = this.contentHeight - _loc2_.bottom;
         var _loc4_:Number = -_loc2_.top;
         switch(param1)
         {
            case NavigationUnit.UP:
               return this._textContainerManager.getScrollDelta(-1);
            case NavigationUnit.DOWN:
               return this._textContainerManager.getScrollDelta(1);
            case NavigationUnit.PAGE_UP:
               return Math.max(_loc4_,-_loc2_.height);
            case NavigationUnit.PAGE_DOWN:
               return Math.min(_loc3_,_loc2_.height);
            case NavigationUnit.HOME:
               return _loc4_;
            case NavigationUnit.END:
               return _loc3_;
            default:
               return 0;
         }
      }
      
      public function insertText(param1:String) : void
      {
         this.handleInsertText(param1);
      }
      
      public function appendText(param1:String) : void
      {
         this.handleInsertText(param1,true);
      }
      
      public function scrollToRange(param1:int, param2:int) : void
      {
         validateProperties();
         this.mx_internal::textContainerManager.scrollToRange(param1,param2);
      }
      
      public function selectRange(param1:int, param2:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         validateProperties();
         if(this.editingMode == EditingMode.READ_ONLY)
         {
            _loc3_ = new SelectionState(this.textFlow,param1,param2);
            _loc4_ = new SelectionEvent(SelectionEvent.SELECTION_CHANGE,false,false,_loc3_);
            this.textContainerManager_selectionChangeHandler(_loc4_);
         }
         else
         {
            (_loc5_ = this._textContainerManager.beginInteraction()).selectRange(param1,param2);
            _loc5_.refreshSelection();
            this._textContainerManager.endInteraction();
         }
         this.hasProgrammaticSelectionRange = param1 != param2;
      }
      
      public function selectAll() : void
      {
         this.selectRange(0,int.MAX_VALUE);
      }
      
      public function getFormatOfRange(param1:Vector.<String> = null, param2:int = -1, param3:int = -1) : TextLayoutFormat
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc4_:TextLayoutFormat = new TextLayoutFormat();
         validateProperties();
         var _loc5_:Object = TextLayoutFormat.tlf_internal::description;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         if(!param1)
         {
            param1 = new Vector.<String>();
            for(_loc6_ in _loc5_)
            {
               param1.push(_loc6_);
            }
            _loc8_ = true;
            _loc9_ = true;
            _loc10_ = true;
         }
         else
         {
            for each(_loc6_ in param1)
            {
               if(_loc6_ in _loc5_)
               {
                  if((_loc7_ = _loc5_[_loc6_].category) == Category.CONTAINER)
                  {
                     _loc8_ = true;
                  }
                  else if(_loc7_ == Category.PARAGRAPH)
                  {
                     _loc9_ = true;
                  }
                  else if(_loc7_ == Category.CHARACTER)
                  {
                     _loc10_ = true;
                  }
               }
            }
         }
         if(param2 == -1 && param3 == -1)
         {
            param2 = this._selectionAnchorPosition;
            param3 = this._selectionActivePosition;
         }
         if(_loc8_)
         {
            _loc11_ = this._textContainerManager.mx_internal::getCommonContainerFormat();
         }
         if(_loc9_)
         {
            _loc12_ = this._textContainerManager.mx_internal::getCommonParagraphFormat(param2,param3);
         }
         if(_loc10_)
         {
            _loc13_ = this._textContainerManager.mx_internal::getCommonCharacterFormat(param2,param3);
         }
         for each(_loc6_ in param1)
         {
            if(_loc6_ in _loc5_)
            {
               if((_loc7_ = _loc5_[_loc6_].category) == Category.CONTAINER && Boolean(_loc11_))
               {
                  _loc4_[_loc6_] = _loc11_[_loc6_];
               }
               else if(_loc7_ == Category.PARAGRAPH && Boolean(_loc12_))
               {
                  _loc4_[_loc6_] = _loc12_[_loc6_];
               }
               else if(_loc7_ == Category.CHARACTER && Boolean(_loc13_))
               {
                  _loc4_[_loc6_] = _loc13_[_loc6_];
               }
            }
         }
         return _loc4_;
      }
      
      public function setFormatOfRange(param1:TextLayoutFormat, param2:int = -1, param3:int = -1) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         validateProperties();
         var _loc7_:Object = TextLayoutFormat.tlf_internal::description;
         for(_loc8_ in _loc7_)
         {
            if(param1[_loc8_] !== undefined)
            {
               if((_loc9_ = _loc7_[_loc8_].category) == Category.CONTAINER)
               {
                  if(!_loc4_)
                  {
                     _loc4_ = new TextLayoutFormat();
                  }
                  _loc4_[_loc8_] = param1[_loc8_];
               }
               else if(_loc9_ == Category.PARAGRAPH)
               {
                  if(!_loc5_)
                  {
                     _loc5_ = new TextLayoutFormat();
                  }
                  _loc5_[_loc8_] = param1[_loc8_];
               }
               else if(_loc9_ == Category.CHARACTER)
               {
                  if(!_loc6_)
                  {
                     _loc6_ = new TextLayoutFormat();
                  }
                  _loc6_[_loc8_] = param1[_loc8_];
               }
            }
         }
         if(param2 == -1 && param3 == -1)
         {
            param2 = this._selectionAnchorPosition;
            param3 = this._selectionActivePosition;
         }
         this._textContainerManager.mx_internal::applyFormatOperation(_loc6_,_loc5_,_loc4_,param2,param3);
      }
      
      mx_internal function createTextContainerManager() : RichEditableTextContainerManager
      {
         return new RichEditableTextContainerManager(this);
      }
      
      private function updateStylesIfChanged() : void
      {
         if(this.hostFormatChanged)
         {
            this._textContainerManager.hostFormat = new CSSTextLayoutFormat(this);
            this.hostFormatChanged = false;
         }
         if(isNaN(this.ascent) || isNaN(this.descent))
         {
            this.mx_internal::embeddedFontContext = this.getEmbeddedFontContext();
            this._textContainerManager.swfContext = ISWFContext(this.mx_internal::embeddedFontContext);
            this.calculateFontMetrics();
         }
         if(this.selectionFormatsChanged)
         {
            this._textContainerManager.invalidateSelectionFormats();
            this.selectionFormatsChanged = false;
         }
      }
      
      private function getEmbeddedFontContext() : IFlexModuleFactory
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = false;
         var _loc5_:* = false;
         var _loc2_:String = getStyle("fontLookup");
         if(_loc2_ != FontLookup.DEVICE)
         {
            _loc3_ = getStyle("fontFamily");
            _loc4_ = getStyle("fontWeight") == "bold";
            _loc5_ = getStyle("fontStyle") == "italic";
            _loc1_ = mx_internal::getFontContext(_loc3_,_loc4_,_loc5_,true);
         }
         return _loc1_;
      }
      
      mx_internal function isMeasureFixed() : Boolean
      {
         if(!this._textContainerManager.hostFormat)
         {
            this.updateStylesIfChanged();
         }
         if(this._textContainerManager.hostFormat.blockProgression != BlockProgression.TB)
         {
            return true;
         }
         if(this.typicalText != null)
         {
            return true;
         }
         return (!isNaN(explicitWidth) || !isNaN(this._widthInChars) || !isNaN(this.widthConstraint)) && (!isNaN(explicitHeight) || !isNaN(this._heightInLines) || !isNaN(this.heightConstraint));
      }
      
      private function measureTextSize(param1:Number, param2:Number = NaN) : Rectangle
      {
         if(isNaN(explicitWidth) && isNaN(this.widthInChars))
         {
            if(!isNaN(explicitMinWidth) && !isNaN(param1) && param1 < minWidth)
            {
               param1 = minWidth;
            }
            if(!isNaN(explicitMaxWidth) && isNaN(param1) || param1 > maxWidth)
            {
               param1 = maxWidth;
            }
         }
         this._textContainerManager.compositionWidth = param1;
         this._textContainerManager.compositionHeight = param2;
         if(this.clipAndEnableScrolling && this._textContainerManager.tlf_internal::composeState != TextContainerManager.tlf_internal::COMPOSE_COMPOSER)
         {
            this._textContainerManager.tlf_internal::convertToTextFlowWithComposer();
         }
         this._textContainerManager.compose();
         var _loc3_:Rectangle = this._textContainerManager.getContentBounds();
         if(this._textContainerManager.getText("\n").length == 0)
         {
            _loc3_.width += getStyle("fontSize");
         }
         if(isNaN(explicitWidth) && isNaN(this.widthInChars))
         {
            if(!isNaN(explicitMinWidth) && isNaN(param1) && _loc3_.width < minWidth)
            {
               _loc3_.width = minWidth;
            }
         }
         return _loc3_;
      }
      
      private function remeasureText(param1:Number, param2:Number) : Boolean
      {
         if(param1 == measuredWidth && param2 == measuredHeight)
         {
            return false;
         }
         this.mx_internal::autoSize = false;
         if(param1 == 0 || param2 == 0)
         {
            return false;
         }
         if(this.typicalText != null)
         {
            return false;
         }
         if(this._textContainerManager.hostFormat.lineBreak == "explicit")
         {
            return false;
         }
         if(!isNaN(this.widthConstraint))
         {
            if(!isNaN(explicitHeight) || !isNaN(this._heightInLines) || !isNaN(this.heightConstraint))
            {
               return false;
            }
         }
         if(!isNaN(this.heightConstraint))
         {
            if(!isNaN(explicitWidth) || !isNaN(this._widthInChars))
            {
               return false;
            }
         }
         invalidateSize();
         this.remeasuringText = true;
         return true;
      }
      
      private function calculateFontMetrics() : void
      {
         var _loc2_:* = null;
         var _loc7_:* = null;
         var _loc1_:FontDescription = new FontDescription();
         _loc2_ = getStyle("cffHinting");
         if(_loc2_ != null)
         {
            _loc1_.cffHinting = _loc2_;
         }
         _loc2_ = getStyle("fontFamily");
         if(_loc2_ != null)
         {
            _loc1_.fontName = _loc2_;
         }
         _loc2_ = getStyle("fontLookup");
         if(_loc2_ != null)
         {
            if(_loc2_ != "device")
            {
               _loc2_ = TextUtil.resolveFontLookup(this._textContainerManager.swfContext,this._textContainerManager.hostFormat);
            }
            _loc1_.fontLookup = _loc2_;
         }
         _loc2_ = getStyle("fontStyle");
         if(_loc2_ != null)
         {
            _loc1_.fontPosture = _loc2_;
         }
         _loc2_ = getStyle("fontWeight");
         if(_loc2_ != null)
         {
            _loc1_.fontWeight = _loc2_;
         }
         var _loc3_:ElementFormat = new ElementFormat();
         _loc3_.fontDescription = _loc1_;
         _loc3_.fontSize = getStyle("fontSize");
         var _loc4_:TextElement;
         (_loc4_ = new TextElement()).elementFormat = _loc3_;
         _loc4_.text = "M";
         var _loc5_:TextBlock;
         (_loc5_ = new TextBlock()).content = _loc4_;
         var _loc6_:ISWFContext;
         if(_loc6_ = ISWFContext(this.mx_internal::embeddedFontContext))
         {
            _loc7_ = _loc6_.callInContext(_loc5_.createTextLine,_loc5_,[null,1000]);
         }
         else
         {
            _loc7_ = _loc5_.createTextLine(null,1000);
         }
         this.ascent = _loc7_.ascent;
         this.descent = _loc7_.descent;
      }
      
      private function calculateWidthInChars() : Number
      {
         var _loc2_:int = 0;
         var _loc1_:Number = getStyle("fontSize");
         if(isNaN(this._widthInChars))
         {
            _loc2_ = isNaN(this._heightInLines) ? 10 : 1;
         }
         else
         {
            _loc2_ = this._widthInChars;
         }
         return getStyle("paddingLeft") + _loc2_ * _loc1_ + getStyle("paddingRight");
      }
      
      private function calculateHeightInLines() : Number
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc1_:Number = getStyle("paddingTop") + getStyle("paddingBottom");
         if(this._heightInLines == 0)
         {
            return _loc1_;
         }
         if(isNaN(this._heightInLines))
         {
            _loc2_ = isNaN(this._widthInChars) ? 10 : 1;
         }
         else
         {
            _loc2_ = this._heightInLines;
         }
         _loc3_ = getStyle("firstBaselineOffset");
         if(_loc3_ == _loc4_)
         {
            _loc1_ += _loc4_;
         }
         else if(_loc3_ is Number)
         {
            _loc1_ += Number(_loc3_);
         }
         else
         {
            _loc1_ += this.ascent;
         }
         if(_loc2_ > 1)
         {
            _loc3_ = getStyle("lineHeight");
            _loc4_ = RichEditableText.getNumberOrPercentOf(_loc3_,getStyle("fontSize"));
            if(isNaN(_loc4_))
            {
               _loc4_ = getStyle("fontSize") * 1.2;
            }
            _loc1_ += (_loc2_ - 1) * _loc4_;
         }
         return _loc1_ + this.descent;
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
      
      private function updateEditingMode() : void
      {
         var _loc1_:String = "null";
         if(enabled)
         {
            if(this._editable)
            {
               _loc1_ = "null";
            }
            else if(this._selectable)
            {
               _loc1_ = "null";
            }
         }
         this.editingMode = _loc1_;
      }
      
      private function handleInsertText(param1:String, param2:Boolean = false) : void
      {
         validateProperties();
         if(param2)
         {
            this._selectionAnchorPosition = this.text.length;
            this._selectionActivePosition = this._selectionAnchorPosition;
         }
         else if(this._selectionAnchorPosition == -1 || this._selectionActivePosition == -1)
         {
            return;
         }
         var _loc3_:Boolean = this._textContainerManager.mx_internal::insertTextOperation(param1,this._selectionAnchorPosition,this._selectionActivePosition);
         if(_loc3_)
         {
            dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
         }
      }
      
      private function handlePasteOperation(param1:PasteOperation) : void
      {
         var _loc2_:Boolean = Boolean(this.restrict) || Boolean(this.maxChars) || this.displayAsPassword;
         if(!_loc2_ && this.multiline)
         {
            return;
         }
         if(param1.textScrap == null || param1.textScrap.textFlow == null)
         {
            return;
         }
         var _loc3_:String = staticPlainTextExporter.export(param1.textScrap.textFlow,ConversionType.STRING_TYPE) as String;
         if(!_loc2_ && _loc3_.indexOf("\n") == -1)
         {
            return;
         }
         var _loc4_:int = _loc3_.length;
         if(this._displayAsPassword)
         {
            this._text = splice(this._text,param1.absoluteStart,param1.absoluteEnd,"");
            this._text = splice(this._text,param1.absoluteStart,param1.absoluteStart,_loc3_);
         }
         if(!this.multiline)
         {
            _loc3_ = _loc3_.replace(ALL_NEWLINES_REGEXP,"");
         }
         var _loc5_:IEditManager = EditManager(this._textContainerManager.beginInteraction());
         this.dispatchChangeAndChangingEvents = false;
         var _loc6_:SelectionState = new SelectionState(param1.textFlow,param1.absoluteStart,param1.absoluteStart + _loc4_);
         _loc5_.insertText(_loc3_,_loc6_);
         this._textContainerManager.endInteraction();
         this.dispatchChangeAndChangingEvents = true;
      }
      
      private function addedToStageHandler(param1:Event) : void
      {
         if(param1.target == this)
         {
            removeEventListener(Event.ADDED_TO_STAGE,this.addedToStageHandler);
            callLater(this.addActivateHandlers);
         }
      }
      
      private function addActivateHandlers() : void
      {
         if(!focusManager)
         {
            return;
         }
         focusManager.addEventListener(FlexEvent.FLEX_WINDOW_ACTIVATE,this._textContainerManager.activateHandler,false,0,true);
         focusManager.addEventListener(FlexEvent.FLEX_WINDOW_DEACTIVATE,this._textContainerManager.deactivateHandler,false,0,true);
      }
      
      private function addFocusManagerHandler(param1:Event) : void
      {
         if(focusManager == param1.target["focusManager"])
         {
            systemManager.getSandboxRoot().removeEventListener(FlexEvent.ADD_FOCUS_MANAGER,this.addFocusManagerHandler,true);
            this.addActivateHandlers();
         }
      }
      
      mx_internal function focusInHandler(param1:FocusEvent) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:IFocusManager = focusManager;
         if(Boolean(_loc2_) && this.editingMode == EditingMode.READ_WRITE)
         {
            _loc2_.showFocusIndicator = true;
         }
         super.focusInHandler(param1);
         if(this.editingMode == EditingMode.READ_WRITE)
         {
            if(!this.mouseDown)
            {
               _loc3_ = this._textContainerManager.beginInteraction();
               if(this.multiline)
               {
                  if(!_loc3_.hasSelection())
                  {
                     _loc3_.selectRange(0,0);
                  }
               }
               else if(!this.hasProgrammaticSelectionRange)
               {
                  _loc3_.selectAll();
               }
               _loc3_.refreshSelection();
               this._textContainerManager.endInteraction();
            }
            if(this._imeMode != null)
            {
               try
               {
                  if(false)
                  {
                     IME.conversionMode = this._imeMode;
                  }
               }
               catch(e:Error)
               {
               }
            }
         }
         if(Boolean(focusManager) && this.multiline)
         {
            focusManager.defaultButtonEnabled = false;
         }
      }
      
      mx_internal function focusOutHandler(param1:FocusEvent) : void
      {
         super.focusOutHandler(param1);
         if(this.mx_internal::clearUndoOnFocusOut && Boolean(this.mx_internal::undoManager))
         {
            this.mx_internal::undoManager.clearAll();
         }
         if(focusManager)
         {
            focusManager.defaultButtonEnabled = true;
         }
         dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
      }
      
      mx_internal function keyDownHandler(param1:KeyboardEvent) : void
      {
         if(this.editingMode != EditingMode.READ_WRITE)
         {
            return;
         }
         if(param1.keyCode == Keyboard.ENTER)
         {
            if(!this.multiline)
            {
               dispatchEvent(new FlexEvent(FlexEvent.ENTER));
               param1.preventDefault();
               return;
            }
            if(this._maxChars != 0 && this.text.length >= this._maxChars)
            {
               param1.preventDefault();
               return;
            }
         }
      }
      
      mx_internal function mouseDownHandler(param1:MouseEvent) : void
      {
         this.mouseDown = true;
         systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_UP,this.systemManager_mouseUpHandler,true);
      }
      
      private function systemManager_mouseUpHandler(param1:MouseEvent) : void
      {
         this.mouseDown = false;
         systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_UP,this.systemManager_mouseUpHandler,true);
      }
      
      private function removedFromStageHandler(param1:Event) : void
      {
         if(param1.target == this)
         {
            TextContainerManager.tlf_internal::releaseReferences();
         }
      }
      
      private function adjustContentBoundsForScroller(param1:Rectangle) : void
      {
         if(this._textFlow.generation == this.lastContentBoundsGeneration)
         {
            if(param1.width <= this._contentWidth)
            {
               if(this._textContainerManager.hostFormat.lineBreak == "toFit")
               {
                  if(param1.height < this._contentHeight)
                  {
                     param1.height = this._contentHeight;
                  }
               }
               else
               {
                  param1.width = this._contentWidth;
               }
            }
         }
         this.lastContentBoundsGeneration = this._textFlow.generation;
      }
      
      private function textContainerManager_compositionCompleteHandler(param1:CompositionCompleteEvent) : void
      {
         var _loc2_:Number = this._contentWidth;
         var _loc3_:Number = this._contentHeight;
         var _loc4_:Rectangle = this._textContainerManager.getContentBounds();
         _loc4_.width += _loc4_.x;
         _loc4_.height += _loc4_.y;
         if(Boolean(this._textFlow) && this.clipAndEnableScrolling)
         {
            this.adjustContentBoundsForScroller(_loc4_);
         }
         var _loc5_:Number = _loc4_.width;
         var _loc6_:Number = _loc4_.height;
         if(_loc5_ != _loc2_)
         {
            this._contentWidth = _loc5_;
            dispatchPropertyChangeEvent("contentWidth",_loc2_,_loc5_);
         }
         if(_loc6_ != _loc3_)
         {
            this._contentHeight = _loc6_;
            dispatchPropertyChangeEvent("contentHeight",_loc3_,_loc6_);
         }
      }
      
      private function textContainerManager_damageHandler(param1:DamageEvent) : void
      {
         if(param1.damageLength == 0)
         {
            return;
         }
         if(this.inUpdateDLMethod)
         {
            return;
         }
         if(this.inMeasureMethod)
         {
            invalidateDisplayList();
            return;
         }
         if(Boolean(this._textFlow) && this._textFlow.generation == this.lastGeneration)
         {
            return;
         }
         if(this.textChanged || this.textFlowChanged || this.contentChanged)
         {
            return;
         }
         if(!this.displayAsPassword)
         {
            this._text = null;
         }
         this._content = null;
         this._textFlow = this._textContainerManager.getTextFlow();
         this.lastGeneration = this._textFlow.generation;
         invalidateSize();
         invalidateDisplayList();
      }
      
      private function textContainerManager_scrollHandler(param1:Event) : void
      {
         var _loc2_:Number = this._horizontalScrollPosition;
         var _loc3_:Number = this._textContainerManager.horizontalScrollPosition;
         if(_loc3_ != _loc2_)
         {
            this._horizontalScrollPosition = _loc3_;
            dispatchPropertyChangeEvent("horizontalScrollPosition",_loc2_,_loc3_);
         }
         var _loc4_:Number = this._verticalScrollPosition;
         var _loc5_:Number;
         if((_loc5_ = this._textContainerManager.verticalScrollPosition) != _loc4_)
         {
            this._verticalScrollPosition = _loc5_;
            dispatchPropertyChangeEvent("verticalScrollPosition",_loc4_,_loc5_);
         }
      }
      
      private function textContainerManager_selectionChangeHandler(param1:SelectionEvent) : void
      {
         if(this.mx_internal::preserveSelectionOnSetText)
         {
            return;
         }
         var _loc2_:int = this._selectionAnchorPosition;
         var _loc3_:int = this._selectionActivePosition;
         var _loc4_:SelectionState;
         if(_loc4_ = param1.selectionState)
         {
            this._selectionAnchorPosition = _loc4_.anchorPosition;
            this._selectionActivePosition = _loc4_.activePosition;
         }
         else
         {
            this._selectionAnchorPosition = -1;
            this._selectionActivePosition = -1;
         }
         this.hasProgrammaticSelectionRange = false;
         var _loc5_:Boolean;
         if(_loc5_ = _loc2_ != this._selectionAnchorPosition || _loc3_ != this._selectionActivePosition)
         {
            dispatchEvent(new FlexEvent(FlexEvent.SELECTION_CHANGE));
         }
      }
      
      private function textContainerManager_flowOperationBeginHandler(param1:FlowOperationEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc2_:FlowOperation = param1.operation;
         if(_loc2_ is InsertTextOperation)
         {
            _loc3_ = InsertTextOperation(_loc2_);
            _loc4_ = _loc3_.text;
            _loc6_ = (_loc5_ = _loc3_.deleteSelectionState) == null ? 0 : _loc5_.absoluteEnd - _loc5_.absoluteStart;
            if(this._restrict != null)
            {
               if((_loc4_ = StringUtil.restrict(_loc4_,this.restrict)).length == 0 && _loc6_ == 0)
               {
                  param1.preventDefault();
                  return;
               }
            }
            if(this.maxChars != 0)
            {
               _loc7_ = this.text.length - _loc6_;
               _loc8_ = _loc4_.length;
               if(_loc7_ + _loc8_ > this.maxChars)
               {
                  _loc4_ = _loc4_.substr(0,this.maxChars - _loc7_);
               }
            }
            if(this._displayAsPassword)
            {
               if(_loc6_ > 0)
               {
                  this._text = splice(this._text,_loc5_.absoluteStart,_loc5_.absoluteEnd,"");
               }
               if(_loc4_.length > 0)
               {
                  this._text = splice(this._text,_loc3_.absoluteStart,_loc3_.absoluteStart,_loc4_);
                  _loc4_ = StringUtil.repeat(this.mx_internal::passwordChar,_loc4_.length);
               }
            }
            _loc3_.text = _loc4_;
         }
         else if(_loc2_ is CopyOperation)
         {
            if(this._displayAsPassword)
            {
               param1.preventDefault();
               return;
            }
         }
         else if(!(_loc2_ is PasteOperation))
         {
            if(_loc2_ is DeleteTextOperation || _loc2_ is CutOperation)
            {
               if((_loc9_ = FlowTextOperation(_loc2_)).absoluteStart == _loc9_.absoluteEnd)
               {
                  param1.preventDefault();
                  return;
               }
               if(this._displayAsPassword)
               {
                  if(!(_loc2_ is DeleteTextOperation))
                  {
                     param1.preventDefault();
                     return;
                  }
                  this._text = splice(this._text,_loc9_.absoluteStart,_loc9_.absoluteEnd,"");
               }
            }
         }
         if(this.dispatchChangeAndChangingEvents && param1.level == 0)
         {
            (_loc10_ = new TextOperationEvent(TextOperationEvent.CHANGING)).operation = _loc2_;
            dispatchEvent(_loc10_);
            if(_loc10_.isDefaultPrevented())
            {
               param1.preventDefault();
            }
         }
      }
      
      private function textContainerManager_flowOperationEndHandler(param1:FlowOperationEvent) : void
      {
         if(param1.operation is PasteOperation)
         {
            this.handlePasteOperation(PasteOperation(param1.operation));
         }
      }
      
      private function textContainerManager_flowOperationCompleteHandler(param1:FlowOperationEvent) : void
      {
         var _loc2_:* = null;
         if(this.dispatchChangeAndChangingEvents && param1.level == 0)
         {
            _loc2_ = new TextOperationEvent(TextOperationEvent.CHANGE);
            _loc2_.operation = param1.operation;
            dispatchEvent(_loc2_);
         }
      }
      
      private function textContainerManager_inlineGraphicStatusChangeHandler(param1:StatusChangeEvent) : void
      {
         if(param1.status == InlineGraphicElementStatus.READY)
         {
            if(this.mx_internal::autoSize)
            {
               invalidateSize();
            }
         }
         invalidateDisplayList();
      }
      
      private function tossTextLine(param1:DisplayObject) : void
      {
         TextUtil.recycleTextLine(param1 as TextLine);
      }
   }
}
