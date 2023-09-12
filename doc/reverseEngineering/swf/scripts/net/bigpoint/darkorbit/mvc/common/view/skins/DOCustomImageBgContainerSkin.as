package net.bigpoint.darkorbit.mvc.common.view.skins {

import mx.binding.BindingManager;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.events.PropertyChangeEvent;
import mx.states.SetProperty;
import mx.states.State;

import package_9.ResourceManager;

import spark.components.Group;
import spark.components.SkinnableContainer;
import spark.components.supportClasses.Skin;
import spark.layouts.BasicLayout;
import spark.primitives.BitmapImage;

public class DOCustomImageBgContainerSkin extends Skin implements IStateClient2 {


    private var _199389162bgImage: BitmapImage;

    private var _809612678contentGroup: Group;

    private var __moduleFactoryInitialized: Boolean = false;

    private var _213507019hostComponent: SkinnableContainer;

    public function DOCustomImageBgContainerSkin() {
        super();
        mx_internal::_document = this;
        this.mxmlContent = [this._DOCustomImageBgContainerSkin_Group1_c(), this._DOCustomImageBgContainerSkin_Group2_i()];
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
        this.bgImage.source = ResourceManager.getBitmapData(getStyle("libID"), getStyle("backgroundBitmap"));
        super.updateDisplayList(param1, param2);
    }

    private function _DOCustomImageBgContainerSkin_Group1_c(): Group {
        var _loc1_: Group = new Group();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.mxmlContent = [this._DOCustomImageBgContainerSkin_BitmapImage1_i()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function _DOCustomImageBgContainerSkin_BitmapImage1_i(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.percentWidth = 100;
        _loc1_.percentHeight = 100;
        _loc1_.initialized(this, "bgImage");
        this.bgImage = _loc1_;
        BindingManager.executeBindings(this, "bgImage", this.bgImage);
        return _loc1_;
    }

    private function _DOCustomImageBgContainerSkin_Group2_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.minWidth = 0;
        _loc1_.minHeight = 0;
        _loc1_.layout = this._DOCustomImageBgContainerSkin_BasicLayout1_c();
        _loc1_.id = "contentGroup";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.contentGroup = _loc1_;
        BindingManager.executeBindings(this, "contentGroup", this.contentGroup);
        return _loc1_;
    }

    private function _DOCustomImageBgContainerSkin_BasicLayout1_c(): BasicLayout {
        return new BasicLayout();
    }

    [Bindable(event="propertyChange")]
    public function get bgImage(): BitmapImage {
        return this._199389162bgImage;
    }

    public function set bgImage(param1: BitmapImage): void {
        var _loc2_: Object = this._199389162bgImage;
        if (_loc2_ !== param1) {
            this._199389162bgImage = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgImage", _loc2_, param1));
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
