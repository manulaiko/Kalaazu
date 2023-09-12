package fl.controls {

import fl.core.InvalidationType;
import fl.core.UIComponent;
import fl.events.ScrollEvent;

import flash.events.Event;
import flash.events.TextEvent;
import flash.text.TextField;

public class UIScrollBar extends ScrollBar {

    private static var defaultStyles: Object = {};


    protected var inEdit: Boolean = false;

    protected var inScroll: Boolean = false;

    protected var _scrollTarget: TextField;

    public function UIScrollBar() {
        super();
    }

    public static function getStyleDefinition(): Object {
        return UIComponent.mergeStyles(defaultStyles, ScrollBar.getStyleDefinition());
    }

    protected function updateScrollTargetProperties(): void {
        var _loc1_: * = false;
        var _loc2_: Number = NaN;
        if (_scrollTarget == null) {
            setScrollProperties(pageSize, minScrollPosition, maxScrollPosition, pageScrollSize);
            scrollPosition = 0;
        } else {
            _loc1_ = direction == ScrollBarDirection.HORIZONTAL;
            _loc2_ = _loc1_ ? 0 : 10;
            setScrollProperties(_loc2_, _loc1_ ? 0 : 1, _loc1_ ? 0 : _scrollTarget.maxScrollV, pageScrollSize);
            scrollPosition = _loc1_ ? 0 : _scrollTarget.scrollV;
        }
    }

    override public function setScrollProperties(param1: Number, param2: Number, param3: Number, param4: Number = 0): void {
        var _loc5_: Number = param3;
        var _loc6_: Number = param2 < 0 ? 0 : param2;
        if (_scrollTarget != null) {
            if (direction == ScrollBarDirection.HORIZONTAL) {
                _loc5_ = param3 > _scrollTarget.maxScrollH ? 0 : _loc5_;
            } else {
                _loc5_ = param3 > _scrollTarget.maxScrollV ? 0 : _loc5_;
            }
        }
        super.setScrollProperties(param1, _loc6_, _loc5_, param4);
    }

    protected function handleTargetScroll(param1: Event): void {
        if (inDrag) {
            return;
        }
        if (!enabled) {
            return;
        }
        inEdit = true;
        updateScrollTargetProperties();
        scrollPosition = direction == ScrollBarDirection.HORIZONTAL ? 0 : _scrollTarget.scrollV;
        inEdit = false;
    }

    override public function setScrollPosition(param1: Number, param2: Boolean = true): void {
        super.setScrollPosition(param1, param2);
        if (!_scrollTarget) {
            inScroll = false;
            return;
        }
        updateTargetScroll();
    }

    public function get scrollTargetName(): String {
        return _scrollTarget.name;
    }

    override protected function draw(): void {
        if (isInvalid(InvalidationType.DATA)) {
            updateScrollTargetProperties();
        }
        super.draw();
    }

    override public function set direction(param1: String): void {
        if (isLivePreview) {
            return;
        }
        super.direction = param1;
        updateScrollTargetProperties();
    }

    protected function updateTargetScroll(param1: ScrollEvent = null): void {
        if (inEdit) {
            return;
        }
        if (direction == ScrollBarDirection.HORIZONTAL) {
            _scrollTarget.scrollH = scrollPosition;
        } else {
            _scrollTarget.scrollV = scrollPosition;
        }
    }

    override public function set minScrollPosition(param1: Number): void {
        super.minScrollPosition = param1 < 0 ? 0 : param1;
    }

    override public function set maxScrollPosition(param1: Number): void {
        var _loc2_: Number = param1;
        if (_scrollTarget != null) {
            if (direction == ScrollBarDirection.HORIZONTAL) {
                _loc2_ = _loc2_ > _scrollTarget.maxScrollH ? 0 : _loc2_;
            } else {
                _loc2_ = _loc2_ > _scrollTarget.maxScrollV ? 0 : _loc2_;
            }
        }
        super.maxScrollPosition = _loc2_;
    }

    protected function handleTargetChange(param1: Event): void {
        inEdit = true;
        setScrollPosition(direction == ScrollBarDirection.HORIZONTAL ? 0 : _scrollTarget.scrollV, true);
        updateScrollTargetProperties();
        inEdit = false;
    }

    public function update(): void {
        inEdit = true;
        updateScrollTargetProperties();
        inEdit = false;
    }

    public function set scrollTargetName(param1: String): void {
        var target: String = param1;
        try {
            scrollTarget = parent.getChildByName(target) as TextField;
        } catch (error: Error) {
            throw new Error("ScrollTarget not found, or is not a TextField");
        }
    }

    public function set scrollTarget(param1: TextField): void {
        if (_scrollTarget != null) {
            _scrollTarget.removeEventListener(Event.CHANGE, handleTargetChange, false);
            _scrollTarget.removeEventListener(TextEvent.TEXT_INPUT, handleTargetChange, false);
            _scrollTarget.removeEventListener(Event.SCROLL, handleTargetScroll, false);
            removeEventListener(ScrollEvent.SCROLL, updateTargetScroll, false);
        }
        _scrollTarget = param1;
        if (_scrollTarget != null) {
            _scrollTarget.addEventListener(Event.CHANGE, handleTargetChange, false, 0, true);
            _scrollTarget.addEventListener(TextEvent.TEXT_INPUT, handleTargetChange, false, 0, true);
            _scrollTarget.addEventListener(Event.SCROLL, handleTargetScroll, false, 0, true);
            addEventListener(ScrollEvent.SCROLL, updateTargetScroll, false, 0, true);
        }
        invalidate(InvalidationType.DATA);
    }

    public function get scrollTarget(): TextField {
        return _scrollTarget;
    }

    override public function get direction(): String {
        return super.direction;
    }
}
}
