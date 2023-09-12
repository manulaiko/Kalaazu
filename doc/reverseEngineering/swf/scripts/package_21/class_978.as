package package_21 {

import flash.display.BitmapData;

import mx.binding.BindingManager;
import mx.core.IFlexModuleFactory;
import mx.events.PropertyChangeEvent;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;

import package_11.class_38;

import package_38.class_787;

import package_47.class_976;

import package_9.ResourceManager;

import spark.components.VGroup;
import spark.primitives.BitmapImage;

public class class_978 extends class_977 {

    public static var var_2784: int = -100;


    private var var_933: BitmapImage;

    private var var_3596: VGroup;

    private var __moduleFactoryInitialized: Boolean = false;

    protected var _notStartedStateBitmapData: BitmapData;

    protected var _queueStateBitmapData: BitmapData;

    protected var _runningStateBitmapData: BitmapData;

    public function class_978() {
        super();
        mx_internal::_document = this;
        this.mxmlContent = [this.method_1787()];
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
        var _loc1_: String = "null";
        var _loc2_: class_38 = ResourceManager.name_15.getFinisher(_loc1_);
        if (_loc2_) {
            this._notStartedStateBitmapData = ResourceManager.getBitmapData(_loc1_, class_976.var_1450);
            this._queueStateBitmapData = ResourceManager.getBitmapData(_loc1_, class_976.var_2088);
            this._runningStateBitmapData = ResourceManager.getBitmapData(_loc1_, class_976.var_1039);
        }
        columnLabelContainer.toolTip = "";
        columnLabelContainer.horizontalCenter = -14;
    }

    override public function set data(param1: Object): void {
        super.data = param1;
        if (param1 == null) {
            return;
        }
        var _loc2_: class_787 = param1 as class_787;
        var _loc3_: String = class_126.getInstance().method_2276[_loc2_.opponent.faction];
        var _loc4_: String = "null";
        rowLabel.htmlText = "<font size=\'12\' color=\'#" + _loc4_ + "\'>" + _loc3_ + "</font>";
        if (_loc2_.name_93 == var_2784) {
            this.imageMatchState.source = this._notStartedStateBitmapData;
            columnLabelContainer.toolTip = "";
            this.imageStateContainer.toolTip = "";
        } else {
            switch (_loc2_.var_572) {
                case class_787.const_2746:
                    this.imageMatchState.source = this._runningStateBitmapData;
                    columnLabelContainer.toolTip = class_88.getItem("ttip_teamdeathmatch_lobbywindow_column_icon_running");
                    this.imageStateContainer.toolTip = class_88.getItem("ttip_teamdeathmatch_lobbywindow_column_icon_running");
                    break;
                case class_787.const_2158:
                    this.imageMatchState.source = this._queueStateBitmapData;
                    columnLabelContainer.toolTip = class_88.getItem("ttip_teamdeathmatch_lobbywindow_column_icon_not_started");
                    this.imageStateContainer.toolTip = class_88.getItem("ttip_teamdeathmatch_lobbywindow_column_icon_not_started");
            }
        }
    }

    private function method_1787(): VGroup {
        var _loc1_: VGroup = new VGroup();
        _loc1_.horizontalCenter = 12;
        _loc1_.horizontalAlign = "center";
        _loc1_.verticalCenter = -1;
        _loc1_.verticalAlign = "middle";
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this.method_4285()];
        _loc1_.id = "imageStateContainer";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.imageStateContainer = _loc1_;
        BindingManager.executeBindings(this, "imageStateContainer", this.imageStateContainer);
        return _loc1_;
    }

    private function method_4285(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.horizontalAlign = "center";
        _loc1_.initialized(this, "imageMatchState");
        this.imageMatchState = _loc1_;
        BindingManager.executeBindings(this, "imageMatchState", this.imageMatchState);
        return _loc1_;
    }

    [Bindable(event="propertyChange")]
    public function get imageMatchState(): BitmapImage {
        return this.var_933;
    }

    public function set imageMatchState(param1: BitmapImage): void {
        var _loc2_: Object = this.var_933;
        if (_loc2_ !== param1) {
            this.var_933 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imageMatchState", _loc2_, param1));
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
}
}
