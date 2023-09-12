package spark.components {

import flash.events.Event;

import flashx.textLayout.elements.TextFlow;
import flashx.textLayout.formats.TextLayoutFormat;

import mx.core.mx_internal;

import spark.components.supportClasses.SkinnableTextBase;

public class TextArea extends SkinnableTextBase {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static const focusExclusions: Array = ["scroller", "textDisplay"];


    private var horizontalScrollPolicyChanged: Boolean = false;

    private var verticalScrollPolicyChanged: Boolean = false;

    [SkinPart(required="false")]
    public var scroller: Scroller;

    public function TextArea() {
        super();
    }

    override public function get suggestedFocusSkinExclusions(): Array {
        return focusExclusions;
    }

    [Bindable("textChanged")]
    [Bindable("change")]
    override public function set text(param1: String): void {
        super.text = param1;
        dispatchEvent(new Event("textChanged"));
    }

    public function get content(): Object {
        return this.textFlow;
    }

    public function set content(param1: Object): void {
        mx_internal::setContent(param1);
    }

    public function get heightInLines(): Number {
        return mx_internal::getHeightInLines();
    }

    public function set heightInLines(param1: Number): void {
        mx_internal::setHeightInLines(param1);
    }

    public function get textFlow(): TextFlow {
        return mx_internal::getTextFlow();
    }

    public function set textFlow(param1: TextFlow): void {
        mx_internal::setTextFlow(param1);
    }

    public function get widthInChars(): Number {
        return mx_internal::getWidthInChars();
    }

    public function set widthInChars(param1: Number): void {
        mx_internal::setWidthInChars(param1);
    }

    override protected function commitProperties(): void {
        super.commitProperties();
        if (this.horizontalScrollPolicyChanged) {
            if (this.scroller) {
                this.scroller.setStyle("horizontalScrollPolicy", getStyle("horizontalScrollPolicy"));
            }
            this.horizontalScrollPolicyChanged = false;
        }
        if (this.verticalScrollPolicyChanged) {
            if (this.scroller) {
                this.scroller.setStyle("verticalScrollPolicy", getStyle("verticalScrollPolicy"));
            }
            this.verticalScrollPolicyChanged = false;
        }
    }

    override public function styleChanged(param1: String): void {
        var _loc2_: Boolean = param1 == null || param1 == "styleName";
        super.styleChanged(param1);
        if (_loc2_ || param1 == "horizontalScrollPolicy") {
            this.horizontalScrollPolicyChanged = true;
            invalidateProperties();
        }
        if (_loc2_ || param1 == "verticalScrollPolicy") {
            this.verticalScrollPolicyChanged = true;
            invalidateProperties();
        }
    }

    override protected function partAdded(param1: String, param2: Object): void {
        super.partAdded(param1, param2);
        if (param2 == textDisplay) {
            textDisplay.multiline = true;
        } else if (param2 == this.scroller) {
            this.scroller.focusEnabled = false;
            if (this.scroller.horizontalScrollBar) {
                this.scroller.horizontalScrollBar.snapInterval = 0;
            }
            if (this.scroller.verticalScrollBar) {
                this.scroller.verticalScrollBar.snapInterval = 0;
            }
        }
    }

    public function getFormatOfRange(param1: Vector.<String> = null, param2: int = -1, param3: int = -1): TextLayoutFormat {
        if (!(textDisplay is RichEditableText)) {
            return null;
        }
        return RichEditableText(textDisplay).getFormatOfRange(param1, param2, param3);
    }

    public function setFormatOfRange(param1: TextLayoutFormat, param2: int = -1, param3: int = -1): void {
        if (!(textDisplay is RichEditableText)) {
            return;
        }
        RichEditableText(textDisplay).setFormatOfRange(param1, param2, param3);
    }

    public function scrollToRange(param1: int = 0, param2: int = 2147483647): void {
        if (!textDisplay) {
            return;
        }
        textDisplay.scrollToRange(param1, param2);
    }
}
}
