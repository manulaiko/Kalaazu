package flashx.textLayout.conversion {

import flashx.textLayout.elements.FlowLeafElement;
import flashx.textLayout.elements.ParagraphElement;
import flashx.textLayout.elements.TextFlow;
import flashx.textLayout.tlf_internal;

public class PlainTextExporter extends ConverterBase implements IPlainTextExporter {

    private static var _discretionaryHyphen: String = String.fromCharCode(173);


    private var _stripDiscretionaryHyphens: Boolean;

    private var _paragraphSeparator: String;

    public function PlainTextExporter() {
        super();
        this._stripDiscretionaryHyphens = true;
        this._paragraphSeparator = "\n";
    }

    public function get stripDiscretionaryHyphens(): Boolean {
        return this._stripDiscretionaryHyphens;
    }

    public function set stripDiscretionaryHyphens(param1: Boolean): void {
        this._stripDiscretionaryHyphens = param1;
    }

    public function get paragraphSeparator(): String {
        return this._paragraphSeparator;
    }

    public function set paragraphSeparator(param1: String): void {
        this._paragraphSeparator = param1;
    }

    public function export(param1: TextFlow, param2: String): Object {
        tlf_internal::clear();
        if (param2 == ConversionType.STRING_TYPE) {
            return this.exportToString(param1);
        }
        return null;
    }

    protected function exportToString(param1: TextFlow): String {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc2_: String = "";
        var _loc3_: FlowLeafElement = param1.getFirstLeaf();
        while (_loc3_) {
            _loc4_ = _loc3_.getParagraph();
            while (true) {
                _loc5_ = _loc3_.text;
                if (this._stripDiscretionaryHyphens) {
                    _loc5_ = (_loc7_ = _loc5_.split(_discretionaryHyphen)).join("");
                }
                _loc2_ += _loc5_;
                if (!(_loc6_ = _loc3_.getNextLeaf(_loc4_))) {
                    break;
                }
                _loc3_ = _loc6_;
            }
            _loc3_ = _loc3_.getNextLeaf();
            if (_loc3_) {
                _loc2_ += this._paragraphSeparator;
            }
        }
        if (useClipboardAnnotations) {
            if ((_loc8_ = param1.getLastLeaf().getParagraph()).getStyle(ConverterBase.MERGE_TO_NEXT_ON_PASTE) != "true") {
                _loc2_ += this._paragraphSeparator;
            }
        }
        return _loc2_;
    }
}
}
