package net.bigpoint.darkorbit.fui.components.core {

import flash.display.DisplayObject;

import net.bigpoint.darkorbit.fui.components.core.layout.AlignmentLayout;
import net.bigpoint.darkorbit.fui.components.core.layout.ILayout;

public class Container extends Coreponent implements IContainer {


    protected var _layout: ILayout;

    public function Container() {
        _mouseEnabled = false;
        _mouseChildrenEnabled = true;
        super();
    }

    override protected function initialize(): void {
        super.initialize();
        this._layout = new AlignmentLayout();
    }

    override protected function draw(): void {
        super.draw();
        if (isInvalidate(InvalidationType.LAYOUT)) {
            this.drawLayout();
        }
    }

    protected function drawLayout(): void {
        this._layout.execute(this);
        validate(InvalidationType.LAYOUT);
    }

    override public function dispose(): void {
        removeChildren();
        super.dispose();
    }

    public function get layout(): ILayout {
        return this._layout;
    }

    public function set layout(param1: ILayout): void {
        this._layout = param1;
        invalidate(InvalidationType.LAYOUT);
    }

    override public function addChild(param1: DisplayObject): DisplayObject {
        super.addChild(param1);
        invalidate(InvalidationType.SIZE);
        return param1;
    }

    override public function addChildAt(param1: DisplayObject, param2: int): DisplayObject {
        super.addChildAt(param1, param2);
        invalidate(InvalidationType.SIZE);
        return param1;
    }

    override public function removeChild(param1: DisplayObject): DisplayObject {
        var _loc2_: DisplayObject = super.removeChild(param1);
        invalidate(InvalidationType.SIZE);
        return _loc2_;
    }

    override public function removeChildAt(param1: int): DisplayObject {
        return super.removeChildAt(param1);
    }

    override public function set width(param1: Number): void {
        super.width = param1;
        invalidate(InvalidationType.LAYOUT);
    }

    override public function set height(param1: Number): void {
        super.height = param1;
        invalidate(InvalidationType.LAYOUT);
    }

    override public function setSize(param1: Number, param2: Number): void {
        super.setSize(param1, param2);
        invalidate(InvalidationType.LAYOUT);
    }
}
}
