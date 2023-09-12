package starling.events {

import flash.geom.Matrix;
import flash.geom.Point;

import starling.core.starling_internal;
import starling.display.DisplayObject;
import starling.utils.MatrixUtil;
import starling.utils.formatString;

public class Touch {

    private static var sHelperMatrix: Matrix = new Matrix();


    private var mID: int;

    private var mGlobalX: Number;

    private var mGlobalY: Number;

    private var mPreviousGlobalX: Number;

    private var mPreviousGlobalY: Number;

    private var mTapCount: int;

    private var mPhase: String;

    private var mTarget: DisplayObject;

    private var mTimestamp: Number;

    private var mPressure: Number;

    private var mWidth: Number;

    private var mHeight: Number;

    private var mBubbleChain: Vector.<EventDispatcher>;

    public function Touch(param1: int) {
        super();
        this.mID = param1;
        this.mTapCount = 0;
        this.mPhase = TouchPhase.HOVER;
        this.mPressure = this.mWidth = this.mHeight = 1;
        this.mBubbleChain = new Vector.<EventDispatcher>(0);
    }

    public function getLocation(param1: DisplayObject, param2: Point = null): Point {
        if (param2 == null) {
            param2 = new Point();
        }
        param1.base.getTransformationMatrix(param1, sHelperMatrix);
        return MatrixUtil.transformCoords(sHelperMatrix, this.mGlobalX, this.mGlobalY, param2);
    }

    public function getPreviousLocation(param1: DisplayObject, param2: Point = null): Point {
        if (param2 == null) {
            param2 = new Point();
        }
        param1.base.getTransformationMatrix(param1, sHelperMatrix);
        return MatrixUtil.transformCoords(sHelperMatrix, this.mPreviousGlobalX, this.mPreviousGlobalY, param2);
    }

    public function getMovement(param1: DisplayObject, param2: Point = null): Point {
        if (param2 == null) {
            param2 = new Point();
        }
        this.getLocation(param1, param2);
        var _loc3_: Number = param2.x;
        var _loc4_: Number = param2.y;
        this.getPreviousLocation(param1, param2);
        param2.setTo(_loc3_ - param2.x, _loc4_ - param2.y);
        return param2;
    }

    public function isTouching(param1: DisplayObject): Boolean {
        return this.mBubbleChain.indexOf(param1) != -1;
    }

    public function toString(): String {
        return formatString("Touch {0}: globalX={1}, globalY={2}, phase={3}", this.mID, this.mGlobalX, this.mGlobalY, this.mPhase);
    }

    public function clone(): Touch {
        var _loc1_: Touch = new Touch(this.mID);
        _loc1_.mGlobalX = this.mGlobalX;
        _loc1_.mGlobalY = this.mGlobalY;
        _loc1_.mPreviousGlobalX = this.mPreviousGlobalX;
        _loc1_.mPreviousGlobalY = this.mPreviousGlobalY;
        _loc1_.mPhase = this.mPhase;
        _loc1_.mTapCount = this.mTapCount;
        _loc1_.mTimestamp = this.mTimestamp;
        _loc1_.mPressure = this.mPressure;
        _loc1_.mWidth = this.mWidth;
        _loc1_.mHeight = this.mHeight;
        _loc1_.target = this.mTarget;
        return _loc1_;
    }

    private function updateBubbleChain(): void {
        var _loc1_: int = 0;
        var _loc2_: * = null;
        if (this.mTarget) {
            _loc1_ = 1;
            _loc2_ = this.mTarget;
            this.mBubbleChain.length = 1;
            this.mBubbleChain[0] = _loc2_;
            while ((_loc2_ = _loc2_.parent) != null) {
                this.mBubbleChain[int(_loc1_++)] = _loc2_;
            }
        } else {
            this.mBubbleChain.length = 0;
        }
    }

    public function get id(): int {
        return this.mID;
    }

    public function get previousGlobalX(): Number {
        return this.mPreviousGlobalX;
    }

    public function get previousGlobalY(): Number {
        return this.mPreviousGlobalY;
    }

    public function get globalX(): Number {
        return this.mGlobalX;
    }

    public function set globalX(param1: Number): void {
        this.mPreviousGlobalX = this.mGlobalX != this.mGlobalX ? param1 : this.mGlobalX;
        this.mGlobalX = param1;
    }

    public function get globalY(): Number {
        return this.mGlobalY;
    }

    public function set globalY(param1: Number): void {
        this.mPreviousGlobalY = this.mGlobalY != this.mGlobalY ? param1 : this.mGlobalY;
        this.mGlobalY = param1;
    }

    public function get tapCount(): int {
        return this.mTapCount;
    }

    public function set tapCount(param1: int): void {
        this.mTapCount = param1;
    }

    public function get phase(): String {
        return this.mPhase;
    }

    public function set phase(param1: String): void {
        this.mPhase = param1;
    }

    public function get target(): DisplayObject {
        return this.mTarget;
    }

    public function set target(param1: DisplayObject): void {
        if (this.mTarget != param1) {
            this.mTarget = param1;
            this.updateBubbleChain();
        }
    }

    public function get timestamp(): Number {
        return this.mTimestamp;
    }

    public function set timestamp(param1: Number): void {
        this.mTimestamp = param1;
    }

    public function get pressure(): Number {
        return this.mPressure;
    }

    public function set pressure(param1: Number): void {
        this.mPressure = param1;
    }

    public function get width(): Number {
        return this.mWidth;
    }

    public function set width(param1: Number): void {
        this.mWidth = param1;
    }

    public function get height(): Number {
        return this.mHeight;
    }

    public function set height(param1: Number): void {
        this.mHeight = param1;
    }

    function dispatchEvent(param1: TouchEvent): void {
        if (this.mTarget) {
            param1.dispatch(this.mBubbleChain);
        }
    }

    function get bubbleChain(): Vector.<EventDispatcher> {
        return this.mBubbleChain.concat();
    }
}
}
