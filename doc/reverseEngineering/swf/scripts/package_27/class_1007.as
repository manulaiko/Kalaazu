package package_27 {

import package_99.class_266;

public class class_1007 extends class_286 {


    protected var var_2549: Vector.<String>;

    public function class_1007(param1: int, param2: String) {
        this.var_2549 = new Vector.<String>();
        super(param1, param2);
    }

    override public function get resKey(): String {
        var _loc1_: int = this.resKeyList.length > 1 ? int(class_266.getRandomCount(0, this.resKeyList.length - 1)) : 0;
        return this.resKeyList[_loc1_];
    }

    override public function set resKey(param1: String): void {
        this.resKeyList.push(param1);
    }

    public function get resKeyList(): Vector.<String> {
        return this.var_2549;
    }
}
}
