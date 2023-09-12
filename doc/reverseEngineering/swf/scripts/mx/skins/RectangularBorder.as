package mx.skins {

import flash.display.DisplayObject;
import flash.display.Graphics;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.display.Shape;
import flash.events.ErrorEvent;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.geom.Rectangle;
import flash.net.URLRequest;
import flash.system.ApplicationDomain;
import flash.system.LoaderContext;
import flash.utils.getDefinitionByName;

import mx.core.EdgeMetrics;
import mx.core.FlexLoader;
import mx.core.FlexShape;
import mx.core.IChildList;
import mx.core.IContainer;
import mx.core.IRawChildrenContainer;
import mx.core.IRectangularBorder;
import mx.core.mx_internal;
import mx.resources.IResourceManager;
import mx.resources.ResourceManager;
import mx.styles.ISimpleStyleClient;

public class RectangularBorder extends Border implements IRectangularBorder {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var backgroundImageStyle: Object;

    private var backgroundImageWidth: Number;

    private var backgroundImageHeight: Number;

    private var resourceManager: IResourceManager;

    private var backgroundImage: DisplayObject;

    private var _backgroundImageBounds: Rectangle;

    public function RectangularBorder() {
        this.resourceManager = ResourceManager.getInstance();
        super();
        addEventListener(Event.REMOVED, this.removedHandler);
    }

    public function get hasBackgroundImage(): Boolean {
        return this.backgroundImage != null;
    }

    public function get backgroundImageBounds(): Rectangle {
        return this._backgroundImageBounds;
    }

    public function set backgroundImageBounds(param1: Rectangle): void {
        if (Boolean(this._backgroundImageBounds) && Boolean(param1) && this._backgroundImageBounds.equals(param1)) {
            return;
        }
        this._backgroundImageBounds = param1;
        invalidateDisplayList();
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        if (!parent) {
            return;
        }
        var _loc3_: Object = getStyle("backgroundImage");
        if (_loc3_ != this.backgroundImageStyle) {
            this.removedHandler(null);
            this.backgroundImageStyle = _loc3_;
            if (Boolean(_loc3_) && Boolean(_loc3_ as Class)) {
                _loc4_ = Class(_loc3_);
                this.initBackgroundImage(new _loc4_());
            } else if (Boolean(_loc3_) && _loc3_ is String) {
                try {
                    _loc4_ = Class(getDefinitionByName(String(_loc3_)));
                } catch (e: Error) {
                }
                if (_loc4_) {
                    _loc5_ = new _loc4_();
                    this.initBackgroundImage(_loc5_);
                } else {
                    (_loc6_ = new FlexLoader()).contentLoaderInfo.addEventListener(Event.COMPLETE, this.completeEventHandler);
                    _loc6_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.errorEventHandler);
                    _loc6_.contentLoaderInfo.addEventListener(ErrorEvent.ERROR, this.errorEventHandler);
                    (_loc7_ = new LoaderContext()).applicationDomain = new ApplicationDomain(ApplicationDomain.currentDomain);
                    _loc6_.load(new URLRequest(String(_loc3_)), _loc7_);
                }
            } else if (_loc3_) {
                _loc8_ = this.resourceManager.getString("skins", "notLoaded", [_loc3_]);
                throw new Error(_loc8_);
            }
        }
        if (this.backgroundImage) {
            this.layoutBackgroundImage();
        }
    }

    private function initBackgroundImage(param1: DisplayObject): void {
        this.backgroundImage = param1;
        if (param1 is Loader) {
            this.backgroundImageWidth = Loader(param1).contentLoaderInfo.width;
            this.backgroundImageHeight = Loader(param1).contentLoaderInfo.height;
        } else {
            this.backgroundImageWidth = this.backgroundImage.width;
            this.backgroundImageHeight = this.backgroundImage.height;
            if (param1 is ISimpleStyleClient) {
                ISimpleStyleClient(param1).styleName = styleName;
            }
        }
        var _loc2_: IChildList = parent is IRawChildrenContainer ? IRawChildrenContainer(parent).rawChildren : IChildList(parent);
        var _loc3_: Shape = new FlexShape();
        _loc3_.name = "backgroundMask";
        _loc3_.x = 0;
        _loc3_.y = 0;
        _loc2_.addChild(_loc3_);
        var _loc4_: int = int(_loc2_.getChildIndex(this));
        _loc2_.addChildAt(this.backgroundImage, _loc4_ + 1);
        this.backgroundImage.mask = _loc3_;
    }

    public function layoutBackgroundImage(): void {
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc14_: Number = NaN;
        var _loc15_: * = null;
        var _loc1_: DisplayObject = parent;
        var _loc2_: EdgeMetrics = _loc1_ is IContainer ? IContainer(_loc1_).viewMetrics : borderMetrics;
        var _loc3_: * = getStyle("backgroundAttachment") != "fixed";
        if (this._backgroundImageBounds) {
            _loc4_ = this._backgroundImageBounds.width;
            _loc5_ = this._backgroundImageBounds.height;
        } else {
            _loc4_ = width - _loc2_.left - _loc2_.right;
            _loc5_ = height - _loc2_.top - _loc2_.bottom;
        }
        var _loc6_: Number = this.getBackgroundSize();
        if (isNaN(_loc6_)) {
            _loc7_ = 1;
            _loc8_ = 1;
        } else {
            _loc7_ = (_loc14_ = _loc6_ * 0.01) * _loc4_ / this.backgroundImageWidth;
            _loc8_ = _loc14_ * _loc5_ / this.backgroundImageHeight;
        }
        this.backgroundImage.scaleX = _loc7_;
        this.backgroundImage.scaleY = _loc8_;
        var _loc9_: Number = Math.round(0.5 * (_loc4_ - this.backgroundImageWidth * _loc7_));
        var _loc10_: Number = Math.round(0.5 * (_loc5_ - this.backgroundImageHeight * _loc8_));
        this.backgroundImage.x = _loc2_.left;
        this.backgroundImage.y = _loc2_.top;
        var _loc11_: Shape;
        (_loc11_ = Shape(this.backgroundImage.mask)).x = _loc2_.left;
        _loc11_.y = _loc2_.top;
        if (_loc3_ && _loc1_ is IContainer) {
            _loc9_ -= IContainer(_loc1_).horizontalScrollPosition;
            _loc10_ -= IContainer(_loc1_).verticalScrollPosition;
        }
        this.backgroundImage.alpha = getStyle("backgroundAlpha");
        this.backgroundImage.x += _loc9_;
        this.backgroundImage.y += _loc10_;
        var _loc12_: Number = width - _loc2_.left - _loc2_.right;
        var _loc13_: Number = height - _loc2_.top - _loc2_.bottom;
        if (_loc11_.width != _loc12_ || _loc11_.height != _loc13_) {
            (_loc15_ = _loc11_.graphics).clear();
            _loc15_.beginFill(16777215);
            _loc15_.drawRect(0, 0, _loc12_, _loc13_);
            _loc15_.endFill();
        }
    }

    private function getBackgroundSize(): Number {
        var _loc3_: int = 0;
        var _loc1_: Number = NaN;
        var _loc2_: Object = getStyle("backgroundSize");
        if (Boolean(_loc2_) && _loc2_ is String) {
            _loc3_ = int(_loc2_.indexOf("%"));
            if (_loc3_ != -1) {
                _loc1_ = Number(_loc2_.substr(0, _loc3_));
            }
        }
        return _loc1_;
    }

    private function errorEventHandler(param1: Event): void {
    }

    private function completeEventHandler(param1: Event): void {
        if (!parent) {
            return;
        }
        var _loc2_: DisplayObject = DisplayObject(LoaderInfo(param1.target).loader);
        this.initBackgroundImage(_loc2_);
        this.layoutBackgroundImage();
        dispatchEvent(param1.clone());
    }

    private function removedHandler(param1: Event): void {
        var _loc2_: * = null;
        if (this.backgroundImage) {
            _loc2_ = parent is IRawChildrenContainer ? IRawChildrenContainer(parent).rawChildren : IChildList(parent);
            _loc2_.removeChild(this.backgroundImage.mask);
            _loc2_.removeChild(this.backgroundImage);
            this.backgroundImage = null;
        }
    }
}
}
