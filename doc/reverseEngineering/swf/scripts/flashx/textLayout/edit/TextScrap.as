package flashx.textLayout.edit {

import flashx.textLayout.conversion.ConverterBase;
import flashx.textLayout.elements.FlowElement;
import flashx.textLayout.elements.ParagraphElement;
import flashx.textLayout.elements.SpanElement;
import flashx.textLayout.elements.TextFlow;
import flashx.textLayout.elements.TextRange;
import flashx.textLayout.tlf_internal;

public class TextScrap {

    tlf_internal static const MERGE_TO_NEXT_ON_PASTE: String = "mergeToNextOnPaste";


    private var _textFlow: TextFlow;

    private var _plainText: int;

    public function TextScrap(param1: TextFlow = null) {
        super();
        this._textFlow = param1;
        this._textFlow.flowComposer = null;
        this._plainText = -1;
    }

    public static function createTextScrap(param1: TextRange): TextScrap {
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc2_: int = param1.absoluteStart;
        var _loc3_: int = param1.absoluteEnd;
        var _loc4_: TextFlow;
        if (!(_loc4_ = param1.textFlow) || _loc2_ >= _loc3_) {
            return null;
        }
        var _loc5_: TextFlow;
        (_loc5_ = _loc4_.deepCopy(_loc2_, _loc3_) as TextFlow).tlf_internal::normalize();
        var _loc6_: TextScrap = new TextScrap(_loc5_);
        if (_loc5_.textLength > 0) {
            _loc7_ = _loc5_.getLastLeaf();
            _loc8_ = _loc4_.findLeaf(_loc3_ - 1);
            if ((_loc9_ = _loc5_.getLastLeaf()) is SpanElement && !(_loc8_ is SpanElement)) {
                _loc9_ = _loc5_.findLeaf(_loc5_.textLength - 2);
            }
            while (Boolean(_loc9_) && Boolean(_loc8_)) {
                if (_loc3_ < _loc8_.getAbsoluteStart() + _loc8_.textLength) {
                    _loc9_.setStyle(tlf_internal::MERGE_TO_NEXT_ON_PASTE, "true");
                }
                _loc9_ = _loc9_.parent;
                _loc8_ = _loc8_.parent;
            }
            return _loc6_;
        }
        return null;
    }

    public function get textFlow(): TextFlow {
        return this._textFlow;
    }

    public function clone(): TextScrap {
        return new TextScrap(this.textFlow.deepCopy() as TextFlow);
    }

    tlf_internal function setPlainText(param1: Boolean): void {
        this._plainText = param1 ? 0 : 1;
    }

    tlf_internal function isPlainText(): Boolean {
        var isPlainElement: Function = null;
        var var_1: int = 0;
        isPlainElement = function (param1: FlowElement): Boolean {
            var _loc3_: * = null;
            if (!(param1 is ParagraphElement) && !(param1 is SpanElement)) {
                foundAttributes = true;
                return true;
            }
            var _loc2_: Object = param1.styles;
            if (_loc2_) {
                for (_loc3_ in _loc2_) {
                    if (_loc3_ != ConverterBase.MERGE_TO_NEXT_ON_PASTE) {
                        foundAttributes = true;
                        return true;
                    }
                }
            }
            return false;
        };
        var foundAttributes: Boolean = false;
        if (this._plainText == -1) {
            var_1 = this._textFlow.numChildren - 1;
            while (var_1 >= 0) {
                this._textFlow.getChildAt(var_1).tlf_internal::applyFunctionToElements(isPlainElement);
                var_1--;
            }
            this._plainText = foundAttributes ? 1 : 0;
        }
        return this._plainText == 0;
    }
}
}
