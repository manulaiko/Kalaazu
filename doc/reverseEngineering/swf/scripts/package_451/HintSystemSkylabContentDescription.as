package package_451 {

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.net.class_227;

import package_38.class_595;

import package_388.class_2256;

import package_392.class_2266;

import package_448.class_2506;
import package_448.class_2514;

public class HintSystemSkylabContentDescription extends class_2266 {

    private static const const_40: String = "HintSystemSkylabContentDescription";


    public function HintSystemSkylabContentDescription(param1: String) {
        super(param1);
    }

    override public function method_3751(param1: String = "default"): String {
        return const_40;
    }

    override public function get content(): class_2514 {
        var _loc1_: * = null;
        var _loc2_: * = null;
        if (_content == null) {
            _loc1_ = new class_2514();
            _loc1_.title = class_88.getItem("gameentry_hintwindow_title_skylab");
            _loc1_.message = method_6274("gameentry_hintwindow_message_skylab");
            _loc1_.method_4859 = class_595.OPEN;
            _loc1_.method_6490 = method_2843();
            _loc2_ = new class_227("internalSkylab", "seo_title_skylab", "");
            _loc2_.method_2070 = "";
            _loc1_.method_2338(class_2256.const_780, new class_2506(null, _loc2_));
            _content = _loc1_;
        }
        return _content;
    }

    override public function get method_108(): int {
        return 1800;
    }
}
}
