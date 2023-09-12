package spark.effects.animation {

import spark.effects.interpolation.MultiValueInterpolator;

public class SimpleMotionPath extends MotionPath {

    private static var multiValueInterpolator: MultiValueInterpolator = null;


    public function SimpleMotionPath(param1: String = null, param2: Object = null, param3: Object = null, param4: Object = null) {
        super();
        this.property = param1;
        keyframes = new <Keyframe>[new Keyframe(0, param2), new Keyframe(NaN, param3, param4)];
        if (param2 !== null && param3 !== null && (param2 is Array && param3 is Array || param2 is Vector.<Number> && param3 is Vector.<Number>)) {
            if (!multiValueInterpolator) {
                multiValueInterpolator = new MultiValueInterpolator();
            }
            interpolator = multiValueInterpolator;
        }
    }

    public function get valueFrom(): Object {
        return keyframes[0].value;
    }

    public function set valueFrom(param1: Object): void {
        keyframes[0].value = param1;
    }

    public function get valueTo(): Object {
        return keyframes[-1].value;
    }

    public function set valueTo(param1: Object): void {
        keyframes[-1].value = param1;
    }

    public function get valueBy(): Object {
        return keyframes[-1].valueBy;
    }

    public function set valueBy(param1: Object): void {
        keyframes[-1].valueBy = param1;
    }
}
}
