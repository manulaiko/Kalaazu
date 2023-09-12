package spark.skins.spark {

import mx.binding.BindingManager;
import mx.core.ClassFactory;
import mx.core.IFlexModuleFactory;
import mx.events.PropertyChangeEvent;

import spark.components.Scroller;
import spark.skins.SparkSkin;

public class ScrollerSkin extends SparkSkin {


    private var _74289256horizontalScrollBarFactory: ClassFactory;

    private var _1765308486verticalScrollBarFactory: ClassFactory;

    private var __moduleFactoryInitialized: Boolean = false;

    private var _213507019hostComponent: Scroller;

    public function ScrollerSkin() {
        super();
        mx_internal::_document = this;
        this._ScrollerSkin_ClassFactory2_i();
        this._ScrollerSkin_ClassFactory1_i();
    }

    override public function set moduleFactory(param1: IFlexModuleFactory): void {
        super.moduleFactory = param1;
        if (this.__moduleFactoryInitialized) {
            return;
        }
        this.__moduleFactoryInitialized = true;
    }

    override public function initialize(): void {
        super.initialize();
    }

    override public function beginHighlightBitmapCapture(): Boolean {
        var _loc1_: Boolean = super.beginHighlightBitmapCapture();
        graphics.beginFill(0);
        graphics.drawRect(0, 0, width, height);
        graphics.endFill();
        return _loc1_;
    }

    override public function endHighlightBitmapCapture(): Boolean {
        var _loc1_: Boolean = super.endHighlightBitmapCapture();
        graphics.clear();
        return _loc1_;
    }

    private function _ScrollerSkin_ClassFactory2_i(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = ScrollerSkinInnerClass1;
        _loc1_.properties = {"outerDocument": this};
        this.horizontalScrollBarFactory = _loc1_;
        BindingManager.executeBindings(this, "horizontalScrollBarFactory", this.horizontalScrollBarFactory);
        return _loc1_;
    }

    private function _ScrollerSkin_ClassFactory1_i(): ClassFactory {
        var _loc1_: ClassFactory = new ClassFactory();
        _loc1_.generator = ScrollerSkinInnerClass0;
        _loc1_.properties = {"outerDocument": this};
        this.verticalScrollBarFactory = _loc1_;
        BindingManager.executeBindings(this, "verticalScrollBarFactory", this.verticalScrollBarFactory);
        return _loc1_;
    }

    [Bindable(event="propertyChange")]
    public function get horizontalScrollBarFactory(): ClassFactory {
        return this._74289256horizontalScrollBarFactory;
    }

    public function set horizontalScrollBarFactory(param1: ClassFactory): void {
        var _loc2_: Object = this._74289256horizontalScrollBarFactory;
        if (_loc2_ !== param1) {
            this._74289256horizontalScrollBarFactory = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "horizontalScrollBarFactory", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get verticalScrollBarFactory(): ClassFactory {
        return this._1765308486verticalScrollBarFactory;
    }

    public function set verticalScrollBarFactory(param1: ClassFactory): void {
        var _loc2_: Object = this._1765308486verticalScrollBarFactory;
        if (_loc2_ !== param1) {
            this._1765308486verticalScrollBarFactory = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "verticalScrollBarFactory", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get hostComponent(): Scroller {
        return this._213507019hostComponent;
    }

    public function set hostComponent(param1: Scroller): void {
        var _loc2_: Object = this._213507019hostComponent;
        if (_loc2_ !== param1) {
            this._213507019hostComponent = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hostComponent", _loc2_, param1));
            }
        }
    }
}
}
