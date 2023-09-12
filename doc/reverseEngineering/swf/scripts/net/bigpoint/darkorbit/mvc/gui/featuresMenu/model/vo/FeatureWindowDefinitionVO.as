package net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo {

import flash.geom.Rectangle;

public class FeatureWindowDefinitionVO {


    private var _closeable: Boolean;

    private var _resizable: Boolean;

    private var _resizeBounds: Rectangle;

    private var _minimizable: Boolean;

    private var _expandable: Boolean;

    private var _zoomable: Boolean;

    private var _draggable: Boolean;

    private var _openCloseAnimation: Boolean;

    private var _transparencySupport: Boolean;

    private var _infoFieldContainers: XMLList;

    private var _simpleContainers: XMLList;

    public function FeatureWindowDefinitionVO(param1: Boolean, param2: Boolean, param3: Boolean, param4: Boolean, param5: Boolean, param6: Boolean, param7: Boolean, param8: Boolean, param9: Rectangle = null, param10: XMLList = null, param11: XMLList = null) {
        this._resizeBounds = new Rectangle();
        super();
        this._closeable = param1;
        this._resizable = param2;
        this._resizeBounds = param9;
        this._minimizable = param3;
        this._expandable = param4;
        this._zoomable = param5;
        this._draggable = param6;
        this._openCloseAnimation = param7;
        this._transparencySupport = param8;
        this._infoFieldContainers = param10;
        this._simpleContainers = param11;
    }

    public function get closeable(): Boolean {
        return this._closeable;
    }

    public function get resizable(): Boolean {
        return this._resizable;
    }

    public function get resizeBounds(): Rectangle {
        return this._resizeBounds;
    }

    public function get minimizable(): Boolean {
        return this._minimizable;
    }

    public function get zoomable(): Boolean {
        return this._zoomable;
    }

    public function get draggable(): Boolean {
        return this._draggable;
    }

    public function get transparencySupport(): Boolean {
        return this._transparencySupport;
    }

    public function get infoFieldContainers(): XMLList {
        return this._infoFieldContainers;
    }

    public function get simpleContainers(): XMLList {
        return this._simpleContainers;
    }

    public function get expandable(): Boolean {
        return this._expandable;
    }

    public function set draggable(param1: Boolean): void {
        this._draggable = param1;
    }

    public function set closeable(param1: Boolean): void {
        this._closeable = param1;
    }

    public function get openCloseAnimation(): Boolean {
        return this._openCloseAnimation;
    }
}
}
