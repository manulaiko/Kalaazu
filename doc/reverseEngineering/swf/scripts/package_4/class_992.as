package package_4 {

import mx.core.IFlexModuleFactory;
import mx.events.PropertyChangeEvent;
import mx.events.ToolTipEvent;

import net.bigpoint.darkorbit.mvc.common.view.components.DOHtmlTooltip;

import package_151.class_989;

import package_3.class_1514;

import package_8.VectorCollection;

import spark.components.SkinnableContainer;

public class class_992 extends SkinnableContainer {


    private var __moduleFactoryInitialized: Boolean = false;

    private var var_1509: class_989;

    private var var_2436: class_1514;

    public function class_992() {
        super();
        mx_internal::_document = this;
        this.mouseEnabled = true;
        this.mouseChildren = true;
        this.enabled = true;
        this.toolTip = " ";
        this.useHandCursor = true;
        this.buttonMode = true;
        this.styleName = "tdmToolTip";
        this.addEventListener("toolTipCreate", this.method_2641);
    }

    override public function set moduleFactory(param1: IFlexModuleFactory): void {
        var factory: IFlexModuleFactory = param1;
        super.moduleFactory = factory;
        if (this.__moduleFactoryInitialized) {
            return;
        }
        this.__moduleFactoryInitialized = true;
        if (!this.styleDeclaration) {
            this.styleDeclaration = new CSSStyleDeclaration(null, styleManager);
        }
        this.styleDeclaration.defaultFactory = function (): void {
            this.skinClass = class_7;
        };
    }

    override public function initialize(): void {
        super.initialize();
    }

    public function set data(param1: Object): void {
        this._rewards = param1 as class_989;
        if (Boolean(this._rewards) && this._rewards.method_4087.length > 0) {
            if (this.var_2436) {
                this.var_2436.dataProvider = new VectorCollection(this._rewards.method_4087);
            }
        }
    }

    private function method_5447(param1: ToolTipEvent): void {
        var _loc2_: * = null;
        if (!this.var_2436) {
            this.var_2436 = new class_1514();
        }
        if (Boolean(this._rewards) && this._rewards.method_4087.length > 0) {
            this.var_2436.rewards = this._rewards;
            param1.toolTip = this.var_2436;
        } else {
            _loc2_ = new DOHtmlTooltip();
            _loc2_.htmlText = this._rewards.title;
            param1.toolTip = _loc2_;
        }
    }

    public function method_2641(param1: ToolTipEvent): void {
        this.method_5447(param1);
    }

    [Bindable(event="propertyChange")]
    private function get _rewards(): class_989 {
        return this.var_1509;
    }

    private function set _rewards(param1: class_989): void {
        var _loc2_: Object = this.var_1509;
        if (_loc2_ !== param1) {
            this.var_1509 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_rewards", _loc2_, param1));
            }
        }
    }
}
}
