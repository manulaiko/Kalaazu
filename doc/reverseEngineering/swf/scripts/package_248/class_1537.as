package package_248 {

import mx.binding.BindingManager;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.events.PropertyChangeEvent;
import mx.states.State;

import spark.components.DataGroup;
import spark.components.HGroup;
import spark.layouts.TileLayout;
import spark.skins.SparkSkin;

public class class_1537 extends SparkSkin implements IStateClient2 {


    private var _385593099dataGroup: DataGroup;

    private var __moduleFactoryInitialized: Boolean = false;

    public function class_1537() {
        super();
        mx_internal::_document = this;
        this.mxmlContent = [this.method_5679()];
        this.currentState = "normal";
        states = [new State({
            "name": "normal",
            "overrides": []
        }), new State({
            "name": "disabled",
            "overrides": []
        })];
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

    private function method_5679(): HGroup {
        var _loc1_: HGroup = new HGroup();
        _loc1_.verticalAlign = "middle";
        _loc1_.horizontalAlign = "center";
        _loc1_.percentWidth = 100;
        _loc1_.mxmlContent = [this.method_2847()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function method_2847(): DataGroup {
        var _loc1_: DataGroup = new DataGroup();
        _loc1_.focusEnabled = false;
        _loc1_.layout = this.method_754();
        _loc1_.id = "dataGroup";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.dataGroup = _loc1_;
        BindingManager.executeBindings(this, "dataGroup", this.dataGroup);
        return _loc1_;
    }

    private function method_754(): TileLayout {
        var _loc1_: TileLayout = new TileLayout();
        _loc1_.useVirtualLayout = false;
        _loc1_.requestedColumnCount = 6;
        _loc1_.verticalGap = 2;
        _loc1_.horizontalGap = 2;
        _loc1_.orientation = "rows";
        _loc1_.clipAndEnableScrolling = true;
        return _loc1_;
    }

    [Bindable(event="propertyChange")]
    public function get dataGroup(): DataGroup {
        return this._385593099dataGroup;
    }

    public function set dataGroup(param1: DataGroup): void {
        var _loc2_: Object = this._385593099dataGroup;
        if (_loc2_ !== param1) {
            this._385593099dataGroup = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dataGroup", _loc2_, param1));
            }
        }
    }
}
}
