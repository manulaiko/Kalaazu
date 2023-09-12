package flashx.textLayout.compose {

import flash.display.DisplayObject;
import flash.display.GraphicsPathCommand;
import flash.display.GraphicsPathWinding;
import flash.display.Shape;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.text.engine.ElementFormat;
import flash.text.engine.FontMetrics;
import flash.text.engine.TextBaseline;
import flash.text.engine.TextBlock;
import flash.text.engine.TextLine;
import flash.text.engine.TextLineValidity;
import flash.text.engine.TextRotation;
import flash.utils.Dictionary;

import flashx.textLayout.container.ContainerController;
import flashx.textLayout.edit.ISelectionManager;
import flashx.textLayout.edit.SelectionFormat;
import flashx.textLayout.elements.BackgroundManager;
import flashx.textLayout.elements.ContainerFormattedElement;
import flashx.textLayout.elements.FlowElement;
import flashx.textLayout.elements.FlowLeafElement;
import flashx.textLayout.elements.InlineGraphicElement;
import flashx.textLayout.elements.LinkElement;
import flashx.textLayout.elements.LinkState;
import flashx.textLayout.elements.ListElement;
import flashx.textLayout.elements.ListItemElement;
import flashx.textLayout.elements.ParagraphElement;
import flashx.textLayout.elements.SpanElement;
import flashx.textLayout.elements.SubParagraphGroupElementBase;
import flashx.textLayout.elements.TCYElement;
import flashx.textLayout.elements.TextFlow;
import flashx.textLayout.formats.BlockProgression;
import flashx.textLayout.formats.Direction;
import flashx.textLayout.formats.Float;
import flashx.textLayout.formats.FormatValue;
import flashx.textLayout.formats.IListMarkerFormat;
import flashx.textLayout.formats.ITextLayoutFormat;
import flashx.textLayout.formats.JustificationRule;
import flashx.textLayout.formats.LeadingModel;
import flashx.textLayout.formats.LineBreak;
import flashx.textLayout.formats.ListStylePosition;
import flashx.textLayout.formats.TextAlign;
import flashx.textLayout.formats.TextLayoutFormat;
import flashx.textLayout.tlf_internal;
import flashx.textLayout.utils.CharacterUtil;
import flashx.textLayout.utils.Twips;

public final class TextFlowLine implements IVerticalJustificationLine {

    private static var _selectionBlockCache: Dictionary = new Dictionary(true);

    private static const VALIDITY_MASK: uint = 7;

    private static const ALIGNMENT_SHIFT: uint = 3;

    private static const ALIGNMENT_MASK: uint = 24;

    private static const NUMBERLINE_MASK: uint = 32;

    private static const GRAPHICELEMENT_MASK: uint = 64;

    private static const _validities: Array = [TextLineValidity.INVALID, TextLineValidity.POSSIBLY_INVALID, TextLineValidity.STATIC, TextLineValidity.VALID, FlowDamageType.GEOMETRY];

    private static const _alignments: Array = [TextAlign.LEFT, TextAlign.CENTER, TextAlign.RIGHT];

    private static var numberLineFactory: NumberLineFactory;

    private static const localZeroPoint: Point = new Point(0, 0);

    private static const localOnePoint: Point = new Point(1, 0);

    private static const rlLocalOnePoint: Point = new Point(0, 1);


    private var _absoluteStart: int;

    private var _textLength: int;

    private var _x: Number = 0;

    private var _y: Number = 0;

    private var _height: Number = 0;

    private var _outerTargetWidth: Number = 0;

    private var _boundsLeftTW: int = 2;

    private var _boundsRightTW: int = 1;

    private var _para: ParagraphElement;

    private var _controller: ContainerController;

    private var _columnIndex: int;

    private var _adornCount: int = 0;

    private var _flags: uint;

    private var _ascent: Number;

    private var _descent: Number;

    private var _targetWidth: Number;

    private var _lineOffset: Number;

    private var _lineExtent: Number;

    private var _accumulatedLineExtent: Number;

    private var _accumulatedMinimumStart: Number;

    private var _numberLinePosition: int;

    public function TextFlowLine(param1: TextLine, param2: ParagraphElement, param3: Number = 0, param4: Number = 0, param5: int = 0, param6: int = 0) {
        super();
        this.tlf_internal::initialize(param2, param3, param4, param5, param6, param1);
    }

    tlf_internal static function initializeNumberLinePosition(param1: TextLine, param2: ListItemElement, param3: ParagraphElement, param4: Number): void {
        var _loc5_: IListMarkerFormat = param2.tlf_internal::computedListMarkerFormat();
        var _loc6_: ITextLayoutFormat = param3.computedFormat;
        var _loc7_: Number = _loc5_.paragraphEndIndent === undefined || param2.computedFormat.listStylePosition == ListStylePosition.INSIDE ? 0 : (_loc5_.paragraphEndIndent == FormatValue.INHERIT ? _loc6_.paragraphEndIndent : Number(_loc5_.paragraphEndIndent));
        TextFlowLine.tlf_internal::setListEndIndent(param1, _loc7_);
        if (param2.computedFormat.listStylePosition == ListStylePosition.OUTSIDE) {
            param1.y = 0;
            param1.x = 0;
            return;
        }
        var _loc8_: String = param3.getTextFlow().computedFormat.blockProgression;
        var _loc9_: Number = TextFlowLine.tlf_internal::getNumberLineInsideLineWidth(param1);
        if (_loc8_ == BlockProgression.TB) {
            if (_loc6_.direction == Direction.LTR) {
                param1.x = -_loc9_;
            } else {
                param1.x = param4 + _loc9_ - param1.textWidth;
            }
            param1.y = 0;
        } else {
            if (_loc6_.direction == Direction.LTR) {
                param1.y = -_loc9_;
            } else {
                param1.y = param4 + _loc9_ - param1.textWidth;
            }
            param1.x = 0;
        }
    }

    tlf_internal static function createNumberLine(param1: ListItemElement, param2: ParagraphElement, param3: ISWFContext, param4: Number): TextLine {
        var listMarkerFormat: IListMarkerFormat;
        var listElement: ListElement;
        var paragraphFormat: TextLayoutFormat;
        var boxStartIndent: Number;
        var firstLeaf: FlowLeafElement;
        var parentLink: LinkElement;
        var linkStateArray: Array;
        var spanFormat: TextLayoutFormat;
        var markerFormat: TextLayoutFormat;
        var holderStyles: Object;
        var highestParentLinkLinkElement: LinkElement = null;
        var key: String = null;
        var rslt: Array = null;
        var numberLine: TextLine = null;
        var leaf: FlowLeafElement = null;
        var val: * = undefined;
        var listItemElement: ListItemElement = param1;
        var curParaElement: ParagraphElement = param2;
        var swfContext: ISWFContext = param3;
        var totalStartIndent: Number = param4;
        if (numberLineFactory == null) {
            numberLineFactory = new NumberLineFactory();
            numberLineFactory.compositionBounds = new Rectangle(0, 0, NaN, NaN);
        }
        numberLineFactory.swfContext = swfContext;
        listMarkerFormat = listItemElement.tlf_internal::computedListMarkerFormat();
        numberLineFactory.listStylePosition = listItemElement.computedFormat.listStylePosition;
        listElement = listItemElement.parent as ListElement;
        paragraphFormat = new TextLayoutFormat(curParaElement.computedFormat);
        boxStartIndent = paragraphFormat.direction == Direction.LTR ? listElement.tlf_internal::getEffectivePaddingLeft() : listElement.tlf_internal::getEffectivePaddingRight();
        paragraphFormat.apply(listMarkerFormat);
        paragraphFormat.textIndent += totalStartIndent;
        if (true) {
            paragraphFormat.textIndent -= boxStartIndent;
        }
        numberLineFactory.paragraphFormat = paragraphFormat;
        numberLineFactory.textFlowFormat = curParaElement.getTextFlow().computedFormat;
        firstLeaf = curParaElement.getFirstLeaf();
        parentLink = firstLeaf.getParentByType(LinkElement) as LinkElement;
        linkStateArray = [];
        while (parentLink) {
            highestParentLinkLinkElement = parentLink;
            linkStateArray.push(parentLink.linkState);
            parentLink.tlf_internal::chgLinkState(LinkState.tlf_internal::SUPPRESSED);
            parentLink = parentLink.getParentByType(LinkElement) as LinkElement;
        }
        spanFormat = new TextLayoutFormat(firstLeaf.computedFormat);
        parentLink = firstLeaf.getParentByType(LinkElement) as LinkElement;
        while (parentLink) {
            linkStateArray.push(parentLink.linkState);
            parentLink.tlf_internal::chgLinkState(linkStateArray.shift());
            parentLink = parentLink.getParentByType(LinkElement) as LinkElement;
        }
        if (highestParentLinkLinkElement) {
            leaf = highestParentLinkLinkElement.getFirstLeaf();
            while (leaf) {
                leaf.computedFormat;
                leaf = leaf.getNextLeaf(highestParentLinkLinkElement);
            }
        }
        markerFormat = new TextLayoutFormat(spanFormat);
        TextLayoutFormat.tlf_internal::resetModifiedNoninheritedStyles(markerFormat);
        holderStyles = (listMarkerFormat as TextLayoutFormat).tlf_internal::getStyles();
        for (key in holderStyles) {
            if (TextLayoutFormat.tlf_internal::description[key] !== undefined) {
                val = holderStyles[key];
                markerFormat[key] = val !== FormatValue.INHERIT ? val : spanFormat[key];
            }
        }
        numberLineFactory.markerFormat = markerFormat;
        numberLineFactory.text = listElement.tlf_internal::computeListItemText(listItemElement, listMarkerFormat);
        rslt = [];
        numberLineFactory.createTextLines(function (param1: DisplayObject): void {
            rslt.push(param1);
        });
        numberLine = rslt[0] as TextLine;
        if (numberLine) {
            numberLine.mouseEnabled = false;
            numberLine.mouseChildren = false;
            tlf_internal::setNumberLineBackground(numberLine, numberLineFactory.backgroundManager);
        }
        numberLineFactory.clearBackgroundManager();
        return numberLine;
    }

    tlf_internal static function getTextLineTypographicAscent(param1: TextLine, param2: FlowLeafElement, param3: int, param4: int): Number {
        var _loc5_: Number = param1.getBaselinePosition(TextBaseline.ROMAN) - param1.getBaselinePosition(TextBaseline.ASCENT);
        if (param1.hasGraphicElement) {
            while (true) {
                if (param2 is InlineGraphicElement) {
                    _loc5_ = Math.max(_loc5_, InlineGraphicElement(param2).tlf_internal::getTypographicAscent(param1));
                }
                param3 += param2.textLength;
                if (param3 >= param4) {
                    break;
                }
                param2 = param2.getNextLeaf();
            }
        }
        return _loc5_;
    }

    private static function createSelectionRect(param1: Shape, param2: uint, param3: Number, param4: Number, param5: Number, param6: Number): DisplayObject {
        param1.graphics.beginFill(param2);
        var _loc7_: Vector.<int> = new Vector.<int>();
        var _loc8_: Vector.<Number> = new Vector.<Number>();
        _loc7_.push(GraphicsPathCommand.MOVE_TO);
        _loc8_.push(param3);
        _loc8_.push(param4);
        _loc7_.push(GraphicsPathCommand.LINE_TO);
        _loc8_.push(param3 + param5);
        _loc8_.push(param4);
        _loc7_.push(GraphicsPathCommand.LINE_TO);
        _loc8_.push(param3 + param5);
        _loc8_.push(param4 + param6);
        _loc7_.push(GraphicsPathCommand.LINE_TO);
        _loc8_.push(param3);
        _loc8_.push(param4 + param6);
        _loc7_.push(GraphicsPathCommand.LINE_TO);
        _loc8_.push(param3);
        _loc8_.push(param4);
        param1.graphics.drawPath(_loc7_, _loc8_, GraphicsPathWinding.NON_ZERO);
        return param1;
    }

    tlf_internal static function constrainRectToColumn(param1: TextFlow, param2: Rectangle, param3: Rectangle, param4: Number, param5: Number, param6: Number, param7: Number): void {
        if (param1.computedFormat.lineBreak == LineBreak.EXPLICIT) {
            return;
        }
        var _loc8_: String = param1.computedFormat.blockProgression;
        var _loc9_: String = param1.computedFormat.direction;
        if (_loc8_ == BlockProgression.TB && !isNaN(param6)) {
            if (_loc9_ == Direction.LTR) {
                if (param2.left > param3.x + param3.width + param4) {
                    param2.left = param3.x + param3.width + param4;
                }
                if (param2.right > param3.x + param3.width + param4) {
                    param2.right = param3.x + param3.width + param4;
                }
            } else {
                if (param2.right < param3.x + param4) {
                    param2.right = param3.x + param4;
                }
                if (param2.left < param3.x + param4) {
                    param2.left = param3.x + param4;
                }
            }
        } else if (_loc8_ == BlockProgression.RL && !isNaN(param7)) {
            if (_loc9_ == Direction.LTR) {
                if (param2.top > param3.y + param3.height + param5) {
                    param2.top = param3.y + param3.height + param5;
                }
                if (param2.bottom > param3.y + param3.height + param5) {
                    param2.bottom = param3.y + param3.height + param5;
                }
            } else {
                if (param2.bottom < param3.y + param5) {
                    param2.bottom = param3.y + param5;
                }
                if (param2.top < param3.y + param5) {
                    param2.top = param3.y + param5;
                }
            }
        }
    }

    private static function setRectangleValues(param1: Rectangle, param2: Number, param3: Number, param4: Number, param5: Number): void {
        param1.x = param2;
        param1.y = param3;
        param1.width = param4;
        param1.height = param5;
    }

    tlf_internal static function findNumberLine(param1: TextLine): TextLine {
        var _loc3_: * = null;
        var _loc2_: int = 0;
        while (_loc2_ < param1.numChildren) {
            _loc3_ = param1.getChildAt(_loc2_) as TextLine;
            if (Boolean(_loc3_) && _loc3_.userData is NumberLineUserData) {
                break;
            }
            _loc2_++;
        }
        return _loc3_;
    }

    tlf_internal static function getNumberLineListStylePosition(param1: TextLine): String {
        return (param1.userData as NumberLineUserData).listStylePosition;
    }

    tlf_internal static function getNumberLineInsideLineWidth(param1: TextLine): Number {
        return (param1.userData as NumberLineUserData).insideLineWidth;
    }

    tlf_internal static function getNumberLineSpanFormat(param1: TextLine): ITextLayoutFormat {
        return (param1.userData as NumberLineUserData).spanFormat;
    }

    tlf_internal static function getNumberLineParagraphDirection(param1: TextLine): String {
        return (param1.userData as NumberLineUserData).paragraphDirection;
    }

    tlf_internal static function setListEndIndent(param1: TextLine, param2: Number): void {
        (param1.userData as NumberLineUserData).listEndIndent = param2;
    }

    tlf_internal static function getListEndIndent(param1: TextLine): Number {
        return (param1.userData as NumberLineUserData).listEndIndent;
    }

    tlf_internal static function setNumberLineBackground(param1: TextLine, param2: BackgroundManager): void {
        (param1.userData as NumberLineUserData).backgroundManager = param2;
    }

    tlf_internal static function getNumberLineBackground(param1: TextLine): BackgroundManager {
        return (param1.userData as NumberLineUserData).backgroundManager;
    }

    tlf_internal function initialize(param1: ParagraphElement, param2: Number = 0, param3: Number = 0, param4: int = 0, param5: int = 0, param6: TextLine = null): void {
        this._para = param1;
        this._outerTargetWidth = param2;
        this._absoluteStart = param4;
        this._textLength = param5;
        this._adornCount = 0;
        this._lineExtent = 0;
        this._accumulatedLineExtent = 0;
        this._accumulatedMinimumStart = TextLine.MAX_LINE_WIDTH;
        this._flags = 0;
        this._controller = null;
        if (param6) {
            param6.userData = this;
            this._targetWidth = param6.specifiedWidth;
            this._ascent = param6.ascent;
            this._descent = param6.descent;
            this._lineOffset = param3;
            this.setValidity(param6.validity);
            this.setFlag(param6.hasGraphicElement ? GRAPHICELEMENT_MASK : 0, GRAPHICELEMENT_MASK);
        } else {
            this.setValidity(TextLineValidity.INVALID);
        }
    }

    private function setFlag(param1: uint, param2: uint): void {
        this._flags = this._flags & ~param2 | param1;
    }

    private function getFlag(param1: uint): uint {
        return this._flags & param1;
    }

    tlf_internal function get heightTW(): int {
        return Twips.to(this._height);
    }

    tlf_internal function get outerTargetWidthTW(): int {
        return Twips.to(this._outerTargetWidth);
    }

    tlf_internal function get ascentTW(): int {
        return Twips.to(this._ascent);
    }

    tlf_internal function get targetWidthTW(): int {
        return Twips.to(this._targetWidth);
    }

    tlf_internal function get textHeightTW(): int {
        return Twips.to(this.textHeight);
    }

    tlf_internal function get lineOffsetTW(): int {
        return Twips.to(this._lineOffset);
    }

    tlf_internal function get lineExtentTW(): int {
        return Twips.to(this._lineExtent);
    }

    tlf_internal function get hasGraphicElement(): Boolean {
        return this.getFlag(GRAPHICELEMENT_MASK) != 0;
    }

    tlf_internal function get hasNumberLine(): Boolean {
        return this.getFlag(NUMBERLINE_MASK) != 0;
    }

    tlf_internal function get numberLinePosition(): Number {
        return Twips.from(this._numberLinePosition);
    }

    tlf_internal function set numberLinePosition(param1: Number): void {
        this._numberLinePosition = Twips.to(param1);
    }

    public function get textHeight(): Number {
        return this._ascent + this._descent;
    }

    public function get x(): Number {
        return this._x;
    }

    public function set x(param1: Number): void {
        this._x = param1;
        this._boundsLeftTW = 2;
        this._boundsRightTW = 1;
    }

    tlf_internal function get xTW(): int {
        return Twips.to(this._x);
    }

    public function get y(): Number {
        return this._y;
    }

    tlf_internal function get yTW(): int {
        return Twips.to(this._y);
    }

    public function set y(param1: Number): void {
        this._y = param1;
        this._boundsLeftTW = 2;
        this._boundsRightTW = 1;
    }

    tlf_internal function setXYAndHeight(param1: Number, param2: Number, param3: Number): void {
        this._x = param1;
        this._y = param2;
        this._height = param3;
        this._boundsLeftTW = 2;
        this._boundsRightTW = 1;
    }

    public function get location(): int {
        var _loc1_: int = 0;
        if (this._para) {
            _loc1_ = this._absoluteStart - this._para.getAbsoluteStart();
            if (_loc1_ == 0) {
                return this._textLength == this._para.textLength ? 0 : TextFlowLineLocation.FIRST;
            }
            if (_loc1_ + this.textLength == this._para.textLength) {
                return TextFlowLineLocation.LAST;
            }
        }
        return TextFlowLineLocation.MIDDLE;
    }

    public function get controller(): ContainerController {
        return this._controller;
    }

    public function get columnIndex(): int {
        return this._columnIndex;
    }

    tlf_internal function setController(param1: ContainerController, param2: int): void {
        this._controller = param1 as ContainerController;
        this._columnIndex = param2;
    }

    public function get height(): Number {
        return this._height;
    }

    public function get ascent(): Number {
        return this._ascent;
    }

    public function get descent(): Number {
        return this._descent;
    }

    public function get lineOffset(): Number {
        return this._lineOffset;
    }

    public function get paragraph(): ParagraphElement {
        return this._para;
    }

    public function get absoluteStart(): int {
        return this._absoluteStart;
    }

    tlf_internal function setAbsoluteStart(param1: int): void {
        this._absoluteStart = param1;
    }

    public function get textLength(): int {
        return this._textLength;
    }

    tlf_internal function setTextLength(param1: int): void {
        this._textLength = param1;
        this.tlf_internal::damage(TextLineValidity.INVALID);
    }

    public function get spaceBefore(): Number {
        return !!(this.location & 0) ? this._para.computedFormat.paragraphSpaceBefore : 0;
    }

    public function get spaceAfter(): Number {
        return !!(this.location & 0) ? this._para.computedFormat.paragraphSpaceAfter : 0;
    }

    tlf_internal function get outerTargetWidth(): Number {
        return this._outerTargetWidth;
    }

    tlf_internal function set outerTargetWidth(param1: Number): void {
        this._outerTargetWidth = param1;
    }

    tlf_internal function get targetWidth(): Number {
        return this._targetWidth;
    }

    public function getBounds(): Rectangle {
        var _loc1_: TextLine = this.getTextLine(true);
        if (!_loc1_) {
            return new Rectangle();
        }
        var _loc2_: String = this.paragraph.tlf_internal::getAncestorWithContainer().computedFormat.blockProgression;
        var _loc3_: Number = this.x;
        var _loc4_: Number = this.createShapeY(_loc2_);
        if (_loc2_ == BlockProgression.TB) {
            _loc4_ += this.descent - _loc1_.height;
        }
        return new Rectangle(_loc3_, _loc4_, _loc1_.width, _loc1_.height);
    }

    private function setValidity(param1: String): void {
        this.setFlag(_validities.indexOf(param1), VALIDITY_MASK);
    }

    public function get validity(): String {
        return _validities[this.getFlag(VALIDITY_MASK)];
    }

    public function get unjustifiedTextWidth(): Number {
        var _loc1_: TextLine = this.getTextLine(true);
        return _loc1_.unjustifiedTextWidth + (this._outerTargetWidth - this.tlf_internal::targetWidth);
    }

    tlf_internal function get lineExtent(): Number {
        return this._lineExtent;
    }

    tlf_internal function set lineExtent(param1: Number): void {
        this._lineExtent = param1;
    }

    tlf_internal function get accumulatedLineExtent(): Number {
        return this._accumulatedLineExtent;
    }

    tlf_internal function set accumulatedLineExtent(param1: Number): void {
        this._accumulatedLineExtent = param1;
    }

    tlf_internal function get accumulatedMinimumStart(): Number {
        return this._accumulatedMinimumStart;
    }

    tlf_internal function set accumulatedMinimumStart(param1: Number): void {
        this._accumulatedMinimumStart = param1;
    }

    tlf_internal function get alignment(): String {
        return _alignments[this.getFlag(ALIGNMENT_MASK) >> ALIGNMENT_SHIFT];
    }

    tlf_internal function set alignment(param1: String): void {
        this.setFlag(_alignments.indexOf(param1) << ALIGNMENT_SHIFT, ALIGNMENT_MASK);
    }

    tlf_internal function isDamaged(): Boolean {
        return this.validity != TextLineValidity.VALID;
    }

    tlf_internal function clearDamage(): void {
        this.setValidity(TextLineValidity.VALID);
    }

    tlf_internal function damage(param1: String): void {
        var _loc2_: String = this.validity;
        if (_loc2_ == param1 || _loc2_ == TextLineValidity.INVALID) {
            return;
        }
        this.setValidity(param1);
    }

    tlf_internal function isLineVisible(param1: String, param2: int, param3: int, param4: int, param5: int): Boolean {
        if (param1 == BlockProgression.RL) {
            return this._boundsRightTW >= param2 && this._boundsLeftTW < param2 + param4;
        }
        return this._boundsRightTW >= param3 && this._boundsLeftTW < param3 + param5;
    }

    tlf_internal function cacheLineBounds(param1: String, param2: Number, param3: Number, param4: Number, param5: Number): void {
        if (param1 == BlockProgression.RL) {
            this._boundsLeftTW = Twips.to(param2);
            this._boundsRightTW = Twips.to(param2 + param4);
        } else {
            this._boundsLeftTW = Twips.to(param3);
            this._boundsRightTW = Twips.to(param3 + param5);
        }
    }

    tlf_internal function hasLineBounds(): Boolean {
        return this._boundsLeftTW <= this._boundsRightTW;
    }

    public function get textLineExists(): Boolean {
        return this.tlf_internal::peekTextLine() != null;
    }

    tlf_internal function peekTextLine(): TextLine {
        var _loc1_: * = null;
        if (!this.paragraph) {
            return null;
        }
        var _loc2_: TextBlock = this.paragraph.tlf_internal::peekTextBlock();
        if (_loc2_) {
            _loc1_ = _loc2_.firstLine;
            while (_loc1_) {
                if (_loc1_.userData == this) {
                    return _loc1_;
                }
                _loc1_ = _loc1_.nextLine;
            }
        }
        return null;
    }

    public function getTextLine(param1: Boolean = false): TextLine {
        var _loc2_: TextLine = this.tlf_internal::peekTextLine();
        if (Boolean(_loc2_) && _loc2_.validity == FlowDamageType.GEOMETRY) {
            this.tlf_internal::createShape(this.paragraph.getTextFlow().computedFormat.blockProgression, _loc2_);
        } else if (!_loc2_ || _loc2_.validity == TextLineValidity.INVALID && param1) {
            if (this.tlf_internal::isDamaged() && this.validity != FlowDamageType.GEOMETRY) {
                return null;
            }
            _loc2_ = this.getTextLineInternal();
        }
        return _loc2_;
    }

    private function getTextLineInternal(): TextLine {
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc1_: int = this.paragraph.getAbsoluteStart();
        var _loc2_: TextBlock = this.paragraph.tlf_internal::getTextBlock();
        var _loc3_: * = _loc2_.firstLine;
        var _loc4_: IFlowComposer;
        var _loc5_: int = (_loc4_ = this.paragraph.getTextFlow().flowComposer).findLineIndexAtPosition(_loc1_);
        var _loc6_: * = null;
        do {
            _loc8_ = _loc4_.getLineAt(_loc5_);
            if (_loc3_ != null && _loc3_.validity == TextLineValidity.VALID && (_loc8_ != this || _loc3_.userData == _loc8_)) {
                _loc7_ = _loc3_;
                _loc3_ = _loc3_.nextLine;
            } else {
                _loc7_ = _loc8_.tlf_internal::recreateTextLine(_loc2_, _loc6_);
                _loc3_ = null;
            }
            _loc6_ = _loc7_;
            _loc5_++;
        }
        while (_loc8_ != this);

        return _loc7_;
    }

    tlf_internal function recreateTextLine(param1: TextBlock, param2: TextLine): TextLine {
        var _loc3_: * = null;
        var _loc8_: * = null;
        var _loc10_: Number = NaN;
        var _loc11_: int = 0;
        var _loc12_: * = null;
        var _loc13_: int = 0;
        var _loc14_: * = null;
        var _loc4_: TextFlow;
        var _loc5_: String = (_loc4_ = this._para.getTextFlow()).computedFormat.blockProgression;
        var _loc6_: IFlowComposer;
        var _loc7_: ISWFContext = !!(_loc6_ = _loc4_.flowComposer).swfContext ? _loc6_.swfContext : BaseCompose.globalSWFContext;
        var _loc9_: Number = this._lineOffset;
        if (this.tlf_internal::hasNumberLine) {
            _loc10_ = this._lineOffset - this._para.computedFormat.textIndent;
            if (_loc8_ = TextFlowLine.tlf_internal::createNumberLine(this._para.getParentByType(ListItemElement) as ListItemElement, this._para, _loc6_.swfContext, _loc10_)) {
                if (tlf_internal::getNumberLineListStylePosition(_loc8_) == ListStylePosition.INSIDE) {
                    _loc9_ += tlf_internal::getNumberLineInsideLineWidth(_loc8_);
                }
            }
        }
        _loc3_ = TextLineRecycler.getLineForReuse();
        if (_loc3_) {
            _loc3_ = _loc7_.callInContext(param1["recreateTextLine"], param1, [_loc3_, param2, this._targetWidth, _loc9_, true]);
        } else {
            _loc3_ = _loc7_.callInContext(param1.createTextLine, param1, [param2, this._targetWidth, _loc9_, true]);
        }
        _loc3_.x = this.x;
        _loc3_.y = this.createShapeY(_loc5_);
        _loc3_.doubleClickEnabled = true;
        _loc3_.userData = this;
        if (this._adornCount > 0) {
            _loc11_ = this._para.getAbsoluteStart();
            _loc13_ = (_loc12_ = this._para.findLeaf(this.absoluteStart - _loc11_)).getAbsoluteStart();
            if (_loc8_) {
                _loc14_ = this._para.getParentByType(ListItemElement) as ListItemElement;
                TextFlowLine.tlf_internal::initializeNumberLinePosition(_loc8_, _loc14_, this._para, _loc3_.textWidth);
            }
            this.tlf_internal::createAdornments(this._para.tlf_internal::getAncestorWithContainer().computedFormat.blockProgression, _loc12_, _loc13_, _loc3_, _loc8_);
            if (Boolean(_loc8_) && tlf_internal::getNumberLineListStylePosition(_loc8_) == ListStylePosition.OUTSIDE) {
                if (_loc5_ == BlockProgression.TB) {
                    _loc8_.x = this.tlf_internal::numberLinePosition;
                } else {
                    _loc8_.y = this.tlf_internal::numberLinePosition;
                }
            }
        }
        return _loc3_;
    }

    tlf_internal function createShape(param1: String, param2: TextLine): void {
        var _loc3_: Number = this.x;
        param2.x = _loc3_;
        var _loc4_: Number = this.createShapeY(param1);
        param2.y = _loc4_;
    }

    private function createShapeY(param1: String): Number {
        return param1 == BlockProgression.RL ? this.y : this.y + this._ascent;
    }

    tlf_internal function createAdornments(param1: String, param2: FlowLeafElement, param3: int, param4: TextLine, param5: TextLine): void {
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = undefined;
        var _loc6_: int = this._absoluteStart + this._textLength;
        this._adornCount = 0;
        if (param5) {
            ++this._adornCount;
            this.setFlag(NUMBERLINE_MASK, NUMBERLINE_MASK);
            param4.addChild(param5);
            if (tlf_internal::getNumberLineBackground(param5) != null) {
                if (_loc7_ = param2.getTextFlow().tlf_internal::getBackgroundManager()) {
                    _loc7_.addNumberLine(param4, param5);
                }
            }
        } else {
            this.setFlag(0, NUMBERLINE_MASK);
        }
        while (true) {
            this._adornCount += param2.tlf_internal::updateAdornments(param4, param1);
            if (_loc9_ = !!(_loc8_ = param2.format) ? _loc8_.getStyle("imeStatus") : undefined) {
                param2.tlf_internal::updateIMEAdornments(param4, param1, _loc9_ as String);
            }
            param3 += param2.textLength;
            if (param3 >= _loc6_) {
                break;
            }
            param2 = param2.getNextLeaf(this._para);
        }
    }

    tlf_internal function getLineLeading(param1: String, param2: FlowLeafElement, param3: int): Number {
        var _loc6_: Number = NaN;
        var _loc4_: int = this._absoluteStart + this._textLength;
        var _loc5_: Number = 0;
        while (true) {
            if (!(_loc6_ = param2.tlf_internal::getEffectiveLineHeight(param1)) && param2.textLength == this.textLength) {
                _loc6_ = TextLayoutFormat.lineHeightProperty.computeActualPropertyValue(param2.computedFormat.lineHeight, param2.computedFormat.fontSize);
            }
            _loc5_ = Math.max(_loc5_, _loc6_);
            param3 += param2.textLength;
            if (param3 >= _loc4_) {
                break;
            }
            param2 = param2.getNextLeaf(this._para);
        }
        return _loc5_;
    }

    tlf_internal function getLineTypographicAscent(param1: FlowLeafElement, param2: int, param3: TextLine): Number {
        return tlf_internal::getTextLineTypographicAscent(!!param3 ? param3 : this.getTextLine(), param1, param2, this.absoluteStart + this.textLength);
    }

    tlf_internal function getCSSLineBox(param1: String, param2: FlowLeafElement, param3: int, param4: ISWFContext, param5: ITextLayoutFormat = null, param6: TextLine = null): Rectangle {
        var lineBox: Rectangle = null;
        var para: ParagraphElement = null;
        var ef: ElementFormat = null;
        var metrics: FontMetrics = null;
        var bp: String = param1;
        var elem: FlowLeafElement = param2;
        var elemStart: int = param3;
        var swfContext: ISWFContext = param4;
        var effectiveListMarkerFormat: ITextLayoutFormat = param5;
        var numberLine: TextLine = param6;
        var addToLineBox: Function = function (param1: Rectangle): void {
            if (param1) {
                lineBox = !!lineBox ? lineBox.union(param1) : param1;
            }
        };
        var endPos: int = this._absoluteStart + this._textLength;
        var textLine: TextLine = this.getTextLine();
        while (true) {
            addToLineBox(elem.tlf_internal::getCSSInlineBox(bp, textLine, this._para, swfContext));
            elemStart += elem.textLength;
            if (elemStart >= endPos) {
                break;
            }
            elem = elem.getNextLeaf(this._para);
        }
        if (Boolean(effectiveListMarkerFormat) && Boolean(numberLine)) {
            para = null;
            ef = FlowLeafElement.tlf_internal::computeElementFormatHelper(effectiveListMarkerFormat, para, swfContext);
            metrics = !!swfContext ? swfContext.callInContext(ef.getFontMetrics, ef, null, true) : ef.getFontMetrics();
            addToLineBox(FlowLeafElement.tlf_internal::getCSSInlineBoxHelper(effectiveListMarkerFormat, metrics, numberLine, para));
        }
        return lineBox;
    }

    private function isTextlineSubsetOfSpan(param1: FlowLeafElement): Boolean {
        var _loc2_: int = param1.getAbsoluteStart();
        var _loc3_: int = _loc2_ + param1.textLength;
        var _loc4_: int = this.absoluteStart;
        var _loc5_: int = this.absoluteStart + this._textLength;
        return _loc2_ <= _loc4_ && _loc3_ >= _loc5_;
    }

    private function getSelectionShapesCacheEntry(param1: int, param2: int, param3: TextFlowLine, param4: TextFlowLine, param5: String): SelectionCache {
        var _loc12_: * = null;
        if (this.tlf_internal::isDamaged()) {
            return null;
        }
        var _loc6_: int = this._para.getAbsoluteStart();
        if (param1 == param2 && _loc6_ + param1 == this.absoluteStart) {
            if (this.absoluteStart != this._para.getTextFlow().textLength - 1) {
                return null;
            }
            param2++;
        }
        var _loc7_: SelectionCache;
        if ((_loc7_ = _selectionBlockCache[this]) && _loc7_.begIdx == param1 && _loc7_.endIdx == param2) {
            return _loc7_;
        }
        var _loc8_: Array = new Array();
        var _loc9_: Array = new Array();
        if (_loc7_ == null) {
            _loc7_ = new SelectionCache();
            _selectionBlockCache[this] = _loc7_;
        } else {
            _loc7_.clear();
        }
        _loc7_.begIdx = param1;
        _loc7_.endIdx = param2;
        var _loc10_: TextLine = this.getTextLine();
        var _loc11_: Array = this.tlf_internal::getRomanSelectionHeightAndVerticalAdjustment(param3, param4);
        this.tlf_internal::calculateSelectionBounds(_loc10_, _loc8_, param1, param2, param5, _loc11_);
        for each(_loc12_ in _loc8_) {
            _loc7_.pushSelectionBlock(_loc12_);
        }
        if (_loc10_) {
            _loc10_.flushAtomData();
        }
        return _loc7_;
    }

    tlf_internal function calculateSelectionBounds(param1: TextLine, param2: Array, param3: int, param4: int, param5: String, param6: Array): void {
        var _loc15_: int = 0;
        var _loc16_: int = 0;
        var _loc17_: * = null;
        var _loc18_: * = null;
        var _loc19_: * = null;
        var _loc20_: * = null;
        var _loc21_: int = 0;
        var _loc22_: * = null;
        var _loc23_: int = 0;
        var _loc24_: * = null;
        var _loc25_: Number = NaN;
        var _loc26_: int = 0;
        var _loc27_: * = null;
        var _loc28_: * = null;
        var _loc29_: int = 0;
        var _loc30_: * = null;
        var _loc31_: int = 0;
        var _loc32_: * = null;
        var _loc33_: * = null;
        var _loc34_: * = null;
        var _loc35_: int = 0;
        var _loc36_: int = 0;
        var _loc7_: String = this._para.computedFormat.direction;
        var _loc8_: int = this._para.getAbsoluteStart();
        var _loc9_: int = param3;
        var _loc10_: * = null;
        var _loc12_: Array = new Array();
        var _loc13_: * = null;
        var _loc14_: * = null;
        while (_loc9_ < param4) {
            if ((_loc10_ = this._para.findLeaf(_loc9_)).textLength == 0) {
                _loc9_++;
            } else if (_loc10_ is InlineGraphicElement && (_loc10_ as InlineGraphicElement).tlf_internal::computedFloat != Float.NONE) {
                if (_loc13_ == null) {
                    _loc13_ = new Array();
                }
                _loc17_ = _loc10_ as InlineGraphicElement;
                if (_loc18_ = this.controller.tlf_internal::getFloatAtPosition(_loc8_ + _loc9_)) {
                    _loc19_ = new Rectangle(_loc18_.x - param1.x, _loc18_.y - param1.y, _loc17_.tlf_internal::elementWidth, _loc17_.tlf_internal::elementHeight);
                    _loc13_.push(_loc19_);
                }
                _loc9_++;
            } else {
                _loc16_ = (_loc15_ = _loc10_.textLength + _loc10_.getElementRelativeStart(this._para) - _loc9_) + _loc9_ > param4 ? param4 : _loc15_ + _loc9_;
                if (param5 != BlockProgression.RL || param1.getAtomTextRotation(param1.getAtomIndexAtCharIndex(_loc9_)) != TextRotation.ROTATE_0) {
                    _loc20_ = this.makeSelectionBlocks(param1, _loc9_, _loc16_, _loc8_, param5, _loc7_, param6);
                    _loc21_ = 0;
                    while (_loc21_ < _loc20_.length) {
                        _loc12_.push(_loc20_[_loc21_]);
                        _loc21_++;
                    }
                    _loc9_ = _loc16_;
                } else {
                    _loc23_ = (_loc22_ = _loc10_.getParentByType(TCYElement)).parentRelativeEnd;
                    _loc24_ = _loc22_.getParentByType(SubParagraphGroupElementBase) as SubParagraphGroupElementBase;
                    while (_loc24_) {
                        _loc23_ += _loc24_.parentRelativeStart;
                        _loc24_ = _loc24_.getParentByType(SubParagraphGroupElementBase) as SubParagraphGroupElementBase;
                    }
                    _loc25_ = 0;
                    _loc26_ = param4 < _loc23_ ? param4 : _loc23_;
                    _loc27_ = new Array();
                    while (_loc9_ < _loc26_) {
                        _loc16_ = (_loc15_ = (_loc10_ = this._para.findLeaf(_loc9_)).textLength + _loc10_.getElementRelativeStart(this._para) - _loc9_) + _loc9_ > param4 ? param4 : _loc15_ + _loc9_;
                        _loc28_ = this.makeSelectionBlocks(param1, _loc9_, _loc16_, _loc8_, param5, _loc7_, param6);
                        _loc29_ = 0;
                        while (_loc29_ < _loc28_.length) {
                            if ((_loc30_ = _loc28_[_loc29_]).height > _loc25_) {
                                _loc25_ = _loc30_.height;
                            }
                            _loc27_.push(_loc30_);
                            _loc29_++;
                        }
                        _loc9_ = _loc16_;
                    }
                    if (!_loc14_) {
                        _loc14_ = new Array();
                    }
                    this.normalizeRects(_loc27_, _loc14_, _loc25_, BlockProgression.TB, _loc7_);
                }
            }
        }
        if (_loc12_.length > 0 && _loc8_ + param3 == this.absoluteStart && _loc8_ + param4 == this.absoluteStart + this.textLength) {
            if ((_loc10_ = this._para.findLeaf(param3)).getAbsoluteStart() + _loc10_.textLength < this.absoluteStart + this.textLength && _loc16_ >= 2) {
                if ((_loc31_ = this._para.getCharCodeAtPosition(_loc16_ - 1)) != SpanElement.tlf_internal::kParagraphTerminator.charCodeAt(0) && CharacterUtil.isWhitespace(_loc31_)) {
                    _loc32_ = this.makeSelectionBlocks(param1, _loc16_ - 1, _loc16_ - 1, _loc8_, param5, _loc7_, param6);
                    _loc33_ = _loc32_[_loc32_.length - 1];
                    _loc34_ = _loc12_[_loc12_.length - 1] as Rectangle;
                    if (param5 != BlockProgression.RL) {
                        if (_loc34_.width == _loc33_.width) {
                            _loc12_.pop();
                        } else {
                            _loc34_.width -= _loc33_.width;
                            if (_loc7_ == Direction.RTL) {
                                _loc34_.left -= _loc33_.width;
                            }
                        }
                    } else if (_loc34_.height == _loc33_.height) {
                        _loc12_.pop();
                    } else {
                        _loc34_.height -= _loc33_.height;
                        if (_loc7_ == Direction.RTL) {
                            _loc34_.top += _loc33_.height;
                        }
                    }
                }
            }
        }
        this.normalizeRects(_loc12_, param2, 0, param5, _loc7_);
        if (Boolean(_loc14_) && _loc14_.length > 0) {
            _loc35_ = 0;
            while (_loc35_ < _loc14_.length) {
                param2.push(_loc14_[_loc35_]);
                _loc35_++;
            }
        }
        if (_loc13_) {
            _loc36_ = 0;
            while (_loc36_ < _loc13_.length) {
                param2.push(_loc13_[_loc36_]);
                _loc36_++;
            }
        }
    }

    private function createSelectionShapes(param1: Shape, param2: SelectionFormat, param3: DisplayObject, param4: int, param5: int, param6: TextFlowLine, param7: TextFlowLine): void {
        var _loc11_: * = null;
        var _loc13_: * = null;
        var _loc8_: ContainerFormattedElement;
        var _loc9_: String = (_loc8_ = this._para.tlf_internal::getAncestorWithContainer()).computedFormat.blockProgression;
        var _loc10_: SelectionCache;
        if (!(_loc10_ = this.getSelectionShapesCacheEntry(param4, param5, param6, param7, _loc9_))) {
            return;
        }
        var _loc12_: uint = param2.rangeColor;
        if (Boolean(this._para) && Boolean(this._para.getTextFlow())) {
            if ((Boolean(_loc13_ = this._para.getTextFlow().interactionManager)) && _loc13_.anchorPosition == _loc13_.activePosition) {
                _loc12_ = param2.pointColor;
            }
        }
        for each(_loc11_ in _loc10_.selectionBlocks) {
            _loc11_ = _loc11_.clone();
            this.tlf_internal::convertLineRectToContainer(_loc11_, true);
            createSelectionRect(param1, _loc12_, _loc11_.x, _loc11_.y, _loc11_.width, _loc11_.height);
        }
    }

    tlf_internal function getRomanSelectionHeightAndVerticalAdjustment(param1: TextFlowLine, param2: TextFlowLine): Array {
        var _loc5_: Boolean = false;
        var _loc6_: Boolean = false;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc3_: Number = 0;
        var _loc4_: Number = 0;
        if (ParagraphElement.tlf_internal::useUpLeadingDirection(this._para.tlf_internal::getEffectiveLeadingModel())) {
            _loc3_ = Math.max(this.height, this.textHeight);
        } else {
            _loc5_ = !param1 || param1.controller != this.controller || param1.columnIndex != this.columnIndex;
            if (_loc6_ = !param2 || param2.controller != this.controller || param2.columnIndex != this.columnIndex || param2.paragraph.tlf_internal::getEffectiveLeadingModel() == LeadingModel.ROMAN_UP) {
                if (!_loc5_) {
                    _loc3_ = this.textHeight;
                } else {
                    _loc3_ = Math.max(this.height, this.textHeight);
                }
            } else if (!_loc5_) {
                _loc3_ = Math.max(param2.height, this.textHeight);
                _loc4_ = _loc3_ - this.textHeight;
            } else {
                _loc7_ = this._descent - Math.max(this.height, this.textHeight);
                _loc3_ = (_loc8_ = Math.max(param2.height, this.textHeight) - this._ascent) - _loc7_;
                _loc4_ = _loc8_ - this._descent;
            }
        }
        if (!param1 || param1.columnIndex != this.columnIndex || param1.controller != this.controller) {
            _loc3_ += this.descent;
            _loc4_ = Math.floor(this.descent / 2);
        }
        return [_loc3_, _loc4_];
    }

    private function makeSelectionBlocks(param1: TextLine, param2: int, param3: int, param4: int, param5: String, param6: String, param7: Array): Array {
        var _loc16_: * = null;
        var _loc17_: int = 0;
        var _loc18_: int = 0;
        var _loc19_: int = 0;
        var _loc20_: int = 0;
        var _loc21_: int = 0;
        var _loc22_: int = 0;
        var _loc23_: Boolean = false;
        var _loc24_: Boolean = false;
        var _loc25_: * = null;
        var _loc26_: * = false;
        var _loc27_: * = null;
        var _loc28_: Number = NaN;
        var _loc29_: Number = NaN;
        var _loc30_: Number = NaN;
        var _loc31_: Number = NaN;
        var _loc8_: Array = new Array();
        var _loc9_: Rectangle = new Rectangle();
        var _loc10_: FlowLeafElement;
        var _loc11_: Rectangle = (_loc10_ = this._para.findLeaf(param2)).getComputedFontMetrics().emBox;
        if (!param1) {
            param1 = this.getTextLine(true);
        }
        var _loc12_: int = param1.getAtomIndexAtCharIndex(param2);
        var _loc13_: int = this.adjustEndElementForBidi(param1, param2, param3, _loc12_, param6);
        if (param6 == Direction.RTL && param1.getAtomBidiLevel(_loc13_) % 2 != 0) {
            if (_loc13_ == 0 && param2 < param3 - 1) {
                _loc8_ = this.makeSelectionBlocks(param1, param2, param3 - 1, param4, param5, param6, param7);
                _loc16_ = this.makeSelectionBlocks(param1, param3 - 1, param3 - 1, param4, param5, param6, param7);
                _loc17_ = 0;
                while (_loc17_ < _loc16_.length) {
                    _loc8_.push(_loc16_[_loc17_]);
                    _loc17_++;
                }
                return _loc8_;
            }
        }
        var _loc14_: Boolean = _loc12_ != -1 ? this.isAtomBidi(param1, _loc12_, param6) : false;
        var _loc15_: Boolean = _loc13_ != -1 ? this.isAtomBidi(param1, _loc13_, param6) : false;
        if (_loc14_ || _loc15_) {
            _loc18_ = param2;
            _loc19_ = param2 != param3 ? 1 : 0;
            _loc20_ = _loc12_;
            _loc21_ = _loc12_;
            _loc22_ = _loc12_;
            _loc23_ = _loc14_;
            do {
                _loc18_ += _loc19_;
                _loc24_ = (_loc22_ = param1.getAtomIndexAtCharIndex(_loc18_)) != -1 ? this.isAtomBidi(param1, _loc22_, param6) : false;
                if (_loc22_ != -1 && _loc24_ != _loc23_) {
                    _loc9_ = this.makeBlock(param1, _loc18_, _loc20_, _loc21_, _loc11_, param5, param6, param7);
                    _loc8_.push(_loc9_);
                    _loc20_ = _loc22_;
                    _loc21_ = _loc22_;
                    _loc23_ = _loc24_;
                } else {
                    if (_loc18_ == param3) {
                        _loc9_ = this.makeBlock(param1, _loc18_, _loc20_, _loc21_, _loc11_, param5, param6, param7);
                        _loc8_.push(_loc9_);
                    }
                    _loc21_ = _loc22_;
                }
            }
            while (_loc18_ < param3);

        } else {
            if (!(_loc25_ = _loc10_ as InlineGraphicElement) || _loc25_.tlf_internal::effectiveFloat == Float.NONE || param2 == param3) {
                _loc9_ = this.makeBlock(param1, param2, _loc12_, _loc13_, _loc11_, param5, param6, param7);
                if (Boolean(_loc25_) && _loc25_.tlf_internal::elementWidthWithMarginsAndPadding() != _loc25_.tlf_internal::elementWidth) {
                    _loc26_ = _loc25_.getTextFlow().computedFormat.blockProgression == BlockProgression.RL;
                    _loc27_ = _loc25_.computedFormat;
                    if (_loc26_) {
                        _loc28_ = Number(_loc25_.tlf_internal::getEffectivePaddingTop());
                        _loc9_.top += _loc28_;
                        _loc29_ = Number(_loc25_.tlf_internal::getEffectivePaddingBottom());
                        _loc9_.bottom -= _loc29_;
                    } else {
                        _loc30_ = Number(_loc25_.tlf_internal::getEffectivePaddingLeft());
                        _loc9_.left += _loc30_;
                        _loc31_ = Number(_loc25_.tlf_internal::getEffectivePaddingRight());
                        _loc9_.right -= _loc31_;
                    }
                }
            } else {
                _loc9_ = _loc25_.graphic.getBounds(param1);
            }
            _loc8_.push(_loc9_);
        }
        return _loc8_;
    }

    private function makeBlock(param1: TextLine, param2: int, param3: int, param4: int, param5: Rectangle, param6: String, param7: String, param8: Array): Rectangle {
        var _loc16_: * = null;
        var _loc17_: int = 0;
        var _loc9_: Rectangle = new Rectangle();
        var _loc10_: Point = new Point(0, 0);
        if (param3 > param4) {
            _loc17_ = param4;
            param4 = param3;
            param3 = _loc17_;
        }
        if (!param1) {
            param1 = this.getTextLine(true);
        }
        var _loc11_: Rectangle = param1.getAtomBounds(param3);
        var _loc12_: Rectangle = param1.getAtomBounds(param4);
        var _loc13_: String = this._para.tlf_internal::getEffectiveJustificationRule();
        if (param6 == BlockProgression.RL && param1.getAtomTextRotation(param3) != TextRotation.ROTATE_0) {
            _loc10_.y = _loc11_.y;
            _loc9_.height = param3 != param4 ? _loc12_.bottom - _loc11_.top : _loc11_.height;
            if (_loc13_ == JustificationRule.EAST_ASIAN) {
                _loc9_.width = _loc11_.width;
            } else {
                _loc9_.width = param8[0];
                _loc10_.x -= param8[1];
            }
        } else {
            _loc10_.x = Math.min(_loc11_.x, _loc12_.x);
            if (param6 == BlockProgression.RL) {
                _loc10_.y = _loc11_.y + param5.width / 2;
            }
            if (_loc13_ != JustificationRule.EAST_ASIAN) {
                _loc9_.height = param8[0];
                if (param6 == BlockProgression.RL) {
                    _loc10_.x -= param8[1];
                } else {
                    _loc10_.y += param8[1];
                }
                _loc9_.width = param3 != param4 ? Math.abs(_loc12_.right - _loc11_.left) : _loc11_.width;
            } else {
                _loc9_.height = _loc11_.height;
                _loc9_.width = param3 != param4 ? Math.abs(_loc12_.right - _loc11_.left) : _loc11_.width;
            }
        }
        _loc9_.x = _loc10_.x;
        _loc9_.y = _loc10_.y;
        if (param6 == BlockProgression.RL) {
            if (param1.getAtomTextRotation(param3) != TextRotation.ROTATE_0) {
                _loc9_.x -= param1.descent;
            } else {
                _loc9_.y -= _loc9_.height / 2;
            }
        } else {
            _loc9_.y += param1.descent - _loc9_.height;
        }
        var _loc14_: TextFlowLine = param1.userData as TextFlowLine;
        var _loc15_: FlowLeafElement;
        if (!(_loc15_ = this._para.findLeaf(param2))) {
            if (param2 < 0) {
                _loc15_ = this._para.getFirstLeaf();
            } else if (param2 >= this._para.textLength) {
                _loc15_ = this._para.getLastLeaf();
            }
            _loc16_ = !!_loc15_ ? _loc15_.computedFormat.textRotation : TextRotation.ROTATE_0;
        } else {
            _loc16_ = _loc15_.computedFormat.textRotation;
        }
        if (_loc16_ == TextRotation.ROTATE_180 || _loc16_ == TextRotation.ROTATE_90) {
            if (param6 != BlockProgression.RL) {
                _loc9_.y += _loc9_.height / 2;
            } else if (_loc15_.getParentByType(TCYElement) == null) {
                if (_loc16_ == TextRotation.ROTATE_90) {
                    _loc9_.x -= _loc9_.width;
                } else {
                    _loc9_.x -= _loc9_.width * 0.75;
                }
            } else if (_loc16_ == TextRotation.ROTATE_90) {
                _loc9_.y += _loc9_.height;
            } else {
                _loc9_.y += _loc9_.height * 0.75;
            }
        }
        return _loc9_;
    }

    tlf_internal function convertLineRectToContainer(param1: Rectangle, param2: Boolean): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc3_: TextLine = this.getTextLine();
        param1.x += _loc3_.x;
        param1.y += _loc3_.y;
        if (param2) {
            _loc4_ = this._para.getTextFlow();
            _loc5_ = this.controller.columnState.getColumnAt(this.columnIndex);
            tlf_internal::constrainRectToColumn(_loc4_, param1, _loc5_, this.controller.horizontalScrollPosition, this.controller.verticalScrollPosition, this.controller.compositionWidth, this.controller.compositionHeight);
        }
    }

    tlf_internal function hiliteBlockSelection(param1: Shape, param2: SelectionFormat, param3: DisplayObject, param4: int, param5: int, param6: TextFlowLine, param7: TextFlowLine): void {
        if (this.tlf_internal::isDamaged() || !this._controller) {
            return;
        }
        var _loc8_: TextLine;
        if (!(_loc8_ = this.tlf_internal::peekTextLine()) || !_loc8_.parent) {
            return;
        }
        var _loc9_: int = this._para.getAbsoluteStart();
        param4 -= _loc9_;
        param5 -= _loc9_;
        this.createSelectionShapes(param1, param2, param3, param4, param5, param6, param7);
    }

    tlf_internal function hilitePointSelection(param1: SelectionFormat, param2: int, param3: DisplayObject, param4: TextFlowLine, param5: TextFlowLine): void {
        var _loc6_: Rectangle;
        if (_loc6_ = this.tlf_internal::computePointSelectionRectangle(param2, param3, param4, param5, true)) {
            this._controller.tlf_internal::drawPointSelection(param1, _loc6_.x, _loc6_.y, _loc6_.width, _loc6_.height);
        }
    }

    tlf_internal function computePointSelectionRectangle(param1: int, param2: DisplayObject, param3: TextFlowLine, param4: TextFlowLine, param5: Boolean): Rectangle {
        var _loc19_: Number = NaN;
        var _loc20_: int = 0;
        var _loc21_: * = null;
        var _loc22_: * = null;
        if (this.tlf_internal::isDamaged() || !this._controller) {
            return null;
        }
        var _loc6_: TextLine;
        if (!(_loc6_ = this.tlf_internal::peekTextLine()) || !_loc6_.parent) {
            return null;
        }
        param1 -= this._para.getAbsoluteStart();
        _loc6_ = this.getTextLine(true);
        var _loc7_: int = param1;
        var _loc8_: int = _loc6_.getAtomIndexAtCharIndex(param1);
        var _loc9_: Boolean = false;
        var _loc10_: Boolean = false;
        var _loc11_: ContainerFormattedElement;
        var _loc12_: String = (_loc11_ = this._para.tlf_internal::getAncestorWithContainer()).computedFormat.blockProgression;
        var _loc13_: String = this._para.computedFormat.direction;
        if (_loc12_ == BlockProgression.RL) {
            if (param1 == 0) {
                if (_loc6_.getAtomTextRotation(0) == TextRotation.ROTATE_0) {
                    _loc10_ = true;
                }
            } else if ((_loc20_ = _loc6_.getAtomIndexAtCharIndex(param1 - 1)) != -1) {
                if (_loc6_.getAtomTextRotation(_loc8_) == TextRotation.ROTATE_0 && _loc6_.getAtomTextRotation(_loc20_) != TextRotation.ROTATE_0) {
                    _loc8_ = _loc20_;
                    param1--;
                    _loc9_ = true;
                } else if (_loc6_.getAtomTextRotation(_loc20_) == TextRotation.ROTATE_0) {
                    _loc8_ = _loc20_;
                    param1--;
                    _loc9_ = true;
                }
            }
        }
        var _loc14_: Array = this.tlf_internal::getRomanSelectionHeightAndVerticalAdjustment(param3, param4);
        var _loc15_: Array;
        var _loc16_: Rectangle = (_loc15_ = this.makeSelectionBlocks(_loc6_, param1, _loc7_, this._para.getAbsoluteStart(), _loc12_, _loc13_, _loc14_))[0];
        this.tlf_internal::convertLineRectToContainer(_loc16_, param5);
        var _loc17_: * = _loc13_ == Direction.RTL;
        if (_loc13_ == Direction.RTL && _loc6_.getAtomBidiLevel(_loc8_) % 2 == 0 || !_loc17_ && _loc6_.getAtomBidiLevel(_loc8_) % 2 != 0) {
            _loc17_ = !_loc17_;
        }
        var _loc18_: Point = param2.localToGlobal(localZeroPoint);
        if (_loc12_ == BlockProgression.RL && _loc6_.getAtomTextRotation(_loc8_) != TextRotation.ROTATE_0) {
            _loc21_ = param2.localToGlobal(rlLocalOnePoint);
            _loc19_ = (_loc19_ = _loc18_.y - _loc21_.y) == 0 ? 1 : Math.abs(1 / _loc19_);
            if (!_loc17_) {
                setRectangleValues(_loc16_, _loc16_.x, !_loc9_ ? _loc16_.y : _loc16_.y + _loc16_.height, _loc16_.width, _loc19_);
            } else {
                setRectangleValues(_loc16_, _loc16_.x, !_loc9_ ? _loc16_.y + _loc16_.height : _loc16_.y, _loc16_.width, _loc19_);
            }
        } else {
            _loc22_ = param2.localToGlobal(localOnePoint);
            _loc19_ = (_loc19_ = _loc18_.x - _loc22_.x) == 0 ? 1 : Math.abs(1 / _loc19_);
            if (!_loc17_) {
                setRectangleValues(_loc16_, !_loc9_ ? _loc16_.x : _loc16_.x + _loc16_.width, _loc16_.y, _loc19_, _loc16_.height);
            } else {
                setRectangleValues(_loc16_, !_loc9_ ? _loc16_.x + _loc16_.width : _loc16_.x, _loc16_.y, _loc19_, _loc16_.height);
            }
        }
        _loc6_.flushAtomData();
        return _loc16_;
    }

    tlf_internal function selectionWillIntersectScrollRect(param1: Rectangle, param2: int, param3: int, param4: TextFlowLine, param5: TextFlowLine): int {
        var _loc9_: * = null;
        var _loc10_: int = 0;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc6_: ContainerFormattedElement;
        var _loc7_: String = (_loc6_ = this._para.tlf_internal::getAncestorWithContainer()).computedFormat.blockProgression;
        var _loc8_: TextLine = this.getTextLine(true);
        if (param2 == param3) {
            if (_loc9_ = this.tlf_internal::computePointSelectionRectangle(param2, DisplayObject(this.controller.container), param4, param5, false)) {
                if (param1.containsRect(_loc9_)) {
                    return 2;
                }
                if (param1.intersects(_loc9_)) {
                    return 1;
                }
            }
        } else {
            _loc10_ = this._para.getAbsoluteStart();
            if (_loc11_ = this.getSelectionShapesCacheEntry(param2 - _loc10_, param3 - _loc10_, param4, param5, _loc7_)) {
                for each(_loc12_ in _loc11_.selectionBlocks) {
                    _loc12_ = _loc12_.clone();
                    _loc12_.x += _loc8_.x;
                    _loc12_.y += _loc8_.y;
                    if (param1.intersects(_loc12_)) {
                        if (_loc7_ == BlockProgression.RL) {
                            if (_loc12_.left >= param1.left && _loc12_.right <= param1.right) {
                                return 2;
                            }
                        } else if (_loc12_.top >= param1.top && _loc12_.bottom <= param1.bottom) {
                            return 2;
                        }
                        return 1;
                    }
                }
            }
        }
        return 0;
    }

    private function normalizeRects(param1: Array, param2: Array, param3: Number, param4: String, param5: String): void {
        var _loc8_: * = null;
        var _loc6_: * = null;
        var _loc7_: int = 0;
        while (_loc7_ < param1.length) {
            _loc8_ = param1[_loc7_++];
            if (param4 == BlockProgression.RL) {
                if (_loc8_.width < param3) {
                    _loc8_.width = param3;
                }
            } else if (_loc8_.height < param3) {
                _loc8_.height = param3;
            }
            if (_loc6_ == null) {
                _loc6_ = _loc8_;
            } else if (param4 == BlockProgression.RL) {
                if (_loc6_.y < _loc8_.y && _loc6_.y + _loc6_.height >= _loc8_.top && _loc6_.x == _loc8_.x) {
                    _loc6_.height += _loc8_.height;
                } else if (_loc8_.y < _loc6_.y && _loc6_.y <= _loc8_.bottom && _loc6_.x == _loc8_.x) {
                    _loc6_.height += _loc8_.height;
                    _loc6_.y = _loc8_.y;
                } else {
                    param2.push(_loc6_);
                    _loc6_ = _loc8_;
                }
            } else if (_loc6_.x < _loc8_.x && _loc6_.x + _loc6_.width >= _loc8_.left && _loc6_.y == _loc8_.y) {
                _loc6_.width += _loc8_.width;
            } else if (_loc8_.x < _loc6_.x && _loc6_.x <= _loc8_.right && _loc6_.y == _loc8_.y) {
                _loc6_.width += _loc8_.width;
                _loc6_.x = _loc8_.x;
            } else {
                param2.push(_loc6_);
                _loc6_ = _loc8_;
            }
            if (_loc7_ == param1.length) {
                param2.push(_loc6_);
            }
        }
    }

    private function adjustEndElementForBidi(param1: TextLine, param2: int, param3: int, param4: int, param5: String): int {
        var _loc6_: int = param4;
        if (param3 != param2) {
            if ((param5 == Direction.LTR && param1.getAtomBidiLevel(param4) % 2 != 0 || param5 == Direction.RTL && param1.getAtomBidiLevel(param4) % 2 == 0) && param1.getAtomTextRotation(param4) != TextRotation.ROTATE_0) {
                _loc6_ = param1.getAtomIndexAtCharIndex(param3);
            } else {
                _loc6_ = param1.getAtomIndexAtCharIndex(param3 - 1);
            }
        }
        if (_loc6_ == -1 && param3 > 0) {
            return this.adjustEndElementForBidi(param1, param2, param3 - 1, param4, param5);
        }
        return _loc6_;
    }

    private function isAtomBidi(param1: TextLine, param2: int, param3: String): Boolean {
        if (!param1) {
            param1 = this.getTextLine(true);
        }
        return param1.getAtomBidiLevel(param2) % 2 != 0 && param3 == Direction.LTR || param1.getAtomBidiLevel(param2) % 2 == 0 && param3 == Direction.RTL;
    }

    tlf_internal function get adornCount(): int {
        return this._adornCount;
    }
}
}

import flash.geom.Rectangle;

final class SelectionCache {


    private var _begIdx: int = -1;

    private var _endIdx: int = -1;

    private var _selectionBlocks: Array = null;

    function SelectionCache() {
        super();
    }

    public function get begIdx(): int {
        return this._begIdx;
    }

    public function set begIdx(param1: int): void {
        this._begIdx = param1;
    }

    public function get endIdx(): int {
        return this._endIdx;
    }

    public function set endIdx(param1: int): void {
        this._endIdx = param1;
    }

    public function pushSelectionBlock(param1: Rectangle): void {
        if (!this._selectionBlocks) {
            this._selectionBlocks = new Array();
        }
        this._selectionBlocks.push(param1.clone());
    }

    public function get selectionBlocks(): Array {
        return this._selectionBlocks;
    }

    public function clear(): void {
        this._selectionBlocks = null;
        this._begIdx = -1;
        this._endIdx = -1;
    }
}

import flashx.textLayout.elements.BackgroundManager;
import flashx.textLayout.formats.ITextLayoutFormat;

class NumberLineUserData {


    public var listStylePosition: String;

    public var insideLineWidth: Number;

    public var spanFormat: ITextLayoutFormat;

    public var paragraphDirection: String;

    public var listEndIndent: Number;

    public var backgroundManager: BackgroundManager;

    function NumberLineUserData(param1: String, param2: Number, param3: ITextLayoutFormat, param4: String) {
        super();
        this.listStylePosition = param1;
        this.insideLineWidth = param2;
        this.spanFormat = param3;
        this.paragraphDirection = param4;
    }
}

import flash.geom.Rectangle;
import flash.text.engine.TextBlock;
import flash.text.engine.TextLine;
import flash.text.engine.TextLineValidity;

import flashx.textLayout.elements.BackgroundManager;
import flashx.textLayout.elements.TextFlow;
import flashx.textLayout.factory.StringTextLineFactory;
import flashx.textLayout.formats.BlockProgression;
import flashx.textLayout.formats.ITextLayoutFormat;
import flashx.textLayout.tlf_internal;

class NumberLineFactory extends StringTextLineFactory {


    private var _listStylePosition: String;

    private var _markerFormat: ITextLayoutFormat;

    private var _backgroundManager: BackgroundManager;

    function NumberLineFactory() {
        super();
    }

    tlf_internal static function calculateInsideNumberLineWidth(param1: TextLine, param2: String): Number {
        var _loc6_: * = null;
        var _loc3_: Number = 0;
        var _loc4_: Number = 0;
        var _loc5_: int = 0;
        if (param2 == BlockProgression.TB) {
            while (_loc5_ < param1.atomCount) {
                if (param1.getAtomTextBlockBeginIndex(_loc5_) != param1.rawTextLength - 1) {
                    _loc6_ = param1.getAtomBounds(_loc5_);
                    _loc3_ = Math.min(_loc3_, _loc6_.x);
                    _loc4_ = Math.max(_loc4_, _loc6_.right);
                }
                _loc5_++;
            }
        } else {
            while (_loc5_ < param1.atomCount) {
                if (param1.getAtomTextBlockBeginIndex(_loc5_) != param1.rawTextLength - 1) {
                    _loc6_ = param1.getAtomBounds(_loc5_);
                    _loc3_ = Math.min(_loc3_, _loc6_.top);
                    _loc4_ = Math.max(_loc4_, _loc6_.bottom);
                }
                _loc5_++;
            }
        }
        param1.flushAtomData();
        return _loc4_ > _loc3_ ? _loc4_ - _loc3_ : 0;
    }

    public function get listStylePosition(): String {
        return this._listStylePosition;
    }

    public function set listStylePosition(param1: String): void {
        this._listStylePosition = param1;
    }

    public function get markerFormat(): ITextLayoutFormat {
        return this._markerFormat;
    }

    public function set markerFormat(param1: ITextLayoutFormat): void {
        this._markerFormat = param1;
        spanFormat = param1;
    }

    public function get backgroundManager(): BackgroundManager {
        return this._backgroundManager;
    }

    public function clearBackgroundManager(): void {
        this._backgroundManager = null;
    }

    override protected function callbackWithTextLines(param1: Function, param2: Number, param3: Number): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        for each(_loc4_ in tlf_internal::_factoryComposer._lines) {
            _loc4_.userData = new NumberLineUserData(this.listStylePosition, tlf_internal::calculateInsideNumberLineWidth(_loc4_, textFlowFormat.blockProgression), this._markerFormat, paragraphFormat.direction);
            if (_loc5_ = _loc4_.textBlock) {
                _loc5_.releaseLines(_loc5_.firstLine, _loc5_.lastLine);
            }
            _loc4_.x += param2;
            _loc4_.y += param3;
            _loc4_.validity = TextLineValidity.STATIC;
            param1(_loc4_);
        }
    }

    override tlf_internal function processBackgroundColors(param1: TextFlow, param2: Function, param3: Number, param4: Number, param5: Number, param6: Number): * {
        this._backgroundManager = param1.tlf_internal::backgroundManager;
        param1.tlf_internal::clearBackgroundManager();
    }
}
