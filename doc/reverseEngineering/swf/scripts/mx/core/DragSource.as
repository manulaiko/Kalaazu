package mx.core {

public class DragSource {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var dataHolder: Object;

    private var formatHandlers: Object;

    private var _formats: Array;

    public function DragSource() {
        this.dataHolder = {};
        this.formatHandlers = {};
        this._formats = [];
        super();
    }

    public function get formats(): Array {
        return this._formats;
    }

    public function addData(param1: Object, param2: String): void {
        this._formats.push(param2);
        this.dataHolder[param2] = param1;
    }

    public function addHandler(param1: Function, param2: String): void {
        this._formats.push(param2);
        this.formatHandlers[param2] = param1;
    }

    public function dataForFormat(param1: String): Object {
        var _loc2_: Object = this.dataHolder[param1];
        if (_loc2_) {
            return _loc2_;
        }
        if (this.formatHandlers[param1]) {
            return this.formatHandlers[param1]();
        }
        return null;
    }

    public function hasFormat(param1: String): Boolean {
        var _loc2_: int = this._formats.length;
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            if (this._formats[_loc3_] == param1) {
                return true;
            }
            _loc3_++;
        }
        return false;
    }
}
}
