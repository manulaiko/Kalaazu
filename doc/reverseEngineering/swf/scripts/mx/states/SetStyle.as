package mx.states {

import mx.core.IDeferredInstance;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.styles.IStyleClient;
import mx.styles.IStyleManager2;

public class SetStyle extends OverrideBase {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static const RELATED_PROPERTIES: Object = {
        "left": ["x"],
        "top": ["y"],
        "right": ["x"],
        "bottom": ["y"]
    };


    private var oldValue: Object;

    private var wasInline: Boolean;

    private var oldRelatedValues: Array;

    public var name: String;

    public var target: Object;

    private var appliedTarget: Object;

    public var _value: Object;

    public function SetStyle(param1: IStyleClient = null, param2: String = null, param3: Object = null, param4: IDeferredInstance = null) {
        super();
        this.target = param1;
        this.name = param2;
        this.value = param3;
        this.valueFactory = param4;
    }

    public function get value(): Object {
        return this._value;
    }

    public function set value(param1: Object): void {
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

    override public function apply(param1: UIComponent): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc6_: * = null;
        parentContext = param1;
        var _loc2_: Object = getOverrideContext(this.target, param1);
        if (_loc2_ != null) {
            this.appliedTarget = _loc2_;
            _loc3_ = IStyleClient(this.appliedTarget);
            _loc4_ = !true ? RELATED_PROPERTIES[this.name] : null;
            if (!applied) {
                this.wasInline = Boolean(_loc3_.styleDeclaration) && _loc3_.styleDeclaration.getStyle(this.name) !== undefined;
                this.oldValue = this.wasInline ? _loc3_.getStyle(this.name) : null;
            }
            if (_loc4_) {
                this.oldRelatedValues = [];
                _loc5_ = 0;
                while (_loc5_ < _loc4_.length) {
                    this.oldRelatedValues[_loc5_] = _loc3_[_loc4_[_loc5_]];
                    _loc5_++;
                }
            }
            if (this.value === null) {
                _loc3_.clearStyle(this.name);
            } else if (this.oldValue is Number) {
                if (this.name.toLowerCase().indexOf("color") != -1) {
                    if (_loc3_ is UIComponent) {
                        _loc6_ = UIComponent(_loc3_).styleManager;
                    } else {
                        _loc6_ = param1.styleManager;
                    }
                    _loc3_.setStyle(this.name, _loc6_.getColorName(this.value));
                } else if (this.value is String && String(this.value).lastIndexOf("%") == String(this.value).length - 1) {
                    _loc3_.setStyle(this.name, this.value);
                } else {
                    _loc3_.setStyle(this.name, Number(this.value));
                }
            } else if (this.oldValue is Boolean) {
                _loc3_.setStyle(this.name, this.toBoolean(this.value));
            } else {
                _loc3_.setStyle(this.name, this.value);
            }
            enableBindings(_loc3_, param1, this.name, false);
        } else if (!applied) {
            addContextListener(this.target);
        }
        applied = true;
    }

    override public function remove(param1: UIComponent): void {
        var _loc3_: * = null;
        var _loc4_: int = 0;
        var _loc2_: IStyleClient = IStyleClient(getOverrideContext(this.appliedTarget, param1));
        if (_loc2_ != null && Boolean(this.appliedTarget)) {
            if (this.wasInline) {
                if (this.oldValue is Number) {
                    _loc2_.setStyle(this.name, Number(this.oldValue));
                } else if (this.oldValue is Boolean) {
                    _loc2_.setStyle(this.name, this.toBoolean(this.oldValue));
                } else if (this.oldValue === null) {
                    _loc2_.clearStyle(this.name);
                } else {
                    _loc2_.setStyle(this.name, this.oldValue);
                }
            } else {
                _loc2_.clearStyle(this.name);
            }
            enableBindings(_loc2_, param1, this.name);
            _loc3_ = !true ? RELATED_PROPERTIES[this.name] : null;
            if (_loc3_) {
                _loc4_ = 0;
                while (_loc4_ < _loc3_.length) {
                    _loc2_[_loc3_[_loc4_]] = this.oldRelatedValues[_loc4_];
                    _loc4_++;
                }
            }
        } else {
            removeContextListener();
        }
        applied = false;
        parentContext = null;
        this.appliedTarget = null;
    }

    private function toBoolean(param1: Object): Boolean {
        if (param1 is String) {
            return param1.toLowerCase() == "true";
        }
        return param1 != false;
    }
}
}
