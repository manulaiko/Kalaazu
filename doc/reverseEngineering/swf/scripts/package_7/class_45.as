package package_7 {

import mx.events.PropertyChangeEvent;
import mx.graphics.SolidColorStroke;

import spark.primitives.Line;

public class class_45 extends Line {


    private var _88844982outerDocument: class_8;

    public function class_45() {
        super();
        this.stroke = this.method_5959();
    }

    private function method_5959(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.color = 6908265;
        _loc1_.weight = 1;
        _loc1_.caps = "square";
        _loc1_.alpha = 0;
        return _loc1_;
    }

    [Bindable(event="propertyChange")]
    public function get outerDocument(): class_8 {
        return this._88844982outerDocument;
    }

    public function set outerDocument(param1: class_8): void {
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
