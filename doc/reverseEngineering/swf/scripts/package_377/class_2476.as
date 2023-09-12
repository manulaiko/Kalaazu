package package_377 {

public class class_2476 {


    private var var_196: Vector.<class_2146>;

    private var _index: int;

    private var var_157: int;

    public function class_2476() {
        super();
        this.var_196 = new Vector.<class_2146>();
    }

    public function getItem(): class_2146 {
        var _loc1_: * = null;
        if (this._index == this.var_157) {
            _loc1_ = new class_2146();
            var _loc2_: * = this._index++;
            this.var_196[_loc2_] = _loc1_;
            ++this.var_157;
            return _loc1_;
        }
        return this.var_196[this._index++];
    }

    public function method_3017(): void {
        this._index = 0;
    }

    public function dispose(): void {
        this.var_196.length = 0;
    }
}
}
