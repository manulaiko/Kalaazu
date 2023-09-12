package package_247 {

import flash.display.BitmapData;

import mx.binding.BindingManager;
import mx.core.IFlexModuleFactory;
import mx.events.PropertyChangeEvent;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.mvc.sectorControlWindow.view.class_265;

import package_11.class_38;

import package_158.class_1008;

import package_9.ResourceManager;

import spark.components.VGroup;
import spark.primitives.BitmapImage;

public class class_1525 extends class_1521 {


    private var var_4073: BitmapImage;

    private var var_3596: VGroup;

    private var __moduleFactoryInitialized: Boolean = false;

    protected var var_4248: BitmapData;

    protected var var_1371: BitmapData;

    protected var var_4630: BitmapData;

    public function class_1525() {
        super();
        mx_internal::_document = this;
        this.mxmlContent = [this.method_3264()];
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

    override protected function createChildren(): void {
        super.createChildren();
        var _loc1_: class_38 = ResourceManager.name_15.getFinisher(class_265.name_129);
        if (_loc1_) {
            this._notStartedStateBitmapData = ResourceManager.getBitmapData(class_265.name_129, "iconMatchState_notstarted");
            this._queueStateBitmapData = ResourceManager.getBitmapData(class_265.name_129, "iconMatchState_queue");
            this._runningStateBitmapData = ResourceManager.getBitmapData(class_265.name_129, "iconMatchState_running");
        }
        columnLabelContainer.horizontalCenter = "-15";
    }

    override public function set data(param1: Object): void {
        super.data = param1;
        if (param1 == null) {
            return;
        }
        var _loc2_: class_1008 = param1 as class_1008;
        rowLabel.htmlText = "<font size=\'12\' color=\'#undefined\'>" + _loc2_.matchID.toString() + "." + "</font>";
        switch (_loc2_.var_572) {
            case class_1008.const_2746:
                this.imageState.source = this._runningStateBitmapData;
                this.imageStateContainer.toolTip = class_88.getItem("ttip_sectorcontrol_lobbywindow_column_icon_running");
                break;
            case class_1008.const_2158:
                this.imageState.source = this._notStartedStateBitmapData;
                this.imageStateContainer.toolTip = class_88.getItem("ttip_sectorcontrol_lobbywindow_column_icon_notstarted");
                break;
            case class_1008.QUEUED:
                this.imageState.source = this._queueStateBitmapData;
                this.imageStateContainer.toolTip = class_88.getItem("ttip_sectorcontrol_lobbywindow_column_icon_queued");
        }
        this.imageState.verticalCenter = 0;
    }

    private function method_3264(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.horizontalCenter = 10;
        _loc1_.horizontalAlign = "center";
        _loc1_.verticalCenter = -1;
        _loc1_.verticalAlign = "middle";
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this.method_150()];
        _loc1_.id = "imageStateContainer";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.imageStateContainer = _loc1_;
        BindingManager.executeBindings(this, "imageStateContainer", this.imageStateContainer);
        return _loc1_;
    }

    private function method_150(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.initialized(this, "imageState");
        this.imageState = _loc1_;
        BindingManager.executeBindings(this, "imageState", this.imageState);
        return _loc1_;
    }

    [Bindable(event="propertyChange")]
    public function get imageState(): BitmapImage {
        return this.var_4073;
    }

    public function set imageState(param1: BitmapImage): void {
        var _loc2_: Object = this.var_4073;
        if (_loc2_ !== param1) {
            this.var_4073 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imageState", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get imageStateContainer(): VGroup {
        return this.var_3596;
    }

    public function set imageStateContainer(param1: VGroup): void {
        var _loc2_: Object = this.var_3596;
        if (_loc2_ !== param1) {
            this.var_3596 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imageStateContainer", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    protected function get _notStartedStateBitmapData(): BitmapData {
        return this.var_4248;
    }

    protected function set _notStartedStateBitmapData(param1: BitmapData): void {
        var _loc2_: Object = this.var_4248;
        if (_loc2_ !== param1) {
            this.var_4248 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_notStartedStateBitmapData", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    protected function get _queueStateBitmapData(): BitmapData {
        return this.var_1371;
    }

    protected function set _queueStateBitmapData(param1: BitmapData): void {
        var _loc2_: Object = this.var_1371;
        if (_loc2_ !== param1) {
            this.var_1371 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_queueStateBitmapData", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    protected function get _runningStateBitmapData(): BitmapData {
        return this.var_4630;
    }

    protected function set _runningStateBitmapData(param1: BitmapData): void {
        var _loc2_: Object = this.var_4630;
        if (_loc2_ !== param1) {
            this.var_4630 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_runningStateBitmapData", _loc2_, param1));
            }
        }
    }
}
}
