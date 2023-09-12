package org.osmf.layout {

import flash.display.DisplayObject;
import flash.display.Sprite;

import org.osmf.events.DisplayObjectEvent;

public class LayoutTargetSprite extends Sprite implements ILayoutTarget {


    private var _layoutMetadata: LayoutMetadata;

    private var _measuredWidth: Number = NaN;

    private var _measuredHeight: Number = NaN;

    private var renderers: LayoutTargetRenderers;

    public function LayoutTargetSprite(param1: LayoutMetadata = null) {
        this._layoutMetadata = param1 || new LayoutMetadata();
        this.renderers = new LayoutTargetRenderers(this);
        addEventListener(LayoutTargetEvent.ADD_CHILD_AT, this.onAddChildAt);
        addEventListener(LayoutTargetEvent.SET_CHILD_INDEX, this.onSetChildIndex);
        addEventListener(LayoutTargetEvent.REMOVE_CHILD, this.onRemoveChild);
        mouseEnabled = true;
        mouseChildren = true;
        super();
    }

    public function get displayObject(): DisplayObject {
        return this;
    }

    public function get layoutMetadata(): LayoutMetadata {
        return this._layoutMetadata;
    }

    public function get measuredWidth(): Number {
        return this._measuredWidth;
    }

    public function get measuredHeight(): Number {
        return this._measuredHeight;
    }

    public function measure(param1: Boolean = true): void {
        var _loc2_: Number = NaN;
        var _loc3_: Number = NaN;
        var _loc4_: * = null;
        if (param1 && Boolean(this.renderers.containerRenderer)) {
            this.renderers.containerRenderer.measure();
        }
        if (this.renderers.containerRenderer) {
            _loc2_ = this.renderers.containerRenderer.measuredWidth;
            _loc3_ = this.renderers.containerRenderer.measuredHeight;
        } else {
            _loc2_ = super.width / scaleX;
            _loc3_ = super.height / scaleY;
        }
        if (_loc2_ != this._measuredWidth || _loc3_ != this._measuredHeight) {
            _loc4_ = new DisplayObjectEvent(DisplayObjectEvent.MEDIA_SIZE_CHANGE, false, false, null, null, this._measuredWidth, this._measuredHeight, _loc2_, _loc3_);
            this._measuredWidth = _loc2_;
            this._measuredHeight = _loc3_;
            dispatchEvent(_loc4_);
        }
    }

    public function layout(param1: Number, param2: Number, param3: Boolean = true): void {
        if (this.renderers.containerRenderer == null) {
            super.width = param1;
            super.height = param2;
        } else if (param3) {
            this.renderers.containerRenderer.layout(param1, param2);
        }
    }

    public function validateNow(): void {
        if (this.renderers.containerRenderer) {
            this.renderers.containerRenderer.validateNow();
        }
    }

    protected function onAddChildAt(param1: LayoutTargetEvent): void {
        addChildAt(param1.displayObject, param1.index);
    }

    protected function onRemoveChild(param1: LayoutTargetEvent): void {
        removeChild(param1.displayObject);
    }

    protected function onSetChildIndex(param1: LayoutTargetEvent): void {
        setChildIndex(param1.displayObject, param1.index);
    }

    override public function set width(param1: Number): void {
        this._layoutMetadata.width = param1;
    }

    override public function get width(): Number {
        return this._measuredWidth;
    }

    override public function set height(param1: Number): void {
        this._layoutMetadata.height = param1;
    }

    override public function get height(): Number {
        return this._measuredHeight;
    }
}
}
