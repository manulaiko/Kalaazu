package mx.styles {

import flash.events.Event;
import flash.events.EventDispatcher;

import mx.core.FlexGlobals;
import mx.core.IFlexModule;
import mx.core.IFlexModuleFactory;
import mx.core.IMXMLObject;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.utils.NameUtil;

public class AdvancedStyleClient extends EventDispatcher implements IAdvancedStyleClient, IFlexModule, IMXMLObject {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var deferredSetStyles: Object;

    private var _inheritingStyles: Object;

    private var _nonInheritingStyles: Object;

    private var _styleDeclarationVar: CSSStyleDeclaration;

    private var _styleName: Object;

    private var _styleParent: IAdvancedStyleClient;

    private var _id: String;

    private var _moduleFactory: IFlexModuleFactory;

    public function AdvancedStyleClient() {
        this._inheritingStyles = StyleProtoChain.STYLE_UNINITIALIZED;
        this._nonInheritingStyles = StyleProtoChain.STYLE_UNINITIALIZED;
        super();
    }

    public function get className(): String {
        return NameUtil.getUnqualifiedClassName(this);
    }

    public function get inheritingStyles(): Object {
        return this._inheritingStyles;
    }

    public function set inheritingStyles(param1: Object): void {
        this._inheritingStyles = param1;
    }

    public function get nonInheritingStyles(): Object {
        return this._nonInheritingStyles;
    }

    public function set nonInheritingStyles(param1: Object): void {
        this._nonInheritingStyles = param1;
    }

    public function get styleDeclaration(): CSSStyleDeclaration {
        return this._styleDeclarationVar;
    }

    public function set styleDeclaration(param1: CSSStyleDeclaration): void {
        this._styleDeclarationVar = param1;
    }

    public function get styleManager(): IStyleManager2 {
        return StyleManager.getStyleManager(this.moduleFactory);
    }

    private function setDeferredStyles(): void {
        var _loc1_: * = null;
        if (!this.deferredSetStyles) {
            return;
        }
        for (_loc1_ in this.deferredSetStyles) {
            StyleProtoChain.setStyle(this, _loc1_, this.deferredSetStyles[_loc1_]);
        }
        this.deferredSetStyles = null;
    }

    [Bindable(style="true")]
    public function getStyle(param1: String): * {
        if (!this.moduleFactory) {
            if (Boolean(this.deferredSetStyles) && this.deferredSetStyles[param1] !== undefined) {
                return this.deferredSetStyles[param1];
            }
        }
        return !!this.styleManager.inheritingStyles[param1] ? (!!this._inheritingStyles ? this._inheritingStyles[param1] : undefined) : (!!this._nonInheritingStyles ? this._nonInheritingStyles[param1] : undefined);
    }

    public function setStyle(param1: String, param2: *): void {
        if (this.moduleFactory) {
            StyleProtoChain.setStyle(this, param1, param2);
        } else {
            if (!this.deferredSetStyles) {
                this.deferredSetStyles = new Object();
            }
            this.deferredSetStyles[param1] = param2;
        }
    }

    public function clearStyle(param1: String): void {
        this.setStyle(param1, undefined);
    }

    public function getClassStyleDeclarations(): Array {
        return StyleProtoChain.getClassStyleDeclarations(this);
    }

    public function notifyStyleChangeInChildren(param1: String, param2: Boolean): void {
    }

    public function regenerateStyleCache(param1: Boolean): void {
        StyleProtoChain.initProtoChain(this);
    }

    public function registerEffects(param1: Array): void {
    }

    public function styleChanged(param1: String): void {
        if (Boolean(param1) && param1 != "styleName") {
            if (hasEventListener(param1 + "Changed")) {
                dispatchEvent(new Event(param1 + "Changed"));
            }
        } else if (hasEventListener("allStylesChanged")) {
            dispatchEvent(new Event("allStylesChanged"));
        }
    }

    public function get styleName(): Object {
        return this._styleName;
    }

    public function set styleName(param1: Object): void {
        if (this._styleName === param1) {
            return;
        }
        this._styleName = param1;
        this.styleChanged("styleName");
    }

    public function get id(): String {
        return this._id;
    }

    public function set id(param1: String): void {
        this._id = param1;
    }

    public function get styleParent(): IAdvancedStyleClient {
        return this._styleParent;
    }

    public function set styleParent(param1: IAdvancedStyleClient): void {
        this._styleParent = param1;
    }

    public function stylesInitialized(): void {
    }

    public function matchesCSSState(param1: String): Boolean {
        return false;
    }

    public function matchesCSSType(param1: String): Boolean {
        return StyleProtoChain.matchesCSSType(this, param1);
    }

    public function hasCSSState(): Boolean {
        return false;
    }

    public function get moduleFactory(): IFlexModuleFactory {
        return this._moduleFactory;
    }

    public function set moduleFactory(param1: IFlexModuleFactory): void {
        this._moduleFactory = param1;
        this.setDeferredStyles();
    }

    public function initialized(param1: Object, param2: String): void {
        var _loc3_: UIComponent = param1 as UIComponent;
        if (_loc3_ == null) {
            _loc3_ = FlexGlobals.topLevelApplication as UIComponent;
        }
        this.id = param2;
        this.moduleFactory = _loc3_.moduleFactory;
        _loc3_.addStyleClient(this);
    }
}
}
