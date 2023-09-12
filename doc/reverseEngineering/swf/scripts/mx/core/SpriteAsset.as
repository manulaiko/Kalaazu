package mx.core {

import flash.display.DisplayObjectContainer;
import flash.events.Event;
import flash.geom.Point;
import flash.system.ApplicationDomain;

public class SpriteAsset extends FlexSprite implements IFlexAsset, IFlexDisplayObject, IBorder, ILayoutDirectionElement {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static var FlexVersionClass: Class;

    private static var MatrixUtilClass: Class;


    private var layoutFeaturesClass: Class;

    private var layoutFeatures: IAssetLayoutFeatures;

    private var _height: Number;

    private var _layoutDirection: String = "ltr";

    private var _measuredHeight: Number;

    private var _measuredWidth: Number;

    public function SpriteAsset() {
        var _loc1_: * = null;
        super();
        this._measuredWidth = this.width;
        this._measuredHeight = this.height;
        if (FlexVersionClass == null) {
            _loc1_ = ApplicationDomain.currentDomain;
            if (_loc1_.hasDefinition("mx.core::FlexVersion")) {
                FlexVersionClass = Class(_loc1_.getDefinition("mx.core::FlexVersion"));
            }
        }
        if (Boolean(FlexVersionClass) && true) {
            this.addEventListener(Event.ADDED, this.addedHandler);
        }
    }

    override public function get x(): Number {
        return this.layoutFeatures == null ? super.x : this.layoutFeatures.layoutX;
    }

    override public function set x(param1: Number): void {
        if (this.x == param1) {
            return;
        }
        if (this.layoutFeatures == null) {
            super.x = param1;
        } else {
            this.layoutFeatures.layoutX = param1;
            this.validateTransformMatrix();
        }
    }

    override public function get y(): Number {
        return this.layoutFeatures == null ? super.y : this.layoutFeatures.layoutY;
    }

    override public function set y(param1: Number): void {
        if (this.y == param1) {
            return;
        }
        if (this.layoutFeatures == null) {
            super.y = param1;
        } else {
            this.layoutFeatures.layoutY = param1;
            this.validateTransformMatrix();
        }
    }

    override public function get z(): Number {
        return this.layoutFeatures == null ? super.z : this.layoutFeatures.layoutZ;
    }

    override public function set z(param1: Number): void {
        if (this.z == param1) {
            return;
        }
        if (this.layoutFeatures == null) {
            super.z = param1;
        } else {
            this.layoutFeatures.layoutZ = param1;
            this.validateTransformMatrix();
        }
    }

    override public function get width(): Number {
        var _loc1_: * = null;
        if (this.layoutFeatures == null) {
            return super.width;
        }
        if (MatrixUtilClass != null) {
            _loc1_ = MatrixUtilClass["transformSize"](this.layoutFeatures.layoutWidth, this._height, transform.matrix);
        }
        return !!_loc1_ ? _loc1_.x : super.width;
    }

    override public function set width(param1: Number): void {
        if (this.width == param1) {
            return;
        }
        if (this.layoutFeatures == null) {
            super.width = param1;
        } else {
            this.layoutFeatures.layoutWidth = param1;
            this.layoutFeatures.layoutScaleX = this.measuredWidth != 0 ? param1 / this.measuredWidth : 0;
            this.validateTransformMatrix();
        }
    }

    override public function get height(): Number {
        var _loc1_: * = null;
        if (this.layoutFeatures == null) {
            return super.height;
        }
        if (MatrixUtilClass != null) {
            _loc1_ = MatrixUtilClass["transformSize"](this.layoutFeatures.layoutWidth, this._height, transform.matrix);
        }
        return !!_loc1_ ? _loc1_.y : super.height;
    }

    override public function set height(param1: Number): void {
        if (this.height == param1) {
            return;
        }
        if (this.layoutFeatures == null) {
            super.height = param1;
        } else {
            this._height = param1;
            this.layoutFeatures.layoutScaleY = this.measuredHeight != 0 ? param1 / this.measuredHeight : 0;
            this.validateTransformMatrix();
        }
    }

    override public function get rotationX(): Number {
        return this.layoutFeatures == null ? super.rotationX : this.layoutFeatures.layoutRotationX;
    }

    override public function set rotationX(param1: Number): void {
        if (this.rotationX == param1) {
            return;
        }
        if (this.layoutFeatures == null) {
            super.rotationX = param1;
        } else {
            this.layoutFeatures.layoutRotationX = param1;
            this.validateTransformMatrix();
        }
    }

    override public function get rotationY(): Number {
        return this.layoutFeatures == null ? super.rotationY : this.layoutFeatures.layoutRotationY;
    }

    override public function set rotationY(param1: Number): void {
        if (this.rotationY == param1) {
            return;
        }
        if (this.layoutFeatures == null) {
            super.rotationY = param1;
        } else {
            this.layoutFeatures.layoutRotationY = param1;
            this.validateTransformMatrix();
        }
    }

    override public function get rotationZ(): Number {
        return this.layoutFeatures == null ? super.rotationZ : this.layoutFeatures.layoutRotationZ;
    }

    override public function set rotationZ(param1: Number): void {
        if (this.rotationZ == param1) {
            return;
        }
        if (this.layoutFeatures == null) {
            super.rotationZ = param1;
        } else {
            this.layoutFeatures.layoutRotationZ = param1;
            this.validateTransformMatrix();
        }
    }

    override public function get rotation(): Number {
        return this.layoutFeatures == null ? super.rotation : this.layoutFeatures.layoutRotationZ;
    }

    override public function set rotation(param1: Number): void {
        if (this.rotation == param1) {
            return;
        }
        if (this.layoutFeatures == null) {
            super.rotation = param1;
        } else {
            this.layoutFeatures.layoutRotationZ = param1;
            this.validateTransformMatrix();
        }
    }

    override public function get scaleX(): Number {
        return this.layoutFeatures == null ? super.scaleX : this.layoutFeatures.layoutScaleX;
    }

    override public function set scaleX(param1: Number): void {
        if (this.scaleX == param1) {
            return;
        }
        if (this.layoutFeatures == null) {
            super.scaleX = param1;
        } else {
            this.layoutFeatures.layoutScaleX = param1;
            this.layoutFeatures.layoutWidth = Math.abs(param1) * this.measuredWidth;
            this.validateTransformMatrix();
        }
    }

    override public function get scaleY(): Number {
        return this.layoutFeatures == null ? super.scaleY : this.layoutFeatures.layoutScaleY;
    }

    override public function set scaleY(param1: Number): void {
        if (this.scaleY == param1) {
            return;
        }
        if (this.layoutFeatures == null) {
            super.scaleY = param1;
        } else {
            this.layoutFeatures.layoutScaleY = param1;
            this._height = Math.abs(param1) * this.measuredHeight;
            this.validateTransformMatrix();
        }
    }

    override public function get scaleZ(): Number {
        return this.layoutFeatures == null ? super.scaleZ : this.layoutFeatures.layoutScaleZ;
    }

    override public function set scaleZ(param1: Number): void {
        if (this.scaleZ == param1) {
            return;
        }
        if (this.layoutFeatures == null) {
            super.scaleZ = param1;
        } else {
            this.layoutFeatures.layoutScaleZ = param1;
            this.validateTransformMatrix();
        }
    }

    public function get layoutDirection(): String {
        return this._layoutDirection;
    }

    public function set layoutDirection(param1: String): void {
        if (param1 == this._layoutDirection) {
            return;
        }
        this._layoutDirection = param1;
        this.invalidateLayoutDirection();
    }

    public function get measuredHeight(): Number {
        return this._measuredHeight;
    }

    public function get measuredWidth(): Number {
        return this._measuredWidth;
    }

    public function get borderMetrics(): EdgeMetrics {
        if (scale9Grid == null) {
            return EdgeMetrics.EMPTY;
        }
        return new EdgeMetrics(scale9Grid.left, scale9Grid.top, Math.ceil(this.measuredWidth - 0), Math.ceil(this.measuredHeight - 0));
    }

    public function invalidateLayoutDirection(): void {
        var _loc2_: Boolean = false;
        var _loc1_: DisplayObjectContainer = parent;
        while (_loc1_) {
            if (_loc1_ is ILayoutDirectionElement) {
                _loc2_ = this._layoutDirection != null && ILayoutDirectionElement(_loc1_).layoutDirection != null && this._layoutDirection != ILayoutDirectionElement(_loc1_).layoutDirection;
                if (_loc2_ && this.layoutFeatures == null) {
                    this.initAdvancedLayoutFeatures();
                    if (this.layoutFeatures != null) {
                        this.layoutFeatures.mirror = _loc2_;
                        this.validateTransformMatrix();
                        break;
                    }
                    break;
                }
                if (!_loc2_ && Boolean(this.layoutFeatures)) {
                    this.layoutFeatures.mirror = _loc2_;
                    this.validateTransformMatrix();
                    this.layoutFeatures = null;
                    break;
                }
                break;
            }
            _loc1_ = _loc1_.parent;
        }
    }

    public function move(param1: Number, param2: Number): void {
        this.x = param1;
        this.y = param2;
    }

    public function setActualSize(param1: Number, param2: Number): void {
        this.width = param1;
        this.height = param2;
    }

    private function addedHandler(param1: Event): void {
        this.invalidateLayoutDirection();
    }

    private function initAdvancedLayoutFeatures(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        if (this.layoutFeaturesClass == null) {
            _loc1_ = ApplicationDomain.currentDomain;
            if (_loc1_.hasDefinition("mx.core::AdvancedLayoutFeatures")) {
                this.layoutFeaturesClass = Class(_loc1_.getDefinition("mx.core::AdvancedLayoutFeatures"));
            }
            if (MatrixUtilClass == null) {
                if (_loc1_.hasDefinition("mx.utils::MatrixUtil")) {
                    MatrixUtilClass = Class(_loc1_.getDefinition("mx.utils::MatrixUtil"));
                }
            }
        }
        if (this.layoutFeaturesClass != null) {
            _loc2_ = new this.layoutFeaturesClass();
            _loc2_.layoutScaleX = this.scaleX;
            _loc2_.layoutScaleY = this.scaleY;
            _loc2_.layoutScaleZ = this.scaleZ;
            _loc2_.layoutRotationX = this.rotationX;
            _loc2_.layoutRotationY = this.rotationY;
            _loc2_.layoutRotationZ = this.rotation;
            _loc2_.layoutX = this.x;
            _loc2_.layoutY = this.y;
            _loc2_.layoutZ = this.z;
            _loc2_.layoutWidth = this.width;
            this._height = this.height;
            this.layoutFeatures = _loc2_;
        }
    }

    private function validateTransformMatrix(): void {
        if (this.layoutFeatures != null) {
            if (this.layoutFeatures.is3D) {
                super.transform.matrix3D = this.layoutFeatures.computedMatrix3D;
            } else {
                super.transform.matrix = this.layoutFeatures.computedMatrix;
            }
        }
    }
}
}
