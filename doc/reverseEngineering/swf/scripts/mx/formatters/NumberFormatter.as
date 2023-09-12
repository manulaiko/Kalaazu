package mx.formatters {

import mx.core.mx_internal;

public class NumberFormatter extends Formatter {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var _decimalSeparatorFrom: String;

    private var decimalSeparatorFromOverride: String;

    private var _decimalSeparatorTo: String;

    private var decimalSeparatorToOverride: String;

    private var _precision: Object;

    private var precisionOverride: Object;

    private var _rounding: String;

    private var roundingOverride: String;

    private var _thousandsSeparatorFrom: String;

    private var thousandsSeparatorFromOverride: String;

    private var _thousandsSeparatorTo: String;

    private var thousandsSeparatorToOverride: String;

    private var _useNegativeSign: Object;

    private var useNegativeSignOverride: Object;

    private var _useThousandsSeparator: Object;

    private var useThousandsSeparatorOverride: Object;

    public function NumberFormatter() {
        super();
    }

    public function get decimalSeparatorFrom(): String {
        return this._decimalSeparatorFrom;
    }

    public function set decimalSeparatorFrom(param1: String): void {
        this.decimalSeparatorFromOverride = param1;
        this._decimalSeparatorFrom = param1 != null ? param1 : resourceManager.getString("SharedResources", "decimalSeparatorFrom");
    }

    public function get decimalSeparatorTo(): String {
        return this._decimalSeparatorTo;
    }

    public function set decimalSeparatorTo(param1: String): void {
        this.decimalSeparatorToOverride = param1;
        this._decimalSeparatorTo = param1 != null ? param1 : resourceManager.getString("SharedResources", "decimalSeparatorTo");
    }

    public function get precision(): Object {
        return this._precision;
    }

    public function set precision(param1: Object): void {
        this.precisionOverride = param1;
        this._precision = param1 != null ? int(param1) : resourceManager.getInt("formatters", "numberFormatterPrecision");
    }

    public function get rounding(): String {
        return this._rounding;
    }

    public function set rounding(param1: String): void {
        this.roundingOverride = param1;
        this._rounding = param1 != null ? param1 : resourceManager.getString("formatters", "rounding");
    }

    public function get thousandsSeparatorFrom(): String {
        return this._thousandsSeparatorFrom;
    }

    public function set thousandsSeparatorFrom(param1: String): void {
        this.thousandsSeparatorFromOverride = param1;
        this._thousandsSeparatorFrom = param1 != null ? param1 : resourceManager.getString("SharedResources", "thousandsSeparatorFrom");
    }

    public function get thousandsSeparatorTo(): String {
        return this._thousandsSeparatorTo;
    }

    public function set thousandsSeparatorTo(param1: String): void {
        this.thousandsSeparatorToOverride = param1;
        this._thousandsSeparatorTo = param1 != null ? param1 : resourceManager.getString("SharedResources", "thousandsSeparatorTo");
    }

    public function get useNegativeSign(): Object {
        return this._useNegativeSign;
    }

    public function set useNegativeSign(param1: Object): void {
        this.useNegativeSignOverride = param1;
        this._useNegativeSign = param1 != null ? Boolean(param1) : resourceManager.getBoolean("formatters", "useNegativeSignInNumber");
    }

    public function get useThousandsSeparator(): Object {
        return this._useThousandsSeparator;
    }

    public function set useThousandsSeparator(param1: Object): void {
        this.useThousandsSeparatorOverride = param1;
        this._useThousandsSeparator = param1 != null ? Boolean(param1) : resourceManager.getBoolean("formatters", "useThousandsSeparator");
    }

    override protected function resourcesChanged(): void {
        super.resourcesChanged();
        this.decimalSeparatorFrom = this.decimalSeparatorFromOverride;
        this.decimalSeparatorTo = this.decimalSeparatorToOverride;
        this.precision = this.precisionOverride;
        this.rounding = this.roundingOverride;
        this.thousandsSeparatorFrom = this.thousandsSeparatorFromOverride;
        this.thousandsSeparatorTo = this.thousandsSeparatorToOverride;
        this.useNegativeSign = this.useNegativeSignOverride;
        this.useThousandsSeparator = this.useThousandsSeparatorOverride;
    }

    override public function format(param1: Object): String {
        var _loc9_: * = null;
        var _loc10_: Number = NaN;
        if (error) {
            error = null;
        }
        if (Boolean(this.useThousandsSeparator) && (this.decimalSeparatorFrom == this.thousandsSeparatorFrom || this.decimalSeparatorTo == this.thousandsSeparatorTo)) {
            error = defaultInvalidFormatError;
            return "";
        }
        if (this.decimalSeparatorTo == "" || !isNaN(Number(this.decimalSeparatorTo))) {
            error = defaultInvalidFormatError;
            return "";
        }
        var _loc2_: NumberBase = new NumberBase(this.decimalSeparatorFrom, this.thousandsSeparatorFrom, this.decimalSeparatorTo, this.thousandsSeparatorTo);
        if (param1 is String) {
            param1 = _loc2_.parseNumberString(String(param1));
        }
        if (param1 === null || isNaN(Number(param1))) {
            error = defaultInvalidValueError;
            return "";
        }
        var _loc3_: * = Number(param1) < 0;
        var _loc4_: String;
        (_loc4_ = param1.toString()).toLowerCase();
        var _loc5_: int;
        if ((_loc5_ = _loc4_.indexOf("e")) != -1) {
            _loc4_ = _loc2_.expandExponents(_loc4_);
        }
        var _loc6_: Array;
        var _loc7_: int = !!(_loc6_ = _loc4_.split("."))[1] ? int(String(_loc6_[1]).length) : 0;
        if (this.precision <= _loc7_) {
            if (this.rounding != NumberBaseRoundType.NONE) {
                _loc4_ = _loc2_.formatRoundingWithPrecision(_loc4_, this.rounding, int(this.precision));
            }
        }
        var _loc8_: Number = Number(_loc4_);
        if (Math.abs(_loc8_) >= 1) {
            _loc6_ = _loc4_.split(".");
            _loc9_ = !!this.useThousandsSeparator ? _loc2_.formatThousands(String(_loc6_[0])) : String(_loc6_[0]);
            if (_loc6_[1] != null && _loc6_[1] != "") {
                _loc4_ = _loc9_ + this.decimalSeparatorTo + _loc6_[1];
            } else {
                _loc4_ = _loc9_;
            }
        } else if (Math.abs(_loc8_) > 0) {
            if (_loc4_.indexOf("e") != -1) {
                _loc4_ = (_loc10_ = Math.abs(_loc8_) + 1).toString();
            }
            _loc4_ = this.decimalSeparatorTo + _loc4_.substring(_loc4_.indexOf(".") + 1);
        }
        _loc4_ = _loc2_.formatPrecision(_loc4_, int(this.precision));
        if (Number(_loc4_) == 0) {
            _loc3_ = false;
        }
        if (_loc3_) {
            _loc4_ = _loc2_.formatNegative(_loc4_, this.useNegativeSign);
        }
        if (!_loc2_.isValid) {
            error = defaultInvalidFormatError;
            return "";
        }
        return _loc4_;
    }
}
}
