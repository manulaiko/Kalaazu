package mx.utils {

import flash.utils.ByteArray;
import flash.utils.Dictionary;
import flash.utils.getQualifiedClassName;
import flash.xml.XMLNode;

import mx.collections.IList;
import mx.core.mx_internal;

public class ObjectUtil {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static var defaultToStringExcludes: Array = ["password", "credentials"];

    private static var refCount: int = 0;

    private static var CLASS_INFO_CACHE: Object = {};


    public function ObjectUtil() {
        super();
    }

    public static function compare(param1: Object, param2: Object, param3: int = -1): int {
        return internalCompare(param1, param2, 0, param3, new Dictionary(true));
    }

    public static function copy(param1: Object): Object {
        var _loc2_: ByteArray = new ByteArray();
        _loc2_.writeObject(param1);
        _loc2_.position = 0;
        return _loc2_.readObject();
    }

    public static function clone(param1: Object): Object {
        var _loc2_: Object = copy(param1);
        cloneInternal(_loc2_, param1);
        return _loc2_;
    }

    private static function cloneInternal(param1: Object, param2: Object): void {
        var _loc4_: * = null;
        var _loc5_: * = undefined;
        if (Boolean(param2) && param2.hasOwnProperty("uid")) {
            param1.uid = param2.uid;
        }
        var _loc3_: Object = getClassInfo(param2);
        for each(_loc5_ in _loc3_.properties) {
            if ((Boolean(_loc4_ = param2[_loc5_])) && _loc4_.hasOwnProperty("uid")) {
                cloneInternal(param1[_loc5_], _loc4_);
            }
        }
    }

    public static function isSimple(param1: Object): Boolean {
        var _loc2_: * = typeof param1;
        switch (_loc2_) {
            case "number":
            case "string":
            case "boolean":
                return true;
            case "object":
                return param1 is Date || param1 is Array;
            default:
                return false;
        }
    }

    public static function numericCompare(param1: Number, param2: Number): int {
        if (isNaN(param1) && isNaN(param2)) {
            return 0;
        }
        if (isNaN(param1)) {
            return 1;
        }
        if (isNaN(param2)) {
            return -1;
        }
        if (param1 < param2) {
            return -1;
        }
        if (param1 > param2) {
            return 1;
        }
        return 0;
    }

    public static function stringCompare(param1: String, param2: String, param3: Boolean = false): int {
        if (param1 == null && param2 == null) {
            return 0;
        }
        if (param1 == null) {
            return 1;
        }
        if (param2 == null) {
            return -1;
        }
        if (param3) {
            param1 = param1.toLocaleLowerCase();
            param2 = param2.toLocaleLowerCase();
        }
        var _loc4_: int;
        if ((_loc4_ = param1.localeCompare(param2)) < -1) {
            _loc4_ = -1;
        } else if (_loc4_ > 1) {
            _loc4_ = 1;
        }
        return _loc4_;
    }

    public static function dateCompare(param1: Date, param2: Date): int {
        if (param1 == null && param2 == null) {
            return 0;
        }
        if (param1 == null) {
            return 1;
        }
        if (param2 == null) {
            return -1;
        }
        var _loc3_: Number = param1.getTime();
        var _loc4_: Number = param2.getTime();
        if (_loc3_ < _loc4_) {
            return -1;
        }
        if (_loc3_ > _loc4_) {
            return 1;
        }
        return 0;
    }

    public static function toString(param1: Object, param2: Array = null, param3: Array = null): String {
        if (param3 == null) {
            param3 = defaultToStringExcludes;
        }
        refCount = 0;
        return internalToString(param1, 0, null, param2, param3);
    }

    private static function internalToString(param1: Object, param2: int = 0, param3: Dictionary = null, param4: Array = null, param5: Array = null): String {
        var str: String = null;
        var classInfo: Object = null;
        var properties: Array = null;
        var isArray: Boolean = false;
        var isDict: Boolean = false;
        var prop: * = undefined;
        var var_2: int = 0;
        var var_102: Object = null;
        var value: Object = param1;
        var indent: int = param2;
        var refs: Dictionary = param3;
        var namespaceURIs: Array = param4;
        var exclude: Array = param5;
        var type: String = value == null ? "null" : typeof value;
        switch (type) {
            case "boolean":
            case "number":
                return value.toString();
            case "string":
                return "\"" + value.toString() + "\"";
            case "object":
                if (value is Date) {
                    return value.toString();
                }
                if (value is XMLNode) {
                    return value.toString();
                }
                if (value is Class) {
                    return "(" + getQualifiedClassName(value) + ")";
                }
                classInfo = getClassInfo(value, exclude, {
                    "includeReadOnly": true,
                    "uris": namespaceURIs
                });
                properties = classInfo.properties;
                str = "(" + classInfo.name + ")";
                if (refs == null) {
                    refs = new Dictionary(true);
                }
                try {
                    var_102 = refs[value];
                    if (var_102 != null) {
                        str += "#" + int(var_102);
                        return str;
                    }
                } catch (e: Error) {
                    return String(value);
                }
                if (value != null) {
                    str += "#" + refCount.toString();
                    refs[value] = refCount;
                    ++refCount;
                }
                isArray = value is Array;
                isDict = value is Dictionary;
                indent += 2;
                var_2 = 0;
                while (var_2 < properties.length) {
                    str = newline(str, indent);
                    prop = properties[var_2];
                    if (isArray) {
                        str += "[";
                    } else if (isDict) {
                        str += "{";
                    }
                    if (isDict) {
                        str += internalToString(prop, indent, refs, namespaceURIs, exclude);
                    } else {
                        str += prop.toString();
                    }
                    if (isArray) {
                        str += "] ";
                    } else if (isDict) {
                        str += "} = ";
                    } else {
                        str += " = ";
                    }
                    try {
                        str += internalToString(value[prop], indent, refs, namespaceURIs, exclude);
                    } catch (e: Error) {
                        str += "?";
                    }
                    var_2++;
                }
                indent -= 2;
                return str;
                break;
            case "xml":
                return value.toXMLString();
            default:
                return "(" + type + ")";
        }
    }

    private static function newline(param1: String, param2: int = 0): String {
        var _loc3_: * = param1;
        _loc3_ += "\n";
        var _loc4_: int = 0;
        while (_loc4_ < param2) {
            _loc3_ += " ";
            _loc4_++;
        }
        return _loc3_;
    }

    private static function internalCompare(param1: Object, param2: Object, param3: int, param4: int, param5: Dictionary): int {
        var _loc9_: int = 0;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc14_: Boolean = false;
        var _loc15_: * = null;
        var _loc16_: * = null;
        var _loc17_: * = null;
        var _loc18_: int = 0;
        if (param1 == null && param2 == null) {
            return 0;
        }
        if (param1 == null) {
            return 1;
        }
        if (param2 == null) {
            return -1;
        }
        if (param1 is ObjectProxy) {
            param1 = ObjectProxy(param1).object_proxy::object;
        }
        if (param2 is ObjectProxy) {
            param2 = ObjectProxy(param2).object_proxy::object;
        }
        var _loc6_: * = typeof param1;
        var _loc7_: * = typeof param2;
        var _loc8_: int = 0;
        if (_loc6_ == _loc7_) {
            switch (_loc6_) {
                case "boolean":
                    _loc8_ = numericCompare(Number(param1), Number(param2));
                    break;
                case "number":
                    _loc8_ = numericCompare(param1 as Number, param2 as Number);
                    break;
                case "string":
                    _loc8_ = stringCompare(param1 as String, param2 as String);
                    break;
                case "object":
                    _loc9_ = param4 > 0 ? param4 - 1 : param4;
                    _loc10_ = getRef(param1, param5);
                    _loc11_ = getRef(param2, param5);
                    if (_loc10_ == _loc11_) {
                        return 0;
                    }
                    param5[_loc11_] = _loc10_;
                    if (param4 != -1 && param3 > param4) {
                        _loc8_ = stringCompare(param1.toString(), param2.toString());
                        break;
                    }
                    if (param1 is Array && param2 is Array) {
                        _loc8_ = arrayCompare(param1 as Array, param2 as Array, param3, param4, param5);
                        break;
                    }
                    if (param1 is Date && param2 is Date) {
                        _loc8_ = dateCompare(param1 as Date, param2 as Date);
                        break;
                    }
                    if (param1 is IList && param2 is IList) {
                        _loc8_ = listCompare(param1 as IList, param2 as IList, param3, param4, param5);
                        break;
                    }
                    if (param1 is ByteArray && param2 is ByteArray) {
                        _loc8_ = byteArrayCompare(param1 as ByteArray, param2 as ByteArray);
                        break;
                    }
                    if (getQualifiedClassName(param1) == getQualifiedClassName(param2)) {
                        _loc12_ = getClassInfo(param1).properties;
                        if (_loc14_ = isDynamicObject(param1)) {
                            _loc13_ = getClassInfo(param2).properties;
                            if ((_loc8_ = arrayCompare(_loc12_, _loc13_, param3, _loc9_, param5)) != 0) {
                                return _loc8_;
                            }
                        }
                        _loc18_ = 0;
                        while (_loc18_ < _loc12_.length) {
                            _loc15_ = _loc12_[_loc18_];
                            _loc16_ = param1[_loc15_];
                            _loc17_ = param2[_loc15_];
                            if ((_loc8_ = internalCompare(_loc16_, _loc17_, param3 + 1, _loc9_, param5)) != 0) {
                                return _loc8_;
                            }
                            _loc18_++;
                        }
                        break;
                    }
                    return 1;
            }
            return _loc8_;
        }
        return stringCompare(_loc6_, _loc7_);
    }

    public static function getClassInfo(param1: Object, param2: Array = null, param3: Object = null): Object {
        var propertyNames: Array;
        var var_2336: Boolean;
        var excludeObject: Object;
        var isArray: Boolean;
        var isDict: Boolean;
        var n: int = 0;
        var var_1: int = 0;
        var var_5: Object = null;
        var cacheKey: String = null;
        var className: String = null;
        var classAlias: String = null;
        var properties: XMLList = null;
        var prop: XML = null;
        var metadataInfo: Object = null;
        var classInfo: XML = null;
        var numericIndex: Boolean = false;
        var key: * = undefined;
        var p: String = null;
        var pi: Number = NaN;
        var uris: Array = null;
        var uri: String = null;
        var qName: QName = null;
        var var_2: int = 0;
        var obj: Object = param1;
        var excludes: Array = param2;
        var var_4495: Object = param3;
        if (obj is ObjectProxy) {
            obj = ObjectProxy(obj).object_proxy::object;
        }
        if (var_4495 == null) {
            var_4495 = {
                "uris": null,
                "includeReadOnly": true,
                "includeTransient": true
            };
        }
        propertyNames = [];
        var_2336 = false;
        if (typeof obj == "xml") {
            className = "XML";
            properties = obj.text();
            if (properties.length()) {
                propertyNames.push("package_1");
            }
            properties = obj.attributes();
        } else {
            classInfo = DescribeTypeCache.describeType(obj).typeDescription;
            className = classInfo.@name.toString();
            classAlias = classInfo.@alias.toString();
            var_2336 = classInfo.@isDynamic.toString() == "true";
            if (var_4495.includeReadOnly) {
                properties = classInfo..accessor.(@access != "writeonly") + classInfo..variable;
            } else {
                properties = classInfo..accessor.(@access == "readwrite") + classInfo..variable;
            }
            numericIndex = false;
        }
        if (!var_2336) {
            cacheKey = getCacheKey(obj, excludes, var_4495);
            var_5 = CLASS_INFO_CACHE[cacheKey];
            if (var_5 != null) {
                return var_5;
            }
        }
        var_5 = {};
        var_5["name"] = className;
        var_5["alias"] = classAlias;
        var_5["properties"] = propertyNames;
        var_5["dynamic"] = var_2336;
        var_5["metadata"] = metadataInfo = recordMetadata(properties);
        excludeObject = {};
        if (excludes) {
            n = excludes.length;
            var_1 = 0;
            while (var_1 < n) {
                excludeObject[excludes[var_1]] = 1;
                var_1++;
            }
        }
        isArray = className == "Array";
        isDict = className == "flash.utils::Dictionary";
        if (isDict) {
            for (key in obj) {
                propertyNames.push(key);
            }
        } else if (var_2336) {
            for (p in obj) {
                if (excludeObject[p] != 1) {
                    if (isArray) {
                        pi = parseInt(p);
                        if (isNaN(pi)) {
                            propertyNames.push(new QName("", p));
                        } else {
                            propertyNames.push(pi);
                        }
                    } else {
                        propertyNames.push(new QName("", p));
                    }
                }
            }
            numericIndex = isArray && !isNaN(Number(p));
        }
        if (!(isArray || isDict || className == "Object")) {
            if (className == "XML") {
                n = properties.length();
                var_1 = 0;
                while (var_1 < n) {
                    p = properties[var_1].name();
                    if (excludeObject[p] != 1) {
                        propertyNames.push(new QName("", "@" + p));
                    }
                    var_1++;
                }
            } else {
                n = properties.length();
                uris = var_4495.uris;
                var_1 = 0;
                while (var_1 < n) {
                    prop = properties[var_1];
                    p = prop.@name.toString();
                    uri = prop.@uri.toString();
                    if (excludeObject[p] != 1) {
                        if (!(!var_4495.includeTransient && internalHasMetadata(metadataInfo, p, "Transient"))) {
                            if (uris != null) {
                                if (uris.length == 1 && uris[0] == "package_1") {
                                    qName = new QName(uri, p);
                                    try {
                                        obj[qName];
                                        propertyNames.push();
                                    } catch (e: Error) {
                                    }
                                } else {
                                    var_2 = 0;
                                    while (var_2 < uris.length) {
                                        uri = uris[var_2];
                                        if (prop.@uri.toString() == uri) {
                                            qName = new QName(uri, p);
                                            try {
                                                obj[qName];
                                                propertyNames.push(qName);
                                            } catch (e: Error) {
                                            }
                                        }
                                        var_2++;
                                    }
                                }
                            } else if (uri.length == 0) {
                                qName = new QName(uri, p);
                                try {
                                    obj[qName];
                                    propertyNames.push(qName);
                                } catch (e: Error) {
                                }
                            }
                        }
                    }
                    var_1++;
                }
            }
        }
        propertyNames.sort(0 | (numericIndex ? Array.NUMERIC : 0));
        if (!isDict) {
            var_1 = 0;
            while (var_1 < propertyNames.length - 1) {
                if (propertyNames[var_1].toString() == propertyNames[var_1 + 1].toString()) {
                    propertyNames.splice(var_1, 1);
                    var_1--;
                }
                var_1++;
            }
        }
        if (!var_2336) {
            cacheKey = getCacheKey(obj, excludes, var_4495);
            CLASS_INFO_CACHE[cacheKey] = var_5;
        }
        return var_5;
    }

    public static function hasMetadata(param1: Object, param2: String, param3: String, param4: Array = null, param5: Object = null): Boolean {
        var _loc6_: Object;
        var _loc7_: Object = (_loc6_ = getClassInfo(param1, param4, param5))["metadata"];
        return internalHasMetadata(_loc7_, param2, param3);
    }

    public static function isDynamicObject(param1: Object): Boolean {
        var obj: Object = param1;
        try {
            obj["wootHackwoot"];
        } catch (e: Error) {
            return false;
        }
        return true;
    }

    private static function internalHasMetadata(param1: Object, param2: String, param3: String): Boolean {
        var _loc4_: * = null;
        if (param1 != null) {
            if ((_loc4_ = param1[param2]) != null) {
                if (_loc4_[param3] != null) {
                    return true;
                }
            }
        }
        return false;
    }

    private static function recordMetadata(param1: XMLList): Object {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc14_: * = null;
        var _loc15_: * = null;
        var _loc2_: * = null;
        try {
            for each(_loc3_ in param1) {
                _loc4_ = _loc3_.attribute("name").toString();
                if ((_loc5_ = _loc3_.metadata).length() > 0) {
                    if (_loc2_ == null) {
                        _loc2_ = {};
                    }
                    _loc6_ = {};
                    _loc2_[_loc4_] = _loc6_;
                    for each(_loc7_ in _loc5_) {
                        _loc8_ = _loc7_.attribute("name").toString();
                        _loc9_ = _loc7_.arg;
                        _loc10_ = {};
                        for each(_loc11_ in _loc9_) {
                            if ((_loc13_ = _loc11_.attribute("key").toString()) != null) {
                                _loc14_ = _loc11_.attribute("value").toString();
                                _loc10_[_loc13_] = _loc14_;
                            }
                        }
                        if ((_loc12_ = _loc6_[_loc8_]) != null) {
                            if (_loc12_ is Array) {
                                _loc15_ = _loc12_ as Array;
                            } else {
                                _loc15_ = [_loc12_];
                                delete _loc6_[_loc8_];
                            }
                            _loc15_.push(_loc10_);
                            _loc12_ = _loc15_;
                        } else {
                            _loc12_ = _loc10_;
                        }
                        _loc6_[_loc8_] = _loc12_;
                    }
                }
            }
        } catch (e: Error) {
        }
        return _loc2_;
    }

    private static function getCacheKey(param1: Object, param2: Array = null, param3: Object = null): String {
        var _loc5_: Number = 0;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc4_: String = getQualifiedClassName(param1);
        if (param2 != null) {
            _loc5_ = 0;
            while (_loc5_ < param2.length) {
                if ((_loc6_ = param2[_loc5_] as String) != null) {
                    _loc4_ += _loc6_;
                }
                _loc5_++;
            }
        }
        if (param3 != null) {
            for (_loc7_ in param3) {
                _loc4_ += _loc7_;
                if ((_loc8_ = param3[_loc7_] as String) != null) {
                    _loc4_ += _loc8_;
                }
            }
        }
        return _loc4_;
    }

    private static function arrayCompare(param1: Array, param2: Array, param3: int, param4: int, param5: Dictionary): int {
        var _loc7_: * = null;
        var _loc6_: int = 0;
        if (param1.length != param2.length) {
            if (param1.length < param2.length) {
                _loc6_ = -1;
            } else {
                _loc6_ = 1;
            }
        } else {
            for (_loc7_ in param1) {
                if (!param2.hasOwnProperty(_loc7_)) {
                    return -1;
                }
                if ((_loc6_ = internalCompare(param1[_loc7_], param2[_loc7_], param3, param4, param5)) != 0) {
                    return _loc6_;
                }
            }
            for (_loc7_ in param2) {
                if (!param1.hasOwnProperty(_loc7_)) {
                    return 1;
                }
            }
        }
        return _loc6_;
    }

    private static function byteArrayCompare(param1: ByteArray, param2: ByteArray): int {
        var _loc4_: int = 0;
        var _loc3_: int = 0;
        if (param1 == param2) {
            return _loc3_;
        }
        if (param1.length != param2.length) {
            if (param1.length < param2.length) {
                _loc3_ = -1;
            } else {
                _loc3_ = 1;
            }
        } else {
            _loc4_ = 0;
            while (_loc4_ < param1.length) {
                _loc3_ = numericCompare(param1[_loc4_], param2[_loc4_]);
                if (_loc3_ != 0) {
                    _loc4_ = param1.length;
                }
                _loc4_++;
            }
        }
        return _loc3_;
    }

    private static function listCompare(param1: IList, param2: IList, param3: int, param4: int, param5: Dictionary): int {
        var _loc7_: int = 0;
        var _loc6_: int = 0;
        if (param1.length != param2.length) {
            if (param1.length < param2.length) {
                _loc6_ = -1;
            } else {
                _loc6_ = 1;
            }
        } else {
            _loc7_ = 0;
            while (_loc7_ < param1.length) {
                if ((_loc6_ = internalCompare(param1.getItemAt(_loc7_), param2.getItemAt(_loc7_), param3 + 1, param4, param5)) != 0) {
                    _loc7_ = param1.length;
                }
                _loc7_++;
            }
        }
        return _loc6_;
    }

    private static function getRef(param1: Object, param2: Dictionary): Object {
        var _loc3_: Object = param2[param1];
        while (Boolean(_loc3_) && _loc3_ != param2[_loc3_]) {
            _loc3_ = param2[_loc3_];
        }
        if (!_loc3_) {
            _loc3_ = param1;
        }
        if (_loc3_ != param2[param1]) {
            param2[param1] = _loc3_;
        }
        return _loc3_;
    }
}
}
