package org.osmf.metadata {

public class CuePoint extends TimelineMarker {

    public static const EMBEDDED_CUEPOINTS_NAMESPACE: String = "http://www.osmf.org/timeline/embeddedCuePoints/1.0";

    public static const DYNAMIC_CUEPOINTS_NAMESPACE: String = "http://www.osmf.org/timeline/dynamicCuePoints/1.0";


    private var _name: String;

    private var _type: String;

    private var _parameters: Object;

    public function CuePoint(param1: String, param2: Number, param3: String, param4: Object, param5: Number = NaN) {
        super(param2, param5);
        this._type = param1;
        this._name = param3;
        this._parameters = param4;
    }

    public function get type(): String {
        return this._type;
    }

    public function get name(): String {
        return this._name;
    }

    public function get parameters(): Object {
        return this._parameters;
    }
}
}
