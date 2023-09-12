package net.bigpoint.darkorbit.fui.system.utils {

import flash.display.DisplayObject;

public class DisplayObjectPool {


    private var _objectPool: Vector.<DisplayObject>;

    public function DisplayObjectPool() {
        this._objectPool = new Vector.<DisplayObject>();
        super();
    }

    public function getObject(): DisplayObject {
        if (this._objectPool.length > 0) {
            return this._objectPool.pop();
        }
        return null;
    }

    public function putObject(param1: DisplayObject): void {
        if (this._objectPool.indexOf(param1) == -1) {
            this._objectPool.push(param1);
        }
    }

    public function size(): uint {
        return this._objectPool.length;
    }

    public function isEmpty(): Boolean {
        return this._objectPool.length == 0 ? true : false;
    }

    public function dispose(): void {
        this._objectPool.length = 0;
    }
}
}
