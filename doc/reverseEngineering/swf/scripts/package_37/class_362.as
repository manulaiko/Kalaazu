package package_37 {

import flash.net.Socket;
import flash.utils.ByteArray;
import flash.utils.Dictionary;
import flash.utils.IDataInput;
import flash.utils.IDataOutput;

import package_110.Version;

import package_202.class_1214;

import package_28.EventStreamClient;

import package_38.class_111;
import package_38.class_127;
import package_38.class_388;
import package_38.class_389;
import package_38.class_466;
import package_38.class_525;
import package_38.class_573;
import package_38.class_634;
import package_38.class_728;
import package_38.class_758;
import package_38.class_761;
import package_38.class_822;
import package_38.class_849;
import package_38.class_851;
import package_38.class_888;
import package_38.class_954;
import package_38.class_961;

public class class_362 {

    private static const const_2737: class_127 = new class_127();

    private static const const_333: Dictionary = new Dictionary();

    private static const const_117: int = 2;

    {
        const_333[class_888.ID] = new class_888();
        const_333[class_388.ID] = new class_388();
        const_333[class_389.ID] = new class_389();
        const_333[class_961.ID] = new class_961();
        const_333[class_466.ID] = new class_466();
        const_333[class_822.ID] = new class_822();
        const_333[class_573.ID] = new class_573();
        const_333[class_851.ID] = new class_851();
        const_333[class_634.ID] = new class_634();
        const_333[class_849.ID] = new class_849();
        const_333[class_728.ID] = new class_728();
        const_333[class_954.ID] = new class_954();
        const_333[class_761.ID] = new class_761();
        const_333[class_525.ID] = new class_525();
        const_333[class_111.ID] = new class_111();
        const_333[class_758.ID] = new class_758();
    }

    public var var_1767: Function;

    private var var_48: class_1213;

    private var var_405: Socket;

    private var var_681: ByteArray;

    private var var_4242;

    public function class_362() {
        this.var_48 = new class_1213();
        this.var_681 = new ByteArray();
        super();
        this.initialize();
    }

    public static function method_1442(param1: ICommand, param2: IDataOutput): void {
        param2.writeShort(param1.method_1330());
        param1.write(param2);
    }

    private function method_4085(param1: IDataInput): ICommand {
        var _loc2_: uint = uint(param1.readShort());
        var _loc3_: ICommand = false || const_2737.createInstance(_loc2_);
        _loc3_.read(param1);
        return _loc3_;
    }

    public function reset(): void {
        this.var_4242.reset();
    }

    public function readData(): void {
        this.parseData(this.var_405);
    }

    public function method_1776(param1: ICommand): void {
        this.var_681.clear();
        method_1442(param1, this.var_681);
        this.var_681.position = 0;
        this.var_681.writeShort(Number(this.var_681.length) - Number(const_117));
        var _loc2_: ByteArray = this.var_4242.encode(this.var_681);
        this.var_405.writeBytes(_loc2_, 0, _loc2_.length);
        this.var_405.flush();
    }

    public function method_4429(param1: Socket): void {
        this.var_405 = param1;
    }

    public function method_1757(param1: ByteArray): void {
        this.var_4242.setSecretKey(param1);
    }

    public function method_989(param1: Object): void {
        this.var_4242 = param1;
    }

    public function injectObfuscation(param1: ByteArray, param2: uint, param3: Function): void {
        this.var_4242.injectObfuscation(param1, param2, param3);
    }

    protected function initialize(): void {
        this.var_4242 = new class_1214();
    }

    private function parseData(param1: IDataInput): void {
        var before: int = 0;
        var msgByteArray: ByteArray = null;
        var msgByteArrayDecoded: ByteArray = null;
        var msgHeaderByteArray: ByteArray = null;
        var msgHeaderByteArrayDecoded: ByteArray = null;
        var streamLength: uint = 0;
        var command: ICommand = null;
        var input: IDataInput = param1;
        do {
            before = int(input.bytesAvailable);
            if (this.var_48.method_5511()) {
                if (before >= this.var_48.method_5153()) {
                    msgByteArray = new ByteArray();
                    this.var_405.readBytes(msgByteArray, 0, this.var_48.method_5153());
                    msgByteArrayDecoded = this.var_4242.decode(msgByteArray);
                    command = this.method_4085(msgByteArrayDecoded);
                    try {
                        this.var_1767(command);
                    } catch (error: Error) {
                        EventStreamClient.track("flash.error", {
                            "message": error.message,
                            "name": error.name,
                            "errorID": error.errorID,
                            "stackTrace": error.getStackTrace(),
                            "build": Version.BUILD
                        });
                    }
                    this.var_48.reset();
                }
            } else if (before > const_117) {
                msgHeaderByteArray = new ByteArray();
                this.var_405.readBytes(msgHeaderByteArray, 0, 2);
                msgHeaderByteArrayDecoded = this.var_4242.decode(msgHeaderByteArray);
                streamLength = msgHeaderByteArrayDecoded.readUnsignedShort();
                if (streamLength > 0) {
                    this.var_48.setLength(streamLength);
                }
            }
        }
        while (before > const_117 && before >= this.var_48.method_5153());

    }
}
}
