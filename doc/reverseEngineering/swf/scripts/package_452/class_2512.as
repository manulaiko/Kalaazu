package package_452 {

import net.bigpoint.darkorbit.class_81;

import package_388.class_2256;

import package_392.class_2266;

import package_448.class_2506;
import package_448.class_2514;

public class class_2512 extends class_2266 {

    private static const const_40: String = "HintSystemProActionBarContentDescription";


    public function class_2512(param1: String) {
        super(param1);
    }

    override public function method_3751(param1: String = "default"): String {
        return const_40;
    }

    override public function get content(): class_2514 {
        var _loc1_: * = null;
        if (_content == null) {
            _title = "targeted_hintwindow_title_proActionBar";
            _message = "targeted_hintwindow_message_proActionBar";
            _content = method_3960();
            _loc1_ = class_81.method_2322.toUpperCase();
            _content.message = _content.message.replace("%companyShortName%", _loc1_);
            _content.method_2338(class_2256.const_780, new class_2506(null, null));
        }
        return _content;
    }

    override public function get method_108(): int {
        return 1000;
    }
}
}
