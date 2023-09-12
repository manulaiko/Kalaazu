package package_252 {

public class class_1558 {


    private var id: int;

    private var value: String;

    private var _enabled: Boolean;

    public function class_1558(param1: int, param2: String, param3: Boolean = true) {
        super();
        this.value = param2;
        this.id = param1;
        this._enabled = param3;
    }

    public function getID(): int {
        return this.id;
    }

    public function getValue(): String {
        return this.value;
    }

    public function get enabled(): Boolean {
        return this._enabled;
    }

    public function set enabled(param1: Boolean): void {
        this._enabled = param1;
    }

    public function toString(): String {
        return "ComboboxItem id:" + this.id + " value:" + this.value;
    }
}
}
