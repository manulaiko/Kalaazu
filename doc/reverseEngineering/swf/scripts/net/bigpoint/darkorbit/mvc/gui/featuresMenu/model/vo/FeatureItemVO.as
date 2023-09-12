package net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo {

import package_38.class_358;

public class FeatureItemVO {


    private var _id: String;

    private var _barId: String;

    private var _visible: Boolean;

    private var _tooltipKeyList: class_358;

    private var _featureWindowVO: FeatureWindowVO;

    public function FeatureItemVO(param1: String, param2: String, param3: Boolean, param4: class_358, param5: FeatureWindowVO = null) {
        super();
        this._id = param1;
        this._barId = param2;
        this._visible = param3;
        this._tooltipKeyList = param4;
        this._featureWindowVO = param5;
    }

    public function get id(): String {
        return this._id;
    }

    public function get visible(): Boolean {
        return this._visible;
    }

    public function get tooltipKeyList(): class_358 {
        return this._tooltipKeyList;
    }

    public function get featureWindowVO(): FeatureWindowVO {
        return this._featureWindowVO;
    }

    public function set visible(param1: Boolean): void {
        this._visible = param1;
    }

    public function get barId(): String {
        return this._barId;
    }
}
}
