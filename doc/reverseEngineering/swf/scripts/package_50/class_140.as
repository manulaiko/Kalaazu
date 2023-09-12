package package_50 {

import flash.events.MouseEvent;

import mx.binding.BindingManager;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;

import net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase;
import net.bigpoint.darkorbit.mvc.common.view.components.DOPopUp;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOButtonBaseSkin;

import package_150.class_988;

import spark.components.Group;
import spark.components.HGroup;
import spark.components.Label;
import spark.components.VGroup;

public class class_140 extends DOPopUp {


    private var _1719531403bigTopLevelHoldingGroupObjectThingy: Group;

    private var _1990131276cancelButton: DOButtonBase;

    private var _236983790confirmButton: DOButtonBase;

    private var _315970861groupDepth1: VGroup;

    private var var_2221: Label;

    private var __moduleFactoryInitialized: Boolean = false;

    public var var_820: int;

    public var var_1050: int;

    public var var_3884: int;

    public function class_140() {
        super();
        mx_internal::_document = this;
        this.styleName = "battleStationPopup";
        this.title = "-";
        this.width = 400;
        this.height = 145;
        this.minHeight = 130;
        this.minWidth = 400;
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_5083);
        this.addEventListener("creationComplete", this.method_5184);
    }

    override public function set moduleFactory(param1: IFlexModuleFactory): void {
        super.moduleFactory = param1;
        if (this.__moduleFactoryInitialized) {
            return;
        }
        this.__moduleFactoryInitialized = true;
    }

    override public function initialize(): void {
        super.initialize();
    }

    private function method_453(): void {
    }

    private function handleConfirmButtonClick(param1: MouseEvent): void {
        var _loc2_: class_988 = new class_988(class_988.CONFIRM_BTN_CLICKED);
        _loc2_.slotId = this.var_820;
        _loc2_.itemId = this.var_3884;
        dispatchEvent(_loc2_);
        handleCloseButtonClick(null);
    }

    private function handleCancelButtonClicked(param1: MouseEvent): void {
        handleCloseButtonClick(null);
    }

    public function method_4022(param1: String): void {
        this.message.text = param1;
    }

    public function method_2210(param1: String, param2: String): void {
        this.confirmButton.label = param1;
        this.cancelButton.label = param2;
    }

    private function method_5083(): Array {
        return [this.method_3091()];
    }

    private function method_3091(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this.method_2687()];
        _loc1_.id = "bigTopLevelHoldingGroupObjectThingy";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.bigTopLevelHoldingGroupObjectThingy = _loc1_;
        BindingManager.executeBindings(this, "bigTopLevelHoldingGroupObjectThingy", this.bigTopLevelHoldingGroupObjectThingy);
        return _loc1_;
    }

    private function method_2687(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.horizontalAlign = "center";
        _loc1_.mxmlContent = [this.method_292(), this.method_2513()];
        _loc1_.id = "groupDepth1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.groupDepth1 = _loc1_;
        BindingManager.executeBindings(this, "groupDepth1", this.groupDepth1);
        return _loc1_;
    }

    private function method_292(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "-";
        _loc1_.minHeight = 40;
        _loc1_.width = 390;
        _loc1_.setStyle("textAlign", "center");
        _loc1_.setStyle("verticalAlign", "middle");
        _loc1_.setStyle("fontSize", 16);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.setStyle("color", 16777215);
        _loc1_.id = "message";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.message = _loc1_;
        BindingManager.executeBindings(this, "message", this.message);
        return _loc1_;
    }

    private function method_2513(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.mxmlContent = [this.method_2442(), this.method_1222()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_2442(): DOButtonBase {
        var _loc1_: DOButtonBase = new DOButtonBase();
        _loc1_.label = "Confirm";
        _loc1_.styleName = "questWindowAcceptQuest";
        _loc1_.mouseChildren = false;
        _loc1_.buttonMode = true;
        _loc1_.setStyle("fontSize", 14);
        _loc1_.setStyle("color", 16777215);
        _loc1_.setStyle("skinClass", DOButtonBaseSkin);
        _loc1_.addEventListener("click", this.__confirmButton_click);
        _loc1_.id = "confirmButton";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.confirmButton = _loc1_;
        BindingManager.executeBindings(this, "confirmButton", this.confirmButton);
        return _loc1_;
    }

    public function __confirmButton_click(param1: MouseEvent): void {
        this.handleConfirmButtonClick(param1);
    }

    private function method_1222(): DOButtonBase {
        var _loc1_: DOButtonBase = new DOButtonBase();
        _loc1_.label = "Cancel";
        _loc1_.styleName = "questWindowAbortQuest";
        _loc1_.mouseChildren = false;
        _loc1_.buttonMode = true;
        _loc1_.setStyle("fontSize", 14);
        _loc1_.setStyle("color", 16777215);
        _loc1_.setStyle("skinClass", DOButtonBaseSkin);
        _loc1_.addEventListener("click", this.__cancelButton_click);
        _loc1_.id = "cancelButton";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.cancelButton = _loc1_;
        BindingManager.executeBindings(this, "cancelButton", this.cancelButton);
        return _loc1_;
    }

    public function __cancelButton_click(param1: MouseEvent): void {
        this.handleCancelButtonClicked(param1);
    }

    public function method_5184(param1: FlexEvent): void {
        this.method_453();
    }

    [Bindable(event="propertyChange")]
    public function get bigTopLevelHoldingGroupObjectThingy(): Group {
        return this._1719531403bigTopLevelHoldingGroupObjectThingy;
    }

    public function set bigTopLevelHoldingGroupObjectThingy(param1: Group): void {
        var _loc2_: Object = this._1719531403bigTopLevelHoldingGroupObjectThingy;
        if (_loc2_ !== param1) {
            this._1719531403bigTopLevelHoldingGroupObjectThingy = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bigTopLevelHoldingGroupObjectThingy", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get cancelButton(): DOButtonBase {
        return this._1990131276cancelButton;
    }

    public function set cancelButton(param1: DOButtonBase): void {
        var _loc2_: Object = this._1990131276cancelButton;
        if (_loc2_ !== param1) {
            this._1990131276cancelButton = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cancelButton", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get confirmButton(): DOButtonBase {
        return this._236983790confirmButton;
    }

    public function set confirmButton(param1: DOButtonBase): void {
        var _loc2_: Object = this._236983790confirmButton;
        if (_loc2_ !== param1) {
            this._236983790confirmButton = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confirmButton", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get groupDepth1(): VGroup {
        return this._315970861groupDepth1;
    }

    public function set groupDepth1(param1: VGroup): void {
        var _loc2_: Object = this._315970861groupDepth1;
        if (_loc2_ !== param1) {
            this._315970861groupDepth1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "groupDepth1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get message(): Label {
        return this.var_2221;
    }

    public function set message(param1: Label): void {
        var _loc2_: Object = this.var_2221;
        if (_loc2_ !== param1) {
            this.var_2221 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "message", _loc2_, param1));
            }
        }
    }
}
}
