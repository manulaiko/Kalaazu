package mx.resources {

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.FocusEvent;
import flash.events.IEventDispatcher;
import flash.events.TimerEvent;
import flash.system.ApplicationDomain;
import flash.system.Capabilities;
import flash.system.SecurityDomain;
import flash.utils.Dictionary;
import flash.utils.Timer;

import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.events.ModuleEvent;
import mx.events.ResourceEvent;
import mx.managers.SystemManagerGlobals;
import mx.modules.IModuleInfo;
import mx.modules.ModuleManager;
import mx.utils.StringUtil;

public class ResourceManagerImpl extends EventDispatcher implements IResourceManager {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static var instance: IResourceManager;


    private var ignoreMissingBundles: Boolean;

    private var bundleDictionary: Dictionary;

    private var localeMap: Object;

    private var resourceModules: Object;

    private var initializedForNonFrameworkApp: Boolean = false;

    private var _localeChain: Array;

    public function ResourceManagerImpl() {
        this.localeMap = {};
        this.resourceModules = {};
        super();
        if (SystemManagerGlobals.topLevelSystemManagers.length) {
            if (SystemManagerGlobals.topLevelSystemManagers[0].currentFrame == 1) {
                this.ignoreMissingBundles = true;
                SystemManagerGlobals.topLevelSystemManagers[0].addEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
            }
        }
        var _loc1_: Object = SystemManagerGlobals.info;
        if (_loc1_) {
            this.processInfo(_loc1_, false);
        }
        this.ignoreMissingBundles = false;
        if (SystemManagerGlobals.topLevelSystemManagers.length) {
            SystemManagerGlobals.topLevelSystemManagers[0].addEventListener(FlexEvent.NEW_CHILD_APPLICATION, this.newChildApplicationHandler);
        }
    }

    public static function getInstance(): IResourceManager {
        if (!instance) {
            instance = new ResourceManagerImpl();
        }
        return instance;
    }

    public function get localeChain(): Array {
        return this._localeChain;
    }

    public function set localeChain(param1: Array): void {
        this._localeChain = param1;
        this.update();
    }

    public function installCompiledResourceBundles(param1: ApplicationDomain, param2: Array, param3: Array, param4: Boolean = false): Array {
        var _loc10_: * = null;
        var _loc11_: int = 0;
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc5_: * = [];
        var _loc6_: Number = 0;
        var _loc7_: int = !!param2 ? param2.length : 0;
        var _loc8_: int = !!param3 ? param3.length : 0;
        var _loc9_: int = 0;
        while (_loc9_ < _loc7_) {
            _loc10_ = param2[_loc9_];
            _loc11_ = 0;
            while (_loc11_ < _loc8_) {
                _loc12_ = param3[_loc11_];
                if (_loc13_ = this.installCompiledResourceBundle(param1, _loc10_, _loc12_, param4)) {
                    var _loc14_: *;
                    _loc5_[_loc14_ = _loc6_++] = _loc13_;
                }
                _loc11_++;
            }
            _loc9_++;
        }
        return _loc5_;
    }

    private function installCompiledResourceBundle(param1: ApplicationDomain, param2: String, param3: String, param4: Boolean = false): IResourceBundle {
        var _loc5_: * = null;
        var _loc6_: String = param3;
        var _loc7_: int;
        if ((_loc7_ = param3.indexOf(":")) != -1) {
            _loc5_ = param3.substring(0, _loc7_);
            _loc6_ = param3.substring(_loc7_ + 1);
        }
        var _loc8_: IResourceBundle;
        if (_loc8_ = this.getResourceBundleInternal(param2, param3, param4)) {
            return _loc8_;
        }
        var _loc9_: * = param2 + "$" + _loc6_ + "_properties";
        if (_loc5_ != null) {
            _loc9_ = _loc5_ + "." + _loc9_;
        }
        var _loc10_: * = null;
        if (param1.hasDefinition(_loc9_)) {
            _loc10_ = Class(param1.getDefinition(_loc9_));
        }
        if (!_loc10_) {
            _loc9_ = param3;
            if (param1.hasDefinition(_loc9_)) {
                _loc10_ = Class(param1.getDefinition(_loc9_));
            }
        }
        if (!_loc10_) {
            _loc9_ = param3 + "_properties";
            if (param1.hasDefinition(_loc9_)) {
                _loc10_ = Class(param1.getDefinition(_loc9_));
            }
        }
        if (!_loc10_) {
            if (this.ignoreMissingBundles) {
                return null;
            }
            throw new Error("Could not find compiled resource bundle \'" + param3 + "\' for locale \'" + param2 + "\'.");
        }
        _loc8_ = ResourceBundle(new _loc10_());
        ResourceBundle(_loc8_).mx_internal::_locale = param2;
        ResourceBundle(_loc8_).mx_internal::_bundleName = param3;
        this.addResourceBundle(_loc8_, param4);
        return _loc8_;
    }

    private function newChildApplicationHandler(param1: FocusEvent): void {
        var _loc2_: Object = param1.relatedObject["info"]();
        var _loc3_: Boolean = false;
        if ("_resourceBundles" in param1.relatedObject) {
            _loc3_ = true;
        }
        var _loc4_: Array = this.processInfo(_loc2_, _loc3_);
        if (_loc3_) {
            param1.relatedObject["_resourceBundles"] = _loc4_;
        }
    }

    private function processInfo(param1: Object, param2: Boolean): Array {
        var _loc3_: Array = param1["compiledLocales"];
        ResourceBundle.mx_internal::locale = _loc3_ != null && _loc3_.length > 0 ? _loc3_[0] : "en_US";
        var _loc4_: String;
        if ((_loc4_ = SystemManagerGlobals.parameters["localeChain"]) != null && _loc4_ != "") {
            this.localeChain = _loc4_.split(",");
        }
        var _loc5_: ApplicationDomain = param1["currentDomain"];
        var _loc6_: Array = param1["compiledResourceBundleNames"];
        var _loc7_: Array = this.installCompiledResourceBundles(_loc5_, _loc3_, _loc6_, param2);
        if (!this.localeChain) {
            this.initializeLocaleChain(_loc3_);
        }
        return _loc7_;
    }

    public function initializeLocaleChain(param1: Array): void {
        this.localeChain = LocaleSorter.sortLocalesByPreference(param1, this.getSystemPreferredLocales(), null, true);
    }

    public function loadResourceModule(param1: String, param2: Boolean = true, param3: ApplicationDomain = null, param4: SecurityDomain = null): IEventDispatcher {
        var errorHandler: Function;
        var moduleInfo: IModuleInfo = null;
        var resourceEventDispatcher: ResourceEventDispatcher = null;
        var timer: Timer = null;
        var timerHandler: Function = null;
        var url: String = param1;
        var updateFlag: Boolean = param2;
        var var_4: ApplicationDomain = param3;
        var securityDomain: SecurityDomain = param4;
        moduleInfo = ModuleManager.getModule(url);
        resourceEventDispatcher = new ResourceEventDispatcher(moduleInfo);
        var readyHandler: Function = function (param1: ModuleEvent): void {
            var _loc2_: * = param1.module.factory.create();
            resourceModules[param1.module.url].resourceModule = _loc2_;
            if (updateFlag) {
                update();
            }
        };
        moduleInfo.addEventListener(ModuleEvent.READY, readyHandler, false, 0, true);
        errorHandler = function (param1: ModuleEvent): void {
            var _loc3_: * = null;
            var _loc2_: String = "Unable to load resource module from " + url;
            if (resourceEventDispatcher.willTrigger(ResourceEvent.ERROR)) {
                _loc3_ = new ResourceEvent(ResourceEvent.ERROR, param1.bubbles, param1.cancelable);
                _loc3_.bytesLoaded = 0;
                _loc3_.bytesTotal = 0;
                _loc3_.errorText = _loc2_;
                resourceEventDispatcher.dispatchEvent(_loc3_);
                return;
            }
            throw new Error(_loc2_);
        };
        moduleInfo.addEventListener(ModuleEvent.ERROR, errorHandler, false, 0, true);
        this.resourceModules[url] = new ResourceModuleInfo(moduleInfo, readyHandler, errorHandler);
        timer = new Timer(0);
        timerHandler = function (param1: TimerEvent): void {
            timer.removeEventListener(TimerEvent.TIMER, timerHandler);
            timer.stop();
            moduleInfo.load(var_4, securityDomain);
        };
        timer.addEventListener(TimerEvent.TIMER, timerHandler, false, 0, true);
        timer.start();
        return resourceEventDispatcher;
    }

    public function unloadResourceModule(param1: String, param2: Boolean = true): void {
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc3_: ResourceModuleInfo = this.resourceModules[param1];
        if (!_loc3_) {
            return;
        }
        if (_loc3_.resourceModule) {
            if (_loc4_ = _loc3_.resourceModule.resourceBundles) {
                _loc5_ = _loc4_.length;
                _loc6_ = 0;
                while (_loc6_ < _loc5_) {
                    _loc7_ = _loc4_[_loc6_].locale;
                    _loc8_ = _loc4_[_loc6_].bundleName;
                    this.removeResourceBundle(_loc7_, _loc8_);
                    _loc6_++;
                }
            }
        }
        this.resourceModules[param1] = null;
        delete this.resourceModules[param1];
        _loc3_.moduleInfo.unload();
        if (param2) {
            this.update();
        }
    }

    public function addResourceBundle(param1: IResourceBundle, param2: Boolean = false): void {
        var _loc3_: String = param1.locale;
        var _loc4_: String = param1.bundleName;
        if (!this.localeMap[_loc3_]) {
            this.localeMap[_loc3_] = {};
        }
        if (param2) {
            if (!this.bundleDictionary) {
                this.bundleDictionary = new Dictionary(true);
            }
            this.bundleDictionary[param1] = _loc3_ + _loc4_;
            this.localeMap[_loc3_][_loc4_] = this.bundleDictionary;
        } else {
            this.localeMap[_loc3_][_loc4_] = param1;
        }
    }

    public function getResourceBundle(param1: String, param2: String): IResourceBundle {
        return this.getResourceBundleInternal(param1, param2, false);
    }

    private function getResourceBundleInternal(param1: String, param2: String, param3: Boolean): IResourceBundle {
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc4_: Object;
        if (!(_loc4_ = this.localeMap[param1])) {
            return null;
        }
        var _loc5_: * = null;
        var _loc6_: Object;
        if ((_loc6_ = _loc4_[param2]) is Dictionary) {
            if (param3) {
                return null;
            }
            _loc7_ = param1 + param2;
            for (_loc8_ in _loc6_) {
                if (_loc6_[_loc8_] == _loc7_) {
                    _loc5_ = _loc8_ as IResourceBundle;
                    break;
                }
            }
        } else {
            _loc5_ = _loc6_ as IResourceBundle;
        }
        return _loc5_;
    }

    public function removeResourceBundle(param1: String, param2: String): void {
        delete this.localeMap[param1][param2];
        if (this.getBundleNamesForLocale(param1).length == 0) {
            delete this.localeMap[param1];
        }
    }

    public function removeResourceBundlesForLocale(param1: String): void {
        delete this.localeMap[param1];
    }

    public function update(): void {
        dispatchEvent(new Event(Event.CHANGE));
    }

    public function getLocales(): Array {
        var _loc2_: * = null;
        var _loc1_: * = [];
        for (_loc2_ in this.localeMap) {
            _loc1_.push(_loc2_);
        }
        return _loc1_;
    }

    public function getPreferredLocaleChain(): Array {
        return LocaleSorter.sortLocalesByPreference(this.getLocales(), this.getSystemPreferredLocales(), null, true);
    }

    public function getBundleNamesForLocale(param1: String): Array {
        var _loc3_: * = null;
        var _loc2_: * = [];
        for (_loc3_ in this.localeMap[param1]) {
            _loc2_.push(_loc3_);
        }
        return _loc2_;
    }

    public function findResourceBundleWithResource(param1: String, param2: String): IResourceBundle {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        if (!this._localeChain) {
            return null;
        }
        var _loc3_: int = this._localeChain.length;
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_) {
            _loc5_ = this.localeChain[_loc4_];
            if (_loc6_ = this.localeMap[_loc5_]) {
                if (_loc7_ = _loc6_[param1]) {
                    _loc8_ = null;
                    if (_loc7_ is Dictionary) {
                        _loc9_ = _loc5_ + param1;
                        for (_loc10_ in _loc7_) {
                            if (_loc7_[_loc10_] == _loc9_) {
                                _loc8_ = _loc10_ as IResourceBundle;
                                break;
                            }
                        }
                    } else {
                        _loc8_ = _loc7_ as IResourceBundle;
                    }
                    if (Boolean(_loc8_) && param2 in _loc8_.content) {
                        return _loc8_;
                    }
                }
            }
            _loc4_++;
        }
        return null;
    }

    [Bindable("change")]
    public function getObject(param1: String, param2: String, param3: String = null): * {
        var _loc4_: IResourceBundle;
        if (!(_loc4_ = this.findBundle(param1, param2, param3))) {
            return undefined;
        }
        return _loc4_.content[param2];
    }

    [Bindable("change")]
    public function getString(param1: String, param2: String, param3: Array = null, param4: String = null): String {
        var _loc5_: IResourceBundle;
        if (!(_loc5_ = this.findBundle(param1, param2, param4))) {
            return null;
        }
        var _loc6_: String = String(_loc5_.content[param2]);
        if (param3) {
            _loc6_ = StringUtil.substitute(_loc6_, param3);
        }
        return _loc6_;
    }

    [Bindable("change")]
    public function getStringArray(param1: String, param2: String, param3: String = null): Array {
        var _loc4_: IResourceBundle;
        if (!(_loc4_ = this.findBundle(param1, param2, param3))) {
            return null;
        }
        var _loc5_: * = _loc4_.content[param2];
        var _loc6_: Array;
        var _loc7_: int = (_loc6_ = String(_loc5_).split(",")).length;
        var _loc8_: int = 0;
        while (_loc8_ < _loc7_) {
            _loc6_[_loc8_] = StringUtil.trim(_loc6_[_loc8_]);
            _loc8_++;
        }
        return _loc6_;
    }

    [Bindable("change")]
    public function getNumber(param1: String, param2: String, param3: String = null): Number {
        var _loc4_: IResourceBundle;
        if (!(_loc4_ = this.findBundle(param1, param2, param3))) {
            return NaN;
        }
        var _loc5_: * = _loc4_.content[param2];
        return Number(_loc5_);
    }

    [Bindable("change")]
    public function getInt(param1: String, param2: String, param3: String = null): int {
        var _loc4_: IResourceBundle;
        if (!(_loc4_ = this.findBundle(param1, param2, param3))) {
            return 0;
        }
        var _loc5_: * = _loc4_.content[param2];
        return int(_loc5_);
    }

    [Bindable("change")]
    public function getUint(param1: String, param2: String, param3: String = null): uint {
        var _loc4_: IResourceBundle;
        if (!(_loc4_ = this.findBundle(param1, param2, param3))) {
            return 0;
        }
        var _loc5_: * = _loc4_.content[param2];
        return uint(_loc5_);
    }

    [Bindable("change")]
    public function getBoolean(param1: String, param2: String, param3: String = null): Boolean {
        var _loc4_: IResourceBundle;
        if (!(_loc4_ = this.findBundle(param1, param2, param3))) {
            return false;
        }
        var _loc5_: * = _loc4_.content[param2];
        return String(_loc5_).toLowerCase() == "true";
    }

    [Bindable("change")]
    public function getClass(param1: String, param2: String, param3: String = null): Class {
        var _loc4_: IResourceBundle;
        if (!(_loc4_ = this.findBundle(param1, param2, param3))) {
            return null;
        }
        var _loc5_: *;
        return (_loc5_ = _loc4_.content[param2]) as Class;
    }

    private function findBundle(param1: String, param2: String, param3: String): IResourceBundle {
        this.supportNonFrameworkApps();
        return param3 != null ? this.getResourceBundle(param3, param1) : this.findResourceBundleWithResource(param1, param2);
    }

    private function supportNonFrameworkApps(): void {
        if (this.initializedForNonFrameworkApp) {
            return;
        }
        this.initializedForNonFrameworkApp = true;
        if (this.getLocales().length > 0) {
            return;
        }
        var _loc1_: ApplicationDomain = ApplicationDomain.currentDomain;
        if (!_loc1_.hasDefinition("_CompiledResourceBundleInfo")) {
            return;
        }
        var _loc2_: Class = Class(_loc1_.getDefinition("_CompiledResourceBundleInfo"));
        var _loc3_: Array = _loc2_.compiledLocales;
        var _loc4_: Array = _loc2_.compiledResourceBundleNames;
        this.installCompiledResourceBundles(_loc1_, _loc3_, _loc4_);
        this.localeChain = _loc3_;
    }

    private function getSystemPreferredLocales(): Array {
        var _loc1_: * = null;
        if (false) {
            _loc1_ = Capabilities["languages"];
        } else {
            _loc1_ = [Capabilities.language];
        }
        return _loc1_;
    }

    private function dumpResourceModule(param1: *): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        for each(_loc2_ in param1.resourceBundles) {
            trace(_loc2_.locale, _loc2_.bundleName);
            for (_loc3_ in _loc2_.content) {
            }
        }
    }

    private function enterFrameHandler(param1: Event): void {
        if (SystemManagerGlobals.topLevelSystemManagers.length) {
            if (SystemManagerGlobals.topLevelSystemManagers[0].currentFrame != 2) {
                return;
            }
            SystemManagerGlobals.topLevelSystemManagers[0].removeEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
        }
        var _loc2_: Object = SystemManagerGlobals.info;
        if (_loc2_) {
            this.processInfo(_loc2_, false);
        }
    }
}
}

import mx.modules.IModuleInfo;
import mx.resources.IResourceModule;

class ResourceModuleInfo {


    public var errorHandler: Function;

    public var moduleInfo: IModuleInfo;

    public var readyHandler: Function;

    public var resourceModule: IResourceModule;

    function ResourceModuleInfo(param1: IModuleInfo, param2: Function, param3: Function) {
        super();
        this.moduleInfo = param1;
        this.readyHandler = param2;
        this.errorHandler = param3;
    }
}

import flash.events.EventDispatcher;

import mx.events.ModuleEvent;
import mx.events.ResourceEvent;
import mx.modules.IModuleInfo;

class ResourceEventDispatcher extends EventDispatcher {


    function ResourceEventDispatcher(param1: IModuleInfo) {
        super();
        param1.addEventListener(ModuleEvent.ERROR, this.moduleInfo_errorHandler, false, 0, true);
        param1.addEventListener(ModuleEvent.PROGRESS, this.moduleInfo_progressHandler, false, 0, true);
        param1.addEventListener(ModuleEvent.READY, this.moduleInfo_readyHandler, false, 0, true);
    }

    private function moduleInfo_errorHandler(param1: ModuleEvent): void {
        var _loc2_: ResourceEvent = new ResourceEvent(ResourceEvent.ERROR, param1.bubbles, param1.cancelable);
        _loc2_.bytesLoaded = param1.bytesLoaded;
        _loc2_.bytesTotal = param1.bytesTotal;
        _loc2_.errorText = param1.errorText;
        dispatchEvent(_loc2_);
    }

    private function moduleInfo_progressHandler(param1: ModuleEvent): void {
        var _loc2_: ResourceEvent = new ResourceEvent(ResourceEvent.PROGRESS, param1.bubbles, param1.cancelable);
        _loc2_.bytesLoaded = param1.bytesLoaded;
        _loc2_.bytesTotal = param1.bytesTotal;
        dispatchEvent(_loc2_);
    }

    private function moduleInfo_readyHandler(param1: ModuleEvent): void {
        var _loc2_: ResourceEvent = new ResourceEvent(ResourceEvent.COMPLETE);
        dispatchEvent(_loc2_);
    }
}
