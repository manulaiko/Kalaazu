package net.bigpoint.darkorbit.mvc.gui.featuresMenu.controller.logic {

import flash.geom.Point;

public class ToggleWindowVO {


    private var _menuBtnPosition: Point;

    private var _featureId: String;

    private var _isNewWindow: Boolean;

    public function ToggleWindowVO(param1: Point, param2: String, param3: Boolean) {
        super();
        this._isNewWindow = param3;
        this._featureId = param2;
        this._menuBtnPosition = param1;
    }

    public function get menuBtnPosition(): Point {
        return this._menuBtnPosition;
    }

    public function get featureId(): String {
        return this._featureId;
    }

    public function get isNewWindow(): Boolean {
        return this._isNewWindow;
    }
}
}
