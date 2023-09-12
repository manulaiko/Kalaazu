package package_381 {

import com.bigpoint.utils.class_73;

import package_35.Effect;

import package_99.class_266;

public class class_2190 extends class_2160 {


    private var var_3120: class_73;

    private var var_4046: class_73;

    private var var_4920: Number = 0;

    private var _currentTime: Number;

    private var var_4742: Number;

    private var var_3856: Boolean;

    public function class_2190(param1: Effect, param2: String, param3: class_73, param4: class_73, param5: Number = 0, param6: Boolean = false, param7: Number = -1) {
        this.var_3856 = param6;
        this._currentTime = 0;
        this.var_4920 = param5;
        this.var_4046 = param3;
        this.var_3120 = param4;
        this.var_4742 = param7;
        if (this.var_4920 == 0) {
            this._currentTime = 1;
        }
        super(param1, param2, param3);
    }

    override public function updateObj(param1: Number): void {
        super.updateObj(param1);
        this.method_4810(param1);
    }

    private function method_4810(param1: Number): void {
        var _loc2_: Number = NaN;
        if (view) {
            _loc2_ = Number(this.var_3120.method_3849(this.var_4046.x, this.var_4046.y, this.var_4046.z));
            if (this._currentTime < 1) {
                this._currentTime += param1 / Number(this.var_4920);
                if (this._currentTime > 1) {
                    this._currentTime = 1;
                }
            }
            if (this.var_4742 == -1 || _loc2_ < this.var_4742) {
                view.scaleZ = _loc2_ / 110 * Number(this._currentTime);
            }
            if (this.var_3856) {
                view.scaleX = _loc2_ / 250 * Number(this._currentTime);
            }
            view.rotationY = Math.atan2(Number(this.var_3120.y) - Number(this.var_4046.y), Number(this.var_3120.x) - Number(this.var_4046.x)) * 0 + 90;
        }
    }
}
}
