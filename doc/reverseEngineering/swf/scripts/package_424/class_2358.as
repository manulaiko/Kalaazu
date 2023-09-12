package package_424 {

import flash.utils.setTimeout;

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.common.class_80;

import package_19.class_68;
import package_19.class_70;

public class class_2358 implements class_80, IDisposable {


    public const completed: class_68 = new class_70();

    private var _updatables: Vector.<class_80>;

    private var _xml: XML;

    private var _tween: class_2563;

    private var var_2919: Function;

    private var _autoPlay: Boolean;

    private var _id: String;

    public function class_2358(param1: String, param2: XML, param3: Function) {
        var _loc4_: * = null;
        this._updatables = new Vector.<class_80>();
        super();
        this._id = param1;
        this._xml = param2;
        this.var_2919 = param3;
        this._autoPlay = String(param2.@autoPlay) == "true";
        if (this._xml.tween.length() > 0 || this._xml.animation.length() > 0) {
            this._tween = new class_2563(class_2564.parse(this._xml), this.var_2919);
            if (String(this._xml.@dispatchCompleteEvent) !== "false") {
                this._tween.completed.add(this.method_1822);
            }
        }
        for each(_loc4_ in this._xml.append) {
            this._updatables.push(new class_2565(param3(String(_loc4_.@target)), method_2917(_loc4_)));
        }
    }

    public static function method_2917(param1: XML): Object {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc2_: * = {};
        var _loc3_: XMLList = param1.attributes();
        for each(_loc6_ in _loc3_) {
            _loc4_ = _loc6_.name();
            _loc5_ = class_2564.method_2499(_loc6_.toString());
            if (!isNaN(Number(_loc5_))) {
                if (_loc4_ == "scale") {
                    _loc2_.scaleX = _loc2_.scaleY = _loc2_.scaleZ = _loc5_;
                } else {
                    _loc2_[_loc4_] = _loc5_;
                }
            }
        }
        return _loc2_;
    }

    public function get id(): String {
        return this._id;
    }

    public function play(): void {
        this.method_6342();
        if (this._tween) {
            this._tween.reset();
            this._tween.start();
        }
    }

    public function stop(): void {
        if (this._tween) {
            this._tween.dispose();
        }
    }

    public function updateObj(param1: Number): void {
        var _loc2_: * = null;
        for each(_loc2_ in this._updatables) {
            _loc2_.updateObj(param1);
        }
    }

    private function method_6342(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        for each(_loc3_ in this._xml.method_1796) {
            _loc1_ = this.var_2919(String(_loc3_.@target));
            if (_loc1_ != null) {
                _loc2_ = method_2917(_loc3_);
                for (_loc4_ in _loc2_) {
                    _loc1_[_loc4_] = Number(_loc2_[_loc4_]);
                }
            }
        }
    }

    protected function method_1822(): void {
        setTimeout(this.completed.dispatch, 1);
    }

    public function get autoPlay(): Boolean {
        return this._autoPlay;
    }

    public function method_1164(param1: class_80): void {
        this._updatables.push(param1);
    }

    public function method_3592(param1: class_80): void {
        var _loc2_: int = int(this._updatables.indexOf(param1));
        if (_loc2_ != -1) {
            this._updatables.splice(_loc2_, 1);
        }
    }

    public function disposeView(param1: Boolean = false): void {
        this.stop();
    }
}
}
