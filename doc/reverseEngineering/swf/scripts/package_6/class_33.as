package package_6 {

import mx.binding.BindingManager;
import mx.events.PropertyChangeEvent;
import mx.graphics.SolidColor;

import spark.components.DataGrid;
import spark.components.Grid;
import spark.components.gridClasses.IGridVisualElement;
import spark.primitives.Rect;

public class class_33 extends Rect implements IGridVisualElement {


    private var _225390506hoverIndicatorFill: SolidColor;

    private var _88844982outerDocument: class_5;

    public function class_33() {
        super();
        this.fill = this.method_4679();
    }

    public function prepareGridVisualElement(param1: Grid, param2: int, param3: int): void {
        var _loc4_: DataGrid;
        if (!(_loc4_ = param1.dataGrid)) {
            return;
        }
        var _loc5_: uint = _loc4_.getStyle("rollOverColor");
        this.hoverIndicatorFill.color = _loc5_;
    }

    private function method_4679(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 13556719;
        this.hoverIndicatorFill = _loc1_;
        BindingManager.executeBindings(this, "hoverIndicatorFill", this.hoverIndicatorFill);
        return _loc1_;
    }

    [Bindable(event="propertyChange")]
    public function get hoverIndicatorFill(): SolidColor {
        return this._225390506hoverIndicatorFill;
    }

    public function set hoverIndicatorFill(param1: SolidColor): void {
        var _loc2_: Object = this._225390506hoverIndicatorFill;
        if (_loc2_ !== param1) {
            this._225390506hoverIndicatorFill = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hoverIndicatorFill", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get outerDocument(): class_5 {
        return this._88844982outerDocument;
    }

    public function set outerDocument(param1: class_5): void {
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
