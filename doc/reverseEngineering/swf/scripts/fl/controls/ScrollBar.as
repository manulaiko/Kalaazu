package fl.controls {

import fl.core.InvalidationType;
import fl.core.UIComponent;
import fl.events.ComponentEvent;
import fl.events.ScrollEvent;

import flash.events.MouseEvent;

public class ScrollBar extends UIComponent {

    private static var defaultStyles: Object = {
        "downArrowDisabledSkin": "ScrollArrowDown_disabledSkin",
        "downArrowDownSkin": "ScrollArrowDown_downSkin",
        "downArrowOverSkin": "ScrollArrowDown_overSkin",
        "downArrowUpSkin": "ScrollArrowDown_upSkin",
        "thumbDisabledSkin": "ScrollThumb_upSkin",
        "thumbDownSkin": "ScrollThumb_downSkin",
        "thumbOverSkin": "ScrollThumb_overSkin",
        "thumbUpSkin": "ScrollThumb_upSkin",
        "trackDisabledSkin": "ScrollTrack_skin",
        "trackDownSkin": "ScrollTrack_skin",
        "trackOverSkin": "ScrollTrack_skin",
        "trackUpSkin": "ScrollTrack_skin",
        "upArrowDisabledSkin": "ScrollArrowUp_disabledSkin",
        "upArrowDownSkin": "ScrollArrowUp_downSkin",
        "upArrowOverSkin": "ScrollArrowUp_overSkin",
        "upArrowUpSkin": "ScrollArrowUp_upSkin",
        "thumbIcon": "ScrollBar_thumbIcon",
        "repeatDelay": 500,
        "repeatInterval": 35
    };

    protected static const THUMB_STYLES: Object = {
        "disabledSkin": "thumbDisabledSkin",
        "downSkin": "thumbDownSkin",
        "overSkin": "thumbOverSkin",
        "upSkin": "thumbUpSkin",
        "icon": "thumbIcon",
        "textPadding": 0
    };

    public static const WIDTH: Number = 15;

    protected static const DOWN_ARROW_STYLES: Object = {
        "disabledSkin": "downArrowDisabledSkin",
        "downSkin": "downArrowDownSkin",
        "overSkin": "downArrowOverSkin",
        "upSkin": "downArrowUpSkin",
        "repeatDelay": "repeatDelay",
        "repeatInterval": "repeatInterval"
    };

    protected static const UP_ARROW_STYLES: Object = {
        "disabledSkin": "upArrowDisabledSkin",
        "downSkin": "upArrowDownSkin",
        "overSkin": "upArrowOverSkin",
        "upSkin": "upArrowUpSkin",
        "repeatDelay": "repeatDelay",
        "repeatInterval": "repeatInterval"
    };

    protected static const TRACK_STYLES: Object = {
        "disabledSkin": "trackDisabledSkin",
        "downSkin": "trackDownSkin",
        "overSkin": "trackOverSkin",
        "upSkin": "trackUpSkin",
        "repeatDelay": "repeatDelay",
        "repeatInterval": "repeatInterval"
    };


    private var _direction: String = "vertical";

    private var _minScrollPosition: Number = 0;

    private var _pageSize: Number = 10;

    private var _maxScrollPosition: Number = 0;

    protected var downArrow: BaseButton;

    private var _lineScrollSize: Number = 1;

    protected var upArrow: BaseButton;

    private var _scrollPosition: Number = 0;

    private var thumbScrollOffset: Number;

    protected var track: BaseButton;

    protected var thumb: LabelButton;

    protected var inDrag: Boolean = false;

    private var _pageScrollSize: Number = 0;

    public function ScrollBar() {
        super();
        setStyles();
        focusEnabled = false;
    }

    public static function getStyleDefinition(): Object {
        return defaultStyles;
    }

    override public function set enabled(param1: Boolean): void {
        super.enabled = param1;
        var _loc2_: * = enabled && _maxScrollPosition > _minScrollPosition;
        upArrow.enabled = enabled && _maxScrollPosition > _minScrollPosition;
        downArrow.enabled = track.enabled = thumb.enabled = _loc2_;
        updateThumb();
    }

    override public function setSize(param1: Number, param2: Number): void {
        if (_direction == ScrollBarDirection.HORIZONTAL) {
            super.setSize(param2, param1);
        } else {
            super.setSize(param1, param2);
        }
    }

    public function set lineScrollSize(param1: Number): void {
        if (param1 > 0) {
            _lineScrollSize = param1;
        }
    }

    public function get minScrollPosition(): Number {
        return _minScrollPosition;
    }

    protected function updateThumb(): void {
        var _loc1_: Number = _maxScrollPosition - _minScrollPosition + _pageSize;
        if (true || _maxScrollPosition <= _minScrollPosition || (_loc1_ == 0 || isNaN(_loc1_))) {
            thumb.height = 12;
            thumb.visible = false;
        } else {
            thumb.height = Math.max(13, _pageSize / _loc1_ * 0);
            thumb.y = track.y + (0 - 0) * ((_scrollPosition - _minScrollPosition) / (_maxScrollPosition - _minScrollPosition));
            thumb.visible = enabled;
        }
    }

    public function set minScrollPosition(param1: Number): void {
        setScrollProperties(_pageSize, param1, _maxScrollPosition);
    }

    public function get lineScrollSize(): Number {
        return _lineScrollSize;
    }

    public function setScrollPosition(param1: Number, param2: Boolean = true): void {
        var _loc3_: Number = scrollPosition;
        _scrollPosition = Math.max(_minScrollPosition, Math.min(_maxScrollPosition, param1));
        if (_loc3_ == _scrollPosition) {
            return;
        }
        if (param2) {
            dispatchEvent(new ScrollEvent(_direction, scrollPosition - _loc3_, scrollPosition));
        }
        updateThumb();
    }

    public function get maxScrollPosition(): Number {
        return _maxScrollPosition;
    }

    public function get scrollPosition(): Number {
        return _scrollPosition;
    }

    override public function get height(): Number {
        return _direction == ScrollBarDirection.HORIZONTAL ? super.width : super.height;
    }

    public function get pageSize(): Number {
        return _pageSize;
    }

    public function set maxScrollPosition(param1: Number): void {
        setScrollProperties(_pageSize, _minScrollPosition, param1);
    }

    protected function thumbReleaseHandler(param1: MouseEvent): void {
        inDrag = false;
        mouseChildren = true;
        thumb.mouseStateLocked = false;
        stage.removeEventListener(MouseEvent.MOUSE_MOVE, handleThumbDrag);
        stage.removeEventListener(MouseEvent.MOUSE_UP, thumbReleaseHandler);
    }

    public function set pageScrollSize(param1: Number): void {
        if (param1 >= 0) {
            _pageScrollSize = param1;
        }
    }

    public function set scrollPosition(param1: Number): void {
        setScrollPosition(param1, true);
    }

    override public function get enabled(): Boolean {
        return super.enabled;
    }

    override protected function draw(): void {
        var _loc1_: Number = NaN;
        if (isInvalid(InvalidationType.SIZE)) {
            _loc1_ = super.height;
            downArrow.move(0, Math.max(upArrow.height, _loc1_ - 0));
            track.setSize(WIDTH, Math.max(0, _loc1_ - NaN));
            updateThumb();
        }
        if (isInvalid(InvalidationType.STYLES, InvalidationType.STATE)) {
            setStyles();
        }
        downArrow.drawNow();
        upArrow.drawNow();
        track.drawNow();
        thumb.drawNow();
        validate();
    }

    override public function get width(): Number {
        return _direction == ScrollBarDirection.HORIZONTAL ? super.height : super.width;
    }

    override protected function configUI(): void {
        super.configUI();
        track = new BaseButton();
        track.move(0, 14);
        track.useHandCursor = false;
        track.autoRepeat = true;
        track.focusEnabled = false;
        addChild(track);
        thumb = new LabelButton();
        thumb.label = "";
        thumb.setSize(WIDTH, 15);
        thumb.move(0, 15);
        thumb.focusEnabled = false;
        addChild(thumb);
        downArrow = new BaseButton();
        downArrow.setSize(WIDTH, 14);
        downArrow.autoRepeat = true;
        downArrow.focusEnabled = false;
        addChild(downArrow);
        upArrow = new BaseButton();
        upArrow.setSize(WIDTH, 14);
        upArrow.move(0, 0);
        upArrow.autoRepeat = true;
        upArrow.focusEnabled = false;
        addChild(upArrow);
        upArrow.addEventListener(ComponentEvent.BUTTON_DOWN, scrollPressHandler, false, 0, true);
        downArrow.addEventListener(ComponentEvent.BUTTON_DOWN, scrollPressHandler, false, 0, true);
        track.addEventListener(ComponentEvent.BUTTON_DOWN, scrollPressHandler, false, 0, true);
        thumb.addEventListener(MouseEvent.MOUSE_DOWN, thumbPressHandler, false, 0, true);
        enabled = false;
    }

    public function set pageSize(param1: Number): void {
        if (param1 > 0) {
            _pageSize = param1;
        }
    }

    public function setScrollProperties(param1: Number, param2: Number, param3: Number, param4: Number = 0): void {
        this.pageSize = param1;
        _minScrollPosition = param2;
        _maxScrollPosition = param3;
        if (param4 >= 0) {
            _pageScrollSize = param4;
        }
        enabled = _maxScrollPosition > _minScrollPosition;
        setScrollPosition(_scrollPosition, false);
        updateThumb();
    }

    public function get pageScrollSize(): Number {
        return _pageScrollSize == 0 ? _pageSize : _pageScrollSize;
    }

    protected function handleThumbDrag(param1: MouseEvent): void {
        var _loc2_: Number = Math.max(0, Math.min(0 - 0, mouseY - 0 - thumbScrollOffset));
        setScrollPosition(_loc2_ / (0 - 0) * (_maxScrollPosition - _minScrollPosition) + _minScrollPosition);
    }

    protected function setStyles(): void {
        copyStylesToChild(downArrow, DOWN_ARROW_STYLES);
        copyStylesToChild(thumb, THUMB_STYLES);
        copyStylesToChild(track, TRACK_STYLES);
        copyStylesToChild(upArrow, UP_ARROW_STYLES);
    }

    protected function scrollPressHandler(param1: ComponentEvent): void {
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        param1.stopImmediatePropagation();
        if (param1.currentTarget == upArrow) {
            setScrollPosition(_scrollPosition - _lineScrollSize);
        } else if (param1.currentTarget == downArrow) {
            setScrollPosition(_scrollPosition + _lineScrollSize);
        } else {
            _loc2_ = 0 / 0 * (_maxScrollPosition - _minScrollPosition) + _minScrollPosition;
            _loc3_ = pageScrollSize == 0 ? pageSize : pageScrollSize;
            if (_scrollPosition < _loc2_) {
                setScrollPosition(Math.min(_loc2_, _scrollPosition + _loc3_));
            } else if (_scrollPosition > _loc2_) {
                setScrollPosition(Math.max(_loc2_, _scrollPosition - _loc3_));
            }
        }
    }

    protected function thumbPressHandler(param1: MouseEvent): void {
        inDrag = true;
        thumbScrollOffset = mouseY - 0;
        thumb.mouseStateLocked = true;
        mouseChildren = false;
        stage.addEventListener(MouseEvent.MOUSE_MOVE, handleThumbDrag, false, 0, true);
        stage.addEventListener(MouseEvent.MOUSE_UP, thumbReleaseHandler, false, 0, true);
    }

    public function set direction(param1: String): void {
        if (_direction == param1) {
            return;
        }
        _direction = param1;
        if (isLivePreview) {
            return;
        }
        setScaleY(1);
        var _loc2_: * = _direction == ScrollBarDirection.HORIZONTAL;
        if (_loc2_ && componentInspectorSetting) {
            if (rotation == 90) {
                return;
            }
            setScaleX(-1);
            rotation = -90;
        }
        if (!componentInspectorSetting) {
            if (_loc2_ && rotation == 0) {
                rotation = -90;
                setScaleX(-1);
            } else if (!_loc2_ && rotation == -90) {
                rotation = 0;
                setScaleX(1);
            }
        }
        invalidate(InvalidationType.SIZE);
    }

    public function get direction(): String {
        return _direction;
    }
}
}
