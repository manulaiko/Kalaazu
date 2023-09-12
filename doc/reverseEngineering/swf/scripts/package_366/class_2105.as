package package_366 {

import away3d.arcane;

import flash.display.BitmapData;
import flash.events.EventDispatcher;
import flash.events.TimerEvent;
import flash.net.URLRequest;
import flash.utils.ByteArray;
import flash.utils.Timer;
import flash.utils.getTimer;

import package_199.class_2123;
import package_199.class_2415;

import package_293.class_1751;
import package_293.class_2131;

import package_368.class_2416;

import package_374.AbstractMethodError;

import package_434.class_2413;

import package_435.class_2414;

public class class_2105 extends EventDispatcher {

    protected static const const_2361: Boolean = true;

    protected static const const_2971: Boolean = false;


    arcane var var_677: String;

    protected var var_59: String;

    protected var _data;

    protected var var_601: Number;

    protected var var_3728: Number;

    private var var_788: Vector.<class_2416>;

    private var var_1277: Boolean;

    private var var_3948: Boolean;

    private var var_1950: Boolean;

    private var _timer: Timer;

    private var var_496: uint;

    public function class_2105(param1: String) {
        super();
        this.var_496 = 0;
        this.var_59 = param1;
        this.var_788 = new Vector.<class_2416>();
    }

    protected function method_5311(): String {
        return class_2414.toString(this._data);
    }

    protected function method_5043(): ByteArray {
        return class_2414.toByteArray(this._data);
    }

    public function method_2090(param1: BitmapData): Boolean {
        var _loc2_: Boolean = Boolean(class_2413.method_2090(param1));
        if (_loc2_) {
        }
        return _loc2_;
    }

    public function set parsingFailure(param1: Boolean): void {
        this.var_1950 = param1;
    }

    public function get parsingFailure(): Boolean {
        return this.var_1950;
    }

    public function get method_3984(): Boolean {
        return this.var_1277;
    }

    public function get method_1070(): Boolean {
        return this.var_3948;
    }

    public function set method_810(param1: uint): void {
        this.var_496 = param1;
    }

    public function get method_810(): uint {
        return this.var_496;
    }

    public function get dataFormat(): String {
        return this.var_59;
    }

    public function method_5169(param1: *, param2: Number = 30): void {
        this._data = param1;
        this.method_2030(param2);
    }

    public function get method_728(): Vector.<class_2416> {
        return this.var_788;
    }

    arcane function method_3765(param1: class_2416): void {
        throw new AbstractMethodError();
    }

    arcane function resolveDependencyFailure(param1: class_2416): void {
        throw new AbstractMethodError();
    }

    arcane function method_5931(param1: class_2416, param2: class_1751): String {
        return param2.name;
    }

    arcane function method_4486(): void {
        this.var_1277 = false;
        if (this._timer) {
            this._timer.start();
        }
    }

    protected function method_3342(param1: class_1751, param2: String = null): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (param2 != null) {
            param1.name = param2;
        }
        switch (param1.assetType) {
            case class_2131.const_133:
                _loc4_ = "lightPicker";
                _loc3_ = "null";
                break;
            case class_2131.const_1414:
                _loc4_ = "light";
                _loc3_ = "null";
                break;
            case class_2131.const_700:
                _loc4_ = "animator";
                _loc3_ = "null";
                break;
            case class_2131.const_2058:
                _loc4_ = "animationSet";
                _loc3_ = "null";
                break;
            case class_2131.const_1841:
                _loc4_ = "animationState";
                _loc3_ = "null";
                break;
            case class_2131.const_800:
                _loc4_ = "animationNode";
                _loc3_ = "null";
                break;
            case class_2131.const_2589:
                _loc4_ = "stateTransition";
                _loc3_ = "null";
                break;
            case class_2131.TEXTURE:
                _loc4_ = "texture";
                _loc3_ = "null";
                break;
            case class_2131.const_2510:
                _loc4_ = "textureProjector";
                _loc3_ = "null";
                break;
            case class_2131.CONTAINER:
                _loc4_ = "container";
                _loc3_ = "null";
                break;
            case class_2131.GEOMETRY:
                _loc4_ = "geometry";
                _loc3_ = "null";
                break;
            case class_2131.const_808:
                _loc4_ = "material";
                _loc3_ = "null";
                break;
            case class_2131.const_3013:
                _loc4_ = "mesh";
                _loc3_ = "null";
                break;
            case class_2131.const_1226:
                _loc4_ = "skeleton";
                _loc3_ = "null";
                break;
            case class_2131.const_3077:
                _loc4_ = "skelpose";
                _loc3_ = "null";
                break;
            case class_2131.const_2930:
                _loc4_ = "entity";
                _loc3_ = "null";
                break;
            case class_2131.const_563:
                _loc4_ = "skybox";
                _loc3_ = "null";
                break;
            case class_2131.CAMERA:
                _loc4_ = "camera";
                _loc3_ = "null";
                break;
            case class_2131.const_2748:
                _loc4_ = "segmentSet";
                _loc3_ = "null";
                break;
            case class_2131.const_1565:
                _loc4_ = "effectsMethod";
                _loc3_ = "null";
                break;
            case class_2131.const_3103:
                _loc4_ = "effectsMethod";
                _loc3_ = "null";
                break;
            default:
                throw new Error("Unhandled asset type " + param1.assetType + ". Report as bug!");
        }
        if (!param1.name) {
            param1.name = _loc4_;
        }
        dispatchEvent(new class_2123(class_2123.const_269, param1));
        dispatchEvent(new class_2123(_loc3_, param1));
    }

    protected function method_196(): Boolean {
        throw new AbstractMethodError();
    }

    protected function method_444(param1: String = "Unknown parsing error"): void {
        if (this._timer) {
            this._timer.removeEventListener(TimerEvent.TIMER, this.method_2477);
            this._timer.stop();
            this._timer = null;
        }
        dispatchEvent(new class_2415(class_2415.PARSE_ERROR, param1));
    }

    protected function method_597(param1: String, param2: URLRequest, param3: Boolean = false, param4: * = null, param5: Boolean = false): void {
        this.var_788.push(new class_2416(param1, param2, param4, this, param3, param5));
    }

    protected function method_1516(): void {
        if (this._timer) {
            this._timer.stop();
        }
        this.var_1277 = true;
        dispatchEvent(new class_2415(class_2415.const_2819));
    }

    protected function method_2812(): Boolean {
        return getTimer() - Number(this.var_3728) < this.var_601;
    }

    protected function method_2477(param1: TimerEvent = null): void {
        this.var_3728 = getTimer();
        if (Boolean(this.method_196()) && !this.var_1950) {
            this.method_1318();
        }
    }

    protected function method_2030(param1: Number): void {
        this.var_601 = param1;
        this._timer = new Timer(this.var_601, 0);
        this._timer.addEventListener(TimerEvent.TIMER, this.method_2477);
        this._timer.start();
    }

    protected function method_1318(): void {
        if (this._timer) {
            this._timer.removeEventListener(TimerEvent.TIMER, this.method_2477);
            this._timer.stop();
        }
        this._timer = null;
        this.var_3948 = true;
        dispatchEvent(new class_2415(class_2415.const_2203));
    }
}
}
