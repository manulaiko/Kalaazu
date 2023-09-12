package package_151 {

import package_8.VectorCollection;

import spark.collections.Sort;

public class class_995 {

    private static const SORT: Sort = new Sort();

    private static const const_745: Array = [new class_1517()];

    {
        SORT.fields = const_745;
    }

    private var var_146: int;

    private var var_1010: String;

    private var _content: VectorCollection;

    public function class_995(param1: String, param2: int, param3: Vector.<class_1515>) {
        this._content = new VectorCollection();
        super();
        this.var_146 = param2;
        this.var_1010 = param1;
        this._content.sort = SORT;
        this._content.source = param3;
    }

    public function get factionId(): int {
        return this.var_146;
    }

    public function get method_5063(): String {
        return this.var_1010;
    }

    public function get method_4197(): VectorCollection {
        return this._content;
    }
}
}
