package spark.skins.spark {

import mx.binding.BindingManager;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.events.PropertyChangeEvent;
import mx.graphics.SolidColor;
import mx.states.SetProperty;
import mx.states.State;

import spark.components.Group;
import spark.components.SkinnableContainer;
import spark.components.supportClasses.Skin;
import spark.layouts.BasicLayout;
import spark.primitives.Rect;

public class SkinnableContainerSkin extends Skin implements IStateClient2 {


    private var _1332194002background: Rect;

    private var _1391998104bgFill: SolidColor;

    private var _809612678contentGroup: Group;

    private var __moduleFactoryInitialized: Boolean = false;

    private var _213507019hostComponent: SkinnableContainer;

    public function SkinnableContainerSkin() {
        super();
        mx_internal::_document = this;
        this.mxmlContent = [this._SkinnableContainerSkin_Rect1_i(), this._SkinnableContainerSkin_Group1_i()];
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
        if (isNaN(getStyle("backgroundColor"))) {
            this.background.visible = false;
        } else {
            this.background.visible = true;
            this.bgFill.color = getStyle("backgroundColor");
            this.bgFill.alpha = getStyle("backgroundAlpha");
        }
        super.updateDisplayList(param1, param2);
    }

    private function _SkinnableContainerSkin_Rect1_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.fill = this._SkinnableContainerSkin_SolidColor1_i();
        _loc1_.initialized(this, "background");
        this.background = _loc1_;
        BindingManager.executeBindings(this, "background", this.background);
        return _loc1_;
    }

    private function _SkinnableContainerSkin_SolidColor1_i(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 16777215;
        this.bgFill = _loc1_;
        BindingManager.executeBindings(this, "bgFill", this.bgFill);
        return _loc1_;
    }

    private function _SkinnableContainerSkin_Group1_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.minWidth = 0;
        _loc1_.minHeight = 0;
        _loc1_.layout = this._SkinnableContainerSkin_BasicLayout1_c();
        _loc1_.id = "contentGroup";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.contentGroup = _loc1_;
        BindingManager.executeBindings(this, "contentGroup", this.contentGroup);
        return _loc1_;
    }

    private function _SkinnableContainerSkin_BasicLayout1_c(): BasicLayout {
        return new BasicLayout();
    }

    [Bindable(event="propertyChange")]
    public function get background(): Rect {
        return this._1332194002background;
    }

    public function set background(param1: Rect): void {
        var _loc2_: Object = this._1332194002background;
        if (_loc2_ !== param1) {
            this._1332194002background = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "background", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get bgFill(): SolidColor {
        return this._1391998104bgFill;
    }

    public function set bgFill(param1: SolidColor): void {
        var _loc2_: Object = this._1391998104bgFill;
        if (_loc2_ !== param1) {
            this._1391998104bgFill = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgFill", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get contentGroup(): Group {
        return this._809612678contentGroup;
    }

    public function set contentGroup(param1: Group): void {
        var _loc2_: Object = this._809612678contentGroup;
        if (_loc2_ !== param1) {
            this._809612678contentGroup = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "contentGroup", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get hostComponent(): SkinnableContainer {
        return this._213507019hostComponent;
    }

    public function set hostComponent(param1: SkinnableContainer): void {
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
