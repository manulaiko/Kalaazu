package package_50 {

import flash.events.MouseEvent;

import mx.binding.BindingManager;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.mvc.common.view.components.DOButtonBase;
import net.bigpoint.darkorbit.mvc.common.view.components.DOPopUp;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOButtonBaseSkin;

import spark.components.Group;
import spark.components.Label;
import spark.components.VGroup;

public class class_147 extends DOPopUp {


    private var _1719531403bigTopLevelHoldingGroupObjectThingy: Group;

    private var _315970861groupDepth1: VGroup;

    private var var_25: Label;

    private var __moduleFactoryInitialized: Boolean = false;

    public function class_147() {
        super();
        mx_internal::_document = this;
        this.styleName = "battleStationPopup";
        this.title = "-";
        this.minHeight = 140;
        this.minWidth = 400;
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_5158);
        this.addEventListener("creationComplete", this.method_1153);
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

    public function method_4130(param1: String): void {
        this.popupTextLabel.text = param1;
    }

    private function handleCancelButtonClicked(param1: MouseEvent): void {
        handleCloseButtonClick(null);
    }

    private function method_453(): void {
        closeButton.label = class_88.getItem("label_close");
    }

    private function method_5158(): Array {
        return [this.method_2255()];
    }

    private function method_2255(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 85;
        _loc1_.mxmlContent = [this.method_6040()];
        _loc1_.id = "bigTopLevelHoldingGroupObjectThingy";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.bigTopLevelHoldingGroupObjectThingy = _loc1_;
        BindingManager.executeBindings(this, "bigTopLevelHoldingGroupObjectThingy", this.bigTopLevelHoldingGroupObjectThingy);
        return _loc1_;
    }

    private function method_6040(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.horizontalAlign = "center";
        _loc1_.verticalCenter = 0;
        _loc1_.mxmlContent = [this.method_3913(), this.method_1254()];
        _loc1_.id = "groupDepth1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.groupDepth1 = _loc1_;
        BindingManager.executeBindings(this, "groupDepth1", this.groupDepth1);
        return _loc1_;
    }

    private function method_3913(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "";
        _loc1_.percentWidth = 95;
        _loc1_.minHeight = 50;
        _loc1_.setStyle("textAlign", "center");
        _loc1_.setStyle("verticalAlign", "middle");
        _loc1_.setStyle("fontSize", 15);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.setStyle("color", 16777215);
        _loc1_.id = "popupTextLabel";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.popupTextLabel = _loc1_;
        BindingManager.executeBindings(this, "popupTextLabel", this.popupTextLabel);
        return _loc1_;
    }

    private function method_1254(): DOButtonBase {
        var _loc1_: DOButtonBase = new DOButtonBase();
        _loc1_.label = "";
        _loc1_.styleName = "questWindowAbortQuest";
        _loc1_.mouseChildren = false;
        _loc1_.buttonMode = true;
        _loc1_.setStyle("fontSize", 14);
        _loc1_.setStyle("color", 16777215);
        _loc1_.setStyle("skinClass", DOButtonBaseSkin);
        _loc1_.addEventListener("click", this.method_6088);
        _loc1_.id = "closeButton";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        closeButton = _loc1_;
        BindingManager.executeBindings(this, "closeButton", closeButton);
        return _loc1_;
    }

    public function method_6088(param1: MouseEvent): void {
        this.handleCancelButtonClicked(param1);
    }

    public function method_1153(param1: FlexEvent): void {
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
    public function get popupTextLabel(): Label {
        return this.var_25;
    }

    public function set popupTextLabel(param1: Label): void {
        var _loc2_: Object = this.var_25;
        if (_loc2_ !== param1) {
            this.var_25 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "popupTextLabel", _loc2_, param1));
            }
        }
    }
}
}
