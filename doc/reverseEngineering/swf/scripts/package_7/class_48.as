package package_7 {

import mx.events.PropertyChangeEvent;

import spark.components.Grid;
import spark.components.gridClasses.IGridVisualElement;
import spark.primitives.Rect;

public class class_48 extends Rect implements IGridVisualElement {


    private var _88844982outerDocument: class_8;

    private var var_777: String;

    public function class_48() {
        super();
    }

    public function prepareGridVisualElement(param1: Grid, param2: int, param3: int): void {
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

    [Bindable(event="propertyChange")]
    public function get headerLabelColor(): String {
        return this.var_777;
    }

    public function set headerLabelColor(param1: String): void {
        var _loc2_: Object = this.var_777;
        if (_loc2_ !== param1) {
            this.var_777 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headerLabelColor", _loc2_, param1));
            }
        }
    }
}
}
