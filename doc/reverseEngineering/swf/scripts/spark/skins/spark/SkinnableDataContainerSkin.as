package spark.skins.spark {

import mx.binding.BindingManager;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.events.PropertyChangeEvent;
import mx.states.State;

import spark.components.DataGroup;
import spark.components.SkinnableDataContainer;
import spark.components.supportClasses.Skin;
import spark.layouts.VerticalLayout;

public class SkinnableDataContainerSkin extends Skin implements IStateClient2 {


    private var _385593099dataGroup: DataGroup;

    private var __moduleFactoryInitialized: Boolean = false;

    private var _213507019hostComponent: SkinnableDataContainer;

    public function SkinnableDataContainerSkin() {
        super();
        mx_internal::_document = this;
        this.mxmlContent = [this._SkinnableDataContainerSkin_DataGroup1_i()];
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

    private function _SkinnableDataContainerSkin_DataGroup1_i(): DataGroup {
        var _loc1_: DataGroup = new DataGroup();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.minWidth = 0;
        _loc1_.minHeight = 0;
        _loc1_.layout = this._SkinnableDataContainerSkin_VerticalLayout1_c();
        _loc1_.id = "dataGroup";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.dataGroup = _loc1_;
        BindingManager.executeBindings(this, "dataGroup", this.dataGroup);
        return _loc1_;
    }

    private function _SkinnableDataContainerSkin_VerticalLayout1_c(): VerticalLayout {
        var _loc1_: VerticalLayout = new VerticalLayout();
        _loc1_.horizontalAlign = "contentJustify";
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
    public function get hostComponent(): SkinnableDataContainer {
        return this._213507019hostComponent;
    }

    public function set hostComponent(param1: SkinnableDataContainer): void {
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
