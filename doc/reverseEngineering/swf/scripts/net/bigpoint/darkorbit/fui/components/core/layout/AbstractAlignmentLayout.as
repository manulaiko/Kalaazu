package net.bigpoint.darkorbit.fui.components.core.layout {

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.utils.Dictionary;

import net.bigpoint.darkorbit.fui.components.core.Coreponent;
import net.bigpoint.darkorbit.fui.components.core.ICoreponent;
import net.bigpoint.darkorbit.fui.components.core.skins.ISkin;

public class AbstractAlignmentLayout {


    protected var container: DisplayObjectContainer;

    protected var child: DisplayObject;

    protected var childCount: uint;

    protected var allChildren: Vector.<DisplayObject>;

    protected var absoluteChildren: Vector.<DisplayObject>;

    protected var relativeChildren: Vector.<DisplayObject>;

    protected var fillChildren: Vector.<DisplayObject>;

    protected var childrenMapping: Dictionary;

    protected var remainingSize: Number;

    protected var remainingSizeAfterAbsolute: Number;

    protected var remainingSizeAfterRelative: Number;

    protected var fillElementSize: Number;

    protected var _gap: uint = 5;

    public function AbstractAlignmentLayout() {
        super();
    }

    public function set gap(param1: uint): void {
        this._gap = param1;
    }

    public function get gap(): uint {
        return this._gap;
    }

    protected function prefilterAndAlignmentActivator(param1: Function): void {
        var _loc3_: * = false;
        var _loc4_: * = null;
        this.childCount = this.container.numChildren;
        var _loc2_: Number = 0;
        while (_loc2_ < this.childCount) {
            this.child = this.container.getChildAt(_loc2_);
            _loc3_ = !(!!(this.child as ISkin) ? true : false);
            if (_loc3_) {
                if (_loc4_ = this.child as ICoreponent) {
                    param1(_loc4_);
                    this.addChildToSizeTypeRelatedChildrenVector(_loc4_);
                    this.allChildren.push(_loc4_);
                } else {
                    this.absoluteChildren.push(this.child);
                    this.allChildren.push(this.child);
                }
            }
            _loc2_++;
        }
    }

    protected function initChildrenMapping(): void {
        this.allChildren = new Vector.<DisplayObject>();
        this.absoluteChildren = new Vector.<DisplayObject>();
        this.relativeChildren = new Vector.<DisplayObject>();
        this.fillChildren = new Vector.<DisplayObject>();
        this.childrenMapping = new Dictionary();
        this.childrenMapping[Coreponent.SIZE_NORMAL] = this.absoluteChildren;
        this.childrenMapping[Coreponent.SIZE_RELATIVE] = this.relativeChildren;
        this.childrenMapping[Coreponent.SIZE_FILL] = this.fillChildren;
    }

    protected function getSizeTypeRelatedChildrenVector(param1: ICoreponent, param2: String = null): Vector.<DisplayObject> {
        if (param2 == null) {
            return this.childrenMapping[param1.sizeHandling];
        }
        return this.childrenMapping[param2];
    }

    protected function addChildToSizeTypeRelatedChildrenVector(param1: ICoreponent, param2: String = null): void {
        var _loc3_: Vector.<DisplayObject> = this.getSizeTypeRelatedChildrenVector(param1, param2);
        _loc3_.push(param1);
    }
}
}
