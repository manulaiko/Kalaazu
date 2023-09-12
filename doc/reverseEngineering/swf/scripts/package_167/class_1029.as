package package_167 {

import mx.binding.BindingManager;
import mx.core.ClassFactory;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.events.PropertyChangeEvent;
import mx.states.State;

import spark.components.DataGroup;
import spark.components.TabBar;
import spark.components.supportClasses.ButtonBarHorizontalLayout;
import spark.skins.SparkSkin;

public class class_1029 extends SparkSkin implements IStateClient2 {


    private var _385593099dataGroup: DataGroup;

    private var __moduleFactoryInitialized: Boolean = false;

    private var _213507019hostComponent: TabBar;

    public function class_1029() {
        super();
        mx_internal::_document = this;
        this.mxmlContent = [this.method_1469()];
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

    private function method_1469(): DataGroup {
        var _loc1_: DataGroup = new DataGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.layout = this.method_2503();
        _loc1_.itemRenderer = this.method_2337();
        _loc1_.id = "dataGroup";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.dataGroup = _loc1_;
        BindingManager.executeBindings(this, "dataGroup", this.dataGroup);
        return _loc1_;
    }

    private function method_2503(): ButtonBarHorizontalLayout {
        var _loc1_: ButtonBarHorizontalLayout = new ButtonBarHorizontalLayout();
        _loc1_.gap = 5;
        return _loc1_;
    }

    private function method_2337(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = class_1543;
        _loc1_.properties = {"outerDocument": this};
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

    [Bindable(event="propertyChange")]
    public function get hostComponent(): TabBar {
        return this._213507019hostComponent;
    }

    public function set hostComponent(param1: TabBar): void {
        var _loc2_: Object = this._213507019hostComponent;
        if (_loc2_ !== param1) {
            this._213507019hostComponent = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hostComponent", _loc2_, param1));
            }
        }
    }
}
}
