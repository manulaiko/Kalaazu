package package_3 {

import flash.events.Event;

import mx.binding.BindingManager;
import mx.core.IFlexModuleFactory;
import mx.core.IToolTip;
import mx.events.FlexEvent;
import mx.events.PropertyChangeEvent;

import package_151.class_989;

import package_8.VectorCollection;

import spark.components.Group;

public class class_1514 extends Group implements IToolTip {


    private var var_1228: class_1902;

    private var __moduleFactoryInitialized: Boolean = false;

    private var _rewards: class_989;

    public function class_1514() {
        super();
        mx_internal::_document = this;
        this.width = 320;
        this.mxmlContent = [this.method_6356()];
        this.addEventListener("creationComplete", this.method_2592);
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

    public function set rewards(param1: class_989): void {
        this._rewards = param1;
        this.rewardGrid.dataProvider = new VectorCollection(this._rewards.method_4087);
    }

    public function set dataProvider(param1: VectorCollection): void {
        this.rewardGrid.dataProvider = param1;
    }

    public function get text(): String {
        return "";
    }

    public function set text(param1: String): void {
    }

    protected function handleCreationComplete(param1: Event): void {
        this.rewardGrid.setTitle(this._rewards.title);
        this.rewardGrid.method_4749(this._rewards.message);
    }

    private function method_6356(): class_1902 {
        var _loc1_: class_1902 = new class_1902();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.id = "rewardGrid";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.rewardGrid = _loc1_;
        BindingManager.executeBindings(this, "rewardGrid", this.rewardGrid);
        return _loc1_;
    }

    public function method_2592(param1: FlexEvent): void {
        this.handleCreationComplete(param1);
    }

    [Bindable(event="propertyChange")]
    public function get rewardGrid(): class_1902 {
        return this.var_1228;
    }

    public function set rewardGrid(param1: class_1902): void {
        var _loc2_: Object = this.var_1228;
        if (_loc2_ !== param1) {
            this.var_1228 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rewardGrid", _loc2_, param1));
            }
        }
    }
}
}
