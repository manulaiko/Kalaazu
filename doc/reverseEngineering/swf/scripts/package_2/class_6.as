package package_2 {

import flash.display.BitmapData;
import flash.geom.Point;
import flash.geom.Rectangle;

import mx.binding.BindingManager;
import mx.core.IFlexModuleFactory;
import mx.events.PropertyChangeEvent;

import net.bigpoint.as3toolbox.guicomponents.components.Scale9GridImage;

import spark.components.supportClasses.Skin;
import spark.primitives.BitmapImage;

public class class_6 extends Skin {


    private var var_2595: BitmapImage;

    private var var_375: BitmapImage;

    private var var_3520: BitmapImage;

    private var var_4993: BitmapImage;

    private var var_4936: BitmapImage;

    private var var_4545: BitmapImage;

    private var var_2563: BitmapImage;

    private var var_3996: BitmapImage;

    private var var_3761: BitmapImage;

    private var __moduleFactoryInitialized: Boolean = false;

    private var _213507019hostComponent: Scale9GridImage;

    public function class_6() {
        super();
        mx_internal::_document = this;
        this.mxmlContent = [this.method_2627(), this.method_4192(), this.method_1008(), this.method_1043(), this.method_1186(), this.method_3663(), this.method_6133(), this.method_100(), this.method_4071()];
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
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: Number = NaN;
        var _loc10_: Number = NaN;
        var _loc11_: Number = NaN;
        var _loc12_: Number = NaN;
        super.updateDisplayList(param1, unscaledHeight);
        var _loc3_: Rectangle = this.hostComponent.scale9Grid;
        var _loc4_: BitmapData;
        if ((_loc4_ = this.hostComponent.source) != null && Boolean(this.hostComponent.method_1116)) {
            this.hostComponent.method_1116 = false;
            if (_loc3_ != null) {
                _loc5_ = _loc3_.x;
                _loc6_ = (_loc7_ = _loc3_.width) + _loc5_;
                _loc8_ = _loc4_.width - _loc6_;
                _loc9_ = _loc3_.y;
                _loc10_ = (_loc11_ = _loc3_.height) + _loc9_;
                _loc12_ = _loc4_.height - _loc10_;
            } else {
                _loc5_ = 0;
                _loc6_ = _loc7_ = _loc4_.width;
                _loc8_ = 0;
                _loc9_ = 0;
                _loc10_ = _loc11_ = _loc4_.height;
                _loc12_ = 0;
            }
            this.upperLeftImage.visible = this.upperCenterImage.visible = this.upperRightImage.visible = this.middleLeftImage.visible = this.middleCenterImage.visible = this.middleRightImage.visible = this.lowerLeftImage.visible = this.lowerCenterImage.visible = this.lowerRightImage.visible = false;
            if (_loc9_ > 0) {
                if (_loc5_ > 0) {
                    this.method_898(this.upperLeftImage, _loc4_, 0, 0, _loc5_, _loc9_);
                }
                if (_loc7_ > 0) {
                    this.method_898(this.upperCenterImage, _loc4_, _loc5_, 0, _loc7_, _loc9_);
                    this.upperCenterImage.left = _loc5_;
                    this.upperCenterImage.right = _loc4_.width - _loc6_;
                }
                if (_loc8_ > 0) {
                    this.method_898(this.upperRightImage, _loc4_, _loc6_, 0, _loc8_, _loc9_);
                }
            }
            if (_loc11_ > 0) {
                if (_loc5_ > 0) {
                    this.method_898(this.middleLeftImage, _loc4_, 0, _loc9_, _loc5_, _loc11_);
                    this.middleLeftImage.top = _loc9_;
                    this.middleLeftImage.bottom = _loc4_.height - _loc10_;
                }
                if (_loc7_ > 0) {
                    this.method_898(this.middleCenterImage, _loc4_, _loc5_, _loc9_, _loc7_, _loc11_);
                    this.middleCenterImage.left = _loc5_;
                    this.middleCenterImage.right = _loc4_.width - _loc6_;
                    this.middleCenterImage.top = _loc9_;
                    this.middleCenterImage.bottom = _loc4_.height - _loc10_;
                }
                if (_loc8_ > 0) {
                    this.method_898(this.middleRightImage, _loc4_, _loc6_, _loc9_, _loc8_, _loc11_);
                    this.middleRightImage.top = _loc9_;
                    this.middleRightImage.bottom = _loc4_.height - _loc10_;
                }
            }
            if (_loc12_ > 0) {
                if (_loc5_ > 0) {
                    this.method_898(this.lowerLeftImage, _loc4_, 0, _loc10_, _loc5_, _loc12_);
                }
                if (_loc7_ > 0) {
                    this.method_898(this.lowerCenterImage, _loc4_, _loc5_, _loc10_, _loc7_, _loc12_);
                    this.lowerCenterImage.left = _loc5_;
                    this.lowerCenterImage.right = _loc4_.width - _loc6_;
                }
                if (_loc8_ > 0) {
                    this.method_898(this.lowerRightImage, _loc4_, _loc6_, _loc10_, _loc8_, _loc12_);
                }
            }
        }
    }

    private function method_898(param1: BitmapImage, param2: BitmapData, param3: Number, param4: Number, param5: Number, param6: Number): void {
        var _loc7_: Number = param3;
        var _loc8_: Number = param4;
        var _loc9_: Number = param5;
        var _loc10_: Number = param6;
        _loc7_ = (_loc7_ = _loc7_ < 0 ? 0 : _loc7_) >= param2.width ? param2.width - 1 : _loc7_;
        _loc8_ = (_loc8_ = _loc8_ < 0 ? 0 : _loc8_) >= param2.height ? param2.height - 1 : _loc8_;
        _loc9_ = _loc9_ + _loc7_ > param2.width ? param2.width - _loc7_ : _loc9_;
        _loc10_ = _loc10_ + _loc8_ > param2.height ? param2.height - _loc8_ : _loc10_;
        var _loc11_: BitmapData;
        (_loc11_ = new BitmapData(_loc9_, _loc10_, true)).copyPixels(param2, new Rectangle(_loc7_, _loc8_, _loc9_, _loc10_), new Point(0, 0));
        param1.source = _loc11_;
        param1.visible = true;
    }

    private function method_2627(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.top = 0;
        _loc1_.left = 0;
        _loc1_.initialized(this, "upperLeftImage");
        this.upperLeftImage = _loc1_;
        BindingManager.executeBindings(this, "upperLeftImage", this.upperLeftImage);
        return _loc1_;
    }

    private function method_4192(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.top = 0;
        _loc1_.initialized(this, "upperCenterImage");
        this.upperCenterImage = _loc1_;
        BindingManager.executeBindings(this, "upperCenterImage", this.upperCenterImage);
        return _loc1_;
    }

    private function method_1008(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.top = 0;
        _loc1_.right = 0;
        _loc1_.initialized(this, "upperRightImage");
        this.upperRightImage = _loc1_;
        BindingManager.executeBindings(this, "upperRightImage", this.upperRightImage);
        return _loc1_;
    }

    private function method_1043(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.left = 0;
        _loc1_.initialized(this, "middleLeftImage");
        this.middleLeftImage = _loc1_;
        BindingManager.executeBindings(this, "middleLeftImage", this.middleLeftImage);
        return _loc1_;
    }

    private function method_1186(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.initialized(this, "middleCenterImage");
        this.middleCenterImage = _loc1_;
        BindingManager.executeBindings(this, "middleCenterImage", this.middleCenterImage);
        return _loc1_;
    }

    private function method_3663(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.right = 0;
        _loc1_.initialized(this, "middleRightImage");
        this.middleRightImage = _loc1_;
        BindingManager.executeBindings(this, "middleRightImage", this.middleRightImage);
        return _loc1_;
    }

    private function method_6133(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.bottom = 0;
        _loc1_.left = 0;
        _loc1_.initialized(this, "lowerLeftImage");
        this.lowerLeftImage = _loc1_;
        BindingManager.executeBindings(this, "lowerLeftImage", this.lowerLeftImage);
        return _loc1_;
    }

    private function method_100(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.bottom = 0;
        _loc1_.initialized(this, "lowerCenterImage");
        this.lowerCenterImage = _loc1_;
        BindingManager.executeBindings(this, "lowerCenterImage", this.lowerCenterImage);
        return _loc1_;
    }

    private function method_4071(): BitmapImage {
        var _loc1_: BitmapImage = new BitmapImage();
        _loc1_.bottom = 0;
        _loc1_.right = 0;
        _loc1_.initialized(this, "lowerRightImage");
        this.lowerRightImage = _loc1_;
        BindingManager.executeBindings(this, "lowerRightImage", this.lowerRightImage);
        return _loc1_;
    }

    [Bindable(event="propertyChange")]
    public function get lowerCenterImage(): BitmapImage {
        return this.var_2595;
    }

    public function set lowerCenterImage(param1: BitmapImage): void {
        var _loc2_: Object = this.var_2595;
        if (_loc2_ !== param1) {
            this.var_2595 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lowerCenterImage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get lowerLeftImage(): BitmapImage {
        return this.var_375;
    }

    public function set lowerLeftImage(param1: BitmapImage): void {
        var _loc2_: Object = this.var_375;
        if (_loc2_ !== param1) {
            this.var_375 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lowerLeftImage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get lowerRightImage(): BitmapImage {
        return this.var_3520;
    }

    public function set lowerRightImage(param1: BitmapImage): void {
        var _loc2_: Object = this.var_3520;
        if (_loc2_ !== param1) {
            this.var_3520 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lowerRightImage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get middleCenterImage(): BitmapImage {
        return this.var_4993;
    }

    public function set middleCenterImage(param1: BitmapImage): void {
        var _loc2_: Object = this.var_4993;
        if (_loc2_ !== param1) {
            this.var_4993 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "middleCenterImage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get middleLeftImage(): BitmapImage {
        return this.var_4936;
    }

    public function set middleLeftImage(param1: BitmapImage): void {
        var _loc2_: Object = this.var_4936;
        if (_loc2_ !== param1) {
            this.var_4936 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "middleLeftImage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get middleRightImage(): BitmapImage {
        return this.var_4545;
    }

    public function set middleRightImage(param1: BitmapImage): void {
        var _loc2_: Object = this.var_4545;
        if (_loc2_ !== param1) {
            this.var_4545 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "middleRightImage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get upperCenterImage(): BitmapImage {
        return this.var_2563;
    }

    public function set upperCenterImage(param1: BitmapImage): void {
        var _loc2_: Object = this.var_2563;
        if (_loc2_ !== param1) {
            this.var_2563 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upperCenterImage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get upperLeftImage(): BitmapImage {
        return this.var_3996;
    }

    public function set upperLeftImage(param1: BitmapImage): void {
        var _loc2_: Object = this.var_3996;
        if (_loc2_ !== param1) {
            this.var_3996 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upperLeftImage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get upperRightImage(): BitmapImage {
        return this.var_3761;
    }

    public function set upperRightImage(param1: BitmapImage): void {
        var _loc2_: Object = this.var_3761;
        if (_loc2_ !== param1) {
            this.var_3761 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upperRightImage", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get hostComponent(): Scale9GridImage {
        return this._213507019hostComponent;
    }

    public function set hostComponent(param1: Scale9GridImage): void {
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
