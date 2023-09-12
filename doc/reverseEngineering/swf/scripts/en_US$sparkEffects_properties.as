package {

import mx.resources.ResourceBundle;

public class en_US$sparkEffects_properties extends ResourceBundle {


    public function en_US$sparkEffects_properties() {
        super("en_US", "sparkEffects");
    }

    override protected function getContent(): Object {
        return {
            "illegalPropValue": "Illegal property value: {0}.",
            "cannotOperateOn": "AnimateShaderTransition can operate only on IUIComponent and GraphicElement instances.",
            "endValContainsNonNums": "The endValue array contains non-Numbers: you must supply a custom Interpolator to Animation.",
            "accDecWithinRange": "(acceleration + deceleration) must be within range [0,1].",
            "cannotCalculateValue": "Interpolator cannot calculate interpolated values when startValue ({0}) or endValue ({1}) is not a number.",
            "arraysNotOfEqualLength": "The start and end arrays must be of equal length.",
            "propNotPropOrStyle": "Property {0} is not a property or a style on object {1}: {2}.",
            "startValContainsNonNums": "The startValue array contains non-Numbers: you must supply Interpolator to Animation."
        };
    }
}
}
