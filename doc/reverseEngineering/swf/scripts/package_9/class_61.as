package package_9 {

import flash.events.MouseEvent;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.net.class_59;
import net.bigpoint.darkorbit.net.class_74;

import package_17.class_62;

import package_27.class_82;

import package_30.class_185;
import package_30.class_218;

import package_33.class_93;

import package_38.class_232;
import package_38.class_238;
import package_38.class_239;

import package_46.class_131;

import package_65.class_203;
import package_65.class_214;
import package_65.class_233;
import package_65.class_236;
import package_65.class_240;

import package_70.class_241;

import package_71.class_189;

import package_79.class_234;

import package_80.QuestProxy;

import package_81.class_237;

public class class_61 {

    public static const const_1337: String = "XML";

    public static const const_144: String = "DOHB";


    private var var_3691: class_233;

    private var var_985: class_203;

    private var main: class_9;

    private var parser: class_240;

    public var var_1485: String = "DOHB";

    public function class_61(param1: class_9) {
        super();
        this.main = param1;
        this.var_3691 = new class_233();
        this.parser = class_240.instance;
    }

    private function handleCancelButtonClicked(param1: MouseEvent): void {
        var _loc2_: class_131 = this.main.method_4489().method_5764();
        var _loc3_: Vector.<class_234> = new <class_234>[new class_234(-1, "btn_ok", this.method_1807, [param1.target], 200), new class_234(-1, "btn_cancel")];
        _loc2_.method_4136("quest_cancel_popup_title", "quest_cancel_popup_message", _loc3_);
    }

    private function method_1807(param1: Array): void {
        var _loc2_: class_218 = param1[0] as class_218;
        if (_loc2_) {
            _loc2_.removeEventListener(MouseEvent.CLICK, this.handleCancelButtonClicked);
            _loc2_.method_4131();
        }
        var _loc3_: class_239 = new class_239();
        if (this.var_985 != null) {
            _loc3_.var_1537 = this.var_985.id;
            this.main.method_6154().sendRequest(_loc3_);
        }
    }

    public function method_1881(param1: int): void {
        var _loc2_: class_203 = this.var_3691.method_2703(param1);
        if (_loc2_ != null) {
            class_82.playSoundEffect(QuestProxy.const_2595);
            this.main.method_4489().writeToLog(class_88.getItem("q2_accomplished_quest").replace(/%quest_name%/, _loc2_.title));
            class_59.call(class_59.const_2242, [class_59.const_195]);
            this.method_3515(param1);
            class_62.getInstance().method_2407(class_237.const_1678, [param1, _loc2_.method_2963().id]);
        }
    }

    public function method_1676(param1: int): void {
        var _loc2_: class_203 = this.var_3691.method_2703(param1);
        if (_loc2_ != null) {
            class_82.playSoundEffect(QuestProxy.const_169);
            this.main.method_4489().writeToLog(class_88.getItem("q2_failed_quest").replace(/%quest_name%/, _loc2_.title));
            this.method_3515(param1);
        }
    }

    public function method_1351(param1: int): void {
        var _loc2_: class_203 = this.var_3691.method_2703(param1);
        if (_loc2_ != null) {
            this.main.method_4489().writeToLog(class_88.getItem("q2_cancelled_quest").replace(/%quest_name%/, _loc2_.title));
            this.method_3515(param1);
        }
    }

    private function method_3515(param1: int): void {
        var _loc5_: Boolean = false;
        var _loc6_: int = 0;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc2_: class_203 = this.var_3691.method_2703(param1);
        class_62.getInstance().method_2407(class_237.const_1661, _loc2_.method_2963().id);
        if (_loc2_ != null) {
            _loc5_ = false;
            if (this.var_985 == null || this.var_985.id == param1) {
                _loc5_ = true;
                this.var_985 = null;
            }
            _loc2_.running = false;
            this.method_5117(_loc2_);
            this.var_3691.method_4262(param1);
            --this.var_3691.method_5713;
            if (_loc5_) {
                this.main.method_4489().method_5065();
                this.main.method_4489().method_2466();
                if ((_loc6_ = int(this.var_3691.method_201())) >= 0) {
                    (_loc7_ = new class_232()).var_1537 = _loc6_;
                    this.main.method_6154().sendRequest(_loc7_);
                }
            }
            _loc2_.method_768(false);
            this.main.method_4489().method_4497(param1);
        }
        var _loc3_: int = int(this.var_3691.method_5713);
        var _loc4_: class_131 = this.main.method_4489().method_468(GuiConstants.QUEST_WINDOW);
        if (_loc3_ == 0) {
            if (_loc4_ != null) {
                class_214(_loc4_.method_3694(class_93.const_1827)).isDefaultVisible = true;
                (_loc8_ = class_189(_loc4_.method_3694(class_93.const_1156))).isDefaultVisible = true;
                _loc8_.dispatchEvent(new class_241(class_241.const_1530, class_185.const_2321, true));
            }
        } else if (_loc4_ != null) {
            class_214(_loc4_.method_3694(class_93.const_1827)).isDefaultVisible = false;
        }
    }

    private function method_5117(param1: class_203): void {
        var _loc3_: * = null;
        var _loc2_: Array = param1.method_3950;
        for each(_loc3_ in _loc2_) {
            _loc3_.runstate = false;
            _loc3_.completed = false;
            _loc3_.current = 0;
        }
    }

    public function method_5166(param1: String, param2: String): void {
    }

    public function method_5490(param1: class_238): void {
        var _loc2_: class_203 = this.parser.method_5892(param1);
        _loc2_.running = true;
        this.method_3893(_loc2_, _loc2_.id);
        if (this.var_985 == null) {
            this.method_2106(_loc2_.id);
        }
        class_62.getInstance().method_2407(class_237.const_2749, _loc2_);
        var _loc3_: Boolean = Boolean(this.main.method_4489().method_5103(_loc2_.id));
        if (_loc3_) {
            ++this.name_76.method_5713;
        }
        if (_loc2_.id == this.var_985.id) {
            this.main.method_4489().method_1322();
        }
    }

    public function method_3893(param1: class_203, param2: int): void {
        param1.method_768(true);
        this.var_3691.method_6351(param1, param2);
    }

    public function method_519(param1: int): class_203 {
        return this.var_3691.method_2703(param1);
    }

    public function get method_345(): class_203 {
        return this.var_985;
    }

    public function method_2106(param1: int): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc2_: class_203 = this.var_3691.method_2703(param1);
        if (_loc2_ != null && this.var_985 != _loc2_) {
            this.var_985 = _loc2_;
            this.main.method_4489().method_3147();
            this.main.method_4489().method_4329();
            _loc3_ = this.main.method_4489().method_5764();
            _loc4_ = _loc3_.method_3694(class_93.const_1649);
            for each(_loc5_ in _loc4_.method_1864()) {
                if (_loc5_.getType() == class_185.const_635) {
                    _loc5_.addEventListener(MouseEvent.CLICK, this.handleCancelButtonClicked);
                    _loc5_.method_4169();
                }
            }
        }
    }

    public function method_6524(param1: int, param2: int, param3: int, param4: Boolean, param5: Boolean): void {
        var _loc6_: * = null;
        if (this.var_3691 != null) {
            if ((_loc6_ = this.var_3691.method_2703(param1)) != null) {
                _loc6_.method_2655(param2, param3, param4, param5);
            }
        }
    }

    public function method_2655(param1: int, param2: int, param3: int, param4: Boolean, param5: Boolean, param6: Boolean = false): void {
        var _loc9_: int = 0;
        var _loc10_: * = null;
        if (this.var_3691 == null) {
            return;
        }
        var _loc7_: class_203;
        if ((_loc7_ = this.var_3691.method_2703(param1)) == null) {
            this.main.method_6154().sendCommand(class_74.const_2615, ["g"]);
            return;
        }
        if (_loc7_.method_3950[param2] == null) {
            return;
        }
        var _loc8_: class_236;
        if ((_loc8_ = class_236(_loc7_.method_3950[param2])) != null) {
            _loc8_.current = param3;
            _loc8_.runstate = param5;
            if (!_loc8_.completed && param4) {
                class_82.playSoundEffect(QuestProxy.const_2549);
            }
            _loc8_.completed = param4;
            if (_loc8_.children.length > 0) {
                _loc9_ = 0;
                while (_loc9_ < _loc8_.children.length) {
                    (_loc10_ = _loc8_.children[_loc9_] as class_236).runstate = param5;
                    _loc10_.completed = param4;
                    _loc9_++;
                }
            }
        }
        if (this.var_985 != null && param1 == this.var_985.id) {
            this.main.method_4489().method_636(param2, param6);
        }
    }

    public function get name_76(): class_233 {
        return this.var_3691;
    }

    public function method_5524(param1: int): int {
        return this.var_3691.method_5524(param1);
    }
}
}
