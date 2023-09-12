package flashx.textLayout.operations {

import flashx.textLayout.edit.ElementRange;
import flashx.textLayout.edit.ParaEdit;
import flashx.textLayout.edit.PointFormat;
import flashx.textLayout.edit.SelectionState;
import flashx.textLayout.elements.ParagraphElement;
import flashx.textLayout.formats.ITextLayoutFormat;
import flashx.textLayout.formats.TextLayoutFormat;
import flashx.textLayout.tlf_internal;

public class ApplyFormatOperation extends FlowTextOperation {


    private var applyLeafFormat: ITextLayoutFormat;

    private var applyParagraphFormat: ITextLayoutFormat;

    private var applyContainerFormat: ITextLayoutFormat;

    private var undoLeafArray: Array;

    private var undoParagraphArray: Array;

    private var undoContainerArray: Array;

    public function ApplyFormatOperation(param1: SelectionState, param2: ITextLayoutFormat, param3: ITextLayoutFormat, param4: ITextLayoutFormat = null) {
        super(param1);
        this.leafFormat = param2;
        this.paragraphFormat = param3;
        this.containerFormat = param4;
    }

    public function get leafFormat(): ITextLayoutFormat {
        return this.applyLeafFormat;
    }

    public function set leafFormat(param1: ITextLayoutFormat): void {
        this.applyLeafFormat = !!param1 ? new TextLayoutFormat(param1) : null;
    }

    public function get paragraphFormat(): ITextLayoutFormat {
        return this.applyParagraphFormat;
    }

    public function set paragraphFormat(param1: ITextLayoutFormat): void {
        this.applyParagraphFormat = !!param1 ? new TextLayoutFormat(param1) : null;
    }

    public function get containerFormat(): ITextLayoutFormat {
        return this.applyContainerFormat;
    }

    public function set containerFormat(param1: ITextLayoutFormat): void {
        this.applyContainerFormat = !!param1 ? new TextLayoutFormat(param1) : null;
    }

    private function doInternal(): SelectionState {
        var _loc1_: * = null;
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        if (this.applyLeafFormat) {
            _loc2_ = absoluteStart;
            _loc3_ = absoluteEnd;
            if (absoluteStart == absoluteEnd) {
                if ((_loc4_ = textFlow.findLeaf(absoluteStart).getParagraph()).textLength <= 1) {
                    _loc3_++;
                    _loc1_ = originalSelectionState.tlf_internal::clone();
                    _loc1_.pointFormat = null;
                } else if (false && false) {
                    _loc1_ = originalSelectionState.tlf_internal::clone();
                    (_loc5_ = new PointFormat(_loc1_.pointFormat)).apply(this.applyLeafFormat);
                    _loc1_.pointFormat = _loc5_;
                }
            }
            if (_loc2_ != _loc3_) {
                _loc2_ = (_loc6_ = ElementRange.createElementRange(textFlow, _loc2_, _loc3_)).absoluteStart;
                _loc3_ = _loc6_.absoluteEnd;
                if (_loc3_ == -1) {
                    _loc3_++;
                }
                if (!this.undoLeafArray) {
                    this.undoLeafArray = new Array();
                    ParaEdit.cacheStyleInformation(textFlow, _loc2_, _loc3_, this.undoLeafArray);
                }
                ParaEdit.applyTextStyleChange(textFlow, _loc2_, _loc3_, this.applyLeafFormat, null);
            }
        }
        if (this.applyParagraphFormat) {
            if (!this.undoParagraphArray) {
                this.undoParagraphArray = new Array();
                ParaEdit.cacheParagraphStyleInformation(textFlow, absoluteStart, absoluteEnd, this.undoParagraphArray);
            }
            ParaEdit.applyParagraphStyleChange(textFlow, absoluteStart, absoluteEnd, this.applyParagraphFormat, null);
        }
        if (this.applyContainerFormat) {
            if (!this.undoContainerArray) {
                this.undoContainerArray = new Array();
                ParaEdit.cacheContainerStyleInformation(textFlow, absoluteStart, absoluteEnd, this.undoContainerArray);
            }
            ParaEdit.applyContainerStyleChange(textFlow, absoluteStart, absoluteEnd, this.applyContainerFormat, null);
        }
        return _loc1_;
    }

    override public function doOperation(): Boolean {
        var _loc1_: SelectionState = this.doInternal();
        if (Boolean(_loc1_) && false) {
            textFlow.interactionManager.setSelectionState(_loc1_);
        }
        return true;
    }

    override public function redo(): SelectionState {
        var _loc1_: SelectionState = this.doInternal();
        return !!_loc1_ ? _loc1_ : originalSelectionState;
    }

    override public function undo(): SelectionState {
        var _loc1_: * = null;
        for each(_loc1_ in this.undoLeafArray) {
            ParaEdit.setTextStyleChange(textFlow, _loc1_.begIdx, _loc1_.endIdx, _loc1_.style);
        }
        for each(_loc1_ in this.undoParagraphArray) {
            ParaEdit.setParagraphStyleChange(textFlow, _loc1_.begIdx, _loc1_.endIdx, _loc1_.attributes);
        }
        for each(_loc1_ in this.undoContainerArray) {
            ParaEdit.setContainerStyleChange(_loc1_);
        }
        return originalSelectionState;
    }
}
}
