package spark.components {

import mx.core.IVisualElement;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;
import mx.utils.BitFlagUtil;

import spark.core.IDisplayText;
import spark.layouts.supportClasses.LayoutBase;

public class Panel extends SkinnableContainer {

    mx_internal static const VERSION: String = "4.6.0.23201";

    mx_internal static const CONTROLBAR_PROPERTY_FLAG: uint = 1;

    mx_internal static const LAYOUT_PROPERTY_FLAG: uint = 2;

    mx_internal static const VISIBLE_PROPERTY_FLAG: uint = 4;

    mx_internal static var createAccessibilityImplementation: Function;


    mx_internal var controlBarGroupProperties: Object;

    [SkinPart(required="false")]
    public var controlBarGroup: Group;

    [SkinPart(required="false")]
    public var titleDisplay: IDisplayText;

    private var _title: String = "";

    private var titleChanged: Boolean;

    public function Panel() {
        this.mx_internal::controlBarGroupProperties = {"visible": true};
        super();
        mouseEnabled = false;
    }

    override public function get baselinePosition(): Number {
        return getBaselinePositionForPart(this.titleDisplay as IVisualElement);
    }

    public function get controlBarContent(): Array {
        if (this.controlBarGroup) {
            return this.controlBarGroup.mx_internal::getMXMLContent();
        }
        return this.mx_internal::controlBarGroupProperties.controlBarContent;
    }

    public function set controlBarContent(param1: Array): void {
        if (this.controlBarGroup) {
            this.controlBarGroup.mxmlContent = param1;
            this.mx_internal::controlBarGroupProperties = BitFlagUtil.update(this.mx_internal::controlBarGroupProperties as uint, mx_internal::CONTROLBAR_PROPERTY_FLAG, param1 != null);
        } else {
            this.mx_internal::controlBarGroupProperties.controlBarContent = param1;
        }
        invalidateSkinState();
    }

    public function get controlBarLayout(): LayoutBase {
        return !!this.controlBarGroup ? this.controlBarGroup.layout : this.mx_internal::controlBarGroupProperties.layout;
    }

    public function set controlBarLayout(param1: LayoutBase): void {
        if (this.controlBarGroup) {
            this.controlBarGroup.layout = param1;
            this.mx_internal::controlBarGroupProperties = BitFlagUtil.update(this.mx_internal::controlBarGroupProperties as uint, mx_internal::LAYOUT_PROPERTY_FLAG, true);
        } else {
            this.mx_internal::controlBarGroupProperties.layout = param1;
        }
    }

    public function get controlBarVisible(): Boolean {
        return !!this.controlBarGroup ? this.controlBarGroup.visible : Boolean(this.mx_internal::controlBarGroupProperties.visible);
    }

    public function set controlBarVisible(param1: Boolean): void {
        if (this.controlBarGroup) {
            this.controlBarGroup.visible = param1;
            this.mx_internal::controlBarGroupProperties = BitFlagUtil.update(this.mx_internal::controlBarGroupProperties as uint, mx_internal::VISIBLE_PROPERTY_FLAG, param1);
        } else {
            this.mx_internal::controlBarGroupProperties.visible = param1;
        }
        invalidateSkinState();
        if (skin) {
            skin.invalidateSize();
        }
    }

    [Bindable(event="propertyChange")]
    public function get title(): String {
        return this._title;
    }

    private function set _110371416title(param1: String): void {
        this._title = param1;
        if (this.titleDisplay) {
            this.titleDisplay.text = this.title;
        }
    }

    override protected function initializeAccessibility(): void {
        if (false) {
            Panel.mx_internal::createAccessibilityImplementation(this);
        }
    }

    override protected function partAdded(param1: String, param2: Object): void {
        var _loc3_: * = 0;
        super.partAdded(param1, param2);
        if (param2 == this.titleDisplay) {
            this.titleDisplay.text = this.title;
        } else if (param2 == this.controlBarGroup) {
            _loc3_ = 0;
            if (this.mx_internal::controlBarGroupProperties.controlBarContent !== undefined) {
                this.controlBarGroup.mxmlContent = this.mx_internal::controlBarGroupProperties.controlBarContent;
                _loc3_ = BitFlagUtil.update(_loc3_, mx_internal::CONTROLBAR_PROPERTY_FLAG, true);
            }
            if (this.mx_internal::controlBarGroupProperties.layout !== undefined) {
                this.controlBarGroup.layout = this.mx_internal::controlBarGroupProperties.layout;
                _loc3_ = BitFlagUtil.update(_loc3_, mx_internal::LAYOUT_PROPERTY_FLAG, true);
            }
            if (this.mx_internal::controlBarGroupProperties.visible !== undefined) {
                this.controlBarGroup.visible = this.mx_internal::controlBarGroupProperties.visible;
                _loc3_ = BitFlagUtil.update(_loc3_, mx_internal::VISIBLE_PROPERTY_FLAG, true);
            }
            this.mx_internal::controlBarGroupProperties = _loc3_;
        }
    }

    override protected function partRemoved(param1: String, param2: Object): void {
        var _loc3_: * = null;
        super.partRemoved(param1, param2);
        if (param2 == this.controlBarGroup) {
            _loc3_ = {};
            if (BitFlagUtil.isSet(this.mx_internal::controlBarGroupProperties as uint, mx_internal::CONTROLBAR_PROPERTY_FLAG)) {
                _loc3_.controlBarContent = this.controlBarGroup.mx_internal::getMXMLContent();
            }
            if (BitFlagUtil.isSet(this.mx_internal::controlBarGroupProperties as uint, mx_internal::LAYOUT_PROPERTY_FLAG)) {
                _loc3_.layout = this.controlBarGroup.layout;
            }
            if (BitFlagUtil.isSet(this.mx_internal::controlBarGroupProperties as uint, mx_internal::VISIBLE_PROPERTY_FLAG)) {
                _loc3_.visible = this.controlBarGroup.visible;
            }
            this.mx_internal::controlBarGroupProperties = _loc3_;
            this.controlBarGroup.mxmlContent = null;
            this.controlBarGroup.layout = null;
        }
    }

    override protected function getCurrentSkinState(): String {
        var _loc1_: * = enabled ? "normal" : "disabled";
        if (this.controlBarGroup) {
            if (BitFlagUtil.isSet(this.mx_internal::controlBarGroupProperties as uint, mx_internal::CONTROLBAR_PROPERTY_FLAG) && BitFlagUtil.isSet(this.mx_internal::controlBarGroupProperties as uint, mx_internal::VISIBLE_PROPERTY_FLAG)) {
                _loc1_ += "WithControlBar";
            }
        } else if (Boolean(this.mx_internal::controlBarGroupProperties.controlBarContent) && Boolean(this.mx_internal::controlBarGroupProperties.visible)) {
            _loc1_ += "WithControlBar";
        }
        return _loc1_;
    }

    public function set title(param1: String): void {
        var _loc2_: Object = this.title;
        if (_loc2_ !== param1) {
            this._110371416title = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _loc2_, param1));
            }
        }
    }
}
}
