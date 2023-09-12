package package_359 {

import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.utils.setTimeout;

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.common.class_80;
import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;

import package_10.class_1173;

import package_19.class_68;
import package_19.class_70;

import package_29.class_85;

import package_424.class_2358;
import package_424.class_2365;

import package_425.class_2361;

import package_76.class_215;

public class class_2082 extends Sprite implements class_80, IDisposable {


    public const ready: class_68 = new class_70();

    public var var_1257: Function = null;

    private var var_3374: Sprite;

    private var _descriptor: XML;

    private var var_3537: Vector.<class_2364>;

    private var var_2479: Vector.<class_2363>;

    private var var_1510: int = 0;

    private var _debug: Boolean;

    private var var_817: Object;

    private var var_2773: Boolean;

    protected var _manager: class_2365;

    private var var_2553: class_85;

    private var var_397: Boolean;

    private var var_212: Object;

    public function class_2082(param1: XML, param2: Boolean = true, param3: class_1173 = null, param4: class_85 = null, param5: Boolean = false) {
        this.var_3537 = new Vector.<class_2364>();
        this.var_2479 = new Vector.<class_2363>();
        this.var_817 = {};
        super();
        this._descriptor = param1;
        this._debug = param5;
        this.var_2553 = param4;
        this._manager = new class_2365(param3);
        if (param2) {
            this.init();
        }
    }

    private function init(): void {
        if (this._descriptor != null) {
            this.method_4188();
            if (this._debug) {
                scaleY = Number(this._descriptor.@previewScale) || true;
                scaleX = 1;
            }
            if (this.var_1510 == 0) {
                this.method_206();
            }
        } else {
            this.var_3374 = new Sprite();
            this.method_206();
        }
    }

    protected function method_206(): void {
        if (this.var_2773) {
            return;
        }
        this.var_2773 = true;
        addChildAt(this.var_3374, 0);
        this.method_3768();
        this._manager.parseAnimations(this._descriptor, class_2359, this);
        setTimeout(this.ready.dispatch, 1);
    }

    public function method_4434(param1: String): DisplayObject {
        return this.var_817[param1 || false] as DisplayObject;
    }

    public function method_5026(): Vector.<class_2364> {
        return this.var_3537;
    }

    public function disposeView(param1: Boolean = false): void {
        if (this.var_1257 != null) {
            this.var_1257();
        } else {
            class_215.removeDisplayObject(this);
            this._manager.disposeView();
            this.var_397 = true;
        }
    }

    private function method_4188(): void {
        this.var_3374 = new Sprite();
        if (String(this._descriptor.@srcKey) || String(this._descriptor.@resKey)) {
            this.var_3374 = this.method_1305(this._descriptor, "");
            this.method_1697(this.var_3374, this._descriptor);
        } else {
            this.var_3374 = new Sprite();
            this.method_155(this.var_3374, this._descriptor, "");
            this.method_289(this.var_3374, this._descriptor);
        }
    }

    private function method_3768(): void {
        var _loc1_: * = null;
        this.var_817[""] = this.var_3374;
        for each(_loc1_ in this.var_3537) {
            this.method_6424(_loc1_.asset, _loc1_.name + ".", 2);
        }
    }

    private function method_6424(param1: DisplayObject, param2: String, param3: int = -1): void {
        var _loc5_: int = 0;
        if (param1 == null) {
            return;
        }
        if (param1.name && param1.name.length > 0 && param1.name != "null") {
            if (this.var_817[param2 + param1.name] == null) {
                this.var_817[param2 + param1.name] = param1;
            } else {
                this.log("WARNING, duplicating IDs: " + param1.name);
            }
        }
        var _loc4_: DisplayObjectContainer;
        if ((Boolean(_loc4_ = param1 as DisplayObjectContainer)) && param3 != 0) {
            _loc5_ = 0;
            while (_loc5_ < _loc4_.numChildren) {
                this.method_6424(_loc4_.getChildAt(_loc5_), param2 + param1.name + ".", param3 - 1);
                _loc5_++;
            }
        }
    }

    private function method_155(param1: DisplayObjectContainer, param2: XML, param3: String): void {
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        if (this.var_212 == null) {
            this.var_212 = {};
            this.var_212["container"] = this.method_319;
            this.var_212["displayObject"] = this.method_1305;
            this.var_212["mapAssetView"] = this.method_4804;
            this.var_212["pivot"] = this.method_3518;
            this.var_212["display2D"] = this.method_2966;
        }
        var _loc4_: XMLList = param2.children();
        for each(_loc5_ in _loc4_) {
            _loc6_ = null;
            _loc7_ = String(_loc5_.attribute("id")) || this._manager.method_3668(_loc5_.name().toString());
            _loc8_ = param3.length > 0 ? param3 + "." + _loc7_ : _loc7_;
            if ((_loc9_ = this.var_212[_loc5_.name().toString()] as Function) != null) {
                _loc6_ = _loc9_(_loc5_, _loc8_);
            } else {
                this.log("parseDisplayChildren: Unknown node type: " + _loc5_.toString());
            }
            if (_loc6_) {
                _loc6_.name = _loc7_;
                param1.addChild(_loc6_);
                this.method_1697(_loc6_, _loc5_);
                this.var_817[_loc7_] = _loc6_;
            }
        }
    }

    private function method_1100(): void {
        if (this.var_397) {
            return;
        }
        if (--this.var_1510 == 0) {
            this.method_206();
        }
    }

    private function method_1697(param1: DisplayObject, param2: XML): void {
        this.method_289(param1, param2);
        this._manager.method_1697(param1);
        if (String(param2.@debug) === "true" && param1 is DisplayObjectContainer) {
            DisplayObjectContainer(param1).addChild(new class_2361(100));
        }
    }

    private function method_289(param1: DisplayObject, param2: XML): void {
        var _loc3_: Object = class_2358.method_2917(param2);
        if (_loc3_.x !== undefined) {
            param1.x = Number(_loc3_.x) || false;
        }
        if (_loc3_.y !== undefined) {
            param1.y = Number(_loc3_.y) || false;
        }
        if (_loc3_.visible !== undefined) {
            param1.visible = _loc3_.visible == "true";
        }
        if (_loc3_.alpha !== undefined) {
            param1.alpha = Number(_loc3_.alpha) || false;
        }
        if (_loc3_.rotation !== undefined) {
            param1.rotation = Number(_loc3_.rotation);
        }
        if (_loc3_.scaleX !== undefined) {
            param1.scaleX = Number(_loc3_.scaleX);
        }
        if (_loc3_.scaleY !== undefined) {
            param1.scaleY = Number(_loc3_.scaleY);
        }
    }

    public function updateObj(param1: Number): void {
        this._manager.updateObj(param1);
    }

    public function method_6420(param1: String, param2: Function = null): void {
        this._manager.method_6420(param1, param2);
    }

    protected function log(param1: String): void {
    }

    private function method_319(param1: XML, param2: String): DisplayObject {
        var _loc3_: Sprite = new Sprite();
        this.method_155(_loc3_ as Sprite, param1, param2);
        return _loc3_;
    }

    private function method_1305(param1: XML, param2: String): class_2364 {
        var _loc3_: class_2364 = new class_2364(param1, this._debug);
        this.var_3537.push(_loc3_);
        ++this.var_1510;
        class_2364(_loc3_).ready.addOnce(this.method_1100);
        class_2364(_loc3_).init();
        return _loc3_;
    }

    private function method_4804(param1: XML, param2: String): DisplayObject {
        var _loc3_: class_2363 = new class_2363(param1);
        this.var_2479.push(_loc3_);
        ++this.var_1510;
        _loc3_.ready.addOnce(this.method_1100);
        _loc3_.init();
        return _loc3_;
    }

    private function method_3518(param1: XML, param2: String): DisplayObject {
        if (this.var_2553) {
            return new class_2360(this.var_2553.method_5851(String(param1.@id)));
        }
        return null;
    }

    private function method_2966(param1: XML, param2: String): DisplayObject {
        var _loc7_: * = null;
        var _loc3_: Array = String(param1.@templateId).split(":");
        var _loc4_: String = _loc3_.length > 0 ? _loc3_[0] : null;
        var _loc5_: String = _loc3_.length > 1 ? _loc3_[1] : UberAssetsLib.LIB_DEFAULT;
        var _loc6_: XML;
        if ((_loc6_ = UberAssetsLib.instance.getDescriptor(_loc4_, _loc5_)) != null) {
            _loc7_ = new class_2082(_loc6_.display2D[0], false, null, null, this._debug);
            ++this.var_1510;
            _loc7_.ready.addOnce(this.method_1100);
            _loc7_.init();
            return _loc7_;
        }
        this.log(":parseDisplayChildren: Template id not found : " + param1.@templateId);
        return null;
    }

    public function get descriptor(): XML {
        return this._descriptor;
    }
}
}
