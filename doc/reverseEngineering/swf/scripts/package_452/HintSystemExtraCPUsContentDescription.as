package package_452 {

import net.bigpoint.darkorbit.net.class_227;

import package_388.class_2256;

import package_392.class_2266;

import package_448.class_2506;
import package_448.class_2514;

public class HintSystemExtraCPUsContentDescription extends class_2266 {

    private static const const_40: String = "HintSystemExtraCPUsContentDescription";


    public function HintSystemExtraCPUsContentDescription(param1: String) {
        super(param1);
    }

    override public function method_3751(param1: String = "default"): String {
        return const_40;
    }

    override public function get content(): class_2514 {
        var _loc1_: * = null;
        if (_content == null) {
            _title = "targeted_hintwindow_title_extracpus";
            _message = "targeted_hintwindow_message_extracpus";
            _content = method_3960();
            _loc1_ = new class_227("internalDock", "seo_title_standard", "internalDockLaser");
            _loc1_.method_2070 = "";
            _content.method_2338(class_2256.const_3193, new class_2506(null, _loc1_));
        }
        return _content;
    }

    override public function get method_108(): int {
        return 1000;
    }
}
}
