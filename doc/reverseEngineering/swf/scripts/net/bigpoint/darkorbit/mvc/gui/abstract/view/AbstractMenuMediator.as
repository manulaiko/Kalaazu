package net.bigpoint.darkorbit.mvc.gui.abstract.view {

import flash.display.DisplayObjectContainer;
import flash.events.Event;
import flash.geom.Point;
import flash.utils.Dictionary;

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.mvc.gui.abstract.model.vo.AbstractMenuBarVO;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.view.components.elements.slotAndItemElement.SlotAndItemBarElement;

import package_103.class_2007;
import package_103.class_273;

import package_104.class_277;

import package_11.class_39;

import package_141.class_2008;

import package_242.DragEvent;
import package_242.DragManager;

import package_31.class_92;

public class AbstractMenuMediator extends class_92 {


    protected var _menuBars: Vector.<class_2008>;

    protected var _menuBarsMap: Dictionary;

    protected var _swfFinisher: class_39;

    protected var _barsDragManager: DragManager;

    public function AbstractMenuMediator(param1: String, param2: Object) {
        super(param1, param2);
    }

    override public function onRegister(): void {
        this._barsDragManager = new DragManager(viewComponent as DisplayObjectContainer);
        this.addListeners();
    }

    protected function initBarsMap(): void {
        throw new Error("invoke initBarsMap in AbstractMenuMediator");
    }

    protected function addListeners(): void {
        this.displayViewComponent.addEventListener(class_2008.const_865, this.barDragStartHandler);
        this.displayViewComponent.addEventListener(class_2008.const_1438, this.barChangeLayout);
    }

    protected function barChangeLayout(param1: Event): void {
        var _loc2_: class_2008 = param1.target as class_2008;
        var _loc3_: AbstractMenuBarVO = this._menuBarsMap[_loc2_] as AbstractMenuBarVO;
        _loc3_.layoutId = this.getNextLayoutId(_loc3_.layoutId, _loc3_.id);
        var _loc4_: class_273;
        if ((_loc4_ = class_2007.method_3824(_loc3_.layoutId)).id == class_277.ID) {
            _loc4_.yOffset = 2;
        }
        _loc2_.var_4606.method_4587(_loc4_, false, true, class_126.const_532);
        var _loc5_: Point = _loc4_.method_1821(SlotAndItemBarElement.DEFAULT_SIZE, _loc2_.var_4606.items.length);
        _loc2_.updateOnListLayoutChange(_loc5_);
    }

    protected function barDragStartHandler(param1: Event): void {
        var _loc2_: class_2008 = param1.target as class_2008;
        this._barsDragManager.startDrag(_loc2_, false);
        this._barsDragManager.addEventListener(DragEvent.DRAG_OVER, this.barDragOverHandler);
    }

    protected function barDragOverHandler(param1: DragEvent): void {
        this._barsDragManager.removeEventListener(DragEvent.DRAG_OVER, this.barDragOverHandler);
    }

    protected function manageConfigMode(param1: Boolean): void {
        this.updateLayoutButtonsVisibility(param1);
    }

    protected function updateLayoutButtonsVisibility(param1: Boolean): void {
        var _loc2_: * = null;
        for each(_loc2_ in this._menuBars) {
            method_1635(param1, _loc2_.dragButton);
            method_1635(param1, _loc2_.rotateButton);
        }
    }

    public function getMenuBarById(param1: String): class_2008 {
        var _loc2_: * = null;
        var _loc3_: * = null;
        for (_loc2_ in this._menuBarsMap) {
            _loc3_ = this._menuBarsMap[_loc2_] as AbstractMenuBarVO;
            if (Boolean(_loc3_) && _loc3_.id == param1) {
                return _loc2_ as class_2008;
            }
        }
        return null;
    }

    protected function getNextLayoutId(param1: String, param2: String): String {
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        if (param2 == ItemsControlMenuConstants.PRO_ACTION_BAR) {
            _loc3_ = ItemsControlMenuConstants.LAYOUTS_QUEUE_PRO_ACTION.indexOf(param1);
            _loc4_ = _loc3_ < ItemsControlMenuConstants.LAYOUTS_QUEUE_PRO_ACTION.length - 1 ? _loc3_ + 1 : 0;
            return ItemsControlMenuConstants.LAYOUTS_QUEUE_PRO_ACTION[_loc4_];
        }
        _loc3_ = ItemsControlMenuConstants.LAYOUTS_QUEUE.indexOf(param1);
        _loc4_ = _loc3_ < ItemsControlMenuConstants.LAYOUTS_QUEUE.length - 1 ? _loc3_ + 1 : 0;
        return ItemsControlMenuConstants.LAYOUTS_QUEUE[_loc4_];
    }

    public function get menuBars(): Vector.<class_2008> {
        return this._menuBars;
    }

    public function get menuBarsMap(): Dictionary {
        return this._menuBarsMap;
    }

    private function get displayViewComponent(): DisplayObjectContainer {
        return viewComponent as DisplayObjectContainer;
    }
}
}
