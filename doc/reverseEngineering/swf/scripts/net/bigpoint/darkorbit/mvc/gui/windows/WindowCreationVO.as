package net.bigpoint.darkorbit.mvc.gui.windows {

import flash.utils.getQualifiedClassName;

import net.bigpoint.darkorbit.mvc.gui.interfaces.IWindow;

import package_17.class_62;

public class WindowCreationVO {


    private const NOTIFICATION_PREFIX: String = "Notification.PostCreation.";

    private var _windowCreatingClassReference: Class;

    private var _windowPostCreateCommandReference: Class;

    public function WindowCreationVO(param1: Class, param2: Class = null) {
        super();
        this._windowCreatingClassReference = param1;
        this._windowPostCreateCommandReference = param2;
    }

    public function createWindowInstance(): IWindow {
        return new this._windowCreatingClassReference() as IWindow;
    }

    public function executePostWindowCreateCommand(...rest): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (this._windowPostCreateCommandReference != null) {
            _loc2_ = class_62.getInstance();
            _loc3_ = "Notification.PostCreation." + getQualifiedClassName(this._windowPostCreateCommandReference);
            if (!_loc2_.hasCommand(_loc3_)) {
                _loc2_.registerCommand(_loc3_, this._windowPostCreateCommandReference);
            }
            _loc2_.sendNotification(_loc3_, rest);
        }
    }
}
}
