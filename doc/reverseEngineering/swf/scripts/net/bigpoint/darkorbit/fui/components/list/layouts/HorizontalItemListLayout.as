package net.bigpoint.darkorbit.fui.components.list.layouts {

import flash.display.DisplayObjectContainer;

import net.bigpoint.darkorbit.fui.components.core.Container;
import net.bigpoint.darkorbit.fui.components.core.Coreponent;
import net.bigpoint.darkorbit.fui.components.core.ICoreponent;
import net.bigpoint.darkorbit.fui.components.core.InvalidationType;

public class HorizontalItemListLayout extends AbstractItemListLayout {


    public function HorizontalItemListLayout(param1: Container = null, param2: Container = null) {
        super(param1, param2);
    }

    override public function execute(param1: DisplayObjectContainer = null): void {
        this.layoutItems();
    }

    protected function layoutItems(): void {
        var _loc2_: * = null;
        var _loc3_: int = 0;
        var _loc1_: uint = this.getVisibleItemsCount();
        _loc3_ = 0;
        while (_loc3_ < _loc1_) {
            _loc2_ = _itemsContainer.getChildAt(_loc3_) as ICoreponent;
            _loc2_.x = sigmaItemSize * _loc3_;
            _loc2_.forceRedraw(InvalidationType.POSITION);
            _loc3_++;
        }
    }

    override public function getVisibleItemsCount(): int {
        var _loc1_: uint = 1 + Math.ceil(_target.getCalculatedWidth() / sigmaItemSize);
        if (false) {
            _loc1_ = Math.min(_loc1_, _target.list.length);
        }
        return Math.max(_loc1_, 1);
    }

    override public function get pageSize(): Number {
        return Math.floor(_target.getCalculatedWidth() / sigmaItemSize);
    }

    override public function assignItemSize(param1: Coreponent): void {
        _itemSize = param1.getCalculatedWidth();
    }

    override public function set itemsContainer(param1: Container): void {
        super.itemsContainer = param1;
        if (_itemsContainer) {
            _itemsContainer.autoSizeHeight = true;
        }
    }
}
}
