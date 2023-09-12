package package_183 {

public class class_1632 extends Condition {


    private var var_851: int;

    private var var_923: int;

    private var var_713: int;

    private var var_126: int;

    public function class_1632() {
        super();
    }

    override protected function method_153(param1: Vector.<String>): void {
        super.method_153(param1);
        var _loc2_: Vector.<String> = param1;
        this.var_851 = parseInt(_loc2_.shift());
        this.var_923 = parseInt(_loc2_.shift());
        this.var_713 = parseInt(_loc2_.shift());
        this.var_126 = parseInt(_loc2_.shift());
        _description = description.replace(/%x%/, Number(this.var_851) / 100);
        _description = description.replace(/%y%/, Number(this.var_923) / 100);
    }
}
}
