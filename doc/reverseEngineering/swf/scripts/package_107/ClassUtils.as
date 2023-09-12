package package_107 {

import flash.events.TimerEvent;
import flash.system.ApplicationDomain;
import flash.utils.*;

public class ClassUtils {

    private static const const_1084: String = "::";

    public static const const_1628: uint = 60000;

    public static var var_3822: uint = const_1628;

    private static var var_2601: Object = {};

    private static var _timer: Timer;


    public function ClassUtils() {
        super();
    }

    public static function method_541(param1: *, param2: ApplicationDomain = null): Class {
        param2 = param2 == null ? ApplicationDomain.currentDomain : param2;
        var _loc3_: String = getQualifiedClassName(param1);
        return method_4271(_loc3_, param2);
    }

    public static function method_4271(param1: String, param2: ApplicationDomain = null): Class {
        var var_5: Class = null;
        var var_554: String = param1;
        var var_4: ApplicationDomain = param2;
        var_4 = var_4 == null ? ApplicationDomain.currentDomain : var_4;
        if (!var_4) {
            var_4 = ApplicationDomain.currentDomain;
        }
        while (!var_4.hasDefinition(var_554)) {
            if (!var_4.parentDomain) {
                break;
            }
            var_4 = var_4.parentDomain;
        }
        try {
            var_5 = var_4.getDefinition(var_554) as Class;
        } catch (e: ReferenceError) {
            throw new class_2550("A class with the name \'" + var_554 + "\' could not be found.");
        }
        return var_5;
    }

    public static function getName(param1: Class): String {
        return method_2978(method_3656(param1));
    }

    public static function method_2978(param1: String): String {
        var _loc2_: String = "";
        var _loc3_: int = param1.indexOf(const_1084);
        if (_loc3_ == -1) {
            _loc2_ = param1;
        } else {
            _loc2_ = param1.substring(_loc3_ + const_1084.length, param1.length);
        }
        return _loc2_;
    }

    public static function method_3656(param1: Class, param2: Boolean = false): String {
        var _loc3_: String = getQualifiedClassName(param1);
        if (param2) {
            _loc3_ = method_1117(_loc3_);
        }
        return _loc3_;
    }

    public static function method_5313(param1: Class, param2: Class, param3: ApplicationDomain = null): Boolean {
        param3 = param3 == null ? ApplicationDomain.currentDomain : param3;
        return param1 === param2 || Boolean(method_5726(param2, param1, param3)) || Boolean(method_3458(param2, param1, param3));
    }

    public static function method_274(param1: *): Boolean {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: int = 0;
        if (param1 is Class) {
            _loc3_ = getQualifiedClassName(param1);
            _loc2_ = _loc3_.substr(0, _loc3_.indexOf("::"));
        } else if (param1 is String) {
            _loc3_ = param1.toString();
            if ((_loc4_ = _loc3_.indexOf("::")) > 0) {
                _loc2_ = _loc3_.substr(0, _loc4_);
            } else {
                _loc2_ = _loc3_;
            }
        }
        return _loc2_.indexOf(".as$") > -1;
    }

    public static function method_5726(param1: Class, param2: Class, param3: ApplicationDomain = null): Boolean {
        var var_1058: Class = param1;
        var var_3746: Class = param2;
        var var_4: ApplicationDomain = param3;
        var_4 = var_4 == null ? ApplicationDomain.currentDomain : var_4;
        var var_2447: XML = method_2155(var_1058, var_4);
        var var_708: String = getQualifiedClassName(var_3746);
        return var_2447.factory.extendsClass.(@type == parentName).length() != 0;
    }

    public static function method_3563(param1: Class, param2: ApplicationDomain = null): Class {
        var _loc3_: * = null;
        param2 = param2 == null ? ApplicationDomain.currentDomain : param2;
        var _loc5_: XMLList;
        var _loc4_: XML;
        if ((_loc5_ = (_loc4_ = method_2155(param1, param2)).factory.extendsClass).length() > 0) {
            _loc3_ = ClassUtils.method_4271(_loc5_[0].@type);
        }
        return _loc3_;
    }

    public static function method_4226(param1: Class): String {
        var _loc2_: String = method_6380(param1);
        var _loc3_: int = _loc2_.indexOf(const_1084) + const_1084.length;
        return _loc2_.substring(_loc3_, _loc2_.length);
    }

    public static function method_6380(param1: Class, param2: Boolean = false): String {
        var _loc3_: String = getQualifiedSuperclassName(param1);
        if (param2) {
            _loc3_ = method_1117(_loc3_);
        }
        return _loc3_;
    }

    public static function method_3458(param1: Class, param2: Class, param3: ApplicationDomain = null): Boolean {
        var var_5: Boolean = false;
        var var_2447: XML = null;
        var var_1058: Class = param1;
        var var_4601: Class = param2;
        var var_4: ApplicationDomain = param3;
        var_4 = var_4 == null ? ApplicationDomain.currentDomain : var_4;
        if (var_1058 == null) {
            var_5 = false;
        } else {
            var_2447 = method_2155(var_1058, var_4);
            var_5 = var_2447.factory.implementsInterface.(@type == getQualifiedClassName(interfaze)).length() != 0;
        }
        return var_5;
    }

    public static function method_2600(param1: Class): Boolean {
        return param1 === Object ? false : describeType(param1).factory.extendsClass.length() == 0;
    }

    public static function method_3087(param1: Class): Array {
        var _loc2_: Array = method_5476(param1);
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_.length) {
            _loc2_[_loc3_] = method_2978(_loc2_[_loc3_]);
            _loc3_++;
        }
        return _loc2_;
    }

    public static function method_5476(param1: Class, param2: Boolean = false, param3: ApplicationDomain = null): Array {
        var _loc7_: int = 0;
        var _loc8_: int = 0;
        var _loc9_: * = null;
        param3 = param3 == null ? ApplicationDomain.currentDomain : param3;
        var _loc4_: * = [];
        var _loc6_: XMLList;
        var _loc5_: XML;
        if (_loc6_ = (_loc5_ = method_2155(param1, param3)).factory.implementsInterface) {
            _loc7_ = _loc6_.length();
            _loc8_ = 0;
            while (_loc8_ < _loc7_) {
                _loc9_ = _loc6_[_loc8_].@type.toString();
                if (param2) {
                    _loc9_ = method_1117(_loc9_);
                }
                _loc4_[_loc4_.length] = _loc9_;
                _loc8_++;
            }
        }
        return _loc4_;
    }

    public static function method_3937(param1: Class, param2: ApplicationDomain = null): Array {
        param2 = param2 == null ? ApplicationDomain.currentDomain : param2;
        var _loc3_: Array = method_5476(param1);
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_.length) {
            _loc3_[_loc4_] = ClassUtils.method_4271(_loc3_[_loc4_], param2);
            _loc4_++;
        }
        return _loc3_;
    }

    public static function newInstance(param1: Class, param2: Array = null): * {
        var _loc3_: * = undefined;
        var _loc4_: Array = param2 == null ? [] : param2;
        switch (_loc4_.length) {
            case 1:
                _loc3_ = new param1(_loc4_[0]);
                break;
            case 2:
                _loc3_ = new param1(_loc4_[0], _loc4_[1]);
                break;
            case 3:
                _loc3_ = new param1(_loc4_[0], _loc4_[1], _loc4_[2]);
                break;
            case 4:
                _loc3_ = new param1(_loc4_[0], _loc4_[1], _loc4_[2], _loc4_[3]);
                break;
            case 5:
                _loc3_ = new param1(_loc4_[0], _loc4_[1], _loc4_[2], _loc4_[3], _loc4_[4]);
                break;
            case 6:
                _loc3_ = new param1(_loc4_[0], _loc4_[1], _loc4_[2], _loc4_[3], _loc4_[4], _loc4_[5]);
                break;
            case 7:
                _loc3_ = new param1(_loc4_[0], _loc4_[1], _loc4_[2], _loc4_[3], _loc4_[4], _loc4_[5], _loc4_[6]);
                break;
            case 8:
                _loc3_ = new param1(_loc4_[0], _loc4_[1], _loc4_[2], _loc4_[3], _loc4_[4], _loc4_[5], _loc4_[6], _loc4_[7]);
                break;
            case 9:
                _loc3_ = new param1(_loc4_[0], _loc4_[1], _loc4_[2], _loc4_[3], _loc4_[4], _loc4_[5], _loc4_[6], _loc4_[7], _loc4_[8]);
                break;
            case 10:
                _loc3_ = new param1(_loc4_[0], _loc4_[1], _loc4_[2], _loc4_[3], _loc4_[4], _loc4_[5], _loc4_[6], _loc4_[7], _loc4_[8], _loc4_[9]);
                break;
            default:
                _loc3_ = new param1();
        }
        return _loc3_;
    }

    public static function method_1117(param1: String): String {
        return param1.replace(const_1084, ".");
    }

    public static function method_4795(): void {
        var_2601 = {};
        if (Boolean(_timer) && false) {
            _timer.stop();
        }
    }

    private static function timerHandler(param1: TimerEvent): void {
        method_4795();
    }

    private static function method_2155(param1: Object, param2: ApplicationDomain): XML {
        var _loc4_: * = null;
        class_2549.method_2478(param1, "The object argument must not be null");
        var _loc3_: String = getQualifiedClassName(param1);
        if (var_2601.hasOwnProperty(_loc3_)) {
            _loc4_ = var_2601[_loc3_];
        } else {
            if (!_timer) {
                _timer = new Timer(var_3822, 1);
                _timer.addEventListener(TimerEvent.TIMER, timerHandler);
            }
            if (!(param1 is Class)) {
                if (param1.hasOwnProperty("constructor")) {
                    param1 = param1.constructor;
                } else {
                    param1 = method_4271(_loc3_, param2);
                }
            }
            _loc4_ = describeType(param1);
            var_2601[_loc3_] = _loc4_;
            if (true) {
                _timer.start();
            }
        }
        return _loc4_;
    }

    private static function method_2139(param1: String, param2: ApplicationDomain = null): XML {
        param2 = param2 == null ? ApplicationDomain.currentDomain : param2;
        var _loc3_: Class = method_4271(param1, param2);
        return method_2155(_loc3_, param2);
    }
}
}
