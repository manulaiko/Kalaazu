package package_49 {

import mx.core.IFlexModuleFactory;
import mx.events.PropertyChangeEvent;

import net.bigpoint.darkorbit.mvc.common.view.components.DOTabButtonBase;
import net.bigpoint.darkorbit.mvc.common.view.skins.DOTabButtonBaseSkin;

public class class_1510 extends DOTabButtonBase {


    private var _88844982outerDocument: class_987;

    private var __moduleFactoryInitialized: Boolean = false;

    public function class_1510() {
        super();
        this.styleName = "questWindowTabs";
        this.mouseChildren = false;
        this.buttonMode = true;
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
            this.fontFamily = "EurostileTHea";
            this.fontSize = 14;
            this.skinClass = DOTabButtonBaseSkin;
        };
    }

    override public function initialize(): void {
        super.initialize();
    }

    [Bindable(event="propertyChange")]
    public function get outerDocument(): class_987 {
        return this._88844982outerDocument;
    }

    public function set outerDocument(param1: class_987): void {
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
