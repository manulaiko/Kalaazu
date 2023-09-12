package spark.utils {

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.filters.ShaderFilter;

import mx.core.UIComponent;
import mx.core.UIComponentGlobals;
import mx.core.mx_internal;
import mx.graphics.shaderClasses.LuminosityMaskShader;

import spark.core.MaskType;

public class MaskUtil {

    mx_internal static const VERSION: String = "4.6.0.23201";


    public function MaskUtil() {
        super();
    }

    mx_internal static function applyLuminositySettings(param1: DisplayObject, param2: String, param3: Boolean, param4: Boolean): void {
        var _loc5_: int = 0;
        var _loc6_: * = null;
        if (!param1 || param2 != MaskType.LUMINOSITY || param1.filters.length == 0) {
            return;
        }
        var _loc7_: int = param1.filters.length;
        _loc5_ = 0;
        while (_loc5_ < _loc7_) {
            if (param1.filters[_loc5_] is ShaderFilter && ShaderFilter(param1.filters[_loc5_]).shader is LuminosityMaskShader) {
                _loc6_ = param1.filters[_loc5_];
                break;
            }
            _loc5_++;
        }
        if (_loc6_) {
            LuminosityMaskShader(_loc6_.shader).mode = calculateLuminositySettings(param3, param4);
            param1.filters[_loc5_] = _loc6_;
            param1.filters = param1.filters;
        }
    }

    mx_internal static function applyMask(param1: DisplayObject, param2: DisplayObjectContainer): void {
        if (!param1) {
            return;
        }
        var _loc3_: UIComponent = param1 as UIComponent;
        if (_loc3_) {
            if (param2) {
                UIComponent(param2).mx_internal::addingChild(_loc3_);
                UIComponent(param2).mx_internal::childAdded(_loc3_);
            }
            UIComponentGlobals.mx_internal::layoutManager.validateClient(_loc3_, true);
            _loc3_.invalidateDisplayList();
            _loc3_.setActualSize(_loc3_.getExplicitOrMeasuredWidth(), _loc3_.getExplicitOrMeasuredHeight());
        }
    }

    mx_internal static function applyMaskType(param1: DisplayObject, param2: String, param3: Boolean, param4: Boolean, param5: DisplayObject): void {
        var _loc6_: * = null;
        var _loc7_: * = null;
        if (!param1) {
            return;
        }
        if (param2 == MaskType.CLIP) {
            param1.cacheAsBitmap = false;
            param1.filters = [];
        } else if (param2 == MaskType.ALPHA) {
            param1.cacheAsBitmap = true;
            param5.cacheAsBitmap = true;
        } else if (param2 == MaskType.LUMINOSITY) {
            param1.cacheAsBitmap = true;
            param5.cacheAsBitmap = true;
            (_loc6_ = new LuminosityMaskShader()).mode = calculateLuminositySettings(param3, param4);
            _loc7_ = new ShaderFilter(_loc6_);
            param1.filters = [_loc7_];
        }
    }

    private static function calculateLuminositySettings(param1: Boolean, param2: Boolean): int {
        var _loc3_: int = 0;
        if (param1) {
            _loc3_ += 1;
        }
        if (param2) {
            _loc3_ += 2;
        }
        return _loc3_;
    }
}
}
