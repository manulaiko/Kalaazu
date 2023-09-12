package net.bigpoint.darkorbit.fui.components.list.dropdownbox {

import flash.display.MovieClip;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.fui.components.core.Coreponent;
import net.bigpoint.darkorbit.fui.components.core.skins.BasicSkin;
import net.bigpoint.darkorbit.fui.components.core.skins.layers.MovieClipLayer;

public class DropDownBox extends Coreponent {


    private var _currentEntry: int = 0;

    private var _dropDownTriangleClip: MovieClip;

    private var _dropDownSelectedClip: MovieClip;

    private var _dropDownSelectedTextField: TextField;

    private var _droppedDownEntryClip: MovieClip;

    private var _droppedDownEntries: Vector.<MovieClip>;

    private var _dropDownTextFields: Vector.<TextField>;

    private var _dropDownTextKeys: Vector.<String>;

    private var _droppedDown: Boolean;

    private var _textFormat: TextFormat;

    public function DropDownBox() {
        this._dropDownTextKeys = new <String>["quality_low", "quality_medium", "quality_good", "quality_high"];
        super();
    }

    override protected function onAddedToStage(param1: Event): void {
        super.onAddedToStage(param1);
        this._dropDownTextFields = new Vector.<TextField>();
        this._droppedDownEntries = new Vector.<MovieClip>();
        this._droppedDown = false;
        this._textFormat = new TextFormat();
        this._textFormat.align = TextFormatAlign.LEFT;
        this._textFormat.font = "Verdana";
        this._textFormat.size = 10;
        var _loc2_: BasicSkin = this.getChildAt(0) as BasicSkin;
        this._dropDownSelectedClip = (_loc2_.getSkinLayer("normal") as MovieClipLayer).getChildAt(0) as MovieClip;
        this.addChild(this._dropDownSelectedClip);
        this._dropDownTriangleClip = this._dropDownSelectedClip.getChildByName("ActiveTriangle") as MovieClip;
        this._droppedDownEntryClip = this._dropDownSelectedClip.getChildByName("DroppedDownEntry") as MovieClip;
        this._dropDownSelectedTextField = new TextField();
        this._dropDownSelectedTextField.mouseEnabled = false;
        this._dropDownSelectedTextField.multiline = false;
        this._dropDownSelectedTextField.width = this._dropDownSelectedClip.width;
        this._dropDownSelectedTextField.defaultTextFormat = this._textFormat;
        this._dropDownSelectedTextField.textColor = 11184810;
        this._dropDownSelectedTextField.x = this._dropDownSelectedClip.x + 5;
        this._dropDownSelectedTextField.y = this._dropDownSelectedClip.y;
        this._dropDownSelectedTextField.appendText(class_88.getItem(this._dropDownTextKeys[this._currentEntry]));
        this.addChild(this._dropDownSelectedTextField);
        this._dropDownSelectedClip.gotoAndStop(1);
        this._dropDownTriangleClip.gotoAndStop(1);
        this.removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        this.mouseEnabled = true;
        this.mouseChildren = true;
        this._dropDownSelectedClip.addEventListener(MouseEvent.CLICK, this.handleMouseClicked);
        this._dropDownSelectedClip.addEventListener(MouseEvent.MOUSE_OVER, this.handleMouseOver);
        this._dropDownSelectedClip.addEventListener(MouseEvent.MOUSE_OUT, this.handleMouseOut);
    }

    private function handleMouseOver(param1: MouseEvent): void {
        if (!this._droppedDown) {
            this._dropDownSelectedClip.gotoAndStop(3);
        }
    }

    private function handleMouseOut(param1: MouseEvent): void {
        if (!this._droppedDown) {
            this._dropDownSelectedClip.gotoAndStop(1);
        }
    }

    public function forceCollapse(): void {
        if (this._droppedDown) {
            this.toggleDroppedState();
        }
    }

    private function toggleDroppedState(): void {
        var _loc1_: int = 0;
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: int = 0;
        if (!this._droppedDown) {
            this._dropDownSelectedClip.gotoAndStop(2);
            this._dropDownTriangleClip.gotoAndStop(2);
            _loc1_ = 0;
            while (_loc1_ < this._dropDownTextKeys.length) {
                _loc2_ = this.cloneMC(this._droppedDownEntryClip);
                _loc2_.x = this.marginLeft;
                _loc2_.y = this.marginTop - 10 + (_loc1_ + 1) * (this._droppedDownEntryClip.height - 1);
                _loc2_.gotoAndStop(1);
                _loc2_.addEventListener(MouseEvent.MOUSE_OVER, this.handleEntryMouseOver);
                _loc2_.addEventListener(MouseEvent.MOUSE_OUT, this.handleEntryMouseOut);
                _loc2_.addEventListener(MouseEvent.CLICK, this.handleEntryMouseClick);
                _loc3_ = new TextField();
                _loc3_.appendText(class_88.getItem(this._dropDownTextKeys[_loc1_]));
                _loc3_.mouseEnabled = false;
                _loc3_.multiline = false;
                _loc3_.width = _loc2_.width;
                _loc3_.setTextFormat(this._textFormat);
                _loc3_.textColor = 11184810;
                _loc3_.x = _loc2_.x + 5;
                _loc3_.y = _loc2_.y;
                this._droppedDownEntries.push(_loc2_);
                this._dropDownTextFields.push(_loc3_);
                this.parent.parent.parent.addChild(_loc2_);
                this.parent.parent.parent.addChild(_loc3_);
                _loc1_++;
            }
            dispatchEvent(new DropDownBoxEvent(DropDownBoxEvent.DROPPED_DOWN));
        } else {
            this._dropDownSelectedClip.gotoAndStop(1);
            this._dropDownTriangleClip.gotoAndStop(1);
            _loc4_ = 0;
            while (_loc4_ < this._dropDownTextFields.length) {
                this._dropDownTextFields[_loc4_].parent.removeChild(this._dropDownTextFields[_loc4_]);
                this._droppedDownEntries[_loc4_].parent.removeChild(this._droppedDownEntries[_loc4_]);
                _loc4_++;
            }
            this._dropDownTextFields.length = 0;
            this._droppedDownEntries.length = 0;
        }
        this._droppedDown = !this._droppedDown;
    }

    private function handleMouseClicked(param1: MouseEvent): void {
        this.toggleDroppedState();
    }

    private function handleEntryMouseOver(param1: MouseEvent): void {
        (param1.target as MovieClip).gotoAndStop(2);
    }

    private function handleEntryMouseOut(param1: MouseEvent): void {
        (param1.target as MovieClip).gotoAndStop(1);
    }

    private function handleEntryMouseClick(param1: MouseEvent): void {
        this.activateEntry(this._droppedDownEntries.indexOf(param1.target as MovieClip));
        this.toggleDroppedState();
    }

    private function activateEntry(param1: int): void {
        this._currentEntry = Math.max(0, Math.min(this._dropDownTextKeys.length - 1, param1));
        this._dropDownSelectedTextField.text = class_88.getItem(this._dropDownTextKeys[this._currentEntry]);
        dispatchEvent(new DropDownBoxEvent(DropDownBoxEvent.SELECTED_ENTRY_CHANGED, this._currentEntry));
    }

    private function cloneMC(param1: MovieClip): MovieClip {
        return new param1.constructor() as MovieClip;
    }

    override protected function removeEventListeners(): void {
        super.removeEventListeners();
    }

    public function set currentEntry(param1: int): void {
        this.activateEntry(param1);
    }

    public function updateAvailableEntries(param1: Vector.<String>): void {
        this.forceCollapse();
        this._dropDownTextKeys = param1;
    }
}
}
