package net.bigpoint.darkorbit.fui.components.list.layouts {

import flash.display.DisplayObjectContainer;

import net.bigpoint.darkorbit.fui.components.core.Container;
import net.bigpoint.darkorbit.fui.components.core.Coreponent;
import net.bigpoint.darkorbit.fui.components.core.interfaces.IDisposable;
import net.bigpoint.darkorbit.fui.components.core.layout.ILayout;
import net.bigpoint.darkorbit.fui.components.list.itemlist.ItemList;

public class AbstractItemListLayout implements ILayout, IDisposable {


    protected var _target: ItemList;

    protected var _itemsContainer: Container;

    protected var _itemGap: uint = 1;

    protected var _itemSize: uint = 1;

    public function AbstractItemListLayout(param1: Container, param2: Container) {
        super();
        this._target = param1 as ItemList;
        this.itemsContainer = param2;
    }

    public function dispose(): void {
        this._target = null;
        this._itemsContainer = null;
    }

    public function execute(param1: DisplayObjectContainer = null): void {
    }

    public function assignItemSize(param1: Coreponent): void {
    }

    public function get pageSize(): Number {
        return 0;
    }

    public function get sigmaItemSize(): Number {
        return this._itemGap + this._itemSize;
    }

    public function get itemSize(): uint {
        return this.itemSize;
    }

    public function set gap(param1: uint): void {
        this._itemGap = param1;
    }

    public function get gap(): uint {
        return this._itemGap;
    }

    public function getVisibleItemsCount(): int {
        return 0;
    }

    public function set itemListComponent(param1: ItemList): void {
        this._target = param1;
    }

    public function set itemsContainer(param1: Container): void {
        this._itemsContainer = param1;
    }
}
}
