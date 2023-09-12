package net.bigpoint.darkorbit.map.model.ship {

import com.bigpoint.utils.class_73;
import com.greensock.TweenLite;
import com.greensock.easing.Linear;

import flash.utils.clearTimeout;
import flash.utils.setTimeout;

import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.map.model.traits.class_287;
import net.bigpoint.darkorbit.map.model.traits.class_299;
import net.bigpoint.darkorbit.map.model.traits.class_306;
import net.bigpoint.darkorbit.map.model.traits.class_308;
import net.bigpoint.darkorbit.map.model.traits.class_309;
import net.bigpoint.darkorbit.map.model.traits.class_319;
import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;

import package_10.class_19;
import package_10.class_20;
import package_10.class_314;

import package_100.class_270;
import package_100.class_313;

import package_112.class_307;

import package_113.class_310;

import package_114.class_312;
import package_114.class_318;

import package_115.class_316;

import package_116.class_317;

import package_19.class_68;
import package_19.class_70;

import package_29.class_267;
import package_29.class_85;
import package_29.class_89;

import package_38.class_315;

import package_9.class_50;

public class class_86 extends class_85 {


    public const rotation: class_314 = new class_314(Math.random() * 360);

    public const speed: class_20 = new class_20(0);

    public const name_166: class_19 = new class_19(false);

    public const legendary: class_19 = new class_19(false);

    public const const_1925: class_19 = new class_19(false);

    public const cloaked: class_19 = new class_19(false);

    public const name_39: class_68 = new class_70();

    public const name_21: class_68 = new class_70();

    public const debug: class_19 = new class_19(false);

    public var pet: class_307;

    private var var_1610: Boolean = false;

    private var var_4729: class_308;

    private var _destination: class_73 = null;

    private var var_1475: class_316;

    private var var_4001: class_68;

    public const const_2106: Vector.<class_315> = new Vector.<class_315>();

    private var var_9: class_309;

    private var var_627: class_306;

    private var _visible: Boolean = true;

    private var var_3203: Boolean = true;

    private var _info: class_310;

    private var var_2535: class_85 = null;

    private var var_3676: Vector.<class_267>;

    private var var_669: class_317;

    private var var_3326: TweenLite;

    private var var_666: class_316;

    private var var_4699: Function = null;

    private var var_4937: Array = null;

    private var var_1246: uint;

    private var var_832: Boolean = false;

    public function class_86(param1: int, param2: class_316, param3: class_270) {
        this.var_4001 = new class_70();
        this.var_669 = new class_317();
        super(param1, new class_73());
        this.var_4729 = new class_308();
        addTrait(this.var_4729);
        this.var_9 = new class_309();
        addTrait(this.var_9);
        addTrait(new class_319(0, 2));
        addTrait(new class_287());
        addTrait(new class_299(new class_312(), new class_318()));
        addTrait(this._info = new class_310());
        addTrait(param3);
        this.info.factionID.changed.add(this.method_6109);
        this.speed.changed.add(this.method_1336);
        this.shipPattern = param2;
        this.method_2517.targetChanged.add(this.method_6103);
        this.cloaked.changed.add(this.method_1915);
        this.method_1915();
    }

    override public function method_125(param1: class_89): void {
        super.method_125(param1);
    }

    override public function method_166(): void {
        if (this.var_2535) {
            this.var_2535.position.changed.remove(this.method_1382);
            this.var_2535 = null;
        }
        if (this.var_3326) {
            this.var_3326.kill();
        }
        this.method_4410();
        super.method_166();
    }

    private function method_6103(): void {
        if (this.var_2535) {
            this.var_2535.position.changed.remove(this.method_1382);
        }
        this.var_2535 = !!this.method_2517.target ? this.method_2517.target.owner : null;
        if (this.var_2535) {
            this.var_2535.position.changed.add(this.method_1382);
            position.changed.add(this.method_1382);
        } else {
            position.changed.remove(this.method_1382);
        }
        this.method_1382();
    }

    public function set visible(param1: Boolean): void {
        this._visible = param1;
        this.method_1382();
        this.method_1915();
    }

    protected function method_1915(): void {
        if (this.method_6225() == false) {
            if (Boolean(this._visible) && this.cloaked.value == false) {
                if (this.var_627) {
                    addTrait(this.var_627);
                }
                addTrait(this.var_9);
                addTrait(this._info);
                class_50.getInstance().map.effects.method_3771(id);
            } else {
                class_50.getInstance().map.effects.method_6294(id);
                if (this.var_627) {
                    removeTrait(this.var_627);
                }
                removeTrait(this.var_9);
                removeTrait(this._info);
            }
        }
    }

    public function set shipPattern(param1: class_316): void {
        if (this.var_832) {
            this.var_666 = param1;
            return;
        }
        this.var_1475 = param1;
        this.hitArea.clickRadius = this.var_1475.clickRadius;
        this.hitArea.const_649.x = this.var_1475.method_6310();
        this.hitArea.const_649.y = this.var_1475.method_2708();
        if (this.var_1475.clickPriority != -1) {
            this.hitArea.clickPriority = this.var_1475.clickPriority;
        }
        class_287(method_1954(class_287)).explosionTypeID = this.var_1475.method_2672();
        var _loc2_: class_299 = method_1954(class_299) as class_299;
        if (_loc2_.laser) {
            _loc2_.laser.laserClassID = this.var_1475.laserClassID;
        }
        if (_loc2_.rocketLauncher) {
            _loc2_.rocketLauncher.rocketClassId = this.var_1475.rocketClassID;
        }
        if (this.shipPattern.minimapIcon) {
            if (method_1954(class_313)) {
                class_313(method_1954(class_313)).resKey = this.shipPattern.minimapIcon;
            } else {
                addTrait(new class_313(this.shipPattern.minimapIcon));
            }
        }
        this.method_6109();
        this.var_4001.dispatch();
    }

    private function method_6109(): void {
        var _loc2_: * = null;
        while (Boolean(this.var_3676) && Boolean(this.var_3676.length)) {
            removeTrait(this.var_3676.pop());
        }
        var _loc1_: XML = UberAssetsLib.instance.getDescriptor(this.var_1475.name_115 + "_" + this.info.factionID.value, UberAssetsLib.LIB_SHIPS, false) || UberAssetsLib.instance.getDescriptor(this.var_1475.name_115, UberAssetsLib.LIB_SHIPS);
        this.var_3676 = UberAssetsLib.instance.getTraits(this, _loc1_);
        for each(_loc2_ in this.var_3676) {
            if (_loc2_ is class_306) {
                this.method_2862(class_306(_loc2_).decorators);
            }
            addTrait(_loc2_);
        }
        this.var_627 = method_1954(class_306) as class_306;
        this.method_1915();
    }

    protected function method_2862(param1: Vector.<Object>): void {
        param1.push({"id": "ship"});
        param1.push({"id": "drones"});
        if (this.method_6225()) {
            param1.push({"id": "hero"});
        }
    }

    public function get drones(): class_317 {
        return this.var_669;
    }

    public function get hitArea(): class_319 {
        return method_1954(class_319) as class_319;
    }

    public function get method_426(): class_287 {
        return method_1954(class_287) as class_287;
    }

    public function get shipPattern(): class_316 {
        return this.var_1475;
    }

    public function get hp(): class_308 {
        return this.var_4729;
    }

    public function get method_4658(): class_68 {
        return this.var_4001;
    }

    public function get method_6406(): Boolean {
        return this._destination != null;
    }

    public function get method_2517(): class_299 {
        return method_1954(class_299) as class_299;
    }

    public function method_1154(param1: int, param2: int): void {
        if (!this.method_6406 || Math.abs(param1 - 0) > 2 || Math.abs(param2 - 0) > 2) {
            this.rotation.radians = Math.atan2(param2 - 0, param1 - 0) + Math.PI;
        }
    }

    public function goto(param1: int, param2: int, param3: Function = null, param4: Array = null, param5: Number = 0, param6: Number = 0): void {
        this.var_4699 = param3;
        this.var_4937 = param4;
        var _loc7_: Number;
        if ((_loc7_ = Number(param5 || Math.sqrt(Math.pow(param2 - 0, 2) + Math.pow(param1 - 0, 2)) / Number(this.speed.value))) > 0) {
            this._destination = new class_73(param1, param2);
            this.method_1382();
            this.name_39.dispatch();
            if (this.var_3326 == null) {
                this.var_3326 = TweenLite.to(position, _loc7_, {
                    "ease": Linear.easeNone,
                    "onComplete": this.method_3807
                });
            }
            this.var_3326.vars.x = param1;
            this.var_3326.vars.y = param2;
            this.var_3326.duration = _loc7_;
            this.var_3326.delay = param6;
            this.var_3326.invalidate();
            this.var_3326.restart();
        } else {
            this.method_3507();
            this.method_1382();
            if (this.var_4699 != null) {
                this.var_4699.apply(null, this.var_4937);
                this.var_4699 = null;
                this.var_4937 = null;
            }
        }
    }

    public function method_3507(): void {
        var _loc1_: * = this._destination != null;
        if (this.var_3326) {
            this.var_3326.kill();
        }
        this._destination = null;
        if (_loc1_) {
            this.name_21.dispatch();
        }
    }

    public function get destination(): class_73 {
        return this._destination;
    }

    public function method_6225(): Boolean {
        if (id == class_81.userID) {
            return true;
        }
        return false;
    }

    private function method_3807(): void {
        this._destination = null;
        position.changed.dispatch();
        this.name_21.dispatch();
        if (this.var_4699 != null) {
            this.var_4699.apply(null, this.var_4937);
            this.var_4699 = null;
            this.var_4937 = null;
        }
    }

    private function method_1382(): void {
        if (this.var_3203) {
            if (this.method_2517.target != null) {
                this.method_1154(this.method_2517.target.owner.x, this.method_2517.target.owner.y);
            } else if (this._destination) {
                this.method_1154(this._destination.x, this._destination.y);
            }
        }
    }

    private function method_1336(): void {
        if (this._destination) {
            this.goto(this._destination.x, this._destination.y);
        }
    }

    public function set method_3687(param1: Boolean): void {
        this.var_3203 = param1;
    }

    public function get info(): class_310 {
        return this._info;
    }

    private function method_6195(): void {
        this.method_4410();
        this.var_1246 = setTimeout(this.method_4038, 2000 + 5000 * Math.random());
    }

    private function method_4410(): void {
        clearTimeout(this.var_1246);
    }

    private function method_4038(): void {
        clearTimeout(this.var_1246);
        if (this.var_2535 == null) {
            this.rotation.degrees += (Math.random() - 0.5) * 360;
        }
        this.var_1246 = setTimeout(this.method_4038, 2000 + 5000 * Math.random());
    }

    public function get isNPC(): Boolean {
        return this.var_1610;
    }

    public function set isNPC(param1: Boolean): void {
        this.var_1610 = param1;
        if (this.var_1610) {
            this.name_39.add(this.method_4410);
            this.name_21.add(this.method_6195);
            if (!this.method_6406) {
                this.method_6195();
            }
        } else {
            this.method_4410();
            this.name_39.remove(this.method_4410);
            this.name_21.remove(this.method_6195);
        }
    }

    public function get method_6341(): class_306 {
        return this.var_627;
    }

    public function lockPattern(): void {
        this.var_832 = true;
    }

    public function unlockPattern(): void {
        this.var_832 = false;
        if (Boolean(this.var_666) && this.var_1475 != this.var_666) {
            this.shipPattern = this.var_666;
        }
    }
}
}
