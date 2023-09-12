package package_335 {

import flash.events.EventDispatcher;
import flash.events.TimerEvent;
import flash.utils.Timer;
import flash.utils.getTimer;

public class class_1914 extends EventDispatcher {

    private static const const_868: int = 200;


    private var _timer: Timer;

    private var var_2163: Number;

    private var _startTime: Number;

    private var var_4844: Number;

    private var var_1192: Number;

    public function class_1914(param1: Number) {
        super();
        this.var_4844 = param1;
    }

    public function start(param1: int = 0): void {
        this._startTime = getTimer();
        this.var_1192 = 0;
        this._timer = new Timer(!!param1 ? param1 : Number(const_868));
        this._timer.addEventListener(TimerEvent.TIMER, this.method_5317);
        this._timer.start();
        this.method_5317();
    }

    public function method_5612(param1: String, param2: Function, param3: Boolean = false, param4: int = 0, param5: Boolean = false): void {
        addEventListener(param1, param2, param3, param4, param5);
        dispatchEvent(new class_1896(param1, Math.max(this.var_1192, 0)));
    }

    private function method_5317(param1: TimerEvent = null): void {
        this.var_2163 = getTimer() - Number(this._startTime);
        this.var_1192 = Number(this.var_4844) - Number(this.var_2163);
        if (this.var_1192 > 0 && this._startTime > 0) {
            dispatchEvent(new class_1896(class_1896.const_983, Math.max(this.var_1192, 0)));
        } else {
            dispatchEvent(new class_1896(class_1896.const_983, 0));
            this.dispose(true);
        }
    }

    public function dispose(param1: Boolean = false): void {
        if (this._timer) {
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER, this.method_5317);
            this._timer = null;
        }
        this.var_2163 = 0;
        this.var_1192 = 0;
        if (param1) {
            dispatchEvent(new class_1896(class_1896.const_2754, 0));
        }
    }
}
}
