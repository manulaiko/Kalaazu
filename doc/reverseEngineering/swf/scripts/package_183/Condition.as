package package_183 {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;

import net.bigpoint.as3toolbox.bplocale.class_88;

import package_11.class_39;

import package_65.class_236;

import package_9.ResourceManager;

public class Condition implements class_236 {


    protected var _id: uint;

    protected var _conditions: Array;

    protected var var_3429: Boolean;

    protected var var_3030: Boolean;

    protected var _current: int;

    protected var _target: int;

    protected var var_106: String = "";

    protected var var_734: uint;

    protected var _definition: class_1108;

    protected var _visibility: int;

    protected var _completed: Boolean;

    protected var _description: String;

    protected var _children: Array;

    protected var var_4144: Boolean;

    protected var var_839: Boolean = true;

    protected var var_3277: BitmapData;

    protected var var_1427: Boolean;

    public function Condition() {
        this._children = [];
        super();
    }

    public function get method_1547(): Boolean {
        return this.var_1427;
    }

    public function get id(): uint {
        return this._id;
    }

    public function set id(param1: uint): void {
        this._id = param1;
    }

    public function get conditions(): Array {
        return this._conditions;
    }

    public function get runstate(): Boolean {
        return this.var_3429;
    }

    public function set runstate(param1: Boolean): void {
        if (this.var_3429 != param1) {
            this.var_3429 = param1;
        }
    }

    public function get name_62(): Boolean {
        return this.var_3030;
    }

    public function set name_62(param1: Boolean): void {
        this.var_3030 = param1;
    }

    public function set method_1918(param1: uint): void {
        this.var_734 = param1;
    }

    public function get definition(): class_1108 {
        return this._definition;
    }

    public function set definition(param1: class_1108): void {
        this._definition = param1;
    }

    public function get description(): String {
        return this._description;
    }

    public function get name_94(): String {
        return this.var_106;
    }

    public function get method_1303(): String {
        return "";
    }

    public function get children(): Array {
        return this._children;
    }

    public function get completed(): Boolean {
        return this._completed;
    }

    public function set completed(param1: Boolean): void {
        this._completed = param1;
    }

    public function get current(): int {
        return this._current;
    }

    public function set current(param1: int): void {
        this._current = param1;
    }

    public function get method_3882(): Boolean {
        return this.var_839;
    }

    public function set method_3882(param1: Boolean): void {
        this.var_839 = param1;
    }

    public function get method_937(): DisplayObject {
        return !!this.var_3277 ? new Bitmap(this.var_3277) : null;
    }

    public function set target(param1: int): void {
        this._target = param1;
    }

    public function set questIsRunning(param1: Boolean): void {
    }

    protected function get method_3859(): class_39 {
        return ResourceManager.name_15.getFinisher("icons") as class_39;
    }

    public function init(param1: int, param2: int, param3: int, param4: Boolean, param5: Boolean, param6: Boolean, param7: Vector.<String>): void {
        this.id = param1;
        this.current = param2;
        this.target = param3;
        this.runstate = param4;
        this.name_62 = param5;
        this.completed = param6;
        this.var_1427 = this.definition.method_123;
        this._description = class_88.getItem("q2_condition_" + this._definition.method_1895);
        this.method_153(param7);
    }

    public function method_2612(): void {
        this.var_4144 = true;
    }

    public function toString(): String {
        return this._definition.method_1895;
    }

    public function method_3964(param1: class_236, param2: uint): void {
        if (this._conditions == null) {
            this._conditions = [];
        }
        this._conditions[param2] = param1;
        this.method_6138(param1);
    }

    public function method_242(param1: class_236): void {
        if (this._conditions == null) {
            this._conditions = [];
        }
        this.method_3964(param1, this._conditions.length);
    }

    public function updateCondtition(param1: int, param2: int, param3: Boolean, param4: Boolean): Boolean {
        var _loc5_: * = undefined;
        if (param1 == this._id) {
            this._current = param2;
            return true;
        }
        if (this._children.length > 0) {
            for (_loc5_ in this._children) {
                if (class_236(_loc5_).updateCondtition(param1, param2, param3, param4)) {
                    return true;
                }
            }
        }
        return false;
    }

    public function toTextTree(): String {
        var _loc1_: * = this._description + "\n";
        var _loc2_: int = 0;
        while (_loc2_ < this._children.length) {
            if (this._children[_loc2_] != null) {
                _loc1_ += class_236(this._children[_loc2_]).toTextTree();
            }
            _loc2_++;
        }
        return _loc1_;
    }

    public function method_4201(): Boolean {
        return this.var_4144;
    }

    protected function method_153(param1: Vector.<String>): void {
    }

    protected function method_6395(param1: String): BitmapData {
        if (this.method_3859.hasEmbeddedObject(param1)) {
            return this.method_3859.getEmbeddedBitmapData(param1);
        }
        return null;
    }

    protected function method_6138(param1: class_236): void {
        this._children.push(param1);
    }
}
}
