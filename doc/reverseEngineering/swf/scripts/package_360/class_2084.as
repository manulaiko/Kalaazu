package package_360 {

import com.bigpoint.utils.class_73;
import com.greensock.TweenLite;
import com.greensock.TweenMax;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.utils.Dictionary;

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.common.class_1699;
import net.bigpoint.darkorbit.map.common.class_80;
import net.bigpoint.darkorbit.map.model.ship.class_1859;
import net.bigpoint.darkorbit.map.model.ship.class_1860;
import net.bigpoint.darkorbit.map.model.ship.class_1861;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.map.model.traits.class_299;
import net.bigpoint.darkorbit.map.model.traits.class_306;
import net.bigpoint.darkorbit.map.model.traits.class_309;
import net.bigpoint.darkorbit.settings.Settings;

import package_112.class_420;

import package_115.class_316;

import package_119.class_1191;

import package_29.class_267;

import package_359.class_2360;

import package_423.class_2355;
import package_423.class_2378;
import package_423.class_2379;
import package_423.class_2382;
import package_423.class_2383;

import package_428.class_2377;

import package_76.class_215;

public class class_2084 extends Sprite implements class_80, class_1699, IDisposable {

    private static const const_2191: Dictionary = new Dictionary();

    private static var counter: int = 0;

    {
        const_2191[class_1191] = class_2378;
        const_2191[class_1859] = class_2379;
        const_2191[class_1861] = class_2355;
        const_2191[class_1860] = class_2382;
        const_2191[class_420] = class_2383;
    }

    private var var_176: class_309;

    private var var_764: class_2381;

    private var _faction: class_2381;

    private var var_347: class_2384;

    private var var_2613: Dictionary;

    private var var_3960: class_73;

    private var var_669: class_2377;

    private var var_1231: class_299;

    private var var_2929: Vector.<class_2360>;

    public function class_2084(param1: class_309) {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        this.var_2613 = new Dictionary();
        this.var_3960 = new class_73();
        this.var_2929 = new Vector.<class_2360>();
        super();
        this.var_176 = param1;
        this.var_764 = new class_2381();
        this.var_764.method_2447 = this.ship.rotation;
        addChild(this.var_764);
        this.var_347 = new class_2384(this.ship, this.var_764);
        addChild(this.var_347);
        this.var_669 = new class_2377(this.ship.drones, this);
        addChild(this.var_669);
        for each(_loc2_ in this.ship.method_6341.descriptor.display2D.pivot) {
            (_loc4_ = new class_2360(this.ship.method_5851(_loc2_.@id))).x = Number(_loc2_.@x) || false;
            _loc4_.y = Number(_loc2_.@y) || false;
            this.var_2929.push(_loc4_);
        }
        this.var_1231 = param1.owner.method_1954(class_299) as class_299;
        this.var_1231.laser.var_3526 = new class_2380(this.ship, this.var_764);
        Settings.qualityShip.changed.add(this.method_1868);
        this.ship.method_4658.add(this.method_1868);
        this.ship.info.factionID.changed.add(this.method_1868);
        this.ship.position.changed.add(this.updatePosition);
        this.ship.cloaked.changed.add(this.method_513);
        Settings.hoverShips.changed.add(this.method_1229);
        this.ship.name_110.add(this.method_2767);
        this.ship.name_33.add(this.method_2228);
        for each(_loc3_ in this.ship.traits) {
            this.method_2767(_loc3_);
        }
        this.method_1868();
        this.updatePosition();
        this.method_513();
        this.ship.name_21.add(this.method_21);
        this.ship.name_39.add(this.method_321);
        if (!this.ship.method_6406) {
            this.method_21();
        }
    }

    public function disposeView(param1: Boolean = false): void {
        class_215.removeDisplayObject(this);
        this.method_1942();
        this.var_764.disposeView();
        if (this._faction) {
            this._faction.disposeView();
        }
        if (this.var_669) {
            this.var_669.disposeView();
        }
        if (this.var_347) {
            this.var_347.disposeView();
        }
        Settings.qualityShip.changed.remove(this.method_1868);
        TweenMax.killTweensOf(this);
        this.method_321();
        if (Boolean(this.var_1231) && this.var_1231.laser.var_3526 is class_2380) {
            class_2380(this.var_1231.laser.var_3526).disposeView();
            this.var_1231.laser.var_3526 = null;
        }
        this.ship.method_4658.remove(this.method_1868);
        this.ship.info.factionID.changed.remove(this.method_1868);
        this.ship.position.changed.remove(this.updatePosition);
        this.ship.cloaked.changed.remove(this.method_513);
        this.ship.position.changed.remove(this.updatePosition);
        this.ship.info.factionID.changed.remove(this.method_1868);
        this.ship.name_110.remove(this.method_2767);
        this.ship.name_33.remove(this.method_2228);
        this.ship.cloaked.changed.remove(this.method_513);
        this.ship.name_21.remove(this.method_21);
        this.ship.name_39.remove(this.method_321);
    }

    private function method_1942(): void {
        var _loc1_: * = null;
        for each(_loc1_ in this.var_2613) {
            if (_loc1_ is DisplayObject && Boolean(DisplayObject(_loc1_).parent)) {
                DisplayObject(_loc1_).parent.removeChild(_loc1_ as DisplayObject);
            }
            if (_loc1_ is IDisposable) {
                IDisposable(_loc1_).disposeView();
            }
        }
    }

    public function get layer(): int {
        return !!this.ship.method_6225() ? 3 : 2;
    }

    public function method_6046(param1: class_267): Object {
        return this.var_2613[param1];
    }

    private function method_2767(param1: class_267): void {
        var _loc2_: * = undefined;
        for (_loc2_ in const_2191) {
            if (param1 is _loc2_) {
                this.var_2613[param1] = new const_2191[_loc2_](param1, this);
                if (this.var_2613[param1] is DisplayObject) {
                    addChild(this.var_2613[param1]);
                }
            }
        }
    }

    private function method_2228(param1: class_267): void {
        var _loc2_: * = null;
        if (this.var_2613[param1]) {
            _loc2_ = this.var_2613[param1];
            if (_loc2_ is DisplayObject) {
                removeChild(_loc2_ as DisplayObject);
            }
            if (_loc2_ is IDisposable) {
                IDisposable(_loc2_).disposeView();
            }
        }
    }

    private function method_1229(): void {
        if (!this.ship.method_6406) {
            if (Settings.hoverShips.value == false) {
                this.method_321();
            } else {
                this.method_21();
            }
        }
    }

    private function method_321(): void {
        TweenMax.killTweensOf(this.var_3960);
        this.var_3960.y = 0;
    }

    private function method_21(): void {
        if (Settings.hoverShips.value) {
            TweenMax.to(this.var_3960, 1.2, {
                "y": 3,
                "repeat": -1,
                "yoyo": true,
                "onUpdate": this.updatePosition
            });
        }
    }

    private function updatePosition(): void {
        x = int(this.ship.x + this.var_3960.x);
        y = int(this.ship.y + this.var_3960.y);
    }

    public function get ship(): class_86 {
        return this.var_176.owner as class_86;
    }

    private function method_513(): void {
        if (this.ship.cloaked.value) {
            TweenLite.to(this, 0.2, {"alpha": 0.3});
        } else {
            TweenLite.to(this, 0.2, {"alpha": 1});
        }
    }

    private function method_1868(): void {
        var _loc2_: * = null;
        var _loc1_: class_306 = this.var_176.owner.method_1954(class_306) as class_306;
        if (Boolean(_loc1_) && Boolean(_loc1_.descriptor)) {
            _loc2_ = _loc1_.descriptor.display2D[0].@srcKey;
            if (Settings.qualityShip.value > Settings.QUALITY_LOW) {
                this.var_764.method_2622("replacementShips", _loc2_);
                this.var_764.load(_loc2_, "mc", this.shipPattern.rotatable, this.shipPattern.playLoop);
            } else {
                this.var_764.load("replacementShips", _loc2_, this.shipPattern.rotatable, this.shipPattern.playLoop);
            }
            if (this.shipPattern.var_700) {
                if (this._faction == null) {
                    this._faction = new class_2381();
                    this._faction.method_2447 = this.ship.rotation;
                    addChildAt(this._faction, this.getChildIndex(this.var_764));
                }
                this._faction.load(this.shipPattern.method_1505(this.ship.info.factionID.value).srcKey, "mc");
            }
        }
    }

    private function get shipPattern(): class_316 {
        return this.ship.shipPattern;
    }

    public function get base(): class_2381 {
        return this.var_764;
    }

    public function get engines(): class_2384 {
        return this.var_347;
    }

    public function updateObj(param1: Number): void {
        var _loc2_: int = this.var_2929.length - 1;
        while (_loc2_ >= 0) {
            this.var_2929[_loc2_].updateObj(param1);
            _loc2_--;
        }
    }
}
}
