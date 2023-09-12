package net.bigpoint.darkorbit.mvc.questWindow.model.vo {

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

import mx.events.PropertyChangeEvent;

public class HighscoreVO implements IEventDispatcher {


    private var _position: int;

    private var var_2878: String;

    private var var_1691: int;

    private var _active: Boolean;

    private var var_4351: int;

    private var var_4261: String;

    private var var_2482: Boolean;

    private var var_1444: EventDispatcher;

    public function HighscoreVO(param1: int, param2: String, param3: int, param4: Boolean, param5: int, param6: String, param7: Boolean) {
        this.var_1444 = new EventDispatcher(IEventDispatcher(this));
        super();
        this._position = param1;
        this.var_2878 = param2;
        this.var_1691 = param3;
        this._active = param4;
        this.var_4351 = param5;
        this.var_4261 = param6;
        this.var_2482 = param7;
    }

    public function get position(): int {
        return this._position;
    }

    public function get points(): int {
        return this.var_1691;
    }

    public function get active(): Boolean {
        return this._active;
    }

    public function get difference(): int {
        return this.var_4351;
    }

    public function get playername(): String {
        return this.var_2878;
    }

    public function get name_120(): String {
        return this.var_4261;
    }

    public function get isHero(): Boolean {
        return this.var_2482;
    }

    public function getField(param1: String): Object {
        return this[param1];
    }

    private function set name_5(param1: Boolean): void {
        this._active = param1;
    }

    [Bindable(event="propertyChange")]
    public function set active(param1: Boolean): void {
        var _loc2_: Object = this.active;
        if (_loc2_ !== param1) {
            this.name_5 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "active", _loc2_, param1));
            }
        }
    }

    public function addEventListener(param1: String, param2: Function, param3: Boolean = false, param4: int = 0, param5: Boolean = false): void {
        this.var_1444.addEventListener(param1, param2, param3, param4, param5);
    }

    public function dispatchEvent(param1: Event): Boolean {
        return this.var_1444.dispatchEvent(param1);
    }

    public function hasEventListener(param1: String): Boolean {
        return this.var_1444.hasEventListener(param1);
    }

    public function removeEventListener(param1: String, param2: Function, param3: Boolean = false): void {
        this.var_1444.removeEventListener(param1, param2, param3);
    }

    public function willTrigger(param1: String): Boolean {
        return this.var_1444.willTrigger(param1);
    }
}
}
