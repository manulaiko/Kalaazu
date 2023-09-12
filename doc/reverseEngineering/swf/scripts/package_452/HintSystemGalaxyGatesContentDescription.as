package package_452 {

import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.net.class_227;
import net.bigpoint.darkorbit.settings.Settings;

import package_388.class_2256;

import package_392.class_2266;

import package_448.class_2506;
import package_448.class_2514;

public class HintSystemGalaxyGatesContentDescription extends class_2266 {

    private static const const_40: String = "HintSystemGalaxyGatesContentDescription";

    private static const const_2002: String = "HintSystemGalaxyGatesPaymentLinkContentDescription";


    public function HintSystemGalaxyGatesContentDescription(param1: String) {
        super(param1);
    }

    override public function method_3751(param1: String = "default"): String {
        var _loc2_: * = null;
        if (param1 == class_2266.const_1451) {
            _loc2_ = "NaN";
            _content.method_2338(class_2256.const_3193, new class_2506(null, null, _loc2_));
            return const_2002;
        }
        return const_40;
    }

    override public function get content(): class_2514 {
        var _loc1_: * = null;
        var _loc2_: * = null;
        if (_content == null) {
            _title = "targeted_hintwindow_title_galaxygates";
            _message = "targeted_hintwindow_message_galaxygates";
            _content = method_3960();
            _loc1_ = class_81.method_2322.toUpperCase();
            _content.message = _content.message.replace("%companyShortName%", _loc1_);
            _loc2_ = new class_227("internalGalaxyGates", "seo_title_standard");
            _loc2_.method_2070 = "";
            _content.method_2338(class_2256.const_780, new class_2506(null, _loc2_));
        }
        return _content;
    }

    override public function get method_108(): int {
        return 1000;
    }
}
}
