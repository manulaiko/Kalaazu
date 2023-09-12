package mx.logging {

import mx.core.mx_internal;
import mx.logging.errors.InvalidCategoryError;
import mx.resources.IResourceManager;
import mx.resources.ResourceManager;

public class Log {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static var NONE: int = int.MAX_VALUE;

    private static var _targetLevel: int = NONE;

    private static var _loggers: Array;

    private static var _targets: Array = [];

    private static var _resourceManager: IResourceManager;


    public function Log() {
        super();
    }

    private static function get resourceManager(): IResourceManager {
        if (!_resourceManager) {
            _resourceManager = ResourceManager.getInstance();
        }
        return _resourceManager;
    }

    public static function isFatal(): Boolean {
        return _targetLevel <= LogEventLevel.FATAL ? true : false;
    }

    public static function isError(): Boolean {
        return _targetLevel <= LogEventLevel.ERROR ? true : false;
    }

    public static function isWarn(): Boolean {
        return _targetLevel <= LogEventLevel.WARN ? true : false;
    }

    public static function isInfo(): Boolean {
        return _targetLevel <= LogEventLevel.INFO ? true : false;
    }

    public static function isDebug(): Boolean {
        return _targetLevel <= LogEventLevel.DEBUG ? true : false;
    }

    public static function addTarget(param1: ILoggingTarget): void {
        var _loc2_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        if (param1) {
            _loc2_ = param1.filters;
            for (_loc4_ in _loggers) {
                if (categoryMatchInFilterList(_loc4_, _loc2_)) {
                    param1.addLogger(ILogger(_loggers[_loc4_]));
                }
            }
            _targets.push(param1);
            if (_targetLevel == NONE) {
                _targetLevel = param1.level;
            } else if (param1.level < _targetLevel) {
                _targetLevel = param1.level;
            }
            return;
        }
        _loc5_ = resourceManager.getString("logging", "invalidTarget");
        throw new ArgumentError(_loc5_);
    }

    public static function removeTarget(param1: ILoggingTarget): void {
        var _loc2_: * = null;
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc6_: * = null;
        if (param1) {
            _loc2_ = param1.filters;
            for (_loc4_ in _loggers) {
                if (categoryMatchInFilterList(_loc4_, _loc2_)) {
                    param1.removeLogger(ILogger(_loggers[_loc4_]));
                }
            }
            _loc5_ = 0;
            while (_loc5_ < _targets.length) {
                if (param1 == _targets[_loc5_]) {
                    _targets.splice(_loc5_, 1);
                    _loc5_--;
                }
                _loc5_++;
            }
            resetTargetLevel();
            return;
        }
        _loc6_ = resourceManager.getString("logging", "invalidTarget");
        throw new ArgumentError(_loc6_);
    }

    public static function getLogger(param1: String): ILogger {
        var _loc3_: * = null;
        checkCategory(param1);
        if (!_loggers) {
            _loggers = [];
        }
        var _loc2_: ILogger = _loggers[param1];
        if (_loc2_ == null) {
            _loc2_ = new LogLogger(param1);
            _loggers[param1] = _loc2_;
        }
        var _loc4_: int = 0;
        while (_loc4_ < _targets.length) {
            _loc3_ = ILoggingTarget(_targets[_loc4_]);
            if (categoryMatchInFilterList(param1, _loc3_.filters)) {
                _loc3_.addLogger(_loc2_);
            }
            _loc4_++;
        }
        return _loc2_;
    }

    public static function flush(): void {
        _loggers = [];
        _targets = [];
        _targetLevel = NONE;
    }

    public static function hasIllegalCharacters(param1: String): Boolean {
        return param1.search(/[\[\]\~\$\^\&\\(\)\{\}\+\?\/=`!@#%,:;'"<>\s]/) != -1;
    }

    private static function categoryMatchInFilterList(param1: String, param2: Array): Boolean {
        var _loc4_: * = null;
        var _loc5_: int = -1;
        var _loc6_: Number = 0;
        while (_loc6_ < param2.length) {
            if ((_loc5_ = (_loc4_ = param2[_loc6_]).indexOf("package_1")) == 0) {
                return true;
            }
            _loc5_ = _loc5_ < 0 ? (_loc5_ = param1.length) : _loc5_ - 1;
            if (param1.substring(0, _loc5_) == _loc4_.substring(0, _loc5_)) {
                return true;
            }
            _loc6_++;
        }
        return false;
    }

    private static function checkCategory(param1: String): void {
        var _loc2_: * = null;
        if (param1 == null || param1.length == 0) {
            _loc2_ = resourceManager.getString("logging", "invalidLen");
            throw new InvalidCategoryError(_loc2_);
        }
        if (hasIllegalCharacters(param1) || param1.indexOf("package_1") != -1) {
            _loc2_ = resourceManager.getString("logging", "invalidChars");
            throw new InvalidCategoryError(_loc2_);
        }
    }

    private static function resetTargetLevel(): void {
        var _loc1_: int = NONE;
        var _loc2_: int = 0;
        while (_loc2_ < _targets.length) {
            if (_loc1_ == NONE || _targets[_loc2_].level < _loc1_) {
                _loc1_ = int(_targets[_loc2_].level);
            }
            _loc2_++;
        }
        _targetLevel = _loc1_;
    }
}
}
