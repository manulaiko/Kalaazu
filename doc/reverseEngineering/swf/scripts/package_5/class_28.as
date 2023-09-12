package package_5 {

import mx.events.PropertyChangeEvent;
import mx.graphics.SolidColor;

import spark.primitives.Rect;

public class class_28 extends Rect {


    private var _88844982outerDocument: class_4;

    public function class_28() {
        super();
        this.fill = this.method_617();
    }

    private function method_617(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 16777215;
        return _loc1_;
    }

    [Bindable(event="propertyChange")]
    public function get outerDocument(): class_4 {
        return this._88844982outerDocument;
    }

    public function set outerDocument(param1: class_4): void {
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
