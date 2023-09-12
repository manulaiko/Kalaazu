package mx.controls {

import flash.display.DisplayObject;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import mx.core.EdgeMetrics;
import mx.core.IFlexDisplayObject;
import mx.core.IFlexModuleFactory;
import mx.core.IFontContextComponent;
import mx.core.IRectangularBorder;
import mx.core.IToolTip;
import mx.core.IUITextField;
import mx.core.UIComponent;
import mx.core.UITextField;
import mx.core.mx_internal;
import mx.styles.ISimpleStyleClient;

public class ToolTip extends UIComponent implements IToolTip, IFontContextComponent {

    mx_internal static const VERSION: String = "4.6.0.23201";

    public static var maxWidth: Number = 300;


    mx_internal var border: IFlexDisplayObject;

    private var _text: String;

    private var textChanged: Boolean;

    protected var textField: IUITextField;

    public function ToolTip() {
        super();
        mouseEnabled = false;
    }

    private function get borderMetrics(): EdgeMetrics {
        if (this.mx_internal::border is IRectangularBorder) {
            return IRectangularBorder(this.mx_internal::border).borderMetrics;
        }
        return EdgeMetrics.EMPTY;
    }

    public function get fontContext(): IFlexModuleFactory {
        return moduleFactory;
    }

    public function set fontContext(param1: IFlexModuleFactory): void {
        this.moduleFactory = param1;
    }

    public function get text(): String {
        return this._text;
    }

    public function set text(param1: String): void {
        this._text = param1;
        this.textChanged = true;
        invalidateProperties();
        invalidateSize();
        invalidateDisplayList();
    }

    override protected function createChildren(): void {
        super.createChildren();
        this.createBorder();
        this.mx_internal::createTextField(-1);
    }

    override protected function commitProperties(): void {
        var _loc1_: int = 0;
        var _loc2_: * = null;
        super.commitProperties();
        if (hasFontContextChanged() && this.textField != null) {
            _loc1_ = getChildIndex(DisplayObject(this.textField));
            this.mx_internal::removeTextField();
            this.mx_internal::createTextField(_loc1_);
            invalidateSize();
            this.textChanged = true;
        }
        if (this.textChanged) {
            _loc2_ = this.textField.getTextFormat();
            _loc2_.leftMargin = 0;
            _loc2_.rightMargin = 0;
            this.textField.defaultTextFormat = _loc2_;
            this.textField.text = this._text;
            this.textChanged = false;
        }
    }

    override protected function measure(): void {
        super.measure();
        var _loc1_: EdgeMetrics = this.borderMetrics;
        var _loc2_: Number = _loc1_.left + getStyle("paddingLeft");
        var _loc3_: Number = _loc1_.top + getStyle("paddingTop");
        var _loc4_: Number = _loc1_.right + getStyle("paddingRight");
        var _loc5_: Number = _loc1_.bottom + getStyle("paddingBottom");
        var _loc6_: Number = _loc2_ + _loc4_;
        var _loc7_: Number = _loc3_ + _loc5_;
        this.textField.wordWrap = false;
        if (this.textField.textWidth + _loc6_ > ToolTip.maxWidth) {
            this.textField.width = 0 - _loc6_;
            this.textField.wordWrap = true;
        }
        measuredWidth = this.textField.width + _loc6_;
        measuredHeight = this.textField.height + _loc7_;
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        super.updateDisplayList(param1, param2);
        var _loc3_: EdgeMetrics = this.borderMetrics;
        var _loc4_: Number = _loc3_.left + getStyle("paddingLeft");
        var _loc5_: Number = _loc3_.top + getStyle("paddingTop");
        var _loc6_: Number = _loc3_.right + getStyle("paddingRight");
        var _loc7_: Number = _loc3_.bottom + getStyle("paddingBottom");
        var _loc8_: Number = _loc4_ + _loc6_;
        var _loc9_: Number = _loc5_ + _loc7_;
        this.mx_internal::border.setActualSize(param1, param2);
        this.textField.move(_loc4_, _loc5_);
        this.textField.setActualSize(param1 - _loc8_, param2 - _loc9_);
    }

    override public function styleChanged(param1: String): void {
        super.styleChanged(param1);
        if (param1 == "styleName" || param1 == "borderSkin" || param1 == null) {
            if (this.mx_internal::border) {
                removeChild(DisplayObject(this.mx_internal::border));
                this.mx_internal::border = null;
            }
            this.createBorder();
        } else if (param1 == "borderStyle") {
            invalidateDisplayList();
        }
    }

    mx_internal function createTextField(param1: int): void {
        if (!this.textField) {
            this.textField = IUITextField(createInFontContext(UITextField));
            this.textField.autoSize = TextFieldAutoSize.LEFT;
            this.textField.mouseEnabled = false;
            this.textField.multiline = true;
            this.textField.selectable = false;
            this.textField.wordWrap = false;
            this.textField.styleName = this;
            if (param1 == -1) {
                addChild(DisplayObject(this.textField));
            } else {
                addChildAt(DisplayObject(this.textField), param1);
            }
        }
    }

    mx_internal function removeTextField(): void {
        if (this.textField) {
            removeChild(DisplayObject(this.textField));
            this.textField = null;
        }
    }

    mx_internal function getTextField(): IUITextField {
        return this.textField;
    }

    private function createBorder(): void {
        var _loc1_: * = null;
        if (!this.mx_internal::border) {
            _loc1_ = getStyle("borderSkin");
            if (_loc1_ != null) {
                this.mx_internal::border = new _loc1_();
                if (this.mx_internal::border is ISimpleStyleClient) {
                    ISimpleStyleClient(this.mx_internal::border).styleName = this;
                }
                addChildAt(DisplayObject(this.mx_internal::border), 0);
                invalidateDisplayList();
            }
        }
    }
}
}
