package net.bigpoint.darkorbit.fui.components.buttons.radio {

import flash.events.EventDispatcher;
import flash.utils.Dictionary;

public class RadioButtonGroup extends EventDispatcher {


    private var _rbMap: Dictionary;

    private var _currentSelectedRadioButton: RadioButton;

    private var _number: uint = 0;

    public function RadioButtonGroup() {
        this._rbMap = new Dictionary();
        super();
    }

    public function add(param1: RadioButton): void {
        if (this._rbMap[param1.name]) {
            this.remove(param1);
        }
        this._rbMap[param1.name] = param1;
        ++this._number;
    }

    public function remove(param1: RadioButton): void {
        if (this._rbMap[param1.name]) {
            this._rbMap[param1.name] = null;
            delete this._rbMap[param1.name];
            if (this._number > 0) {
                --this._number;
            }
        }
    }

    public function select(param1: RadioButton): void {
        var _loc2_: * = null;
        for each(_loc2_ in this._rbMap) {
            if (_loc2_.name == param1.name) {
                _loc2_.select();
                this._currentSelectedRadioButton = param1;
            } else {
                _loc2_.unselect();
            }
        }
        dispatchEvent(new RadioButtonGroupEvent(this));
    }

    public function get number(): uint {
        return this._number;
    }

    public function getSelectedRadionButton(): RadioButton {
        return this._currentSelectedRadioButton;
    }
}
}
