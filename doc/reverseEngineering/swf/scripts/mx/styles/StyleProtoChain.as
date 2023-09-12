package mx.styles {

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.system.ApplicationDomain;
import flash.utils.getQualifiedClassName;
import flash.utils.getQualifiedSuperclassName;

import mx.core.FlexGlobals;
import mx.core.IFlexDisplayObject;
import mx.core.IFlexModule;
import mx.core.IFlexModuleFactory;
import mx.core.IFontContextComponent;
import mx.core.IInvalidating;
import mx.core.IUITextField;
import mx.core.IVisualElement;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.effects.EffectManager;
import mx.managers.SystemManager;
import mx.modules.IModule;
import mx.modules.ModuleManager;
import mx.utils.NameUtil;
import mx.utils.OrderedObject;
import mx.utils.object_proxy;

public class StyleProtoChain {

    mx_internal static const VERSION: String = "4.6.0.23201";

    public static var STYLE_UNINITIALIZED: Object = {};


    public function StyleProtoChain() {
        super();
    }

    public static function getClassStyleDeclarations(param1: IStyleClient): Array {
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc14_: * = null;
        var _loc2_: IStyleManager2 = getStyleManager(param1);
        var _loc3_: Boolean = _loc2_.qualifiedTypeSelectors;
        var _loc4_: String = _loc3_ ? getQualifiedClassName(param1) : param1.className;
        var _loc5_: IAdvancedStyleClient = param1 as IAdvancedStyleClient;
        var _loc7_: Array;
        var _loc6_: OrderedObject;
        var _loc8_: int = (_loc7_ = (_loc6_ = getTypeHierarchy(param1, _loc3_)).object_proxy::propertyList).length;
        var _loc9_: * = null;
        if (!_loc2_.hasAdvancedSelectors()) {
            if (_loc9_ = _loc2_.typeSelectorCache[_loc4_]) {
                return _loc9_;
            }
        }
        _loc9_ = [];
        var _loc10_: int = _loc8_ - 1;
        while (_loc10_ >= 0) {
            _loc11_ = _loc7_[_loc10_].toString();
            if (_loc2_.hasAdvancedSelectors() && _loc5_ != null) {
                if (_loc12_ = _loc2_.getStyleDeclarations(_loc11_)) {
                    _loc13_ = matchStyleDeclarations(_loc12_, _loc5_);
                    _loc9_ = _loc9_.concat(_loc13_);
                }
            } else if (_loc14_ = _loc2_.getMergedStyleDeclaration(_loc11_)) {
                _loc9_.push(_loc14_);
            }
            _loc10_--;
        }
        if (_loc2_.hasAdvancedSelectors() && _loc5_ != null) {
            _loc9_ = sortOnSpecificity(_loc9_);
        } else {
            _loc2_.typeSelectorCache[_loc4_] = _loc9_;
        }
        return _loc9_;
    }

    public static function initProtoChain(param1: IStyleClient, param2: Boolean = true): void {
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc15_: * = null;
        var _loc16_: * = null;
        var _loc17_: * = null;
        var _loc3_: IStyleManager2 = getStyleManager(param1);
        var _loc6_: UIComponent = param1 as UIComponent;
        var _loc7_: IAdvancedStyleClient = param1 as IAdvancedStyleClient;
        var _loc8_: * = null;
        var _loc9_: * = [];
        var _loc10_: Boolean = false;
        var _loc11_: Object;
        if (_loc11_ = param1.styleName) {
            if (_loc11_ is CSSStyleDeclaration) {
                _loc9_.push(CSSStyleDeclaration(_loc11_));
            } else {
                if (_loc11_ is IFlexDisplayObject || _loc11_ is IStyleClient) {
                    StyleProtoChain.initProtoChainForUIComponentStyleName(param1);
                    return;
                }
                if (_loc11_ is String) {
                    _loc10_ = true;
                }
            }
        }
        var _loc12_: Object;
        if ((Boolean(_loc12_ = _loc3_.stylesRoot)) && Boolean(_loc12_.effects)) {
            param1.registerEffects(_loc12_.effects);
        }
        var _loc13_: * = null;
        if (param1 is IVisualElement) {
            _loc13_ = IVisualElement(param1).parent as IStyleClient;
        } else if (param1 is IAdvancedStyleClient) {
            _loc13_ = IAdvancedStyleClient(param1).styleParent as IStyleClient;
        }
        if (_loc13_) {
            if ((_loc15_ = _loc13_.inheritingStyles) == StyleProtoChain.STYLE_UNINITIALIZED) {
                _loc15_ = _loc12_;
            }
            if (param1 is IModule) {
                if (_loc8_ = _loc3_.getStyleDeclaration("global")) {
                    _loc15_ = _loc8_.mx_internal::addStyleToProtoChain(_loc15_, DisplayObject(param1));
                }
            }
        } else if (Boolean(_loc6_) && _loc6_.isPopUp) {
            _loc16_ = _loc6_.mx_internal::_owner;
            if (param2 && _loc16_ && _loc16_ is IStyleClient) {
                _loc15_ = IStyleClient(_loc16_).inheritingStyles;
            } else {
                _loc15_ = FlexGlobals.topLevelApplication.inheritingStyles;
            }
        } else {
            _loc15_ = _loc3_.stylesRoot;
        }
        var _loc14_: * = null;
        if (_loc3_.hasAdvancedSelectors() && _loc7_ != null) {
            _loc4_ = (_loc14_ = getMatchingStyleDeclarations(_loc7_, _loc9_)) != null ? _loc14_.length : 0;
            _loc5_ = 0;
            while (_loc5_ < _loc4_) {
                _loc15_ = (_loc8_ = _loc14_[_loc5_]).mx_internal::addStyleToProtoChain(_loc15_, _loc6_);
                _loc12_ = _loc8_.mx_internal::addStyleToProtoChain(_loc12_, _loc6_);
                if (_loc8_.mx_internal::effects) {
                    _loc7_.registerEffects(_loc8_.mx_internal::effects);
                }
                _loc5_++;
            }
        } else {
            if (_loc10_) {
                _loc4_ = (_loc17_ = _loc11_.split(/\s+/)).length;
                _loc5_ = 0;
                while (_loc5_ < _loc4_) {
                    if (_loc17_[_loc5_].length) {
                        if (_loc8_ = _loc3_.getMergedStyleDeclaration("." + _loc17_[_loc5_])) {
                            _loc9_.push(_loc8_);
                        }
                    }
                    _loc5_++;
                }
            }
            _loc4_ = (_loc14_ = param1.getClassStyleDeclarations()) != null ? _loc14_.length : 0;
            _loc5_ = 0;
            while (_loc5_ < _loc4_) {
                _loc15_ = (_loc8_ = _loc14_[_loc5_]).mx_internal::addStyleToProtoChain(_loc15_, _loc6_);
                _loc12_ = _loc8_.mx_internal::addStyleToProtoChain(_loc12_, _loc6_);
                if (_loc8_.mx_internal::effects) {
                    param1.registerEffects(_loc8_.mx_internal::effects);
                }
                _loc5_++;
            }
            _loc4_ = _loc9_.length;
            _loc5_ = 0;
            while (_loc5_ < _loc4_) {
                if (_loc8_ = _loc9_[_loc5_]) {
                    _loc15_ = _loc8_.mx_internal::addStyleToProtoChain(_loc15_, _loc6_);
                    _loc12_ = _loc8_.mx_internal::addStyleToProtoChain(_loc12_, _loc6_);
                    if (_loc8_.mx_internal::effects) {
                        param1.registerEffects(_loc8_.mx_internal::effects);
                    }
                }
                _loc5_++;
            }
        }
        _loc8_ = param1.styleDeclaration;
        param1.inheritingStyles = !!_loc8_ ? _loc8_.mx_internal::addStyleToProtoChain(_loc15_, _loc6_) : _loc15_;
        param1.nonInheritingStyles = !!_loc8_ ? _loc8_.mx_internal::addStyleToProtoChain(_loc12_, _loc6_) : _loc12_;
    }

    public static function initProtoChainForUIComponentStyleName(param1: IStyleClient): void {
        var _loc10_: * = null;
        var _loc2_: IStyleManager2 = getStyleManager(param1);
        var _loc3_: IStyleClient = IStyleClient(param1.styleName);
        var _loc4_: DisplayObject = param1 as DisplayObject;
        var _loc5_: Object;
        if (!(_loc5_ = _loc3_.nonInheritingStyles) || _loc5_ == StyleProtoChain.STYLE_UNINITIALIZED) {
            if ((_loc5_ = _loc2_.stylesRoot).effects) {
                param1.registerEffects(_loc5_.effects);
            }
        }
        var _loc6_: Object;
        if (!(_loc6_ = _loc3_.inheritingStyles) || _loc6_ == StyleProtoChain.STYLE_UNINITIALIZED) {
            _loc6_ = _loc2_.stylesRoot;
        }
        var _loc7_: Array;
        var _loc8_: int = (_loc7_ = param1.getClassStyleDeclarations()).length;
        if (_loc3_ is StyleProxy) {
            if (_loc8_ == 0) {
                _loc5_ = addProperties(_loc5_, _loc3_, false);
            }
            _loc4_ = StyleProxy(_loc3_).source as DisplayObject;
        }
        var _loc9_: int = 0;
        while (_loc9_ < _loc8_) {
            _loc6_ = (_loc10_ = _loc7_[_loc9_]).mx_internal::addStyleToProtoChain(_loc6_, _loc4_);
            _loc6_ = addProperties(_loc6_, _loc3_, true);
            _loc5_ = _loc10_.mx_internal::addStyleToProtoChain(_loc5_, _loc4_);
            _loc5_ = addProperties(_loc5_, _loc3_, false);
            if (_loc10_.mx_internal::effects) {
                param1.registerEffects(_loc10_.mx_internal::effects);
            }
            _loc9_++;
        }
        param1.inheritingStyles = !!param1.styleDeclaration ? param1.styleDeclaration.mx_internal::addStyleToProtoChain(_loc6_, _loc4_) : _loc6_;
        param1.nonInheritingStyles = !!param1.styleDeclaration ? param1.styleDeclaration.mx_internal::addStyleToProtoChain(_loc5_, _loc4_) : _loc5_;
    }

    private static function addProperties(param1: Object, param2: IStyleClient, param3: Boolean): Object {
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc12_: int = 0;
        var _loc13_: int = 0;
        var _loc14_: * = null;
        var _loc15_: int = 0;
        var _loc4_: Object = param2 is StyleProxy && !param3 ? StyleProxy(param2).filterMap : null;
        var _loc5_: IStyleClient = param2;
        while (_loc5_ is StyleProxy) {
            _loc5_ = StyleProxy(_loc5_).source;
        }
        var _loc6_: DisplayObject = _loc5_ as DisplayObject;
        var _loc7_: IAdvancedStyleClient = param2 as IAdvancedStyleClient;
        var _loc8_: Object = param2.styleName;
        var _loc11_: IStyleManager2 = getStyleManager(_loc6_);
        if (_loc7_ != null && _loc11_.hasAdvancedSelectors()) {
            if (_loc8_ is CSSStyleDeclaration) {
                _loc9_ = [CSSStyleDeclaration(_loc8_)];
            }
            _loc9_ = getMatchingStyleDeclarations(_loc7_, _loc9_);
            _loc13_ = 0;
            while (_loc13_ < _loc9_.length) {
                if (_loc10_ = _loc9_[_loc13_]) {
                    param1 = _loc10_.mx_internal::addStyleToProtoChain(param1, _loc6_, _loc4_);
                    if (_loc10_.mx_internal::effects) {
                        param2.registerEffects(_loc10_.mx_internal::effects);
                    }
                }
                _loc13_++;
            }
            if (_loc8_ is IStyleClient) {
                param1 = addProperties(param1, IStyleClient(_loc8_), param3);
            }
        } else {
            _loc12_ = (_loc9_ = param2.getClassStyleDeclarations()).length;
            _loc13_ = 0;
            while (_loc13_ < _loc12_) {
                param1 = (_loc10_ = _loc9_[_loc13_]).mx_internal::addStyleToProtoChain(param1, _loc6_, _loc4_);
                if (_loc10_.mx_internal::effects) {
                    param2.registerEffects(_loc10_.mx_internal::effects);
                }
                _loc13_++;
            }
            if (_loc8_) {
                _loc9_ = [];
                if (typeof _loc8_ == "object") {
                    if (_loc8_ is CSSStyleDeclaration) {
                        _loc9_.push(CSSStyleDeclaration(_loc8_));
                    } else {
                        param1 = addProperties(param1, IStyleClient(_loc8_), param3);
                    }
                } else {
                    _loc14_ = _loc8_.split(/\s+/);
                    _loc15_ = 0;
                    while (_loc15_ < _loc14_.length) {
                        if (_loc14_[_loc15_].length) {
                            _loc9_.push(_loc11_.getMergedStyleDeclaration("." + _loc14_[_loc15_]));
                        }
                        _loc15_++;
                    }
                }
                _loc13_ = 0;
                while (_loc13_ < _loc9_.length) {
                    if (_loc10_ = _loc9_[_loc13_]) {
                        param1 = _loc10_.mx_internal::addStyleToProtoChain(param1, _loc6_, _loc4_);
                        if (_loc10_.mx_internal::effects) {
                            param2.registerEffects(_loc10_.mx_internal::effects);
                        }
                    }
                    _loc13_++;
                }
            }
        }
        if (param2.styleDeclaration) {
            param1 = param2.styleDeclaration.mx_internal::addStyleToProtoChain(param1, _loc6_, _loc4_);
        }
        return param1;
    }

    public static function initTextField(param1: IUITextField): void {
        var _loc8_: * = null;
        var _loc9_: int = 0;
        var _loc10_: * = null;
        var _loc2_: IStyleManager2 = StyleManager.getStyleManager(param1.moduleFactory);
        var _loc3_: Object = param1.styleName;
        var _loc4_: * = [];
        if (_loc3_) {
            if (typeof _loc3_ == "object") {
                if (!(_loc3_ is CSSStyleDeclaration)) {
                    if (_loc3_ is StyleProxy) {
                        param1.inheritingStyles = IStyleClient(_loc3_).inheritingStyles;
                        param1.nonInheritingStyles = addProperties(_loc2_.stylesRoot, IStyleClient(_loc3_), false);
                        return;
                    }
                    param1.inheritingStyles = IStyleClient(_loc3_).inheritingStyles;
                    param1.nonInheritingStyles = IStyleClient(_loc3_).nonInheritingStyles;
                    return;
                }
                _loc4_.push(CSSStyleDeclaration(_loc3_));
            } else {
                _loc8_ = _loc3_.split(/\s+/);
                _loc9_ = 0;
                while (_loc9_ < _loc8_.length) {
                    if (_loc8_[_loc9_].length) {
                        _loc4_.push(_loc2_.getMergedStyleDeclaration("." + _loc8_[_loc9_]));
                    }
                    _loc9_++;
                }
            }
        }
        var _loc5_: Object = IStyleClient(param1.parent).inheritingStyles;
        var _loc6_: Object = _loc2_.stylesRoot;
        if (!_loc5_) {
            _loc5_ = _loc2_.stylesRoot;
        }
        var _loc7_: int = 0;
        while (_loc7_ < _loc4_.length) {
            if (_loc10_ = _loc4_[_loc7_]) {
                _loc5_ = _loc10_.mx_internal::addStyleToProtoChain(_loc5_, DisplayObject(param1));
                _loc6_ = _loc10_.mx_internal::addStyleToProtoChain(_loc6_, DisplayObject(param1));
            }
            _loc7_++;
        }
        param1.inheritingStyles = _loc5_;
        param1.nonInheritingStyles = _loc6_;
    }

    public static function setStyle(param1: IStyleClient, param2: String, param3: *): void {
        var _loc4_: IStyleManager2 = getStyleManager(param1);
        if (param2 == "styleName") {
            param1.styleName = param3;
            return;
        }
        if (EffectManager.mx_internal::getEventForEffectTrigger(param2) != "") {
            EffectManager.mx_internal::setStyle(param2, param1);
        }
        var _loc5_: Boolean = Boolean(_loc4_.isInheritingStyle(param2));
        var _loc6_: * = param1.inheritingStyles != StyleProtoChain.STYLE_UNINITIALIZED;
        var _loc7_: * = param1.getStyle(param2) != param3;
        if (!param1.styleDeclaration) {
            param1.styleDeclaration = new CSSStyleDeclaration(null, _loc4_);
            param1.styleDeclaration.mx_internal::setLocalStyle(param2, param3);
            if (_loc6_) {
                param1.regenerateStyleCache(_loc5_);
            }
        } else {
            param1.styleDeclaration.mx_internal::setLocalStyle(param2, param3);
        }
        if (_loc6_ && _loc7_) {
            param1.styleChanged(param2);
            param1.notifyStyleChangeInChildren(param2, _loc5_);
        }
    }

    public static function styleChanged(param1: IInvalidating, param2: String): void {
        var _loc4_: * = null;
        var _loc3_: IStyleManager2 = getStyleManager(param1);
        if (param1 is IFontContextComponent && "hasFontContextChanged" in param1 && Boolean(param1["hasFontContextChanged"]())) {
            param1.invalidateProperties();
        }
        if (!param2 || param2 == "styleName" || param2 == "layoutDirection") {
            param1.invalidateProperties();
        }
        if (!param2 || param2 == "styleName" || Boolean(_loc3_.isSizeInvalidatingStyle(param2))) {
            param1.invalidateSize();
        }
        if (!param2 || param2 == "styleName" || param2 == "themeColor") {
            if (param1 is UIComponent) {
                param1["initThemeColor"]();
            }
        }
        param1.invalidateDisplayList();
        if (param1 is IVisualElement) {
            _loc4_ = IVisualElement(param1).parent as IInvalidating;
        }
        if (_loc4_) {
            if (param2 == "styleName" || Boolean(_loc3_.isParentSizeInvalidatingStyle(param2))) {
                _loc4_.invalidateSize();
            }
            if (param2 == "styleName" || Boolean(_loc3_.isParentDisplayListInvalidatingStyle(param2))) {
                _loc4_.invalidateDisplayList();
            }
        }
    }

    public static function matchesCSSType(param1: IAdvancedStyleClient, param2: String): Boolean {
        var _loc3_: IStyleManager2 = getStyleManager(param1);
        var _loc4_: Boolean = _loc3_.qualifiedTypeSelectors;
        var _loc5_: OrderedObject;
        return (_loc5_ = getTypeHierarchy(param1, _loc4_)).object_proxy::getObjectProperty(param2) != null;
    }

    public static function getMatchingStyleDeclarations(param1: IAdvancedStyleClient, param2: Array = null): Array {
        var _loc3_: IStyleManager2 = getStyleManager(param1);
        if (param2 == null) {
            param2 = [];
        }
        var _loc4_: Object = _loc3_.getStyleDeclarations("package_1");
        param2 = matchStyleDeclarations(_loc4_, param1).concat(param2);
        if (param2.length > 0) {
            param2 = param1.getClassStyleDeclarations().concat(param2);
            param2 = sortOnSpecificity(param2);
        } else {
            param2 = param1.getClassStyleDeclarations();
        }
        return param2;
    }

    private static function getTypeHierarchy(param1: IStyleClient, param2: Boolean = true): OrderedObject {
        var myApplicationDomain: ApplicationDomain = null;
        var factory: IFlexModuleFactory = null;
        var myRoot: DisplayObject = null;
        var type: String = null;
        var object: IStyleClient = param1;
        var qualified: Boolean = param2;
        var styleManager: IStyleManager2 = getStyleManager(object);
        var className: String = getQualifiedClassName(object);
        var hierarchy: OrderedObject = styleManager.typeHierarchyCache[className] as OrderedObject;
        if (hierarchy == null) {
            hierarchy = new OrderedObject();
            factory = ModuleManager.getAssociatedFactory(object);
            if (factory != null) {
                myApplicationDomain = ApplicationDomain(factory.info()["currentDomain"]);
            } else {
                myRoot = SystemManager.getSWFRoot(object);
                if (!myRoot) {
                    return hierarchy;
                }
                myApplicationDomain = myRoot.loaderInfo.applicationDomain;
            }
            styleManager.typeHierarchyCache[className] = hierarchy;
            while (!isStopClass(className)) {
                try {
                    if (qualified) {
                        type = className.replace("::", ".");
                    } else {
                        type = NameUtil.getUnqualifiedClassName(className);
                    }
                    hierarchy.object_proxy::setObjectProperty(type, true);
                    className = getQualifiedSuperclassName(myApplicationDomain.getDefinition(className));
                } catch (e: ReferenceError) {
                    className = null;
                }
            }
        }
        return hierarchy;
    }

    private static function isStopClass(param1: String): Boolean {
        return param1 == null || param1 == "mx.core::UIComponent" || param1 == "mx.core::UITextField" || param1 == "mx.graphics.baseClasses::GraphicElement";
    }

    private static function matchStyleDeclarations(param1: Object, param2: IAdvancedStyleClient): Array {
        var _loc8_: * = null;
        var _loc3_: * = [];
        var _loc4_: Array = param1["pseudo"];
        var _loc5_: Array = param1["class"];
        var _loc6_: Array = param1["id"];
        var _loc7_: Array = param1["unconditional"];
        for each(_loc8_ in _loc7_) {
            if (_loc8_.matchesStyleClient(param2)) {
                _loc3_.push(_loc8_);
            }
        }
        if (param2.styleName is String) {
            for each(_loc8_ in _loc5_) {
                if (_loc8_.matchesStyleClient(param2)) {
                    _loc3_.push(_loc8_);
                }
            }
        }
        if (param2.hasCSSState()) {
            for each(_loc8_ in _loc4_) {
                if (_loc8_.matchesStyleClient(param2)) {
                    _loc3_.push(_loc8_);
                }
            }
        }
        if (param2.id) {
            for each(_loc8_ in _loc6_) {
                if (_loc8_.matchesStyleClient(param2)) {
                    _loc3_.push(_loc8_);
                }
            }
        }
        if (_loc3_.length > 1) {
            _loc3_.sortOn("selectorIndex", Array.NUMERIC);
        }
        if (param1.parent) {
            _loc3_ = matchStyleDeclarations(param1.parent, param2).concat(_loc3_);
        }
        return _loc3_;
    }

    private static function sortOnSpecificity(param1: Array): Array {
        var _loc3_: * = null;
        var _loc5_: int = 0;
        var _loc2_: Number = param1.length;
        if (_loc2_ <= 1) {
            return param1;
        }
        var _loc4_: int = 1;
        while (_loc4_ < _loc2_) {
            _loc5_ = _loc4_;
            while (_loc5_ > 0) {
                if (param1[_loc5_].specificity >= param1[_loc5_ - 1].specificity) {
                    break;
                }
                _loc3_ = param1[_loc5_];
                param1[_loc5_] = param1[_loc5_ - 1];
                param1[_loc5_ - 1] = _loc3_;
                _loc5_--;
            }
            _loc4_++;
        }
        return param1;
    }

    private static function getStyleManager(param1: Object): IStyleManager2 {
        if (param1 is IFlexModule) {
            return StyleManager.getStyleManager(IFlexModule(param1).moduleFactory);
        }
        if (param1 is StyleProxy) {
            return getStyleManagerFromStyleProxy(StyleProxy(param1));
        }
        return StyleManager.getStyleManager(null);
    }

    private static function getStyleManagerFromStyleProxy(param1: StyleProxy): IStyleManager2 {
        var _loc2_: IStyleClient = param1;
        while (_loc2_ is StyleProxy) {
            _loc2_ = StyleProxy(_loc2_).source;
        }
        if (_loc2_ is IFlexModule) {
            return StyleManager.getStyleManager(IFlexModule(_loc2_).moduleFactory);
        }
        return StyleManager.getStyleManager(null);
    }
}
}
