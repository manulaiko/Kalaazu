package net.bigpoint.darkorbit.fui.components.buttons.checkbox {

import flash.events.MouseEvent;

import net.bigpoint.darkorbit.fui.components.buttons.button.Button;
import net.bigpoint.darkorbit.fui.components.core.InvalidationType;
import net.bigpoint.darkorbit.fui.components.core.skins.SkinLayerNames;

public class CheckBox extends Button {


    protected const SELECTED: Boolean = true;

    protected const UNSELECTED: Boolean = false;

    protected var _selectionState: Boolean = false;

    protected var _currentSkinState: String = "normal";

    public function CheckBox() {
        super();
    }

    override protected function initialize(): void {
        super.initialize();
    }

    override protected function draw(): void {
        super.draw();
        if (isInvalidate(InvalidationType.SELECTION)) {
            this.drawSelectionState();
            validate(InvalidationType.SELECTION);
        }
    }

    protected function drawSelectionState(): void {
        if (_skin) {
            this.setSkinState(this._currentSkinState);
        }
    }

    override protected function handleButtonClicked(param1: MouseEvent): void {
        super.handleButtonClicked(param1);
        this.selection = !this.selection;
    }

    public function set selection(param1: Boolean): void {
        if (this._selectionState == param1) {
            return;
        }
        this._selectionState = param1;
        invalidate(InvalidationType.SELECTION);
        this.dispatchSelectionEvent();
    }

    public function get selection(): Boolean {
        return this._selectionState;
    }

    public function select(): void {
        if (this._selectionState == true) {
            return;
        }
        this._selectionState = true;
        invalidate(InvalidationType.SELECTION);
        this.dispatchSelectionEvent();
    }

    public function unselect(): void {
        if (this._selectionState == false) {
            return;
        }
        this._selectionState = false;
        invalidate(InvalidationType.SELECTION);
        this.dispatchSelectionEvent();
    }

    protected function dispatchSelectionEvent(): void {
        dispatchEvent(new CheckBoxEvent(this._selectionState));
    }

    override public function setSkinState(param1: String): void {
        this._currentSkinState = param1;
        if (this._selectionState == true) {
            switch (param1) {
                case SkinLayerNames.NORMAL:
                    param1 = "null";
                    break;
                case SkinLayerNames.CLICKED:
                    param1 = "null";
                    break;
                case SkinLayerNames.OVER:
                    param1 = "null";
                    break;
                case SkinLayerNames.DISABLED:
                    param1 = "null";
            }
        }
        super.setSkinState(param1);
    }
}
}
