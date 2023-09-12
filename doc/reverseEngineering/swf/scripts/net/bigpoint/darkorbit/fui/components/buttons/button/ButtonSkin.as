package net.bigpoint.darkorbit.fui.components.buttons.button {

import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.utils.Dictionary;

import net.bigpoint.darkorbit.fui.builder.repository.TextStyleRepository;
import net.bigpoint.darkorbit.fui.builder.repository.TextStyleVO;
import net.bigpoint.darkorbit.fui.components.core.skins.AbstractSkin;
import net.bigpoint.darkorbit.fui.components.core.skins.ISkin;
import net.bigpoint.darkorbit.fui.components.core.skins.SkinLayerNames;

public class ButtonSkin extends AbstractSkin implements IButtonSkin {

    private static var _skinLayerDefintions: Dictionary = new Dictionary();

    protected static const TEXTFIELD_TOP: uint = 1;

    protected static const TEXTFIELD_CENTER: uint = 2;

    protected static const TEXTFIELD_BOTTOM: uint = 4;

    protected static const TEXTFIELD_NAME: String = "tf";

    {
        _skinLayerDefintions[SkinLayerNames.NORMAL] = {};
        _skinLayerDefintions[SkinLayerNames.OVER] = {};
        _skinLayerDefintions[SkinLayerNames.CLICKED] = {};
        _skinLayerDefintions[SkinLayerNames.DISABLED] = {};
    }

    protected var _verticalTextfieldAlignment: uint = 2;

    protected var _msgLabel: TextField;

    protected var _textStyleName: String;

    protected var _textMarginX: int = 0;

    protected var _textMarginY: int = 0;

    public function ButtonSkin() {
        super();
    }

    override public function getSkinLayerDefintions(): Dictionary {
        return _skinLayerDefintions;
    }

    override protected function preinitialize(): void {
        super.preinitialize();
        _resizablelayers = new <String>[SkinLayerNames.NORMAL, SkinLayerNames.LABEL, SkinLayerNames.MASK, SkinLayerNames.NORMAL, SkinLayerNames.OVER, SkinLayerNames.CLICKED, SkinLayerNames.DISABLED];
    }

    override public function init(): void {
        super.init();
        if (false) {
            addChild(_layers[SkinLayerNames.NORMAL]);
            showState(SkinLayerNames.NORMAL);
        }
        if (false) {
            addChild(_layers[SkinLayerNames.OVER]);
            hideState(SkinLayerNames.OVER);
        }
        if (false) {
            addChild(_layers[SkinLayerNames.CLICKED]);
            hideState(SkinLayerNames.CLICKED);
        }
        if (false) {
            addChild(_layers[SkinLayerNames.DISABLED]);
            hideState(SkinLayerNames.DISABLED);
        }
        if (this._msgLabel == null) {
            this._msgLabel = new TextField();
            this._msgLabel.name = TEXTFIELD_NAME;
            this._msgLabel.width = 2;
            this._msgLabel.height = 2;
            this._msgLabel.mouseEnabled = false;
            this.assignTextStyle();
            addChild(this._msgLabel);
        }
    }

    override protected function setCurrentSkinState(param1: String): void {
        super.setCurrentSkinState(param1);
        switch (param1) {
            case SkinLayerNames.NORMAL:
                showState(SkinLayerNames.NORMAL);
                hideState(SkinLayerNames.OVER);
                hideState(SkinLayerNames.CLICKED);
                hideState(SkinLayerNames.DISABLED);
                break;
            case SkinLayerNames.OVER:
                hideState(SkinLayerNames.NORMAL);
                showState(SkinLayerNames.OVER);
                hideState(SkinLayerNames.CLICKED);
                hideState(SkinLayerNames.DISABLED);
                break;
            case SkinLayerNames.CLICKED:
                hideState(SkinLayerNames.NORMAL);
                hideState(SkinLayerNames.OVER);
                showState(SkinLayerNames.CLICKED);
                hideState(SkinLayerNames.DISABLED);
                break;
            case SkinLayerNames.DISABLED:
                hideState(SkinLayerNames.NORMAL);
                hideState(SkinLayerNames.OVER);
                hideState(SkinLayerNames.CLICKED);
                showState(SkinLayerNames.DISABLED);
        }
    }

    override public function set width(param1: Number): void {
        super.width = param1;
        this.alignTextfieldHorizontal();
    }

    override public function set height(param1: Number): void {
        super.height = param1;
        this.alignTextfieldVertical();
    }

    override public function setSize(param1: Number, param2: Number): void {
        super.setSize(param1, param2);
        this.alignTextfieldHorizontal();
        this.alignTextfieldVertical();
    }

    public function set text(param1: String): void {
        if (Boolean(this._msgLabel) && param1 != null) {
            this._msgLabel.text = param1;
            this._msgLabel.height = this._msgLabel.textHeight;
            this.alignTextfieldVertical();
            this.alignTextfieldHorizontal();
        }
    }

    protected function alignTextfieldHorizontal(): void {
        if (this._msgLabel) {
            switch (this._msgLabel.autoSize) {
                case TextFieldAutoSize.NONE:
                    this._msgLabel.width = _width;
                    break;
                case TextFieldAutoSize.LEFT:
                    this._msgLabel.x = 0 + this._textMarginX;
                    break;
                case TextFieldAutoSize.CENTER:
                    this._msgLabel.x = _width - this._msgLabel.width >> 1;
                    break;
                case TextFieldAutoSize.RIGHT:
                    this._msgLabel.x = _width - this._msgLabel.width - this._textMarginX;
            }
        }
    }

    protected function alignTextfieldVertical(): void {
        if (this._msgLabel) {
            switch (this._verticalTextfieldAlignment) {
                case TEXTFIELD_TOP:
                    this._setTextfieldPositionToTop();
                    break;
                case TEXTFIELD_CENTER:
                    this._centerTextfieldVertically();
                    break;
                case TEXTFIELD_BOTTOM:
                    this._setTextfieldPositionToBottom();
            }
        }
    }

    protected function _setTextfieldPositionToTop(): void {
    }

    protected function _centerTextfieldVertically(): void {
        this._msgLabel.y = (_height - this._msgLabel.height >> 1) + this._textMarginY;
    }

    protected function _setTextfieldPositionToBottom(): void {
    }

    public function set textStyleName(param1: String): void {
        this._textStyleName = param1;
        this.assignTextStyle();
    }

    protected function assignTextStyle(): void {
        var _loc1_: * = null;
        if (this._textStyleName) {
            _loc1_ = TextStyleRepository.getInstance().getByName(this._textStyleName);
            if (Boolean(_loc1_) && Boolean(this._msgLabel)) {
                _loc1_.assign(this._msgLabel);
            }
        }
    }

    public function set textMarginX(param1: uint): void {
        this._textMarginX = param1;
    }

    public function set textMarginY(param1: uint): void {
        this._textMarginY = param1;
    }

    override public function clone(): ISkin {
        var _loc1_: ButtonSkin = new ButtonSkin();
        _clone_(_loc1_, _skinLayerDefintions);
        return _loc1_;
    }
}
}
