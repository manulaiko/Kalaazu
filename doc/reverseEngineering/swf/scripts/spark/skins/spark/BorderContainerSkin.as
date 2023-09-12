package spark.skins.spark {

import mx.events.PropertyChangeEvent;
import mx.graphics.BitmapFill;
import mx.graphics.RectangularDropShadow;
import mx.graphics.SolidColor;
import mx.graphics.SolidColorStroke;
import mx.states.SetProperty;
import mx.states.State;

import spark.components.BorderContainer;
import spark.components.Group;
import spark.components.supportClasses.Skin;
import spark.primitives.Path;
import spark.primitives.Rect;

public class BorderContainerSkin extends Skin {


    private var _809612678contentGroup: Group;

    private var bgRect: Rect;

    private var insetPath: Path;

    private var rds: RectangularDropShadow;

    private var _213507019hostComponent: BorderContainer;

    public function BorderContainerSkin() {
        super();
        minWidth = 30;
        minHeight = 30;
        states = [new State({"name": "normal"}), new State({
            "name": "disabled",
            "overrides": [new SetProperty(this, "alpha", 0.5)]
        })];
    }

    override protected function createChildren(): void {
        super.createChildren();
        this.bgRect = new Rect();
        addElementAt(this.bgRect, 0);
        this.bgRect.left = this.bgRect.top = this.bgRect.right = this.bgRect.bottom = 0;
        this.contentGroup = new Group();
        addElement(this.contentGroup);
        this.insetPath = new Path();
        addElement(this.insetPath);
    }

    override protected function measure(): void {
        var _loc2_: int = 0;
        measuredWidth = this.contentGroup.measuredWidth;
        measuredHeight = this.contentGroup.measuredHeight;
        measuredMinWidth = this.contentGroup.measuredMinWidth;
        measuredMinHeight = this.contentGroup.measuredMinHeight;
        var _loc1_: Number = getStyle("borderWeight");
        if (Boolean(this.hostComponent) && Boolean(this.hostComponent.borderStroke)) {
            _loc1_ = this.hostComponent.borderStroke.weight;
        }
        if (_loc1_ > 0) {
            _loc2_ = _loc1_ * 2;
            measuredWidth += _loc2_;
            measuredHeight += _loc2_;
            measuredMinWidth += _loc2_;
            measuredMinHeight += _loc2_;
        }
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        var _loc3_: int = 0;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: Number = NaN;
        var _loc12_: Number = NaN;
        var _loc13_: Number = NaN;
        var _loc14_: * = null;
        var _loc15_: Number = NaN;
        var _loc16_: Number = NaN;
        var _loc17_: Number = NaN;
        graphics.clear();
        var _loc4_: String = getStyle("borderStyle");
        var _loc5_: Boolean = getStyle("borderVisible");
        var _loc6_: Number = getStyle("cornerRadius");
        if (Boolean(this.hostComponent) && Boolean(this.hostComponent.borderStroke)) {
            _loc3_ = this.hostComponent.borderStroke.weight;
        } else {
            _loc3_ = getStyle("borderWeight");
        }
        if (!_loc5_) {
            _loc3_ = 0;
        }
        if (isNaN(_loc3_)) {
            _loc3_ = 1;
        }
        this.contentGroup.setStyle("left", _loc3_);
        this.contentGroup.setStyle("right", _loc3_);
        this.contentGroup.setStyle("top", _loc3_);
        this.contentGroup.setStyle("bottom", _loc3_);
        if (this.hostComponent.borderStroke) {
            this.bgRect.stroke = this.hostComponent.borderStroke;
        } else if (!_loc5_) {
            this.bgRect.stroke = null;
        } else {
            _loc7_ = getStyle("borderColor");
            _loc8_ = getStyle("borderAlpha");
            if (!isNaN(_loc7_)) {
                if (isNaN(_loc8_)) {
                    _loc8_ = 1;
                }
                this.bgRect.stroke = new SolidColorStroke(_loc7_, _loc3_, _loc8_);
            }
        }
        if (this.hostComponent.backgroundFill) {
            this.bgRect.fill = this.hostComponent.backgroundFill;
        } else if (_loc9_ = getStyle("backgroundImage")) {
            (_loc10_ = this.bgRect.fill is BitmapFill ? BitmapFill(this.bgRect.fill) : new BitmapFill()).source = _loc9_;
            _loc10_.fillMode = getStyle("backgroundImageFillMode");
            _loc10_.alpha = getStyle("backgroundAlpha");
            this.bgRect.fill = _loc10_;
        } else {
            _loc11_ = getStyle("backgroundColor");
            _loc12_ = getStyle("backgroundAlpha");
            if (isNaN(_loc12_)) {
                _loc12_ = 1;
            }
            if (!isNaN(_loc11_)) {
                this.bgRect.fill = new SolidColor(_loc11_, _loc12_);
            } else {
                this.bgRect.fill = new SolidColor(0, 0);
            }
        }
        if (_loc4_ == "inset" && this.hostComponent.borderStroke == null && _loc5_) {
            _loc13_ = -_loc6_;
            _loc14_ = "";
            if (_loc6_ > 0 && _loc3_ < 10) {
                _loc15_ = _loc6_ * 0.292893218813453;
                _loc16_ = _loc6_ * 0.585786437626905;
                _loc17_ = param1 - _loc3_;
                _loc14_ = (_loc14_ = (_loc14_ = (_loc14_ = (_loc14_ = (_loc14_ += "M 0 " + _loc6_) + (" Q 0 " + _loc16_ + " " + _loc15_ + " " + _loc15_)) + (" Q " + _loc16_ + " 0 " + _loc6_ + " 0")) + (" L " + (_loc17_ - _loc6_) + " 0")) + (" Q " + (_loc17_ - _loc16_) + " 0 " + (_loc17_ - _loc15_) + " " + _loc15_)) + (" Q " + _loc17_ + " " + _loc16_ + " " + _loc17_ + " " + _loc6_);
                this.insetPath.height = _loc6_;
            } else {
                _loc14_ += "M 0 0";
                _loc14_ = _loc14_ + "M 0 0" + (" L " + (param1 - _loc3_) + " 0");
                this.insetPath.height = 1;
            }
            this.insetPath.x = _loc3_;
            this.insetPath.y = _loc3_;
            this.insetPath.width = param1 - _loc3_ * 2;
            this.insetPath.data = _loc14_;
            this.insetPath.stroke = new SolidColorStroke(0, 1, 0.12);
        } else {
            this.insetPath.data = "";
            this.insetPath.stroke = null;
        }
        this.bgRect.radiusX = this.bgRect.radiusY = _loc6_;
        super.updateDisplayList(param1, param2);
        if (getStyle("dropShadowVisible") == true) {
            if (!this.rds) {
                this.rds = new RectangularDropShadow();
            }
            this.rds.alpha = 0.4;
            this.rds.angle = 90;
            this.rds.color = 0;
            this.rds.distance = 5;
            var _loc18_: * = _loc6_ + 1;
            this.rds.brRadius = _loc6_ + 1;
            this.rds.tlRadius = this.rds.trRadius = this.rds.blRadius = _loc18_;
            graphics.lineStyle();
            this.rds.drawShadow(graphics, 0, 0, param1, param2);
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
    public function get hostComponent(): BorderContainer {
        return this._213507019hostComponent;
    }

    public function set hostComponent(param1: BorderContainer): void {
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
