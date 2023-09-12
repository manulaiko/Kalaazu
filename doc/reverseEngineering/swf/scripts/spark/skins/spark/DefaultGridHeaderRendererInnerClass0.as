package spark.skins.spark {

import mx.binding.BindingManager;
import mx.events.PropertyChangeEvent;
import mx.graphics.GradientEntry;
import mx.graphics.RadialGradient;

import spark.components.DataGrid;
import spark.components.Grid;
import spark.components.gridClasses.IGridVisualElement;
import spark.primitives.Path;

public class DefaultGridHeaderRendererInnerClass0 extends Path implements IGridVisualElement {


    private var _1752992635arrowFill1: GradientEntry;

    private var _1752992634arrowFill2: GradientEntry;

    private var _88844982outerDocument: DefaultGridHeaderRenderer;

    public function DefaultGridHeaderRendererInnerClass0() {
        super();
        this.data = "M 3.5 7.0 L 0.0 0.0 L 7.0 0.0 L 3.5 7.0";
        this.fill = this._DefaultGridHeaderRendererInnerClass0_RadialGradient1_c();
    }

    public function prepareGridVisualElement(param1: Grid, param2: int, param3: int): void {
        var _loc4_: DataGrid;
        if (!(_loc4_ = param1.dataGrid)) {
            return;
        }
        var _loc5_: uint = _loc4_.getStyle("symbolColor");
        this.arrowFill1.color = _loc5_;
        this.arrowFill2.color = _loc5_;
    }

    private function _DefaultGridHeaderRendererInnerClass0_RadialGradient1_c(): RadialGradient {
        var _loc1_: RadialGradient = new RadialGradient();
        _loc1_.rotation = 90;
        _loc1_.focalPointRatio = 1;
        _loc1_.entries = [this._DefaultGridHeaderRendererInnerClass0_GradientEntry1_i(), this._DefaultGridHeaderRendererInnerClass0_GradientEntry2_i()];
        return _loc1_;
    }

    private function _DefaultGridHeaderRendererInnerClass0_GradientEntry1_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 0;
        _loc1_.alpha = 0.6;
        this.arrowFill1 = _loc1_;
        BindingManager.executeBindings(this, "arrowFill1", this.arrowFill1);
        return _loc1_;
    }

    private function _DefaultGridHeaderRendererInnerClass0_GradientEntry2_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 0;
        _loc1_.alpha = 0.8;
        this.arrowFill2 = _loc1_;
        BindingManager.executeBindings(this, "arrowFill2", this.arrowFill2);
        return _loc1_;
    }

    [Bindable(event="propertyChange")]
    public function get arrowFill1(): GradientEntry {
        return this._1752992635arrowFill1;
    }

    public function set arrowFill1(param1: GradientEntry): void {
        var _loc2_: Object = this._1752992635arrowFill1;
        if (_loc2_ !== param1) {
            this._1752992635arrowFill1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "arrowFill1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get arrowFill2(): GradientEntry {
        return this._1752992634arrowFill2;
    }

    public function set arrowFill2(param1: GradientEntry): void {
        var _loc2_: Object = this._1752992634arrowFill2;
        if (_loc2_ !== param1) {
            this._1752992634arrowFill2 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "arrowFill2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get outerDocument(): DefaultGridHeaderRenderer {
        return this._88844982outerDocument;
    }

    public function set outerDocument(param1: DefaultGridHeaderRenderer): void {
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
