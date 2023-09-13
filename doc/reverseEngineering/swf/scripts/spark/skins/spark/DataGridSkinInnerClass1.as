package spark.skins.spark {

import mx.binding.BindingManager;
import mx.events.PropertyChangeEvent;
import mx.graphics.SolidColorStroke;

import spark.components.DataGrid;
import spark.components.Grid;
import spark.components.gridClasses.IGridVisualElement;
import spark.primitives.Rect;

public class DataGridSkinInnerClass1 extends Rect implements IGridVisualElement {


    private var _270443153caretIndicatorFill: SolidColorStroke;

    private var _88844982outerDocument: DataGridSkin;

    public function DataGridSkinInnerClass1() {
        super();
        this.stroke = this._DataGridSkinInnerClass1_SolidColorStroke1_i();
    }

    public function prepareGridVisualElement(param1: Grid, param2: int, param3: int): void {
        var _loc4_: DataGrid;
        if (!(_loc4_ = param1.dataGrid)) {
            return;
        }
        var _loc5_: uint = _loc4_.getStyle("caretColor");
        this.caretIndicatorFill.color = _loc5_;
    }

    private function _DataGridSkinInnerClass1_SolidColorStroke1_i(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.color = 92159;
        _loc1_.weight = 1;
        this.caretIndicatorFill = _loc1_;
        BindingManager.executeBindings(this, "caretIndicatorFill", this.caretIndicatorFill);
        return _loc1_;
    }

    [Bindable(event="propertyChange")]
    public function get caretIndicatorFill(): SolidColorStroke {
        return this._270443153caretIndicatorFill;
    }

    public function set caretIndicatorFill(param1: SolidColorStroke): void {
        var _loc2_: Object = this._270443153caretIndicatorFill;
        if (_loc2_ !== param1) {
            this._270443153caretIndicatorFill = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "caretIndicatorFill", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get outerDocument(): DataGridSkin {
        return this._88844982outerDocument;
    }

    public function set outerDocument(param1: DataGridSkin): void {
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