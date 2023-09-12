package spark.skins.spark {

import flash.display.DisplayObject;
import flash.events.Event;

import mx.core.IDataRenderer;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.events.FlexEvent;

import spark.components.IItemRenderer;
import spark.components.Label;
import spark.components.supportClasses.InteractionState;
import spark.components.supportClasses.InteractionStateDetector;
import spark.components.supportClasses.TextBase;

public class DefaultItemRenderer extends UIComponent implements IDataRenderer, IItemRenderer {


    private var interactionStateDetector: InteractionStateDetector;

    private var _data: Object;

    private var _itemIndex: int;

    private var _label: String = "";

    public var labelDisplay: TextBase;

    private var _showsCaret: Boolean = false;

    private var _selected: Boolean = false;

    private var _dragging: Boolean = false;

    public function DefaultItemRenderer() {
        super();
        this.interactionStateDetector = new InteractionStateDetector(this);
        this.interactionStateDetector.addEventListener(Event.CHANGE, this.interactionStateDetector_changeHandler);
    }

    override public function get baselinePosition(): Number {
        if (!this.labelDisplay || !mx_internal::validateBaselinePosition()) {
            return super.baselinePosition;
        }
        return this.labelDisplay.y + this.labelDisplay.baselinePosition;
    }

    [Bindable("dataChange")]
    public function get data(): Object {
        return this._data;
    }

    public function set data(param1: Object): void {
        this._data = param1;
        if (hasEventListener(FlexEvent.DATA_CHANGE)) {
            dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
        }
    }

    public function get itemIndex(): int {
        return this._itemIndex;
    }

    public function set itemIndex(param1: int): void {
        if (param1 == this._itemIndex) {
            return;
        }
        this._itemIndex = param1;
        invalidateDisplayList();
    }

    public function get label(): String {
        return this._label;
    }

    public function set label(param1: String): void {
        if (param1 == this._label) {
            return;
        }
        this._label = param1;
        if (this.labelDisplay) {
            this.labelDisplay.text = this._label;
        }
    }

    public function get showsCaret(): Boolean {
        return this._showsCaret;
    }

    public function set showsCaret(param1: Boolean): void {
        if (param1 == this._showsCaret) {
            return;
        }
        this._showsCaret = param1;
        invalidateDisplayList();
    }

    public function get selected(): Boolean {
        return this._selected;
    }

    public function set selected(param1: Boolean): void {
        if (param1 != this._selected) {
            this._selected = param1;
            invalidateDisplayList();
        }
    }

    public function get dragging(): Boolean {
        return this._dragging;
    }

    public function set dragging(param1: Boolean): void {
        if (param1 == this._dragging) {
            return;
        }
        this._dragging = param1;
    }

    override protected function createChildren(): void {
        super.createChildren();
        if (!this.labelDisplay) {
            this.labelDisplay = new Label();
            addChild(DisplayObject(this.labelDisplay));
            if (this._label != "") {
                this.labelDisplay.text = this._label;
            }
        }
    }

    override protected function measure(): void {
        super.measure();
        measuredWidth = this.labelDisplay.getPreferredBoundsWidth() + 6;
        measuredHeight = this.labelDisplay.getPreferredBoundsHeight() + 10;
        measuredMinWidth = this.labelDisplay.getMinBoundsWidth() + 6;
        measuredMinHeight = this.labelDisplay.getMinBoundsHeight() + 10;
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        var _loc3_: * = 0;
        var _loc8_: * = null;
        var _loc9_: * = null;
        super.updateDisplayList(param1, param2);
        graphics.clear();
        var _loc4_: Boolean = true;
        var _loc5_: * = getStyle("downColor");
        if (this.interactionStateDetector.state == InteractionState.DOWN && _loc5_ !== undefined) {
            _loc3_ = _loc5_;
        } else if (this.selected) {
            _loc3_ = getStyle("selectionColor");
        } else if (this.interactionStateDetector.state == InteractionState.OVER) {
            _loc3_ = getStyle("rollOverColor");
        } else {
            if (_loc9_ = getStyle("alternatingItemColors")) {
                _loc8_ = _loc9_ is Array ? _loc9_ as Array : [_loc9_];
            }
            if (Boolean(_loc8_) && _loc8_.length > 0) {
                styleManager.getColorNames(_loc8_);
                _loc3_ = uint(_loc8_[this.itemIndex % _loc8_.length]);
            } else {
                _loc4_ = false;
            }
        }
        graphics.beginFill(_loc3_, _loc4_ ? 1 : 0);
        if (this.showsCaret) {
            graphics.lineStyle(1, getStyle("selectionColor"));
            graphics.drawRect(0.5, 0.5, param1 - 1, param2 - 1);
        } else {
            graphics.lineStyle();
            graphics.drawRect(0, 0, param1, param2);
        }
        graphics.endFill();
        var _loc6_: Number = param1 - 6;
        _loc6_ = Math.max(this.labelDisplay.getMinBoundsWidth(), Math.min(this.labelDisplay.getMaxBoundsWidth(), _loc6_));
        var _loc7_: Number = param2 - 10;
        _loc7_ = Math.max(this.labelDisplay.getMinBoundsHeight(), Math.min(this.labelDisplay.getMaxBoundsHeight(), _loc7_));
        this.labelDisplay.setLayoutBoundsSize(_loc6_, _loc7_);
        this.labelDisplay.setLayoutBoundsPosition(3, 5);
    }

    private function interactionStateDetector_changeHandler(param1: Event): void {
        invalidateDisplayList();
    }
}
}
