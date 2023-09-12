package package_46 {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.geom.Point;

import net.bigpoint.darkorbit.gui.class_1499;
import net.bigpoint.darkorbit.gui.class_176;
import net.bigpoint.darkorbit.gui.class_58;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureWindowVO;

import package_11.class_39;

import package_30.class_130;
import package_30.class_91;

import package_33.class_183;
import package_33.class_93;

import package_9.ResourceManager;

public class class_973 {

    private static const const_1904: String = "horizontal";

    private static const const_573: String = "noAlign";


    public function class_973() {
        super();
    }

    public static function method_5864(param1: class_58, param2: class_131, param3: FeatureWindowVO, param4: class_39): void {
        if (param2 == null) {
            return;
        }
        var _loc5_: XMLList = param3.definition.infoFieldContainers;
        var _loc6_: XMLList = param3.definition.simpleContainers;
        method_547(param2, _loc5_, param1, param4);
        method_704(param2, _loc6_, param1);
    }

    private static function method_704(param1: class_131, param2: XMLList, param3: class_58): void {
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc6_: * = null;
        for each(_loc5_ in param2) {
            _loc4_ = int(_loc5_.@id);
            _loc6_ = new class_93(param3, _loc4_);
            if (_loc5_.@x.length() > 0) {
                _loc6_.x = int(_loc5_.@x);
            }
            if (_loc5_.@y.length() > 0) {
                _loc6_.y = int(_loc5_.@y);
            }
            param1.method_1655(_loc6_);
        }
    }

    private static function method_547(param1: class_131, param2: XMLList, param3: class_58, param4: class_39): int {
        var _loc5_: int = 0;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: int = 0;
        var _loc9_: int = 0;
        var _loc10_: int = 0;
        var _loc11_: * = null;
        var _loc12_: int = 0;
        var _loc13_: * = null;
        var _loc14_: * = null;
        var _loc15_: * = null;
        var _loc16_: int = 0;
        var _loc17_: * = null;
        var _loc18_: int = 0;
        var _loc19_: * = null;
        var _loc20_: * = null;
        var _loc21_: * = null;
        for each(_loc6_ in param2) {
            _loc5_ = int(_loc6_.@id);
            _loc7_ = new class_183(param3, _loc5_);
            _loc8_ = 100;
            _loc9_ = 0;
            if (_loc6_.@align.length() > 0) {
                if (_loc6_.@align == const_1904) {
                    _loc9_ = 0;
                } else if (_loc6_.@align == const_573) {
                    _loc9_ = 0;
                }
            }
            if (_loc6_.@x_0.length() > 0 && _loc6_.@y_0.length() > 0) {
                _loc7_.method_5942(new Point(_loc6_.@x_0, _loc6_.@y_0));
            }
            if (_loc6_.@x_1.length() > 0 && _loc6_.@y_1.length() > 0) {
                _loc7_.method_5942(new Point(_loc6_.@x_1, _loc6_.@y_1));
            }
            if (_loc6_.@textFieldWidth.length() > 0) {
                _loc8_ = int(_loc6_.@textFieldWidth);
            }
            for each(_loc11_ in _loc6_.infoField) {
                _loc12_ = int(_loc11_.@id);
                if (_loc11_.@linkage.length() > 0) {
                    _loc20_ = _loc11_.@linkage;
                    _loc13_ = (param4 = class_39(ResourceManager.name_15.getFinisher("ui"))).getEmbeddedBitmap(_loc20_);
                } else {
                    _loc13_ = new Bitmap(new BitmapData(24, 24, true, 0));
                }
                _loc14_ = null;
                if (_loc11_.@languageKey.length() > 0) {
                    _loc14_ = _loc11_.@languageKey;
                }
                _loc15_ = null;
                if (_loc11_.@bar.length() > 0) {
                    _loc15_ = (_loc21_ = _loc11_.@bar).split(",");
                }
                _loc16_ = 0;
                if ((_loc17_ = class_1499.method_1262(_loc12_)) != null) {
                    _loc16_ = int(_loc17_.var_3041);
                }
                if (_loc11_.@width.length() > 0) {
                    _loc10_ = int(_loc11_.@width);
                } else {
                    _loc10_ = -1;
                }
                _loc18_ = 1;
                if (_loc11_.@lineCount.length() > 0) {
                    _loc18_ = int(_loc11_.@lineCount);
                }
                _loc19_ = new class_130(param3, _loc12_, _loc13_, _loc10_, _loc15_, _loc14_, _loc16_, _loc18_);
                switch (_loc12_) {
                    case class_91.const_2410:
                    case class_91.const_2982:
                    case class_91.const_2130:
                        _loc19_.var_226 = /%COUNT%/;
                        break;
                    case class_91.const_692:
                        _loc19_.var_226 = /%AMOUNT%/;
                }
                if (_loc11_.@textColor.length() > 0) {
                    _loc19_.setColor(parseInt("0x" + String(_loc11_.@textColor)));
                }
                _loc7_.addElement(_loc19_, _loc9_, 1);
                if (_loc12_ == class_91.const_692) {
                    _loc7_.updateInfoField(class_91.const_692);
                }
            }
            param1.method_1655(_loc7_);
            _loc7_.method_558();
        }
        return _loc5_;
    }
}
}
