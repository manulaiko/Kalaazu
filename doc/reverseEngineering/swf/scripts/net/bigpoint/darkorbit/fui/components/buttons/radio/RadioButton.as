package net.bigpoint.darkorbit.fui.components.buttons.radio {

import flash.events.MouseEvent;

import net.bigpoint.darkorbit.fui.components.buttons.checkbox.CheckBox;

public class RadioButton extends CheckBox {


    protected var _groupName: String;

    public function RadioButton() {
        super();
    }

    override public function dispose(): void {
        RadioButtonGroupManager.getInstance().unregister(this._groupName, this);
        super.dispose();
    }

    override public function set selection(param1: Boolean): void {
        super.selection = param1;
    }

    override public function select(): void {
        super.select();
    }

    override public function unselect(): void {
        super.unselect();
    }

    override protected function handleButtonClicked(param1: MouseEvent): void {
        var _loc2_: RadioButtonGroup = this.group;
        if (_loc2_) {
            _loc2_.select(this);
        }
    }

    override protected function dispatchSelectionEvent(): void {
    }

    public function set groupName(param1: String): void {
        RadioButtonGroupManager.getInstance().register(param1, this);
        this._groupName = param1;
    }

    public function get groupName(): String {
        return this._groupName;
    }

    public function get group(): RadioButtonGroup {
        return RadioButtonGroupManager.getInstance().getGroup(this._groupName);
    }
}
}
