package flashx.textLayout.elements {

import flash.text.engine.GroupElement;
import flash.text.engine.TextElement;
import flash.utils.getQualifiedClassName;

import flashx.textLayout.container.ContainerController;
import flashx.textLayout.events.ModelChange;
import flashx.textLayout.formats.FormatValue;
import flashx.textLayout.formats.ITextLayoutFormat;
import flashx.textLayout.formats.TextLayoutFormat;
import flashx.textLayout.formats.WhiteSpaceCollapse;
import flashx.textLayout.tlf_internal;
import flashx.textLayout.utils.CharacterUtil;

public class SpanElement extends FlowLeafElement {

    tlf_internal static const kParagraphTerminator: String = " ";

    private static const _dblSpacePattern: RegExp = /[ ]{2,}/g;

    private static const _newLineTabPattern: RegExp = /[\t\n\r]/g;

    private static const _tabPlaceholderPattern: RegExp = //g;

    private static const anyPrintChar: RegExp = /[^\t\n\r ]/g;


    public function SpanElement() {
        super();
    }

    override tlf_internal function createContentElement(): void {
        if (_blockElement) {
            return;
        }
        computedFormat;
        _blockElement = new TextElement(_text, null);
        super.tlf_internal::createContentElement();
    }

    override public function shallowCopy(param1: int = 0, param2: int = -1): FlowElement {
        if (param2 == -1) {
            param2 = textLength;
        }
        var _loc3_: SpanElement = super.shallowCopy(param1, param2) as SpanElement;
        var _loc5_: int = 0 + textLength;
        var _loc6_: int = 0 >= param1 ? 0 : param1;
        var _loc7_: int;
        if ((_loc7_ = _loc5_ < param2 ? _loc5_ : param2) == textLength && this.tlf_internal::hasParagraphTerminator) {
            _loc7_--;
        }
        if (_loc6_ > _loc7_) {
            throw RangeError(GlobalSettings.resourceStringFunction("badShallowCopyRange"));
        }
        if (_loc6_ != _loc5_ && CharacterUtil.isLowSurrogate(_text.charCodeAt(_loc6_)) || _loc7_ != 0 && CharacterUtil.isHighSurrogate(_text.charCodeAt(_loc7_ - 1))) {
            throw RangeError(GlobalSettings.resourceStringFunction("badSurrogatePairCopy"));
        }
        if (_loc6_ != _loc7_) {
            _loc3_.replaceText(0, _loc3_.textLength, _text.substring(_loc6_, _loc7_));
        }
        return _loc3_;
    }

    override protected function get abstract(): Boolean {
        return false;
    }

    override tlf_internal function get defaultTypeName(): String {
        return "span";
    }

    override public function get text(): String {
        if (textLength == 0) {
            return "";
        }
        return this.tlf_internal::hasParagraphTerminator ? _text.substr(0, textLength - 1) : _text;
    }

    public function set text(param1: String): void {
        this.replaceText(0, textLength, param1);
    }

    override public function getText(param1: int = 0, param2: int = -1, param3: String = "\n"): String {
        if (param2 == -1) {
            param2 = textLength;
        }
        if (textLength && param2 == textLength && this.tlf_internal::hasParagraphTerminator) {
            param2--;
        }
        return !!_text ? _text.substring(param1, param2) : "";
    }

    public function get mxmlChildren(): Array {
        return [this.text];
    }

    public function set mxmlChildren(param1: Array): void {
        var _loc3_: * = null;
        var _loc2_: String = new String();
        for each(_loc3_ in param1) {
            if (_loc3_ is String) {
                _loc2_ += _loc3_ as String;
            } else if (_loc3_ is Number) {
                _loc2_ += _loc3_.toString();
            } else if (_loc3_ is BreakElement) {
                _loc2_ += String.fromCharCode(8232);
            } else if (_loc3_ is TabElement) {
                _loc2_ += String.fromCharCode(57344);
            } else if (_loc3_ != null) {
                throw new TypeError(GlobalSettings.resourceStringFunction("badMXMLChildrenArgument", [getQualifiedClassName(_loc3_)]));
            }
        }
        this.replaceText(0, textLength, _loc2_);
    }

    tlf_internal function get hasParagraphTerminator(): Boolean {
        var _loc1_: ParagraphElement = getParagraph();
        return Boolean(_loc1_) && _loc1_.getLastLeaf() == this;
    }

    override tlf_internal function applyWhiteSpaceCollapse(param1: String): void {
        var _loc2_: ITextLayoutFormat = this.tlf_internal::formatForCascade;
        var _loc3_: * = !!_loc2_ ? _loc2_.whiteSpaceCollapse : undefined;
        if (_loc3_ !== undefined && _loc3_ != FormatValue.INHERIT) {
            param1 = _loc3_;
        }
        var _loc4_: String;
        var _loc5_: String = _loc4_ = this.text;
        if (!param1 || param1 == WhiteSpaceCollapse.COLLAPSE) {
            if (Boolean(tlf_internal::impliedElement) && parent != null) {
                if (_loc5_.search(anyPrintChar) == -1) {
                    parent.removeChild(this);
                    return;
                }
            }
            _loc5_ = (_loc5_ = _loc5_.replace(_newLineTabPattern, " ")).replace(_dblSpacePattern, " ");
        }
        if ((_loc5_ = _loc5_.replace(_tabPlaceholderPattern, "\t")) != _loc4_) {
            this.replaceText(0, textLength, _loc5_);
        }
        super.tlf_internal::applyWhiteSpaceCollapse(param1);
    }

    public function replaceText(param1: int, param2: int, param3: String): void {
        if (param1 < 0 || param2 > textLength || param2 < param1) {
            throw RangeError(GlobalSettings.resourceStringFunction("invalidReplaceTextPositions"));
        }
        if (param1 != 0 && param1 != textLength && CharacterUtil.isLowSurrogate(_text.charCodeAt(param1)) || param2 != 0 && param2 != textLength && CharacterUtil.isHighSurrogate(_text.charCodeAt(param2 - 1))) {
            throw RangeError(GlobalSettings.resourceStringFunction("invalidSurrogatePairSplit"));
        }
        if (this.tlf_internal::hasParagraphTerminator) {
            if (param1 == textLength) {
                param1--;
            }
            if (param2 == textLength) {
                param2--;
            }
        }
        if (param2 != param1) {
            tlf_internal::modelChanged(ModelChange.TEXT_DELETED, this, param1, param2 - param1);
        }
        this.replaceTextInternal(param1, param2, param3);
        if (Boolean(param3) && Boolean(param3.length)) {
            tlf_internal::modelChanged(ModelChange.TEXT_INSERTED, this, param1, param3.length);
        }
    }

    private function replaceTextInternal(param1: int, param2: int, param3: String): void {
        var _loc7_: * = null;
        var _loc4_: int = param3 == null ? 0 : param3.length;
        var _loc5_: int = param2 - param1;
        var _loc6_: int = _loc4_ - _loc5_;
        if (_blockElement) {
            (_blockElement as TextElement).replaceText(param1, param2, param3);
            _text = _blockElement.rawText;
        } else if (_text) {
            if (param3) {
                _text = _text.slice(0, param1) + param3 + _text.slice(param2, _text.length);
            } else {
                _text = _text.slice(0, param1) + _text.slice(param2, _text.length);
            }
        } else {
            _text = param3;
        }
        if (_loc6_ != 0) {
            tlf_internal::updateLengths(getAbsoluteStart() + param1, _loc6_, true);
            tlf_internal::deleteContainerText(param2, _loc5_);
            if (_loc4_ != 0) {
                if (_loc7_ = tlf_internal::getEnclosingController(param1)) {
                    ContainerController(_loc7_).tlf_internal::setTextLength(_loc7_.textLength + _loc4_);
                }
            }
        }
    }

    tlf_internal function addParaTerminator(): void {
        this.replaceTextInternal(textLength, textLength, SpanElement.tlf_internal::kParagraphTerminator);
        tlf_internal::modelChanged(ModelChange.TEXT_INSERTED, this, textLength - 1, 1);
    }

    tlf_internal function removeParaTerminator(): void {
        this.replaceTextInternal(textLength - 1, textLength, "");
        tlf_internal::modelChanged(ModelChange.TEXT_DELETED, this, textLength > 0 ? textLength - 1 : 0, 1);
    }

    override public function splitAtPosition(param1: int): FlowElement {
        var _loc3_: * = null;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: int = 0;
        if (param1 < 0 || param1 > textLength) {
            throw RangeError(GlobalSettings.resourceStringFunction("invalidSplitAtPosition"));
        }
        if (param1 < textLength && CharacterUtil.isLowSurrogate(String(this.text).charCodeAt(param1))) {
            throw RangeError(GlobalSettings.resourceStringFunction("invalidSurrogatePairSplit"));
        }
        var _loc2_: SpanElement = new SpanElement();
        _loc2_.id = this.id;
        _loc2_.typeName = this.typeName;
        if (parent) {
            _loc4_ = textLength - param1;
            if (_blockElement) {
                _loc7_ = (_loc6_ = parent.tlf_internal::createContentAsGroup()).getElementIndex(_blockElement);
                _loc6_.splitTextElement(_loc7_, param1);
                _blockElement = _loc6_.getElementAt(_loc7_);
                _text = _blockElement.rawText;
                _loc3_ = _loc6_.getElementAt(_loc7_ + 1) as TextElement;
            } else if (param1 < textLength) {
                _loc2_.text = _text.substr(param1);
                _text = _text.substring(0, param1);
            }
            tlf_internal::modelChanged(ModelChange.TEXT_DELETED, this, param1, _loc4_);
            _loc2_.tlf_internal::quickInitializeForSplit(this, _loc4_, _loc3_);
            tlf_internal::setTextLength(param1);
            parent.tlf_internal::addChildAfterInternal(this, _loc2_);
            (_loc5_ = this.getParagraph()).tlf_internal::updateTerminatorSpan(this, _loc2_);
            parent.tlf_internal::modelChanged(ModelChange.ELEMENT_ADDED, _loc2_, _loc2_.parentRelativeStart, _loc2_.textLength);
        } else {
            _loc2_.format = format;
            if (param1 < textLength) {
                _loc2_.text = String(this.text).substr(param1);
                this.replaceText(param1, textLength, null);
            }
        }
        return _loc2_;
    }

    override tlf_internal function normalizeRange(param1: uint, param2: uint): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (this.textLength == 1 && !tlf_internal::bindableElement) {
            _loc3_ = getParagraph();
            if (Boolean(_loc3_) && _loc3_.getLastLeaf() == this) {
                if (_loc4_ = getPreviousLeaf(_loc3_)) {
                    if (!TextLayoutFormat.isEqual(this.format, _loc4_.format)) {
                        this.format = _loc4_.format;
                    }
                }
            }
        }
        super.tlf_internal::normalizeRange(param1, param2);
    }

    override tlf_internal function mergeToPreviousIfPossible(): Boolean {
        var _loc1_: int = 0;
        var _loc2_: * = null;
        var _loc3_: Boolean = false;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: int = 0;
        if (Boolean(parent) && !tlf_internal::bindableElement) {
            _loc1_ = parent.getChildIndex(this);
            if (_loc1_ != 0) {
                _loc2_ = parent.getChildAt(_loc1_ - 1) as SpanElement;
                if (!_loc2_ && this.textLength == 1 && this.tlf_internal::hasParagraphTerminator) {
                    if (_loc4_ = getParagraph()) {
                        if (_loc5_ = getPreviousLeaf(_loc4_) as SpanElement) {
                            parent.removeChildAt(_loc1_);
                            return true;
                        }
                    }
                }
                if (_loc2_ == null) {
                    return false;
                }
                if (this.tlf_internal::hasActiveEventMirror()) {
                    return false;
                }
                _loc3_ = textLength == 1 && this.tlf_internal::hasParagraphTerminator;
                if (Boolean(_loc2_.tlf_internal::hasActiveEventMirror()) && !_loc3_) {
                    return false;
                }
                if (_loc3_ || Boolean(tlf_internal::equalStylesForMerge(_loc2_))) {
                    _loc6_ = _loc2_.textLength;
                    _loc2_.replaceText(_loc6_, _loc6_, this.text);
                    parent.removeChildAt(_loc1_);
                    return true;
                }
            }
        }
        return false;
    }
}
}
