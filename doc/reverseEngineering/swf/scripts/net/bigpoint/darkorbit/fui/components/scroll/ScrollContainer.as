package net.bigpoint.darkorbit.fui.components.scroll {

import flash.display.DisplayObject;
import flash.display.Graphics;
import flash.display.Shape;
import flash.events.MouseEvent;

import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.fui.components.core.Container;
import net.bigpoint.darkorbit.fui.components.core.ICoreponent;

public class ScrollContainer extends Container {


    protected var _scrollDelta: Number;

    private var _contentMask: Shape;

    protected var _content: DisplayObject;

    public function ScrollContainer() {
        this._contentMask = new Shape();
        super();
    }

    override protected function initialize(): void {
        super.initialize();
        addEventListener(MouseEvent.MOUSE_WHEEL, this.handleMouseWheelEvent);
    }

    override public function dispose(): void {
        super.dispose();
        removeEventListener(MouseEvent.MOUSE_WHEEL, this.handleMouseWheelEvent);
    }

    protected function handleMouseWheelEvent(param1: MouseEvent): void {
    }

    override public function assignChildren(): void {
        this.content = this.getChildByName("content");
        this._contentMask = new Shape();
        var _loc1_: Graphics = this._contentMask.graphics;
        _loc1_.beginFill(65535, 0.5);
        _loc1_.drawRect(0, 0, 1, 1);
        _loc1_.endFill();
    }

    override protected function maskWithSkin(): void {
        if (this._contentMask) {
            if (this.contains(this._contentMask) == false) {
                addChildAt(this._contentMask, 0);
            }
            this.content.mask = this._contentMask;
        }
    }

    override protected function _drawSizeWithValues(param1: Number, param2: Number): void {
        super._drawSizeWithValues(param1, param2);
        this._contentMask.width = param1;
        this._contentMask.height = param2;
        this.calculateScrollDelta();
    }

    public function setScrollPositionInPercent(param1: Number, param2: uint = 2): void {
        if (this._content == null) {
            UISystem.log("You have to specifiy a content to enjoy the full scope of the scrollcontainer. ;)" + this.height);
        }
        switch (param2) {
            case ScrollDirection.DIRECTION_HORIZONTAL:
                this.calculateXPosition(param1);
                break;
            case ScrollDirection.DIRECTION_VERTICAL:
                this.calculateYPosition(param1);
        }
    }

    protected function calculateXPosition(param1: Number): void {
        var _loc3_: Number = NaN;
        var _loc2_: Number = this.calculateHorizontalScrollDelta();
        if (_loc2_ >= 0) {
            _loc3_ = _loc2_ * param1;
            this._content.x = -_loc3_;
        } else {
            this._content.x = 0;
        }
    }

    protected function calculateYPosition(param1: Number): void {
        var _loc3_: Number = NaN;
        var _loc2_: Number = this.calculateVerticalScrollDelta();
        if (_loc2_ >= 0) {
            _loc3_ = _loc2_ * param1;
            this._content.y = -_loc3_;
        } else {
            this._content.y = 0;
        }
    }

    protected function calculateVerticalScrollDelta(): Number {
        var _loc3_: * = null;
        var _loc1_: Number = this.contentHeight();
        var _loc2_: Number = _loc1_ - this.height;
        if (this._scrollDelta != _loc2_) {
            this._scrollDelta = _loc2_;
            _loc3_ = new ScrollEvent(ScrollEvent.SCROLLCONTAINER_VERTICAL_SIZE_CHANGED, _loc2_);
            _loc3_.contentSize = _loc1_;
            _loc3_.viewSize = this.height;
            dispatchEvent(_loc3_);
        }
        return _loc2_;
    }

    public function contentHeight(): Number {
        if (this._content as ICoreponent) {
            return (this._content as ICoreponent).getCalculatedHeight();
        }
        return this._content.height;
    }

    protected function calculateHorizontalScrollDelta(): Number {
        var _loc3_: * = null;
        var _loc1_: Number = this.contentWidth();
        var _loc2_: Number = _loc1_ - this.width;
        if (this._scrollDelta != _loc2_) {
            this._scrollDelta = _loc2_;
            _loc3_ = new ScrollEvent(ScrollEvent.SCROLLCONTAINER_HORIZONTAL_SIZE_CHANGED, _loc2_);
            _loc3_.contentSize = _loc1_;
            _loc3_.viewSize = this.width;
            dispatchEvent(_loc3_);
        }
        return _loc2_;
    }

    public function contentWidth(): Number {
        if (this._content as ICoreponent) {
            return (this._content as ICoreponent).getExplicitWidth();
        }
        return this._content.width;
    }

    protected function calculateScrollDelta(): void {
        this.calculateHorizontalScrollDelta();
        this.calculateVerticalScrollDelta();
    }

    public function set content(param1: DisplayObject): void {
        this._content = param1;
        this.calculateScrollDelta();
    }

    public function get content(): DisplayObject {
        return this._content;
    }
}
}
