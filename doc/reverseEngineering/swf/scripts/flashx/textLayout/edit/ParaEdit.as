package flashx.textLayout.edit {

import flashx.textLayout.container.ContainerController;
import flashx.textLayout.elements.FlowElement;
import flashx.textLayout.elements.FlowGroupElement;
import flashx.textLayout.elements.FlowLeafElement;
import flashx.textLayout.elements.InlineGraphicElement;
import flashx.textLayout.elements.ParagraphElement;
import flashx.textLayout.elements.SpanElement;
import flashx.textLayout.elements.SubParagraphGroupElementBase;
import flashx.textLayout.elements.TextFlow;
import flashx.textLayout.formats.ITextLayoutFormat;
import flashx.textLayout.formats.TextLayoutFormat;
import flashx.textLayout.tlf_internal;

public class ParaEdit {


    public function ParaEdit() {
        super();
    }

    public static function insertText(param1: TextFlow, param2: int, param3: String, param4: Boolean): SpanElement {
        var _loc6_: int = 0;
        var _loc14_: int = 0;
        var _loc15_: * = null;
        var _loc17_: * = null;
        var _loc18_: int = 0;
        if (param3.length == 0) {
            return null;
        }
        var _loc7_: ParagraphElement;
        var _loc5_: FlowElement;
        var _loc8_: int = (_loc7_ = (_loc5_ = param1.findLeaf(param2)).getParagraph()).getAbsoluteStart();
        var _loc9_: int = param2 - _loc8_;
        if (_loc8_ == param2) {
            _loc6_ = 0;
        } else {
            if (_loc9_ == _loc5_.getElementRelativeStart(_loc7_)) {
                _loc5_ = FlowLeafElement(_loc5_).getPreviousLeaf(_loc7_);
            }
            _loc6_ = _loc5_.parent.getChildIndex(_loc5_) + 1;
        }
        var _loc10_: FlowGroupElement = _loc5_.parent;
        var _loc11_: SubParagraphGroupElementBase = _loc5_.getParentByType(SubParagraphGroupElementBase) as SubParagraphGroupElementBase;
        while (_loc11_ != null) {
            if (!((_loc14_ = _loc9_ - _loc11_.getElementRelativeStart(_loc7_)) == 0 && !_loc11_.tlf_internal::acceptTextBefore() || !_loc11_.tlf_internal::acceptTextAfter() && (_loc14_ == _loc11_.textLength || _loc14_ == _loc11_.textLength - 1 && _loc5_ == _loc7_.getLastLeaf()))) {
                break;
            }
            param4 = true;
            _loc5_ = _loc10_;
            _loc10_ = _loc10_.parent;
            _loc11_ = _loc11_.getParentByType(SubParagraphGroupElementBase) as SubParagraphGroupElementBase;
            _loc6_ = _loc10_.getChildIndex(_loc5_) + 1;
        }
        var _loc12_: SpanElement;
        if (!(_loc12_ = _loc5_ as SpanElement) || param4) {
            _loc15_ = new SpanElement();
            if (_loc6_ > 0) {
                _loc18_ = _loc9_ - _loc5_.getElementRelativeStart(_loc7_);
                if (param4) {
                    if (_loc18_ == 0) {
                        _loc6_--;
                    } else if (_loc18_ != _loc5_.textLength) {
                        _loc5_.splitAtPosition(_loc18_);
                    }
                }
            }
            _loc10_.replaceChildren(_loc6_, _loc6_, _loc15_);
            if ((_loc17_ = _loc15_.getPreviousLeaf(_loc7_)) == null) {
                _loc15_.format = _loc15_.getNextLeaf(_loc7_).format;
            } else {
                _loc15_.format = _loc17_.format;
            }
            _loc12_ = _loc15_;
        }
        var _loc13_: int = _loc9_ - _loc12_.getElementRelativeStart(_loc7_);
        _loc12_.replaceText(_loc13_, _loc13_, param3);
        return _loc12_;
    }

    private static function deleteTextInternal(param1: ParagraphElement, param2: int, param3: int): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: int = 0;
        var _loc8_: int = 0;
        var _loc9_: int = 0;
        var _loc7_: int = 0;
        while (param3 > 0) {
            _loc8_ = (_loc5_ = (_loc4_ = param1.findLeaf(param2)) as SpanElement).getElementRelativeStart(param1);
            _loc7_ = param2 - _loc8_;
            if (param2 > _loc8_ + _loc5_.textLength) {
                _loc6_ = _loc5_.textLength;
            } else {
                _loc6_ = _loc8_ + _loc5_.textLength - param2;
            }
            if (param3 < _loc6_) {
                _loc6_ = param3;
            }
            _loc5_.replaceText(_loc7_, _loc7_ + _loc6_, "");
            if (_loc5_.textLength == 0) {
                _loc9_ = _loc5_.parent.getChildIndex(_loc5_);
                _loc5_.parent.replaceChildren(_loc9_, _loc9_ + 1, null);
            }
            param3 -= _loc6_;
        }
    }

    public static function deleteText(param1: ParagraphElement, param2: int, param3: int): void {
        var _loc4_: int = param1.textLength - 1;
        if (param2 < 0 || param2 > _loc4_) {
            return;
        }
        if (param3 <= 0) {
            return;
        }
        var _loc5_: int;
        if ((_loc5_ = param2 + param3 - 1) > _loc4_) {
            param3 = (_loc5_ = _loc4_) - param2 + 1;
        }
        deleteTextInternal(param1, param2, param3);
    }

    public static function createImage(param1: FlowGroupElement, param2: int, param3: Object, param4: Object, param5: Object, param6: Object, param7: ITextLayoutFormat): InlineGraphicElement {
        var _loc16_: * = null;
        var _loc17_: int = 0;
        var _loc18_: * = null;
        var _loc8_: FlowElement = param1.findLeaf(param2);
        var _loc9_: int = 0;
        if (_loc8_ != null) {
            _loc9_ = param2 - _loc8_.getElementRelativeStart(param1);
        }
        if (_loc8_ != null && _loc9_ > 0 && _loc9_ < _loc8_.textLength) {
            (_loc8_ as SpanElement).splitAtPosition(_loc9_);
        }
        var _loc10_: InlineGraphicElement;
        (_loc10_ = new InlineGraphicElement()).height = param5;
        _loc10_.width = param4;
        _loc10_.float = !!param6 ? param6.toString() : undefined;
        var _loc11_: Object = param3;
        if (_loc11_ is String && _loc11_.length > 6 && _loc11_.substr(0, 6) == "@Embed") {
            _loc16_ = "source=";
            if ((_loc17_ = int(_loc11_.indexOf(_loc16_, 6))) > 0) {
                _loc17_ += _loc16_.length;
                _loc17_ = int(_loc11_.indexOf("\'", _loc17_));
                _loc11_ = _loc11_.substring(_loc17_ + 1, _loc11_.indexOf("\'", _loc17_ + 1));
            }
        }
        _loc10_.source = _loc11_;
        while (Boolean(_loc8_) && _loc8_.parent != param1) {
            _loc8_ = _loc8_.parent;
        }
        var _loc13_: int = _loc8_ != null ? param1.getChildIndex(_loc8_) : param1.numChildren;
        if (Boolean(_loc8_) && _loc9_ > 0) {
            _loc13_++;
        }
        param1.replaceChildren(_loc13_, _loc13_, _loc10_);
        var _loc14_: ParagraphElement = _loc10_.getParagraph();
        var _loc15_: FlowLeafElement;
        if (!(_loc15_ = _loc10_.getPreviousLeaf(_loc14_))) {
            _loc15_ = _loc10_.getNextLeaf(_loc14_);
        }
        if (Boolean(_loc15_.format) || Boolean(param7)) {
            _loc18_ = new TextLayoutFormat(_loc15_.format);
            if (param7) {
                _loc18_.apply(param7);
            }
            _loc10_.format = _loc18_;
        }
        return _loc10_;
    }

    private static function splitForChange(param1: SpanElement, param2: int, param3: int): SpanElement {
        var _loc5_: * = null;
        var _loc4_: int = param1.getAbsoluteStart();
        if (param2 == _loc4_ && param3 == param1.textLength) {
            return param1;
        }
        var _loc6_: int = param1.textLength;
        var _loc7_: int;
        if ((_loc7_ = param2 - _loc4_) > 0) {
            _loc5_ = param1.splitAtPosition(_loc7_) as SpanElement;
            if (_loc7_ + param3 < _loc6_) {
                _loc5_.splitAtPosition(param3);
            }
        } else {
            param1.splitAtPosition(param3);
            _loc5_ = param1;
        }
        return _loc5_;
    }

    private static function undefineDefinedFormats(param1: TextLayoutFormat, param2: ITextLayoutFormat): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (param2) {
            if (param2 is TextLayoutFormat) {
                _loc3_ = param2 as TextLayoutFormat;
            } else {
                _loc3_ = new TextLayoutFormat(param2);
            }
            for (_loc4_ in _loc3_.styles) {
                param1.setStyle(_loc4_, undefined);
            }
        }
    }

    private static function applyCharacterFormat(param1: FlowLeafElement, param2: int, param3: int, param4: ITextLayoutFormat, param5: ITextLayoutFormat): int {
        var _loc6_: TextLayoutFormat = new TextLayoutFormat(param1.format);
        if (param4) {
            _loc6_.apply(param4);
        }
        undefineDefinedFormats(_loc6_, param5);
        return setCharacterFormat(param1, _loc6_, param2, param3);
    }

    private static function setCharacterFormat(param1: FlowLeafElement, param2: ITextLayoutFormat, param3: int, param4: int): int {
        var _loc6_: * = null;
        var _loc7_: int = 0;
        var _loc8_: int = 0;
        var _loc9_: * = null;
        var _loc5_: int = param1.getAbsoluteStart();
        if (!(param2 is ITextLayoutFormat) || !TextLayoutFormat.isEqual(ITextLayoutFormat(param2), param1.format)) {
            _loc7_ = (_loc6_ = param1.getParagraph()).getAbsoluteStart();
            if ((_loc8_ = param3 - _loc5_) + param4 > param1.textLength) {
                param4 = param1.textLength - _loc8_;
            }
            if (_loc8_ + param4 == param1.textLength - 1 && param1 is SpanElement && Boolean(SpanElement(param1).tlf_internal::hasParagraphTerminator)) {
                param4++;
            }
            if (param1 is SpanElement) {
                _loc9_ = splitForChange(SpanElement(param1), param3, param4);
            } else {
                _loc9_ = param1;
            }
            if (param2 is ITextLayoutFormat) {
                _loc9_.format = ITextLayoutFormat(param2);
            } else {
                _loc9_.tlf_internal::setStylesInternal(param2);
            }
            return param3 + param4;
        }
        param4 = param1.textLength;
        return _loc5_ + param4;
    }

    public static function applyTextStyleChange(param1: TextFlow, param2: int, param3: int, param4: ITextLayoutFormat, param5: ITextLayoutFormat): void {
        var _loc7_: * = null;
        var _loc6_: int = param2;
        while (_loc6_ < param3) {
            _loc7_ = param1.findLeaf(_loc6_);
            _loc6_ = applyCharacterFormat(_loc7_, _loc6_, param3 - _loc6_, param4, param5);
        }
    }

    public static function setTextStyleChange(param1: TextFlow, param2: int, param3: int, param4: ITextLayoutFormat): void {
        var _loc6_: * = null;
        var _loc5_: int = param2;
        while (_loc5_ < param3) {
            _loc6_ = param1.findLeaf(_loc5_);
            _loc5_ = setCharacterFormat(FlowLeafElement(_loc6_), param4, _loc5_, param3 - _loc5_);
        }
    }

    public static function splitElement(param1: FlowGroupElement, param2: int): FlowGroupElement {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc3_: FlowGroupElement = param1.splitAtPosition(param2) as FlowGroupElement;
        if (!(_loc3_ is SubParagraphGroupElementBase)) {
            _loc4_ = _loc3_;
            while (!(_loc4_ is ParagraphElement) && Boolean(_loc4_.numChildren)) {
                _loc4_ = _loc4_.getChildAt(0) as FlowGroupElement;
            }
            _loc5_ = param1;
            while (!(_loc5_ is ParagraphElement) && Boolean(_loc5_.numChildren)) {
                _loc5_ = _loc5_.getChildAt(_loc5_.numChildren - 1) as FlowGroupElement;
            }
            if (!(_loc5_ is ParagraphElement)) {
                _loc6_ = _loc4_.shallowCopy() as ParagraphElement;
                _loc5_.addChild(_loc6_);
                _loc5_ = _loc6_;
            } else if (!(_loc4_ is ParagraphElement)) {
                _loc6_ = _loc5_.shallowCopy() as ParagraphElement;
                _loc4_.addChild(_loc6_);
                _loc4_ = _loc6_;
            }
            if (_loc5_.textLength <= 1) {
                _loc5_.tlf_internal::normalizeRange(0, _loc5_.textLength);
                _loc5_.getLastLeaf().tlf_internal::quickCloneTextLayoutFormat(_loc4_.getFirstLeaf());
            } else if (_loc4_.textLength <= 1) {
                _loc4_.tlf_internal::normalizeRange(0, _loc4_.textLength);
                _loc4_.getFirstLeaf().tlf_internal::quickCloneTextLayoutFormat(_loc5_.getLastLeaf());
            }
        }
        return _loc3_;
    }

    public static function mergeParagraphWithNext(param1: ParagraphElement): Boolean {
        var _loc4_: * = null;
        var _loc2_: int = param1.parent.getChildIndex(param1);
        if (_loc2_ == param1.parent.numChildren - 1) {
            return false;
        }
        var _loc3_: ParagraphElement = param1.parent.getChildAt(_loc2_ + 1) as ParagraphElement;
        if (_loc3_ == null) {
            return false;
        }
        param1.parent.replaceChildren(_loc2_ + 1, _loc2_ + 2, null);
        if (_loc3_.textLength <= 1) {
            return true;
        }
        while (_loc3_.numChildren) {
            _loc4_ = _loc3_.getChildAt(0);
            _loc3_.replaceChildren(0, 1, null);
            param1.replaceChildren(param1.numChildren, param1.numChildren, _loc4_);
            if (param1.numChildren > 1 && param1.getChildAt(param1.numChildren - 2).textLength == 0) {
                param1.replaceChildren(param1.numChildren - 2, param1.numChildren - 1, null);
            }
        }
        return true;
    }

    public static function cacheParagraphStyleInformation(param1: TextFlow, param2: int, param3: int, param4: Array): void {
        var _loc5_: * = null;
        var _loc6_: * = null;
        while (param2 <= param3 && param2 >= 0) {
            _loc5_ = param1.findLeaf(param2).getParagraph();
            (_loc6_ = new Object()).begIdx = _loc5_.getAbsoluteStart();
            _loc6_.endIdx = _loc6_.begIdx + _loc5_.textLength - 1;
            _loc6_.attributes = new TextLayoutFormat(_loc5_.format);
            param4.push(_loc6_);
            param2 = _loc6_.begIdx + _loc5_.textLength;
        }
    }

    public static function setParagraphStyleChange(param1: TextFlow, param2: int, param3: int, param4: ITextLayoutFormat): void {
        var _loc6_: * = null;
        var _loc5_: int = param2;
        while (_loc5_ <= param3) {
            (_loc6_ = param1.findLeaf(_loc5_).getParagraph()).format = !!param4 ? new TextLayoutFormat(param4) : null;
            _loc5_ = _loc6_.getAbsoluteStart() + _loc6_.textLength;
        }
    }

    public static function applyParagraphStyleChange(param1: TextFlow, param2: int, param3: int, param4: ITextLayoutFormat, param5: ITextLayoutFormat): void {
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc6_: int = param2;
        while (_loc6_ <= param3) {
            if (!(_loc7_ = param1.findLeaf(_loc6_))) {
                break;
            }
            _loc8_ = _loc7_.getParagraph();
            _loc9_ = new TextLayoutFormat(_loc8_.format);
            if (param4) {
                _loc9_.apply(param4);
            }
            undefineDefinedFormats(_loc9_, param5);
            _loc8_.format = _loc9_;
            _loc6_ = _loc8_.getAbsoluteStart() + _loc8_.textLength;
        }
    }

    public static function cacheStyleInformation(param1: TextFlow, param2: int, param3: int, param4: Array): void {
        var _loc8_: * = null;
        var _loc9_: int = 0;
        var _loc5_: FlowElement;
        var _loc6_: int = (_loc5_ = param1.findLeaf(param2)).getAbsoluteStart() + _loc5_.textLength - param2;
        var _loc7_: int = param3 - param2;
        while (true) {
            (_loc8_ = new Object()).begIdx = param2;
            _loc9_ = Math.min(_loc7_, _loc6_);
            _loc8_.endIdx = param2 + _loc9_;
            _loc8_.style = new TextLayoutFormat(_loc5_.format);
            param4.push(_loc8_);
            if ((_loc7_ -= Math.min(_loc7_, _loc6_)) == 0) {
                break;
            }
            param2 = int(_loc8_.endIdx);
            _loc6_ = (_loc5_ = param1.findLeaf(param2)).textLength;
        }
    }

    public static function cacheContainerStyleInformation(param1: TextFlow, param2: int, param3: int, param4: Array): void {
        var _loc5_: int = 0;
        var _loc6_: * = null;
        var _loc7_: * = null;
        if (param1.flowComposer) {
            if ((_loc5_ = param1.flowComposer.findControllerIndexAtPosition(param2, false)) == -1) {
                return;
            }
            param3 = param1.flowComposer.findControllerIndexAtPosition(param3, true);
            if (param3 == -1) {
                param3 = param1.flowComposer.numControllers - 1;
            }
            while (_loc5_ <= param3) {
                _loc6_ = param1.flowComposer.getControllerAt(_loc5_);
                (_loc7_ = new Object()).container = _loc6_;
                _loc7_.attributes = new TextLayoutFormat(_loc6_.format);
                param4.push(_loc7_);
                _loc5_++;
            }
        }
    }

    public static function applyContainerStyleChange(param1: TextFlow, param2: int, param3: int, param4: ITextLayoutFormat, param5: ITextLayoutFormat): void {
        var _loc6_: int = 0;
        var _loc7_: int = 0;
        var _loc8_: * = null;
        var _loc9_: * = null;
        if (param1.flowComposer) {
            if ((_loc6_ = param1.flowComposer.findControllerIndexAtPosition(param2, false)) == -1) {
                return;
            }
            param3 = param1.flowComposer.findControllerIndexAtPosition(param3, true);
            if (param3 == -1) {
                param3 = param1.flowComposer.numControllers - 1;
            }
            _loc7_ = param1.flowComposer.findControllerIndexAtPosition(param2, false);
            while (_loc6_ <= param3) {
                _loc8_ = param1.flowComposer.getControllerAt(_loc6_);
                _loc9_ = new TextLayoutFormat(_loc8_.format);
                if (param4) {
                    _loc9_.apply(param4);
                }
                undefineDefinedFormats(_loc9_, param5);
                _loc8_.format = _loc9_;
                _loc6_++;
            }
        }
    }

    public static function setContainerStyleChange(param1: Object): void {
        param1.container.format = param1.attributes as ITextLayoutFormat;
    }
}
}
