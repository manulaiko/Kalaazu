package package_5 {

import mx.events.PropertyChangeEvent;
import mx.graphics.SolidColorStroke;

import spark.primitives.Line;

public class class_25 extends Line {


    private var _88844982outerDocument: class_4;

    public function class_25() {
        super();
        this.stroke = this.method_2751();
    }

    private function method_2751(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.color = 2961714;
        _loc1_.weight = 1;
        _loc1_.caps = "square";
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
