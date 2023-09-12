package spark.skins.spark {

import mx.binding.BindingManager;
import mx.core.ClassFactory;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.core.UIComponent;
import mx.events.PropertyChangeEvent;
import mx.states.SetProperty;
import mx.states.State;

import spark.components.DataGroup;
import spark.components.TabBar;
import spark.components.supportClasses.ButtonBarHorizontalLayout;
import spark.components.supportClasses.Skin;

public class TabBarSkin extends Skin implements IStateClient2 {


    private var _385593099dataGroup: DataGroup;

    private var __moduleFactoryInitialized: Boolean = false;

    private var _213507019hostComponent: TabBar;

    public function TabBarSkin() {
        super();
        mx_internal::_document = this;
        this.mxmlContent = [this._TabBarSkin_DataGroup1_i()];
        this.currentState = "normal";
        states = [new State({
            "name": "normal",
            "overrides": []
        }), new State({
            "name": "disabled",
            "overrides": [new SetProperty().initializeFromObject({
                "name": "alpha",
                "value": 0.5
            })]
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

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        var _loc6_: * = null;
        var _loc3_: int = this.dataGroup.numElements;
        var _loc4_: int = this.hostComponent.getStyle("cornerRadius");
        var _loc5_: int = 0;
        while (_loc5_ < _loc3_) {
            if (_loc6_ = this.dataGroup.getElementAt(_loc5_) as UIComponent) {
                _loc6_.setStyle("cornerRadius", _loc4_);
            }
            _loc5_++;
        }
        super.updateDisplayList(param1, unscaledHeight);
    }

    private function _TabBarSkin_DataGroup1_i(): DataGroup {
        var _loc1_: DataGroup = new DataGroup();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.layout = this._TabBarSkin_ButtonBarHorizontalLayout1_c();
        _loc1_.itemRenderer = this._TabBarSkin_ClassFactory1_c();
        _loc1_.id = "dataGroup";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.dataGroup = _loc1_;
        BindingManager.executeBindings(this, "dataGroup", this.dataGroup);
        return _loc1_;
    }

    private function _TabBarSkin_ButtonBarHorizontalLayout1_c(): ButtonBarHorizontalLayout {
        var _loc1_: ButtonBarHorizontalLayout = new ButtonBarHorizontalLayout();
        _loc1_.gap = -1;
        return _loc1_;
    }

    private function _TabBarSkin_ClassFactory1_c(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = TabBarSkinInnerClass0;
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
