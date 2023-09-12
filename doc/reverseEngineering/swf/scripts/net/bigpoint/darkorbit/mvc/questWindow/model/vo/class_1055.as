package net.bigpoint.darkorbit.mvc.questWindow.model.vo {

import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IEventDispatcher;

import mx.events.PropertyChangeEvent;

import package_38.class_771;

public class class_1055 implements IEventDispatcher {


    private var var_3760: int;

    private var var_4022: String;

    private var var_1444: EventDispatcher;

    public function class_1055(param1: class_771) {
        this.var_1444 = new EventDispatcher(IEventDispatcher(this));
        super();
        this.var_3760 = param1.amount;
        this.var_4022 = param1.lootId;
    }

    public function get amount(): int {
        return this.var_3760;
    }

    private function set name_31(param1: int): void {
        this.var_3760 = param1;
    }

    public function get lootId(): String {
        return this.var_4022;
    }

    private function set method_4485(param1: String): void {
        this.var_4022 = param1;
    }

    [Bindable(event="propertyChange")]
    public function set amount(param1: int): void {
        var _loc2_: Object = this.amount;
        if (_loc2_ !== param1) {
            this.name_31 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "amount", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function set lootId(param1: String): void {
        var _loc2_: Object = this.lootId;
        if (_loc2_ !== param1) {
            this.method_4485 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lootId", _loc2_, param1));
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
