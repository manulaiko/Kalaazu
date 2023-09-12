package package_5 {

import mx.binding.BindingManager;
import mx.events.PropertyChangeEvent;
import mx.graphics.SolidColor;

import spark.components.DataGrid;
import spark.components.Grid;
import spark.components.gridClasses.IGridVisualElement;
import spark.primitives.Rect;

public class class_23 extends Rect implements IGridVisualElement {


    private var _88844982outerDocument: class_4;

    private var _1247411672rowBackgroundFillColor: SolidColor;

    public function class_23() {
        super();
        this.fill = this.method_4273();
    }

    public function prepareGridVisualElement(param1: Grid, param2: int, param3: int): void {
        var _loc4_: DataGrid;
        if (!(_loc4_ = param1.dataGrid)) {
            return;
        }
        var _loc5_: Array;
        if ((Boolean(_loc5_ = _loc4_.getStyle("alternatingRowColors"))) && _loc5_.length > 0) {
            _loc4_.styleManager.getColorNames(_loc5_);
            this.rowBackgroundFillColor.color = _loc5_[param2 % _loc5_.length];
        } else {
            this.rowBackgroundFillColor.color = 16777215;
        }
    }

    private function method_4273(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 16777215;
        this.rowBackgroundFillColor = _loc1_;
        BindingManager.executeBindings(this, "rowBackgroundFillColor", this.rowBackgroundFillColor);
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

    [Bindable(event="propertyChange")]
    public function get rowBackgroundFillColor(): SolidColor {
        return this._1247411672rowBackgroundFillColor;
    }

    public function set rowBackgroundFillColor(param1: SolidColor): void {
        var _loc2_: Object = this._1247411672rowBackgroundFillColor;
        if (_loc2_ !== param1) {
            this._1247411672rowBackgroundFillColor = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rowBackgroundFillColor", _loc2_, param1));
            }
        }
    }
}
}
