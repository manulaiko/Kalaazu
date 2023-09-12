package mx.utils {

import flash.system.Capabilities;

import mx.core.IFlexModuleFactory;
import mx.core.mx_internal;

public class MediaQueryParser {

    public static var platformMap: Object = {
        "AND": "android",
        "IOS": "ios",
        "MAC": "macintosh",
        "WIN": "windows",
        "LNX": "linux",
        "QNX": "qnx"
    };

    private static var _instance: MediaQueryParser;


    mx_internal var goodQueries: Object;

    mx_internal var badQueries: Object;

    public var type: String = "screen";

    public var applicationDpi: Number;

    public var osPlatform: String;

    public function MediaQueryParser(param1: IFlexModuleFactory = null) {
        this.mx_internal::goodQueries = {};
        this.mx_internal::badQueries = {};
        super();
        this.applicationDpi = DensityUtil.getRuntimeDPI();
        if (param1) {
            if (param1.info()["applicationDPI"] != null) {
                this.applicationDpi = param1.info()["applicationDPI"];
            }
        }
        this.osPlatform = this.getPlatform();
    }

    public static function get instance(): MediaQueryParser {
        return _instance;
    }

    public static function set instance(param1: MediaQueryParser): void {
        if (!_instance) {
            _instance = param1;
        }
    }

    public function parse(param1: String): Boolean {
        var _loc5_: Boolean = false;
        var _loc6_: * = null;
        var _loc7_: Boolean = false;
        var _loc8_: * = null;
        var _loc9_: int = 0;
        param1 = StringUtil.trim(param1);
        param1 = param1.toLowerCase();
        if (param1 == "") {
            return true;
        }
        if (param1 == "all") {
            return true;
        }
        if (this.mx_internal::goodQueries[param1]) {
            return true;
        }
        if (this.mx_internal::badQueries[param1]) {
            return false;
        }
        var _loc2_: Array = param1.split(", ");
        var _loc3_: int = _loc2_.length;
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_) {
            _loc6_ = _loc2_[_loc4_];
            _loc7_ = false;
            if (_loc6_.indexOf("only ") == 0) {
                _loc6_ = _loc6_.substr(5);
            }
            if (_loc6_.indexOf("not ") == 0) {
                _loc7_ = true;
                _loc6_ = _loc6_.substr(4);
            }
            _loc9_ = (_loc8_ = this.tokenizeMediaQuery(_loc6_)).length;
            if (_loc8_[0] == "all" || _loc8_[0] == this.type) {
                if (_loc9_ == 1 && !_loc7_) {
                    this.mx_internal::goodQueries[param1] = true;
                    return true;
                }
                if (_loc9_ == 2) {
                    return false;
                }
                _loc8_.shift();
                _loc8_.shift();
                if ((_loc5_ = this.evalExpressions(_loc8_)) && !_loc7_ || !_loc5_ && _loc7_) {
                    this.mx_internal::goodQueries[param1] = true;
                    return true;
                }
            } else if (_loc7_) {
                this.mx_internal::goodQueries[param1] = true;
                return true;
            }
            _loc4_++;
        }
        this.mx_internal::badQueries[param1] = true;
        return false;
    }

    private function tokenizeMediaQuery(param1: String): Array {
        var _loc9_: * = null;
        var _loc2_: * = [];
        var _loc3_: int = param1.indexOf("(");
        if (_loc3_ == 0) {
            _loc2_.push("all");
            _loc2_.push("and");
        } else if (_loc3_ == -1) {
            return [param1];
        }
        var _loc4_: int = 0;
        var _loc5_: Boolean = false;
        var _loc6_: int = param1.length;
        var _loc7_: * = [];
        var _loc8_: int = 0;
        while (_loc8_ < _loc6_) {
            _loc9_ = param1.charAt(_loc8_);
            if (!(StringUtil.isWhitespace(_loc9_) && _loc7_.length == 0)) {
                if (_loc9_ == "/" && _loc8_ < _loc6_ - 1 && param1.charAt(_loc8_ + 1) == "package_1") {
                    _loc5_ = true;
                    _loc8_++;
                } else if (_loc5_) {
                    if (_loc9_ == "package_1" && _loc8_ < _loc6_ - 1 && param1.charAt(_loc8_ + 1) == "/") {
                        _loc5_ = false;
                        _loc8_++;
                    }
                } else {
                    if (_loc9_ == "(") {
                        _loc4_++;
                    } else if (_loc9_ == ")") {
                        _loc4_--;
                    } else {
                        _loc7_.push(_loc9_);
                    }
                    if (_loc4_ == 0 && (StringUtil.isWhitespace(_loc9_) || _loc9_ == ")")) {
                        if (_loc9_ != ")") {
                            --_loc7_.length;
                        }
                        _loc2_.push(_loc7_.join(""));
                        _loc7_.length = 0;
                    }
                }
            }
            _loc8_++;
        }
        return _loc2_;
    }

    private function evalExpressions(param1: Array): Boolean {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: Boolean = false;
        var _loc7_: Boolean = false;
        var _loc2_: int = param1.length;
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            if ((_loc4_ = param1[_loc3_]) != "and") {
                _loc5_ = _loc4_.split(":");
                _loc6_ = false;
                _loc7_ = false;
                if (_loc5_[0].indexOf("min-") == 0) {
                    _loc6_ = true;
                    _loc5_[0] = _loc5_[0].substr(4);
                } else if (_loc5_[0].indexOf("max-") == 0) {
                    _loc7_ = true;
                    _loc5_[0] = _loc5_[0].substr(4);
                }
                if (_loc5_[0].indexOf("-") > 0) {
                    _loc5_[0] = this.deHyphenate(_loc5_[0]);
                }
                if (_loc5_.length == 1) {
                    if (!(_loc5_[0] in this)) {
                        return false;
                    }
                }
                if (_loc5_.length == 2) {
                    if (!(_loc5_[0] in this)) {
                        return false;
                    }
                    if (_loc6_) {
                        if (this[_loc5_[0]] < this.normalize(_loc5_[1], typeof this[_loc5_[0]])) {
                            return false;
                        }
                    } else if (_loc7_) {
                        if (this[_loc5_[0]] > this.normalize(_loc5_[1], typeof this[_loc5_[0]])) {
                            return false;
                        }
                    } else if (this[_loc5_[0]] != this.normalize(_loc5_[1], typeof this[_loc5_[0]])) {
                        return false;
                    }
                }
            }
            _loc3_++;
        }
        return true;
    }

    private function normalize(param1: String, param2: String): Object {
        var _loc3_: int = 0;
        if (param1.charAt(0) == " ") {
            param1 = param1.substr(1);
        }
        if (param2 == "number") {
            _loc3_ = param1.indexOf("dpi");
            if (_loc3_ != -1) {
                param1 = param1.substr(0, _loc3_);
            }
            return Number(param1);
        }
        if (param2 == "int") {
            return int(param1);
        }
        if (param2 == "string") {
            if (param1.indexOf("\"") == 0) {
                if (param1.lastIndexOf("\"") == param1.length - 1) {
                    param1 = param1.substr(1, param1.length - 2);
                } else {
                    param1 = param1.substr(1);
                }
            }
        }
        return param1;
    }

    private function deHyphenate(param1: String): String {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc2_: int = param1.indexOf("-");
        while (_loc2_ > 0) {
            _loc3_ = param1.substr(_loc2_ + 1);
            param1 = param1.substr(0, _loc2_);
            _loc4_ = (_loc4_ = _loc3_.charAt(0)).toUpperCase();
            param1 += _loc4_ + _loc3_.substr(1);
            _loc2_ = param1.indexOf("-");
        }
        return param1;
    }

    private function getPlatform(): String {
        var _loc1_: String = Capabilities.version.substr(0, 3);
        if (platformMap.hasOwnProperty(_loc1_)) {
            return platformMap[_loc1_] as String;
        }
        return _loc1_.toLowerCase();
    }
}
}
