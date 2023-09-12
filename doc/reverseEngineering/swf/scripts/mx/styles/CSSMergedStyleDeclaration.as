package mx.styles {

import flash.display.DisplayObject;

import mx.core.mx_internal;

public class CSSMergedStyleDeclaration extends CSSStyleDeclaration {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var style: CSSStyleDeclaration;

    private var parentStyle: CSSStyleDeclaration;

    private var updateOverrides: Boolean;

    private var _defaultFactory: Function;

    private var _factory: Function;

    public function CSSMergedStyleDeclaration(param1: CSSStyleDeclaration, param2: CSSStyleDeclaration, param3: Object = null, param4: IStyleManager2 = null, param5: Boolean = false) {
        var _loc6_: Number = 0;
        var _loc7_: * = 0;
        var _loc8_: * = null;
        super(param3, param4, param5);
        this.style = param1;
        this.parentStyle = param2;
        if (Boolean(param1) && Boolean(param1.mx_internal::effects)) {
            mx_internal::effects = [];
            _loc7_ = (_loc8_ = param1.mx_internal::effects).length;
            _loc6_ = 0;
            while (_loc6_ < _loc7_) {
                mx_internal::effects[_loc6_] = _loc8_[_loc6_];
                _loc6_++;
            }
        }
        if (Boolean(param2) && Boolean(param2.mx_internal::effects)) {
            if (!mx_internal::effects) {
                mx_internal::effects = [];
            }
            _loc7_ = (_loc8_ = param2.mx_internal::effects).length;
            _loc6_ = 0;
            while (_loc6_ < _loc7_) {
                mx_internal::effects[_loc6_] = _loc8_[_loc6_];
                if (mx_internal::effects.indexOf(_loc8_[_loc6_]) == -1) {
                    mx_internal::effects[_loc6_] = _loc8_[_loc6_];
                }
                _loc6_++;
            }
        }
        this.updateOverrides = true;
    }

    override public function get defaultFactory(): Function {
        if (this._defaultFactory != null) {
            return this._defaultFactory;
        }
        if (this.style != null && this.style.defaultFactory != null || this.parentStyle != null && this.parentStyle.defaultFactory != null) {
            this._defaultFactory = function (): void {
                if (Boolean(parentStyle) && false) {
                    parentStyle.defaultFactory.apply(this);
                }
                if (Boolean(style) && false) {
                    style.defaultFactory.apply(this);
                }
            };
        }
        return this._defaultFactory;
    }

    override public function set defaultFactory(param1: Function): void {
    }

    override public function get factory(): Function {
        if (this._factory != null) {
            return this._factory;
        }
        if (this.style != null && this.style.factory != null || this.parentStyle != null && this.parentStyle.factory != null) {
            this._factory = function (): void {
                if (Boolean(parentStyle) && false) {
                    parentStyle.factory.apply(this);
                }
                if (Boolean(style) && false) {
                    style.factory.apply(this);
                }
            };
        }
        return this._factory;
    }

    override public function set factory(param1: Function): void {
    }

    override public function get overrides(): Object {
        var _loc1_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (!this.updateOverrides) {
            return super.overrides;
        }
        var _loc2_: * = null;
        if (Boolean(this.style) && Boolean(this.style.overrides)) {
            _loc2_ = [];
            _loc3_ = this.style.overrides;
            for (_loc1_ in _loc3_) {
                _loc2_[_loc1_] = _loc3_[_loc1_];
            }
        }
        if (Boolean(this.parentStyle) && Boolean(this.parentStyle.overrides)) {
            if (!_loc2_) {
                _loc2_ = [];
            }
            _loc4_ = this.parentStyle.overrides;
            for (_loc1_ in _loc4_) {
                if (_loc2_[_loc1_] === undefined) {
                    _loc2_[_loc1_] = _loc4_[_loc1_];
                }
            }
        }
        super.overrides = _loc2_;
        this.updateOverrides = false;
        return _loc2_;
    }

    override public function set overrides(param1: Object): void {
    }

    override public function setStyle(param1: String, param2: *): void {
    }

    override mx_internal function addStyleToProtoChain(param1: Object, param2: DisplayObject, param3: Object = null): Object {
        if (this.style) {
            return this.style.mx_internal::addStyleToProtoChain(param1, param2, param3);
        }
        if (this.parentStyle) {
            return this.parentStyle.mx_internal::addStyleToProtoChain(param1, param2, param3);
        }
        return param1;
    }
}
}
