package mx.managers.systemClasses {

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.InteractiveObject;
import flash.events.IEventDispatcher;

import mx.core.IFlexDisplayObject;
import mx.core.IFlexModule;
import mx.core.IFlexModuleFactory;
import mx.core.IFontContextComponent;
import mx.core.IInvalidating;
import mx.core.IUIComponent;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.managers.ILayoutManagerClient;
import mx.managers.ISystemManager;
import mx.managers.ISystemManagerChildManager;
import mx.messaging.config.LoaderConfig;
import mx.preloaders.Preloader;
import mx.styles.ISimpleStyleClient;
import mx.styles.IStyleClient;
import mx.utils.LoaderUtil;

public class ChildManager implements ISystemManagerChildManager {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var systemManager: ISystemManager;

    public function ChildManager(param1: IFlexModuleFactory) {
        super();
        if (param1 is ISystemManager) {
            param1["childManager"] = this;
            this.systemManager = ISystemManager(param1);
            this.systemManager.registerImplementation("mx.managers::ISystemManagerChildManager", this);
        }
    }

    public function addingChild(param1: DisplayObject): void {
        var _loc3_: * = null;
        var _loc2_: int = 1;
        if (!this.topLevel && Boolean(DisplayObject(this.systemManager).parent)) {
            _loc3_ = DisplayObject(this.systemManager).parent.parent;
            while (_loc3_) {
                if (_loc3_ is ILayoutManagerClient) {
                    _loc2_ = ILayoutManagerClient(_loc3_).nestLevel + 1;
                    break;
                }
                _loc3_ = _loc3_.parent;
            }
        }
        this.nestLevel = _loc2_;
        if (param1 is IUIComponent) {
            IUIComponent(param1).systemManager = this.systemManager;
        }
        if (param1 is IUIComponent && !IUIComponent(param1).document) {
            IUIComponent(param1).document = this.systemManager.document;
        }
        if (param1 is IFlexModule && IFlexModule(param1).moduleFactory == null) {
            IFlexModule(param1).moduleFactory = this.systemManager;
        }
        if (param1 is IFontContextComponent && !param1 is UIComponent && IFontContextComponent(param1).fontContext == null) {
            IFontContextComponent(param1).fontContext = this.systemManager;
        }
        if (param1 is ILayoutManagerClient) {
            ILayoutManagerClient(param1).nestLevel = this.nestLevel + 1;
        }
        if (param1 is InteractiveObject) {
            if (InteractiveObject(this.systemManager).doubleClickEnabled) {
                InteractiveObject(param1).doubleClickEnabled = true;
            }
        }
        if (param1 is IUIComponent) {
            IUIComponent(param1).parentChanged(DisplayObjectContainer(this.systemManager));
        }
        if (param1 is IStyleClient) {
            IStyleClient(param1).regenerateStyleCache(true);
        }
        if (param1 is ISimpleStyleClient) {
            ISimpleStyleClient(param1).styleChanged(null);
        }
        if (param1 is IStyleClient) {
            IStyleClient(param1).notifyStyleChangeInChildren(null, true);
        }
        if (param1 is UIComponent) {
            UIComponent(param1).mx_internal::initThemeColor();
        }
        if (param1 is UIComponent) {
            UIComponent(param1).stylesInitialized();
        }
    }

    public function childAdded(param1: DisplayObject): void {
        if (param1.hasEventListener(FlexEvent.ADD)) {
            param1.dispatchEvent(new FlexEvent(FlexEvent.ADD));
        }
        if (param1 is IUIComponent) {
            IUIComponent(param1).initialize();
        }
    }

    public function removingChild(param1: DisplayObject): void {
        if (param1.hasEventListener(FlexEvent.REMOVE)) {
            param1.dispatchEvent(new FlexEvent(FlexEvent.REMOVE));
        }
    }

    public function childRemoved(param1: DisplayObject): void {
        if (param1 is IUIComponent) {
            IUIComponent(param1).parentChanged(null);
        }
    }

    public function regenerateStyleCache(param1: Boolean): void {
        var _loc5_: * = null;
        var _loc2_: Boolean = false;
        var _loc3_: int = int(this.systemManager.rawChildren.numChildren);
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_) {
            if (_loc5_ = this.systemManager.rawChildren.getChildAt(_loc4_) as IStyleClient) {
                _loc5_.regenerateStyleCache(param1);
            }
            if (this.isTopLevelWindow(DisplayObject(_loc5_))) {
                _loc2_ = true;
            }
            _loc3_ = int(this.systemManager.rawChildren.numChildren);
            _loc4_++;
        }
        if (!_loc2_ && this.topLevelWindow is IStyleClient) {
            IStyleClient(this.topLevelWindow).regenerateStyleCache(param1);
        }
    }

    public function notifyStyleChangeInChildren(param1: String, param2: Boolean): void {
        var _loc6_: * = null;
        var _loc3_: Boolean = false;
        var _loc4_: int = int(this.systemManager.rawChildren.numChildren);
        var _loc5_: int = 0;
        while (_loc5_ < _loc4_) {
            if (_loc6_ = this.systemManager.rawChildren.getChildAt(_loc5_) as IStyleClient) {
                _loc6_.styleChanged(param1);
                _loc6_.notifyStyleChangeInChildren(param1, param2);
            }
            if (this.isTopLevelWindow(DisplayObject(_loc6_))) {
                _loc3_ = true;
            }
            _loc4_ = int(this.systemManager.rawChildren.numChildren);
            _loc5_++;
        }
        if (!_loc3_ && this.topLevelWindow is IStyleClient) {
            IStyleClient(this.topLevelWindow).styleChanged(param1);
            IStyleClient(this.topLevelWindow).notifyStyleChangeInChildren(param1, param2);
        }
    }

    public function initializeTopLevelWindow(param1: Number, param2: Number): void {
        var _loc3_: * = null;
        this.systemManager.document = _loc3_ = this.topLevelWindow = IUIComponent(this.systemManager.create());
        if (this.systemManager.document) {
            IEventDispatcher(_loc3_).addEventListener(FlexEvent.CREATION_COMPLETE, this.appCreationCompleteHandler);
            if (true) {
                LoaderConfig.mx_internal::_url = LoaderUtil.normalizeURL(this.systemManager.loaderInfo);
                LoaderConfig.mx_internal::_parameters = this.systemManager.loaderInfo.parameters;
                LoaderConfig.mx_internal::_swfVersion = this.systemManager.loaderInfo.swfVersion;
            }
            IFlexDisplayObject(_loc3_).setActualSize(param1, param2);
            if (this.preloader) {
                this.preloader.registerApplication(_loc3_);
            }
            this.addingChild(DisplayObject(_loc3_));
            this.childAdded(DisplayObject(_loc3_));
        } else {
            this.systemManager.document = this;
        }
    }

    private function appCreationCompleteHandler(param1: FlexEvent): void {
        var _loc2_: * = null;
        if (!this.topLevel && Boolean(DisplayObject(this.systemManager).parent)) {
            _loc2_ = DisplayObject(this.systemManager).parent.parent;
            while (_loc2_) {
                if (_loc2_ is IInvalidating) {
                    IInvalidating(_loc2_).invalidateSize();
                    IInvalidating(_loc2_).invalidateDisplayList();
                    return;
                }
                _loc2_ = _loc2_.parent;
            }
        }
    }

    private function isTopLevelWindow(param1: DisplayObject): Boolean {
        return this.systemManager["isTopLevelWindow"](param1);
    }

    private function get topLevel(): Boolean {
        return this.systemManager["topLevel"];
    }

    private function set topLevel(param1: Boolean): void {
        this.systemManager["topLevel"] = param1;
    }

    private function get topLevelWindow(): IUIComponent {
        return this.systemManager["topLevelWindow"];
    }

    private function set topLevelWindow(param1: IUIComponent): void {
        this.systemManager["topLevelWindow"] = param1;
    }

    private function get nestLevel(): int {
        return this.systemManager["nestLevel"];
    }

    private function set nestLevel(param1: int): void {
        this.systemManager["nestLevel"] = param1;
    }

    private function get preloader(): Preloader {
        return this.systemManager["preloader"];
    }

    private function set preloader(param1: Preloader): void {
        this.systemManager["preloader"] = param1;
    }
}
}
