package spark.skins.spark {

import mx.core.IFlexModuleFactory;
import mx.events.PropertyChangeEvent;

import spark.components.ButtonBarButton;

public class TabBarSkinInnerClass0 extends ButtonBarButton {


    private var _88844982outerDocument: TabBarSkin;

    private var __moduleFactoryInitialized: Boolean = false;

    public function TabBarSkinInnerClass0() {
        super();
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
            this.skinClass = TabBarButtonSkin;
        };
    }

    override public function initialize(): void {
        super.initialize();
    }

    [Bindable(event="propertyChange")]
    public function get outerDocument(): TabBarSkin {
        return this._88844982outerDocument;
    }

    public function set outerDocument(param1: TabBarSkin): void {
        var _loc2_: Object = this._88844982outerDocument;
        if (_loc2_ !== param1) {
            this._88844982outerDocument = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "outerDocument", _loc2_, param1));
            }
        }
    }
}
}
