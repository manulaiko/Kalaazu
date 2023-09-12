package package_22 {

public class class_1074 {

    public static const const_746: String = "hint_";

    public static const const_1848: String = "hint_";

    public static const const_2469: String = "";


    public var id: int;

    public var price: Number = -1;

    public var baseKey: String;

    public var var_1380: String;

    public var var_4232: String;

    public var name_85: String;

    public var assetCount: int;

    public var url: String;

    public var jsFunctionName: String;

    public var showWindowTitle: Boolean;

    public function class_1074(param1: int, param2: String, param3: String, param4: int, param5: String = null, param6: String = null, param7: Boolean = true) {
        super();
        this.id = param1;
        this.name_85 = "banner" + param1;
        this.baseKey = param2;
        this.var_1380 = param3;
        this.assetCount = param4;
        this.url = param5;
        this.jsFunctionName = param6;
        this.showWindowTitle = param7;
    }

    public function method_1955(): String {
        return const_746 + this.baseKey;
    }

    public function method_1403(): String {
        return const_1848 + this.baseKey;
    }
}
}
