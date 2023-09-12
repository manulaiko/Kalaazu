package spark.components {

import flash.events.Event;

import mx.core.mx_internal;

import spark.layouts.VerticalLayout;
import spark.layouts.supportClasses.LayoutBase;

public class VGroup extends Group {

    mx_internal static const VERSION: String = "4.6.0.23201";


    public function VGroup() {
        super();
        super.layout = new VerticalLayout();
    }

    private function get verticalLayout(): VerticalLayout {
        return VerticalLayout(layout);
    }

    public function get gap(): int {
        return this.verticalLayout.gap;
    }

    public function set gap(param1: int): void {
        this.verticalLayout.gap = param1;
    }

    public function get horizontalAlign(): String {
        return this.verticalLayout.horizontalAlign;
    }

    public function set horizontalAlign(param1: String): void {
        this.verticalLayout.horizontalAlign = param1;
    }

    public function get verticalAlign(): String {
        return this.verticalLayout.verticalAlign;
    }

    public function set verticalAlign(param1: String): void {
        this.verticalLayout.verticalAlign = param1;
    }

    public function get paddingLeft(): Number {
        return this.verticalLayout.paddingLeft;
    }

    public function set paddingLeft(param1: Number): void {
        this.verticalLayout.paddingLeft = param1;
    }

    public function get paddingRight(): Number {
        return this.verticalLayout.paddingRight;
    }

    public function set paddingRight(param1: Number): void {
        this.verticalLayout.paddingRight = param1;
    }

    public function get paddingTop(): Number {
        return this.verticalLayout.paddingTop;
    }

    public function set paddingTop(param1: Number): void {
        this.verticalLayout.paddingTop = param1;
    }

    public function get paddingBottom(): Number {
        return this.verticalLayout.paddingBottom;
    }

    public function set paddingBottom(param1: Number): void {
        this.verticalLayout.paddingBottom = param1;
    }

    [Bindable("propertyChange")]
    public function get rowCount(): int {
        return this.verticalLayout.rowCount;
    }

    public function get requestedMaxRowCount(): int {
        return this.verticalLayout.requestedMaxRowCount;
    }

    public function set requestedMaxRowCount(param1: int): void {
        this.verticalLayout.requestedMaxRowCount = param1;
    }

    public function get requestedMinRowCount(): int {
        return this.verticalLayout.requestedMinRowCount;
    }

    public function set requestedMinRowCount(param1: int): void {
        this.verticalLayout.requestedMinRowCount = param1;
    }

    public function get requestedRowCount(): int {
        return this.verticalLayout.requestedRowCount;
    }

    public function set requestedRowCount(param1: int): void {
        this.verticalLayout.requestedRowCount = param1;
    }

    public function get rowHeight(): Number {
        return this.verticalLayout.rowHeight;
    }

    public function set rowHeight(param1: Number): void {
        this.verticalLayout.rowHeight = param1;
    }

    public function get variableRowHeight(): Boolean {
        return this.verticalLayout.variableRowHeight;
    }

    public function set variableRowHeight(param1: Boolean): void {
        this.verticalLayout.variableRowHeight = param1;
    }

    [Bindable("indexInViewChanged")]
    public function get firstIndexInView(): int {
        return this.verticalLayout.firstIndexInView;
    }

    [Bindable("indexInViewChanged")]
    public function get lastIndexInView(): int {
        return this.verticalLayout.lastIndexInView;
    }

    override public function set layout(param1: LayoutBase): void {
        throw new Error(resourceManager.getString("components", "layoutReadOnly"));
    }

    override public function addEventListener(param1: String, param2: Function, param3: Boolean = false, param4: int = 0, param5: Boolean = false): void {
        switch (param1) {
            case "indexInViewChanged":
            case "propertyChange":
                if (!hasEventListener(param1)) {
                    this.verticalLayout.addEventListener(param1, this.redispatchHandler);
                    break;
                }
        }
        super.addEventListener(param1, param2, param3, param4, param5);
    }

    override public function removeEventListener(param1: String, param2: Function, param3: Boolean = false): void {
        super.removeEventListener(param1, param2, param3);
        switch (param1) {
            case "indexInViewChanged":
            case "propertyChange":
                if (!hasEventListener(param1)) {
                    this.verticalLayout.removeEventListener(param1, this.redispatchHandler);
                    break;
                }
        }
    }

    private function redispatchHandler(param1: Event): void {
        dispatchEvent(param1);
    }
}
}
