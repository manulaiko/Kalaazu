package package_76 {

import flash.ui.Keyboard;

import net.bigpoint.as3toolbox.bplocale.class_88;

public class class_2321 {

    private static const const_526: Object = new Object();

    {
        const_526[Keyboard.BACKSPACE] = class_88.getItem("keyboard_key_backspace");
        const_526[Keyboard.CONTROL] = class_88.getItem("keyboard_key_ctrl");
        const_526[Keyboard.ESCAPE] = class_88.getItem("keyboard_key_esc");
        const_526[Keyboard.CAPS_LOCK] = class_88.getItem("keyboard_key_capslock");
        const_526[Keyboard.DELETE] = class_88.getItem("keyboard_key_delete");
        const_526[Keyboard.END] = class_88.getItem("keyboard_key_end");
        const_526[Keyboard.ENTER] = class_88.getItem("keyboard_key_enter");
        const_526[Keyboard.HOME] = class_88.getItem("keyboard_key_home");
        const_526[Keyboard.INSERT] = class_88.getItem("keyboard_key_insert");
        const_526[Keyboard.PAGE_UP] = class_88.getItem("keyboard_key_page up");
        const_526[Keyboard.PAGE_DOWN] = class_88.getItem("keyboard_key_page down");
        const_526[Keyboard.SPACE] = class_88.getItem("keyboard_key_space");
        const_526[Keyboard.SHIFT] = class_88.getItem("keyboard_key_key_shift");
        const_526[Keyboard.TAB] = class_88.getItem("keyboard_key_tab");
        const_526[Keyboard.UP] = class_88.getItem("keyboard_key_up");
        const_526[Keyboard.DOWN] = class_88.getItem("keyboard_key_down");
        const_526[Keyboard.LEFT] = class_88.getItem("keyboard_key_left");
        const_526[Keyboard.RIGHT] = class_88.getItem("keyboard_key_right");
        const_526[144] = class_88.getItem("keyboard_key_numpad").split("\n").join(" ");
        const_526[145] = class_88.getItem("keyboard_key_roll");
        const_526[19] = class_88.getItem("keyboard_key_pause");
        const_526[93] = class_88.getItem("keyboard_key_option");
        const_526[92] = class_88.getItem("keyboard_key_win");
        const_526[91] = class_88.getItem("keyboard_key_win");
        const_526[-1] = class_88.getItem("keyboard_key_undefined");
        const_526[Keyboard.NUMPAD_0] = "undefined 0";
        const_526[Keyboard.NUMPAD_1] = "undefined 1";
        const_526[Keyboard.NUMPAD_2] = "undefined 2";
        const_526[Keyboard.NUMPAD_3] = "undefined 3";
        const_526[Keyboard.NUMPAD_4] = "undefined 4";
        const_526[Keyboard.NUMPAD_5] = "undefined 5";
        const_526[Keyboard.NUMPAD_6] = "undefined 6";
        const_526[Keyboard.NUMPAD_7] = "undefined 7";
        const_526[Keyboard.NUMPAD_8] = "undefined 8";
        const_526[Keyboard.NUMPAD_9] = "undefined 9";
        const_526[Keyboard.NUMPAD_ADD] = "undefined +";
        const_526[Keyboard.NUMPAD_SUBTRACT] = "undefined -";
        const_526[Keyboard.NUMPAD_MULTIPLY] = "undefined *";
        const_526[Keyboard.NUMPAD_DIVIDE] = "undefined /";
    }

    public function class_2321() {
        super();
    }

    public static function method_3475(param1: String, param2: String = ""): Boolean {
        var _loc3_: String = param2 == "" || param2 == null ? "" : param2 + ".";
        return class_88.method_734(param2, param1) != "{" + _loc3_ + param1 + "}";
    }

    public static function method_1944(param1: int): String {
        var _loc2_: * = null;
        if (false) {
            _loc2_ = "null";
        } else if (param1 > 111 && param1 <= 126) {
            _loc2_ = "F" + (param1 - 111).toString();
        } else {
            if (class_2321.method_3475("keyboard_key_" + param1.toString())) {
                _loc2_ = class_88.getItem("keyboard_key_" + param1.toString());
            }
            if (!_loc2_ || _loc2_ == "") {
                _loc2_ = String.fromCharCode(param1);
            }
        }
        return _loc2_;
    }
}
}
