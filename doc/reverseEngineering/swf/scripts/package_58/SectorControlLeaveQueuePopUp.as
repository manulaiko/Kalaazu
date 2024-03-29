package package_58 {

import flash.events.Event;
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
import spark.components.HGroup;
import spark.components.Label;
import spark.components.VGroup;

public class SectorControlLeaveQueuePopUp extends DOPopUp {

    public static const EVENT_EXIT_QUEUE_CONFIRMATION: String = "SectorControlLeaveGamePopUp.EVENT_EXIT_QUEUE_CONFIRMATION";

    public static const EVENT_EXIT_QUEUE_CANCEL: String = "SectorControlLeaveGamePopUp.EVENT_EXIT_QUEUE_CANCEL";


    private var _1719531403bigTopLevelHoldingGroupObjectThingy: Group;

    private var _1990131276cancelButton: DOButtonBase;

    private var _236983790confirmButton: DOButtonBase;

    private var _315970861groupDepth1: VGroup;

    private var _467213939labelMessage: Label;

    private var __moduleFactoryInitialized: Boolean = false;

    public function SectorControlLeaveQueuePopUp() {
        super();
        mx_internal::_document = this;
        this.styleName = "battleStationPopup";
        this.title = "";
        this.minHeight = 150;
        this.minWidth = 400;
        this.mxmlContentFactory = new DeferredInstanceFromFunction(this.method_5438);
        this.addEventListener("creationComplete", this.method_2791);
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

    private function handlePopUpReady(): void {
        this.confirmButton.label = class_88.getItem("sectorcontrol_lobby_window_popup_confirmation");
        this.cancelButton.label = class_88.getItem("lab_cancel");
    }

    public function set message(param1: String): void {
        this.labelMessage.text = param1;
    }

    protected function handleCancelButtonClicked(param1: MouseEvent): void {
        dispatchEvent(new Event(SectorControlLeaveQueuePopUp.EVENT_EXIT_QUEUE_CANCEL));
    }

    protected function handleConfirmButtonClick(param1: MouseEvent): void {
        dispatchEvent(new Event(SectorControlLeaveQueuePopUp.EVENT_EXIT_QUEUE_CONFIRMATION));
    }

    private function method_5438(): Array {
        return [this.method_3243()];
    }

    private function method_3243(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 85;
        _loc1_.mxmlContent = [this.method_1461(), this.method_5429()];
        _loc1_.id = "bigTopLevelHoldingGroupObjectThingy";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.bigTopLevelHoldingGroupObjectThingy = _loc1_;
        BindingManager.executeBindings(this, "bigTopLevelHoldingGroupObjectThingy", this.bigTopLevelHoldingGroupObjectThingy);
        return _loc1_;
    }

    private function method_1461(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.horizontalAlign = "center";
        _loc1_.verticalCenter = 0;
        _loc1_.mxmlContent = [this.method_2986()];
        _loc1_.id = "groupDepth1";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.groupDepth1 = _loc1_;
        BindingManager.executeBindings(this, "groupDepth1", this.groupDepth1);
        return _loc1_;
    }

    private function method_2986(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "";
        _loc1_.percentWidth = 95;
        _loc1_.height = 100;
        _loc1_.setStyle("textAlign", "center");
        _loc1_.setStyle("fontSize", 15);
        _loc1_.setStyle("fontFamily", "EurostileT");
        _loc1_.setStyle("color", 16777215);
        _loc1_.id = "labelMessage";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.labelMessage = _loc1_;
        BindingManager.executeBindings(this, "labelMessage", this.labelMessage);
        return _loc1_;
    }

    private function method_5429(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.bottom = 4;
        _loc1_.percentWidth = 100;
        _loc1_.height = 28;
        _loc1_.horizontalAlign = "center";
        _loc1_.horizontalCenter = 0;
        _loc1_.mxmlContent = [this.method_3180(), this.method_3273()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_3180(): DOButtonBase {
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

    private function method_3273(): DOButtonBase {
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

    public function method_2791(param1: FlexEvent): void {
        this.handlePopUpReady();
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
    public function get labelMessage(): Label {
        return this._467213939labelMessage;
    }

    public function set labelMessage(param1: Label): void {
        var _loc2_: Object = this._467213939labelMessage;
        if (_loc2_ !== param1) {
            this._467213939labelMessage = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelMessage", _loc2_, param1));
            }
        }
    }
}
}
