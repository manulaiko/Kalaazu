package net.bigpoint.darkorbit.fui.components.text.input {

import flash.events.Event;

public class InputEvent extends Event {

    public static const INPUT_IS_VALID: String = "InputEvent.isValid";

    public static const INPUT_IS_INVALID: String = "InputEvent.isInvalid";


    public function InputEvent(param1: String) {
        super(param1);
    }
}
}
