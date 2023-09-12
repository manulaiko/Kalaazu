package net.bigpoint.darkorbit.mvc.gui.model.vo {

public class SetWindowProgressVisibilityVO {


    private var _visibility: Boolean;

    private var _windowId: String;

    public function SetWindowProgressVisibilityVO(param1: String, param2: Boolean) {
        super();
        this._windowId = param1;
        this._visibility = param2;
    }

    public function get visibility(): Boolean {
        return this._visibility;
    }

    public function get windowId(): String {
        return this._windowId;
    }
}
}
