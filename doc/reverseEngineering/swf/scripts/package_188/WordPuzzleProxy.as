package package_188 {

import org.puremvc.as3.multicore.patterns.proxy.Proxy;

import package_189.class_1116;

import package_85.class_244;

public class WordPuzzleProxy extends Proxy {

    public static const NAME: String = "WordPuzzleProxy";


    public function WordPuzzleProxy() {
        super(NAME);
        var _loc1_: class_1116 = new class_1116();
        setData(_loc1_);
    }

    public function method_4670(param1: int): void {
        var _loc2_: class_1116 = this.method_5125();
        _loc2_.initialize(param1);
        sendNotification(class_244.const_990, this.method_5125());
    }

    public function method_5354(param1: class_1116): void {
        var _loc2_: class_1116 = this.method_5125();
        _loc2_.method_5354(param1);
        sendNotification(class_244.const_897, _loc2_);
    }

    public function method_5125(): class_1116 {
        return getData() as class_1116;
    }
}
}
