package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_806 implements ICommand {

    public static const ID: int = 16435;


    public var windows: Vector.<class_672>;

    public function class_806(param1: Vector.<class_672> = null) {
        super();
        if (param1 == null) {
            this.windows = new Vector.<class_672>();
        } else {
            this.windows = param1;
        }
    }

    public function method_1330(): int {
        return ID;
    }

    public function method_1260(): int {
        return 4;
    }

    public function read(param1: IDataInput): void {
        var _loc4_: * = null;
        param1.readShort();
        param1.readShort();
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.windows.length > 0) {
            this.windows.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_672).read(param1);
            this.windows.push(_loc4_);
            _loc2_++;
        }
    }

    public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    protected function method_3(param1: IDataOutput): void {
        var _loc2_: * = null;
        param1.writeShort(-22711);
        param1.writeShort(-23223);
        param1.writeInt(this.windows.length);
        for each(_loc2_ in this.windows) {
            _loc2_.write(param1);
        }
    }
}
}