package package_2 {

import mx.binding.BindingManager;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.events.PropertyChangeEvent;
import mx.states.AddItems;
import mx.states.State;

import net.bigpoint.as3toolbox.guicomponents.components.Scale9GridImage;
import net.bigpoint.as3toolbox.guicomponents.components.Scale9GridImageButton;

import spark.components.supportClasses.Skin;

public class class_1 extends Skin implements IStateClient2 {


    private var var_349: Scale9GridImage;

    private var var_2002: Scale9GridImage;

    private var var_1313: Scale9GridImage;

    private var var_3587: Scale9GridImage;

    private var __moduleFactoryInitialized: Boolean = false;

    private var _213507019hostComponent: Scale9GridImageButton;

    public function class_1() {
        super();
        mx_internal::_document = this;
        this.mxmlContent = [];
        this.currentState = "disabled";
        var _loc1_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this.method_1500);
        var _loc2_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this.method_1866);
        var _loc3_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this.method_2645);
        var _loc4_: DeferredInstanceFromFunction = new DeferredInstanceFromFunction(this.method_880);
        states = [new State({
            "name": "disabled",
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc4_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "first"
            })]
        }), new State({
            "name": "down",
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc2_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "first"
            })]
        }), new State({
            "name": "over",
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc3_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "first"
            })]
        }), new State({
            "name": "up",
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _loc1_,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "first"
            })]
        })];
        _loc1_.getInstance();
        _loc2_.getInstance();
        _loc3_.getInstance();
        _loc4_.getInstance();
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

    private function method_1500(): Scale9GridImage {
        var _loc1_: Scale9GridImage = new Scale9GridImage();
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.id = "upImageSkinPart";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.upImageSkinPart = _loc1_;
        BindingManager.executeBindings(this, "upImageSkinPart", this.upImageSkinPart);
        return _loc1_;
    }

    private function method_1866(): Scale9GridImage {
        var _loc1_: Scale9GridImage = new Scale9GridImage();
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.id = "downImageSkinPart";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.downImageSkinPart = _loc1_;
        BindingManager.executeBindings(this, "downImageSkinPart", this.downImageSkinPart);
        return _loc1_;
    }

    private function method_2645(): Scale9GridImage {
        var _loc1_: Scale9GridImage = new Scale9GridImage();
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.id = "overImageSkinPart";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.overImageSkinPart = _loc1_;
        BindingManager.executeBindings(this, "overImageSkinPart", this.overImageSkinPart);
        return _loc1_;
    }

    private function method_880(): Scale9GridImage {
        var _loc1_: Scale9GridImage = new Scale9GridImage();
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.id = "disabledImageSkinPart";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.disabledImageSkinPart = _loc1_;
        BindingManager.executeBindings(this, "disabledImageSkinPart", this.disabledImageSkinPart);
        return _loc1_;
    }

    [Bindable(event="propertyChange")]
    public function get disabledImageSkinPart(): Scale9GridImage {
        return this.var_349;
    }

    public function set disabledImageSkinPart(param1: Scale9GridImage): void {
        var _loc2_: Object = this.var_349;
        if (_loc2_ !== param1) {
            this.var_349 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "disabledImageSkinPart", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get downImageSkinPart(): Scale9GridImage {
        return this.var_2002;
    }

    public function set downImageSkinPart(param1: Scale9GridImage): void {
        var _loc2_: Object = this.var_2002;
        if (_loc2_ !== param1) {
            this.var_2002 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "downImageSkinPart", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get overImageSkinPart(): Scale9GridImage {
        return this.var_1313;
    }

    public function set overImageSkinPart(param1: Scale9GridImage): void {
        var _loc2_: Object = this.var_1313;
        if (_loc2_ !== param1) {
            this.var_1313 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "overImageSkinPart", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get upImageSkinPart(): Scale9GridImage {
        return this.var_3587;
    }

    public function set upImageSkinPart(param1: Scale9GridImage): void {
        var _loc2_: Object = this.var_3587;
        if (_loc2_ !== param1) {
            this.var_3587 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upImageSkinPart", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get hostComponent(): Scale9GridImageButton {
        return this._213507019hostComponent;
    }

    public function set hostComponent(param1: Scale9GridImageButton): void {
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
