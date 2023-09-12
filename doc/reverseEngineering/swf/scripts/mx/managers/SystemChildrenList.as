package mx.managers {

import flash.display.DisplayObject;
import flash.geom.Point;

import mx.core.IChildList;
import mx.core.mx_internal;

public class SystemChildrenList implements IChildList {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var owner: SystemManager;

    private var lowerBoundReference: QName;

    private var upperBoundReference: QName;

    public function SystemChildrenList(param1: SystemManager, param2: QName, param3: QName) {
        super();
        this.owner = param1;
        this.lowerBoundReference = param2;
        this.upperBoundReference = param3;
    }

    public function get numChildren(): int {
        return Number(this.owner[this.upperBoundReference]) - Number(this.owner[this.lowerBoundReference]);
    }

    public function addChild(param1: DisplayObject): DisplayObject {
        this.owner.mx_internal::rawChildren_addChildAt(param1, this.owner[this.upperBoundReference]);
        ++this.owner[this.upperBoundReference];
        return param1;
    }

    public function addChildAt(param1: DisplayObject, param2: int): DisplayObject {
        this.owner.mx_internal::rawChildren_addChildAt(param1, this.owner[this.lowerBoundReference] + param2);
        ++this.owner[this.upperBoundReference];
        return param1;
    }

    public function removeChild(param1: DisplayObject): DisplayObject {
        var _loc2_: int = this.owner.mx_internal::rawChildren_getChildIndex(param1);
        if (this.owner[this.lowerBoundReference] <= _loc2_ && _loc2_ < this.owner[this.upperBoundReference]) {
            this.owner.mx_internal::rawChildren_removeChild(param1);
            --this.owner[this.upperBoundReference];
        }
        return param1;
    }

    public function removeChildAt(param1: int): DisplayObject {
        var _loc2_: DisplayObject = this.owner.mx_internal::rawChildren_removeChildAt(param1 + this.owner[this.lowerBoundReference]);
        --this.owner[this.upperBoundReference];
        return _loc2_;
    }

    public function getChildAt(param1: int): DisplayObject {
        return this.owner.mx_internal::rawChildren_getChildAt(this.owner[this.lowerBoundReference] + param1);
    }

    public function getChildByName(param1: String): DisplayObject {
        return this.owner.mx_internal::rawChildren_getChildByName(param1);
    }

    public function getChildIndex(param1: DisplayObject): int {
        var _loc2_: int = this.owner.mx_internal::rawChildren_getChildIndex(param1);
        return _loc2_ - Number(this.owner[this.lowerBoundReference]);
    }

    public function setChildIndex(param1: DisplayObject, param2: int): void {
        this.owner.mx_internal::rawChildren_setChildIndex(param1, this.owner[this.lowerBoundReference] + param2);
    }

    public function getObjectsUnderPoint(param1: Point): Array {
        return this.owner.mx_internal::rawChildren_getObjectsUnderPoint(param1);
    }

    public function contains(param1: DisplayObject): Boolean {
        var _loc2_: int = 0;
        if (param1 != this.owner && this.owner.mx_internal::rawChildren_contains(param1)) {
            while (param1.parent != this.owner) {
                param1 = param1.parent;
            }
            _loc2_ = this.owner.mx_internal::rawChildren_getChildIndex(param1);
            if (_loc2_ >= this.owner[this.lowerBoundReference] && _loc2_ < this.owner[this.upperBoundReference]) {
                return true;
            }
        }
        return false;
    }
}
}
