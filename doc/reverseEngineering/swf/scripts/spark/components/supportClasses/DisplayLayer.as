package spark.components.supportClasses {

import flash.display.DisplayObject;
import flash.events.EventDispatcher;

import mx.resources.ResourceManager;

import spark.events.DisplayLayerObjectExistenceEvent;

public class DisplayLayer extends EventDispatcher {


    private var _depth: Vector.<Number>;

    private var _objects: Vector.<DisplayObject>;

    public function DisplayLayer() {
        super();
    }

    public function get numDisplayObjects(): int {
        return !!this._objects ? this._objects.length : 0;
    }

    public function getDisplayObjectAt(param1: int): DisplayObject {
        if (!this._objects || param1 < 0 || param1 >= this._objects.length) {
            throw new RangeError(ResourceManager.getInstance().getString("components", "indexOutOfRange", [param1]));
        }
        return this._objects[param1];
    }

    public function getDisplayObjectDepth(param1: DisplayObject): Number {
        var _loc2_: int = this._objects.indexOf(param1);
        if (_loc2_ == -1) {
            throw new RangeError(ResourceManager.getInstance().getString("components", "objectNotFoundInDisplayLayer", [param1]));
        }
        return this._depth[_loc2_];
    }

    public function addDisplayObject(param1: DisplayObject, param2: Number = 10000): DisplayObject {
        var _loc4_: int = 0;
        var _loc3_: int = 0;
        if (!this._depth) {
            this._depth = new Vector.<Number>();
            this._objects = new Vector.<DisplayObject>();
        } else {
            _loc4_ = this._depth.length;
            while (_loc3_ < _loc4_) {
                if (param2 < this._depth[_loc3_]) {
                    break;
                }
                _loc3_++;
            }
        }
        this._depth.splice(_loc3_, 0, param2);
        this._objects.splice(_loc3_, 0, param1);
        dispatchEvent(new DisplayLayerObjectExistenceEvent(DisplayLayerObjectExistenceEvent.OBJECT_ADD, false, false, param1, _loc3_));
        return param1;
    }

    public function removeDisplayObject(param1: DisplayObject): DisplayObject {
        var _loc2_: int = this._objects.indexOf(param1);
        if (_loc2_ == -1) {
            throw new RangeError(ResourceManager.getInstance().getString("components", "objectNotFoundInDisplayLayer", [param1]));
        }
        dispatchEvent(new DisplayLayerObjectExistenceEvent(DisplayLayerObjectExistenceEvent.OBJECT_REMOVE, false, false, param1, _loc2_));
        this._depth.splice(_loc2_, 1);
        this._objects.splice(_loc2_, 1);
        return param1;
    }
}
}
