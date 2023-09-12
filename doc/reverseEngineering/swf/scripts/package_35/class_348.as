package package_35 {

import net.bigpoint.darkorbit.map.model.ship.class_86;

import package_112.class_307;

import package_22.class_339;

import package_27.class_82;

import package_29.class_85;

public class class_348 extends Effect {


    private var var_504: int = -1;

    private var _source: class_85;

    public function class_348(param1: int, param2: class_85, param3: int = 1, param4: class_339 = null, param5: int = -1) {
        super(param1, param3, param4);
        this._source = param2;
        this.var_504 = param5;
    }

    public function get source(): class_85 {
        return this._source;
    }

    override public function activate(): Boolean {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: Boolean = false;
        var _loc4_: Boolean = false;
        if (this.var_504 != -1) {
            class_82.playSoundEffect(this.var_504, false, false, this._source.x, this._source.y, true);
        }
        if (type == const_2311 || type == const_2856) {
            this._source.const_2402.add(this.deactivate);
            _loc1_ = this._source as class_86;
            _loc2_ = this._source as class_307;
            _loc3_ = (Boolean(_loc1_) && !_loc1_.method_6225() || Boolean(_loc2_) && !_loc2_.isHeroPet()) && Boolean(_loc1_.cloaked.value);
            _loc4_ = _loc3_ ? Boolean(method_5314) : true;
        } else {
            _loc4_ = true;
        }
        return super.activate() && _loc4_;
    }

    override public function deactivate(): void {
        this._source.const_2402.remove(this.deactivate);
        super.deactivate();
    }

    override public function isValid(): Boolean {
        var _loc1_: class_86 = this._source as class_86;
        var _loc2_: class_307 = this._source as class_307;
        var _loc3_: Boolean = (Boolean(_loc1_) && !_loc1_.method_6225() || Boolean(_loc2_) && !_loc2_.isHeroPet()) && Boolean(_loc1_.cloaked.value);
        var _loc4_: Boolean = _loc3_ && type == Effect.const_925 ? Boolean(method_5314) : true;
        return super.isValid() && this._source != null && _loc4_;
    }
}
}
