package net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model {

import flash.utils.Proxy;
import flash.utils.flash_proxy;

public class FactoryViewProxy extends Proxy {


    private var _views: Vector.<Object>;

    private var _len: int;

    public function FactoryViewProxy(param1: Vector.<Object>) {
        super();
        this._views = param1;
        this._len = this._views.length;
    }

    override flash_proxy function callProperty(param1: *, ...rest): * {
        var _loc3_: * = null;
        var _loc4_: int = 0;
        while (_loc4_ < this._len) {
            _loc3_ = this._views[_loc4_][param1] as Function;
            if (_loc3_ != null) {
                _loc3_.apply(null, rest);
            }
            _loc4_++;
        }
        return null;
    }

    override flash_proxy function setProperty(param1: *, param2: *): void {
        var _loc3_: int = 0;
        while (_loc3_ < this._len) {
            this._views[_loc3_][param1] = param2;
            _loc3_++;
        }
    }

    override flash_proxy function getProperty(param1: *): * {
        return this._views[0][param1];
    }

    override flash_proxy function hasProperty(param1: *): Boolean {
        return this._views[0][param1];
    }

    override flash_proxy function isAttribute(param1: *): Boolean {
        return this._views[0][param1];
    }
}
}
