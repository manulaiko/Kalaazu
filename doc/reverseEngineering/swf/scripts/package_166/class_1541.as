package package_166 {

import mx.events.PropertyChangeEvent;

import net.bigpoint.as3toolbox.bplocale.class_88;

import package_9.ResourceManager;

import spark.components.Image;
import spark.components.Label;
import spark.components.SkinnableContainer;

public class class_1541 extends SkinnableContainer {


    private var var_4597: String;

    private var _value: int = -1;

    protected var var_2404: String;

    private var var_5005: Image;

    private var var_4748: Label;

    public function class_1541() {
        super();
    }

    public function init(param1: String, param2: String): void {
        this.var_4597 = param2;
        this.method_4413();
        this.statIcon.source = ResourceManager.getBitmapData("battleStationsUI", param1);
    }

    public function set value(param1: Number): void {
        this._value = param1;
        this.valueLabel.text = String(this._value);
        this.method_4413();
    }

    private function method_4413(): void {
        if (this.var_4597) {
            this._tooltipText = class_88.getItem(this.var_4597) + ": " + this._value;
        }
    }

    [Bindable(event="propertyChange")]
    protected function get _tooltipText(): String {
        return this.var_2404;
    }

    protected function set _tooltipText(param1: String): void {
        var _loc2_: Object = this.var_2404;
        if (_loc2_ !== param1) {
            this.var_2404 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_tooltipText", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get statIcon(): Image {
        return this.var_5005;
    }

    public function set statIcon(param1: Image): void {
        var _loc2_: Object = this.var_5005;
        if (_loc2_ !== param1) {
            this.var_5005 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "statIcon", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get valueLabel(): Label {
        return this.var_4748;
    }

    public function set valueLabel(param1: Label): void {
        var _loc2_: Object = this.var_4748;
        if (_loc2_ !== param1) {
            this.var_4748 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "valueLabel", _loc2_, param1));
            }
        }
    }
}
}
