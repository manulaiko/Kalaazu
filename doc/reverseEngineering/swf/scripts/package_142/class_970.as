package package_142 {

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;

import package_141.class_969;

public class class_970 extends class_969 {


    public var selectedState: Sprite;

    public var rollOverState: Sprite;

    public var mouseDownState: Sprite;

    public var labelF: TextField;

    public var background: Sprite;

    private var _selected: Boolean;

    public function class_970(param1: DisplayObjectContainer) {
        super(param1);
        this.addListeners();
        mouseChildren = false;
        buttonMode = true;
        this.method_1574();
    }

    override public function decorate(): void {
        method_4210(this.background = method_4492(this.method_4462, true));
        method_4210(this.rollOverState = method_4492(this.method_6157));
        method_4210(this.mouseDownState = method_4492(this.method_1686));
        method_4210(this.selectedState = method_4492(this.method_1151, true));
        method_4210(this.labelF = method_1023("labelF", true));
    }

    protected function addListeners(): void {
        addEventListener(MouseEvent.ROLL_OVER, this.rollHandler, false, 1000, true);
        addEventListener(MouseEvent.ROLL_OUT, this.rollHandler, false, 1000, true);
        addEventListener(MouseEvent.MOUSE_DOWN, this.mouseUpDownHandler, false, 0, true);
        addEventListener(MouseEvent.MOUSE_UP, this.mouseUpDownHandler, false, 0, true);
        addEventListener(MouseEvent.CLICK, this.clickHandler, false, 0, true);
        addEventListener(MouseEvent.DOUBLE_CLICK, this.doubleClickHandler);
        addEventListener(Event.REMOVED_FROM_STAGE, this.removeFromStageListener, false, 0, true);
    }

    public function rollHandler(param1: MouseEvent): void {
        if (!this._selected) {
            method_4622(param1.type == MouseEvent.ROLL_OVER, this.rollOverState);
            if (param1.type == MouseEvent.ROLL_OUT) {
                method_4622(false, this.mouseDownState);
            }
        }
    }

    protected function method_1574(): void {
        method_4622(false, this.selectedState, 0);
        method_4622(false, this.rollOverState, 0);
        method_4622(false, this.mouseDownState, 0);
    }

    public function mouseUpDownHandler(param1: MouseEvent): void {
        var _loc2_: * = param1.type == MouseEvent.MOUSE_DOWN;
        if (!this._selected) {
            method_4622(_loc2_, this.mouseDownState, 0.1);
            if (Boolean(this.selectedState) || Boolean(this.mouseDownState)) {
                if (_loc2_) {
                    method_4622(false, this.rollOverState, 0.6);
                }
            }
        }
    }

    protected function clickHandler(param1: MouseEvent): void {
    }

    protected function doubleClickHandler(param1: MouseEvent): void {
    }

    protected function removeFromStageListener(param1: Event): void {
    }

    public function set selected(param1: Boolean): void {
        method_4622(param1, this.selectedState);
        if (param1) {
            method_4622(false, this.rollOverState, 0);
            method_4622(false, this.mouseDownState, 0);
        }
        this._selected = param1;
    }

    protected function get method_4462(): String {
        return "background";
    }

    protected function get method_6157(): String {
        return "rollOverState";
    }

    protected function get method_1686(): String {
        return "mouseDownState";
    }

    protected function get method_1151(): String {
        return "selectedState";
    }

    public function set enable(param1: Boolean): void {
        mouseEnabled = param1;
        alpha = param1 ? 1 : 0.3;
    }

    public function get selected(): Boolean {
        return this._selected;
    }
}
}
