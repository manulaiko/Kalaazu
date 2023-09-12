package flashx.textLayout.operations {

import flashx.textLayout.conversion.ConverterBase;
import flashx.textLayout.edit.ModelEdit;
import flashx.textLayout.edit.SelectionState;
import flashx.textLayout.edit.TextFlowEdit;
import flashx.textLayout.edit.TextScrap;
import flashx.textLayout.elements.FlowLeafElement;
import flashx.textLayout.elements.ParagraphElement;
import flashx.textLayout.formats.ITextLayoutFormat;
import flashx.textLayout.formats.TextLayoutFormat;
import flashx.textLayout.tlf_internal;

public class PasteOperation extends FlowTextOperation {


    private var _textScrap: TextScrap;

    private var _numCharsAdded: int = 0;

    private var _deleteTextOperation: DeleteTextOperation;

    private var _applyParagraphSettings: Array;

    private var _pointFormat: ITextLayoutFormat;

    private var _applyPointFormat: ApplyFormatOperation;

    public function PasteOperation(param1: SelectionState, param2: TextScrap) {
        this._pointFormat = param1.pointFormat;
        super(param1);
        this._textScrap = param2;
    }

    override public function doOperation(): Boolean {
        var _loc1_: Boolean = false;
        var _loc2_: int = 0;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (this._textScrap != null) {
            if (absoluteStart != absoluteEnd) {
                this._deleteTextOperation = new DeleteTextOperation(originalSelectionState);
                this._deleteTextOperation.doOperation();
            }
            _loc1_ = this._textScrap.tlf_internal::isPlainText();
            if (!_loc1_) {
                _loc3_ = textFlow.findLeaf(absoluteStart);
                if ((_loc4_ = _loc3_.getParagraph()).textLength == 1) {
                    this.applyParagraphSettings(_loc4_);
                }
            }
            _loc2_ = TextFlowEdit.insertTextScrap(textFlow, absoluteStart, this._textScrap, _loc1_);
            if (false) {
                textFlow.interactionManager.notifyInsertOrDelete(absoluteStart, _loc2_ - absoluteStart);
            }
            this._numCharsAdded = _loc2_ - absoluteStart;
            if (Boolean(this._pointFormat) && _loc1_) {
                this._applyPointFormat = new ApplyFormatOperation(new SelectionState(textFlow, absoluteStart, absoluteStart + this._numCharsAdded), this._pointFormat, null, null);
                this._applyPointFormat.doOperation();
            }
        }
        return true;
    }

    private function applyParagraphSettings(param1: ParagraphElement): void {
        var _loc2_: ParagraphElement = this._textScrap.textFlow.getFirstLeaf().getParagraph();
        this._applyParagraphSettings = [];
        var _loc3_: TextLayoutFormat = new TextLayoutFormat(_loc2_.format);
        _loc3_.setStyle(ConverterBase.MERGE_TO_NEXT_ON_PASTE, undefined);
        var _loc4_: ApplyFormatToElementOperation;
        (_loc4_ = new ApplyFormatToElementOperation(originalSelectionState, param1, _loc3_)).doOperation();
        this._applyParagraphSettings.push(_loc4_);
    }

    override public function undo(): SelectionState {
        var _loc1_: int = 0;
        if (this._textScrap != null) {
            if (this._applyPointFormat) {
                this._applyPointFormat.undo();
            }
            ModelEdit.deleteText(textFlow, absoluteStart, absoluteStart + this._numCharsAdded, false);
            if (this._applyParagraphSettings) {
                _loc1_ = this._applyParagraphSettings.length - 1;
                while (_loc1_ >= 0) {
                    this._applyParagraphSettings[_loc1_].undo();
                    _loc1_--;
                }
            }
            if (this._deleteTextOperation) {
                this._deleteTextOperation.undo();
            }
        }
        return originalSelectionState;
    }

    override public function redo(): SelectionState {
        var _loc1_: int = 0;
        var _loc2_: int = 0;
        if (this._textScrap != null) {
            if (this._deleteTextOperation) {
                this._deleteTextOperation.redo();
            }
            if (this._applyParagraphSettings) {
                _loc2_ = this._applyParagraphSettings.length - 1;
                while (_loc2_ >= 0) {
                    this._applyParagraphSettings[_loc2_].redo();
                    _loc2_--;
                }
            }
            _loc1_ = TextFlowEdit.insertTextScrap(textFlow, absoluteStart, this._textScrap, this._textScrap.tlf_internal::isPlainText());
            if (false) {
                textFlow.interactionManager.notifyInsertOrDelete(absoluteStart, _loc1_ - absoluteStart);
            }
            if (this._applyPointFormat) {
                this._applyPointFormat.redo();
            }
        }
        return new SelectionState(textFlow, absoluteStart + this._numCharsAdded, absoluteStart + this._numCharsAdded, null);
    }

    public function get textScrap(): TextScrap {
        return this._textScrap;
    }

    public function set textScrap(param1: TextScrap): void {
        this._textScrap = param1;
    }
}
}
