package package_38 {

import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_37.ICommand;

public class class_811 extends class_434 implements ICommand {

    public static const const_2032: uint = 0;

    public static const const_474: uint = 2;

    public static const const_1328: uint = 1;

    public static const ID: int = 8290;


    public var playerScore: Number = 0;

    public var var_4531: Vector.<class_563>;

    public var var_3651: Number = 0;

    public var name_158: String = "";

    public var var_3065: uint = 0;

    public var var_2568: int = 0;

    public var var_371: int = 0;

    public function class_811(param1: Vector.<class_563> = null, param2: uint = 0, param3: int = 0, param4: Number = 0, param5: String = "", param6: int = 0, param7: Number = 0) {
        super();
        this.var_3065 = param2;
        this.var_2568 = param6;
        this.var_371 = param3;
        this.name_158 = param5;
        this.playerScore = param7;
        this.var_3651 = param4;
        if (param1 == null) {
            this.var_4531 = new Vector.<class_563>();
        } else {
            this.var_4531 = param1;
        }
    }

    override public function method_1330(): int {
        return ID;
    }

    override public function method_1260(): int {
        return 22;
    }

    override public function read(param1: IDataInput): void {
        var _loc4_: * = null;
        super.read(param1);
        this.playerScore = param1.readFloat();
        var _loc2_: Number = 0;
        var _loc3_: * = 0;
        while (this.var_4531.length > 0) {
            this.var_4531.pop();
        }
        _loc2_ = 0;
        _loc3_ = uint(param1.readInt());
        while (_loc2_ < _loc3_) {
            (_loc4_ = class_127.getInstance().createInstance(param1.readShort()) as class_563).read(param1);
            this.var_4531.push(_loc4_);
            _loc2_++;
        }
        this.var_3651 = param1.readFloat();
        this.name_158 = param1.readUTF();
        this.var_3065 = param1.readShort();
        this.var_2568 = param1.readInt();
        this.var_2568 = Number(this.var_2568) >>> 7 | Number(this.var_2568) << 25;
        this.var_371 = param1.readInt();
        this.var_371 = Number(this.var_371) >>> 10 | Number(this.var_371) << 22;
    }

    override public function write(param1: IDataOutput): void {
        param1.writeShort(ID);
        this.method_3(param1);
    }

    override protected function method_3(param1: IDataOutput): void {
        var _loc2_: * = null;
        super.method_3(param1);
        param1.writeFloat(this.playerScore);
        param1.writeInt(this.var_4531.length);
        for each(_loc2_ in this.var_4531) {
            _loc2_.write(param1);
        }
        param1.writeFloat(this.var_3651);
        param1.writeUTF(this.name_158);
        param1.writeShort(this.var_3065);
        param1.writeInt(Number(this.var_2568) << 7 | Number(this.var_2568) >>> 25);
        param1.writeInt(Number(this.var_371) << 10 | Number(this.var_371) >>> 22);
    }
}
}
