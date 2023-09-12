package com.bigpoint.utils {

public class class_1488 {

    public static const const_2305: int = 0;

    public static const const_1153: int = 1;

    public static const const_312: int = 2;

    public static const const_1968: int = 3;


    public var value: String;

    public var type: int;

    public var wildcard: String;

    public var precision: int = 0;

    public function class_1488(param1: String = "%!", param2: int = 0, param3: String = "") {
        super();
        this.wildcard = param1;
        this.type = param2;
        this.value = param3;
    }
}
}
