package mx.states {

import mx.core.FlexVersion;
import mx.core.IDeferredInstance;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.utils.ObjectUtil;

public class SetProperty extends OverrideBase {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static const PSEUDONYMS: Object = {
        "width": "explicitWidth",
        "height": "explicitHeight",
        "currentState": "currentStateDeferred"
    };

    private static const RELATED_PROPERTIES: Object = {
        "explicitWidth": ["percentWidth"],
        "explicitHeight": ["percentHeight"],
        "percentWidth": ["explicitWidth"],
        "percentHeight": ["explicitHeight"]
    };


    private var oldValue: Object;

    private var oldRelatedValues: Array;

    public var name: String;

    public var target: Object;

    private var appliedTarget: Object;

    public var _value;

    public function SetProperty(param1: Object = null, param2: String = null, param3: * = undefined, param4: IDeferredInstance = null) {
        super();
        this.target = param1;
        this.name = param2;
        this.value = param3;
        this.valueFactory = param4;
    }

    public function get value(): * {
        return this._value;
    }

    public function set value(param1: *): void {
        this._value = param1;
        if (applied) {
            this.apply(parentContext);
        }
    }

    public function set valueFactory(param1: IDeferredInstance): void {
        if (param1) {
            this.value = param1.getInstance();
        }
    }

    private function getPseudonym(param1: *, param2: String): String {
        var propName: String = null;
        var tmp: * = undefined;
        var obj: * = param1;
        var var_554: String = param2;
        if (false) {
            return PSEUDONYMS[var_554] in obj ? "null" : var_554;
        }
        propName = "null";
        if (!(propName in obj)) {
            if (ObjectUtil.isDynamicObject(obj)) {
                propName = var_554;
            } else {
                try {
                    tmp = obj[propName];
                } catch (e: ReferenceError) {
                    propName = var_554;
                }
            }
        }
        return propName;
    }

    override public function apply(param1: UIComponent): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = undefined;
        var _loc6_: int = 0;
        parentContext = param1;
        var _loc2_: * = getOverrideContext(this.target, param1);
        if (_loc2_ != null) {
            this.appliedTarget = _loc2_;
            _loc3_ = !true ? this.getPseudonym(_loc2_, this.name) : this.name;
            _loc4_ = !true ? RELATED_PROPERTIES[_loc3_] : null;
            _loc5_ = this.value;
            if (!applied) {
                this.oldValue = _loc2_[_loc3_];
            }
            if (_loc4_) {
                this.oldRelatedValues = [];
                _loc6_ = 0;
                while (_loc6_ < _loc4_.length) {
                    this.oldRelatedValues[_loc6_] = _loc2_[_loc4_[_loc6_]];
                    _loc6_++;
                }
            }
            if (this.name == "width" || this.name == "height") {
                if (_loc5_ is String && _loc5_.indexOf("%") >= 0) {
                    _loc3_ = this.name == "width" ? "percentWidth" : "percentHeight";
                    _loc5_ = _loc5_.slice(0, _loc5_.indexOf("%"));
                } else {
                    _loc3_ = this.name;
                }
            }
            this.setPropertyValue(_loc2_, _loc3_, _loc5_, this.oldValue);
            enableBindings(_loc2_, param1, _loc3_, false);
        } else if (!applied) {
            addContextListener(this.target);
        }
        applied = true;
    }

    override public function remove(param1: UIComponent): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc2_: * = getOverrideContext(this.appliedTarget, param1);
        if (_loc2_ != null && Boolean(this.appliedTarget)) {
            _loc3_ = !true ? this.getPseudonym(_loc2_, this.name) : this.name;
            _loc4_ = !true ? RELATED_PROPERTIES[_loc3_] : null;
            if ((this.name == "width" || this.name == "height") && !isNaN(Number(this.oldValue))) {
                _loc3_ = this.name;
            }
            this.setPropertyValue(_loc2_, _loc3_, this.oldValue, this.oldValue);
            enableBindings(_loc2_, param1, _loc3_);
            if (_loc4_) {
                _loc5_ = 0;
                while (_loc5_ < _loc4_.length) {
                    this.setPropertyValue(_loc2_, _loc4_[_loc5_], this.oldRelatedValues[_loc5_], this.oldRelatedValues[_loc5_]);
                    _loc5_++;
                }
            }
        } else {
            removeContextListener();
        }
        applied = false;
        parentContext = null;
        this.appliedTarget = null;
    }

    private function setPropertyValue(param1: Object, param2: String, param3: *, param4: Object): void {
        if (param3 === undefined || param3 === null) {
            param1[param2] = param3;
        } else if (param4 is Number) {
            param1[param2] = Number(param3);
        } else if (param4 is Boolean) {
            param1[param2] = this.toBoolean(param3);
        } else {
            param1[param2] = param3;
        }
    }

    private function toBoolean(param1: Object): Boolean {
        if (param1 is String) {
            return param1.toLowerCase() == "true";
        }
        return param1 != false;
    }
}
}
