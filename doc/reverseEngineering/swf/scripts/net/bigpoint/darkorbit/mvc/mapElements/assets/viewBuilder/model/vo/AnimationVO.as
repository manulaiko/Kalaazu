package net.bigpoint.darkorbit.mvc.mapElements.assets.viewBuilder.model.vo {

public class AnimationVO {


    private var _id: String;

    private var _loop: Boolean;

    private var _yoyo: Boolean;

    private var _autoPlay: Boolean;

    private var _children: Vector.<Object>;

    private var _minUserQuality: uint = 0;

    private var _maxReductionThreshold: uint = 4294967295;

    private var _parallel: Boolean;

    private var _resumeAfterReduction: Boolean;

    public function AnimationVO(param1: String, param2: Boolean, param3: Boolean, param4: Boolean, param5: Boolean, param6: Vector.<Object>, param7: uint, param8: uint, param9: Boolean) {
        super();
        this._resumeAfterReduction = param9;
        this._parallel = param5;
        this._maxReductionThreshold = param8;
        this._minUserQuality = param7;
        this._children = param6;
        this._autoPlay = param4;
        this._yoyo = param3;
        this._loop = param2;
        this._id = param1;
    }

    public function get loop(): Boolean {
        return this._loop;
    }

    public function get yoyo(): Boolean {
        return this._yoyo;
    }

    public function get children(): Vector.<Object> {
        return this._children;
    }

    public function get id(): String {
        return this._id;
    }

    public function get autoPlay(): Boolean {
        return this._autoPlay;
    }

    public function get minUserQuality(): uint {
        return this._minUserQuality;
    }

    public function get maxReductionThreshold(): uint {
        return this._maxReductionThreshold;
    }

    public function get parallel(): Boolean {
        return this._parallel;
    }

    public function get resumeAfterReduction(): Boolean {
        return this._resumeAfterReduction;
    }
}
}
