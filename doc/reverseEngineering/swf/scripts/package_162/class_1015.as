package package_162 {

import com.greensock.TweenMax;

import flash.events.MouseEvent;

import mx.collections.ArrayList;
import mx.core.IUIComponent;
import mx.events.DragEvent;
import mx.events.PropertyChangeEvent;
import mx.managers.DragManager;

import net.bigpoint.as3toolbox.bplocale.class_88;

import package_150.class_988;

import package_155.class_998;
import package_155.class_999;

import package_163.class_1520;

import spark.components.Label;
import spark.components.SkinnableContainer;

public class class_1015 extends SkinnableContainer {


    private var var_359: Label;

    private var var_3503: class_1535;

    private var var_3198: class_1535;

    private var var_2572: class_1535;

    private var var_1834: class_1535;

    private var var_689: class_1535;

    private var var_3239: class_1535;

    private var var_2268: class_1535;

    private var var_4978: class_1535;

    private var var_4530: class_1535;

    protected var var_1320: int = 27;

    protected var var_691: int = 78;

    protected var var_2561: int = 67;

    protected var var_1080: int = 30;

    protected var var_2421: int = 0;

    protected var var_2291: int = 25;

    protected var var_4915: int = 50;

    protected var var_2456: int = 75;

    protected var var_248: int = 100;

    private var var_4792: ArrayList;

    private var var_3660: String = "AsteroidState";

    public function class_1015() {
        this.var_4792 = new ArrayList();
        super();
    }

    protected function creationCompleteHandler(): void {
        this.method_4375();
        this.titleLabel.text = class_88.getItem("label_bswin_mod_installation");
    }

    protected function method_1806(param1: DragEvent): void {
        var _loc2_: class_999 = this.method_5144(param1);
        _loc2_.hovered = true;
        DragManager.acceptDragDrop(param1.currentTarget as IUIComponent);
    }

    protected function method_3492(param1: DragEvent): void {
        var _loc2_: class_999 = this.method_5144(param1);
        _loc2_.hovered = false;
        DragManager.acceptDragDrop(param1.currentTarget as IUIComponent);
    }

    protected function method_6440(param1: DragEvent): void {
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc5_: * = null;
        var _loc2_: class_1520 = param1.dragSource.dataForFormat("moduleData") as class_1520;
        if (_loc2_) {
            if (param1.currentTarget is class_1535) {
                _loc3_ = int(class_1535(param1.currentTarget).slotId);
                _loc4_ = int(class_1535(param1.currentTarget).moduleItem.moduleType);
                class_1535(param1.currentTarget).moduleItem.hovered = false;
            } else if (param1.currentTarget is class_999) {
                _loc3_ = int(class_999(param1.currentTarget).slotId);
                _loc4_ = int(class_999(param1.currentTarget).moduleType);
                class_999(param1.currentTarget).hovered = false;
            }
            (_loc5_ = new class_988(class_988.EQUIP_MODULE)).itemId = _loc2_.itemId;
            _loc5_.slotId = _loc3_;
            _loc5_.var_1959 = _loc4_ > 1;
            dispatchEvent(_loc5_);
        }
    }

    protected function method_3739(param1: MouseEvent): void {
        var _loc3_: * = null;
        var _loc2_: class_999 = this.method_5144(param1);
        if (_loc2_ && _loc2_.moduleVO && _loc2_.moduleVO && Boolean(_loc2_.moduleVO.type)) {
            if (!_loc2_.method_883) {
                _loc3_ = new class_988(class_988.BATTLE_STATION_MODULE_CLICKED);
                _loc3_.itemId = _loc2_.itemId;
                _loc3_.slotId = _loc2_.slotId;
                _loc3_.moduleType = _loc2_.moduleType;
                _loc3_.moduleItem = _loc2_;
                dispatchEvent(_loc3_);
            }
        }
    }

    protected function method_6007(param1: MouseEvent): void {
        var _loc2_: class_999 = this.method_5144(param1);
        if (_loc2_ && _loc2_.moduleVO && this.var_3660 != class_998.INSTALLING_STATE) {
            if (_loc2_.method_883 == false && _loc2_.moduleVO.type != 0) {
                _loc2_.method_3477();
                TweenMax.to(_loc2_.repairIcon, 0.3, {"autoAlpha": int(param1.type == MouseEvent.ROLL_OVER)});
            }
        }
    }

    private function method_5144(param1: MouseEvent): class_999 {
        if (param1.currentTarget is class_1535) {
            return class_1535(param1.currentTarget).moduleItem;
        }
        if (param1.currentTarget is class_999) {
            return class_999(param1.currentTarget);
        }
        return null;
    }

    private function method_4375(): void {
        this.var_4792.addItemAt(this.hub, this.hub.slotId);
        this.var_4792.addItemAt(this.hub, this.hub.method_5422);
        this.var_4792.addItemAt(this.rightInner1, this.rightInner1.slotId);
        this.var_4792.addItemAt(this.rightOuter1, this.rightOuter1.slotId);
        this.var_4792.addItemAt(this.rightOuter2, this.rightOuter2.slotId);
        this.var_4792.addItemAt(this.rightInner2, this.rightInner2.slotId);
        this.var_4792.addItemAt(this.leftInner2, this.leftInner2.slotId);
        this.var_4792.addItemAt(this.leftOuter2, this.leftOuter2.slotId);
        this.var_4792.addItemAt(this.leftOuter1, this.leftOuter1.slotId);
        this.var_4792.addItemAt(this.leftInner1, this.leftInner1.slotId);
    }

    public function method_2982(param1: String, param2: Vector.<class_1520>): void {
        this.method_2577(param1, param2);
    }

    private function method_2577(param1: String, param2: Vector.<class_1520>): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        this.var_3660 = param1;
        if (!this.var_4792.length) {
            this.method_4375();
        }
        var _loc3_: int = 0;
        while (_loc3_ < param2.length) {
            _loc4_ = this.var_4792.getItemAt(_loc3_) as class_1535;
            _loc5_ = param2[_loc3_];
            _loc4_.var_1393.method_3040 = _loc4_.moduleItem.method_3040 = true;
            _loc4_.moduleItem.state = _loc4_.var_1393.state = this.var_3660;
            _loc4_.method_5033(this.var_3660);
            if (_loc3_ == 1) {
                _loc4_.method_4858(_loc5_.type, _loc5_.itemId);
                _loc4_.var_1393.itemId = _loc5_.itemId;
                _loc4_.var_1393.moduleVO = _loc5_;
                if (_loc5_.installationSecondsLeft > 0) {
                    _loc4_.var_1393.method_4592(_loc5_.installationSecondsLeft, _loc5_.installationSecondsTotal);
                    _loc4_.var_1393.method_743 = true;
                } else {
                    _loc4_.var_1393.method_743 = false;
                }
            } else {
                _loc4_.moduleItem.itemId = _loc5_.itemId;
                _loc4_.moduleItem.moduleVO = _loc5_;
                if (_loc5_.installationSecondsLeft > 0) {
                    _loc4_.moduleItem.method_4592(_loc5_.installationSecondsLeft, _loc5_.installationSecondsTotal);
                    _loc4_.moduleItem.method_743 = true;
                } else {
                    _loc4_.moduleItem.method_743 = false;
                }
            }
            if (_loc5_.type == class_1520.HULL || _loc5_.type == class_1520.DEFLECTOR) {
                if (_loc6_ = this.method_3643(class_1520.HULL, param2)) {
                    if (_loc4_.moduleItem.moduleVO) {
                        _loc4_.moduleItem.moduleVO.emergencyRepairSecondsLeft = _loc6_.emergencyRepairSecondsLeft;
                    }
                    if (_loc4_.var_1393.moduleVO) {
                        _loc4_.var_1393.moduleVO.emergencyRepairSecondsLeft = _loc6_.emergencyRepairSecondsLeft;
                    }
                }
            }
            callLater(_loc4_.var_1393.initIcon);
            callLater(_loc4_.moduleItem.initIcon);
            if (_loc5_.type != class_1520.DEFLECTOR) {
                _loc4_.method_4055(_loc5_.currentHitpoints, _loc5_.maxHitpoints, _loc5_.currentShield, _loc5_.maxShield);
            }
            _loc3_++;
        }
    }

    private function method_3643(param1: int, param2: Vector.<class_1520>): class_1520 {
        var _loc3_: * = null;
        for each(_loc3_ in param2) {
            if (_loc3_.type == param1) {
                return _loc3_;
            }
        }
        return null;
    }

    public function method_3455(param1: class_1520): void {
        var _loc2_: * = null;
        try {
            _loc2_ = this.var_4792.getItemAt(param1.slotOccupying) as class_1535;
        } catch (e: Error) {
        }
        if (Boolean(_loc2_) && Boolean(_loc2_.moduleItem)) {
            _loc2_.method_4055(param1.currentHitpoints, param1.maxHitpoints, param1.currentShield, param1.maxShield);
            if (param1.emergencyRepairSecondsLeft > 0) {
                _loc2_.moduleItem.method_3286();
                if (param1.slotOccupying == 0 || param1.slotOccupying == 1) {
                    _loc2_.var_1393.method_3286();
                }
            } else {
                _loc2_.moduleItem.method_5881();
                if (_loc2_.var_1393) {
                    _loc2_.var_1393.method_5881();
                }
            }
            if (param1.type == _loc2_.moduleItem.moduleVO.type) {
                _loc2_.moduleItem.moduleVO.method_1738(param1.installationSecondsLeft);
            }
            _loc2_.moduleItem.moduleVO.update(param1.emergencyRepairSecondsLeft, param1.emergencyRepairSecondsTotal, param1.currentHitpoints, param1.currentShield);
            if (Boolean(_loc2_.var_1393) && Boolean(_loc2_.var_1393.moduleVO)) {
                _loc2_.var_1393.moduleVO.update(param1.emergencyRepairSecondsLeft, param1.emergencyRepairSecondsTotal, param1.currentHitpoints, param1.currentShield);
                if (param1.type == _loc2_.var_1393.moduleVO.type) {
                    _loc2_.var_1393.moduleVO.method_1738(param1.installationSecondsLeft);
                }
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get titleLabel(): Label {
        return this.var_359;
    }

    public function set titleLabel(param1: Label): void {
        var _loc2_: Object = this.var_359;
        if (_loc2_ !== param1) {
            this.var_359 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleLabel", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get leftInner1(): class_1535 {
        return this.var_3503;
    }

    public function set leftInner1(param1: class_1535): void {
        var _loc2_: Object = this.var_3503;
        if (_loc2_ !== param1) {
            this.var_3503 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftInner1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get rightInner1(): class_1535 {
        return this.var_3198;
    }

    public function set rightInner1(param1: class_1535): void {
        var _loc2_: Object = this.var_3198;
        if (_loc2_ !== param1) {
            this.var_3198 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rightInner1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get leftOuter1(): class_1535 {
        return this.var_2572;
    }

    public function set leftOuter1(param1: class_1535): void {
        var _loc2_: Object = this.var_2572;
        if (_loc2_ !== param1) {
            this.var_2572 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftOuter1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get rightOuter1(): class_1535 {
        return this.var_1834;
    }

    public function set rightOuter1(param1: class_1535): void {
        var _loc2_: Object = this.var_1834;
        if (_loc2_ !== param1) {
            this.var_1834 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rightOuter1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get hub(): class_1535 {
        return this.var_689;
    }

    public function set hub(param1: class_1535): void {
        var _loc2_: Object = this.var_689;
        if (_loc2_ !== param1) {
            this.var_689 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hub", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get leftOuter2(): class_1535 {
        return this.var_3239;
    }

    public function set leftOuter2(param1: class_1535): void {
        var _loc2_: Object = this.var_3239;
        if (_loc2_ !== param1) {
            this.var_3239 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftOuter2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get rightOuter2(): class_1535 {
        return this.var_2268;
    }

    public function set rightOuter2(param1: class_1535): void {
        var _loc2_: Object = this.var_2268;
        if (_loc2_ !== param1) {
            this.var_2268 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rightOuter2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get leftInner2(): class_1535 {
        return this.var_4978;
    }

    public function set leftInner2(param1: class_1535): void {
        var _loc2_: Object = this.var_4978;
        if (_loc2_ !== param1) {
            this.var_4978 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftInner2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get rightInner2(): class_1535 {
        return this.var_4530;
    }

    public function set rightInner2(param1: class_1535): void {
        var _loc2_: Object = this.var_4530;
        if (_loc2_ !== param1) {
            this.var_4530 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rightInner2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    protected function get xOffsetInnerModules(): int {
        return this.var_1320;
    }

    protected function set xOffsetInnerModules(param1: int): void {
        var _loc2_: Object = this.var_1320;
        if (_loc2_ !== param1) {
            this.var_1320 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xOffsetInnerModules", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    protected function get xOffsetOuterModules(): int {
        return this.var_691;
    }

    protected function set xOffsetOuterModules(param1: int): void {
        var _loc2_: Object = this.var_691;
        if (_loc2_ !== param1) {
            this.var_691 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "xOffsetOuterModules", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    protected function get yOffsetInnerModules(): int {
        return this.var_2561;
    }

    protected function set yOffsetInnerModules(param1: int): void {
        var _loc2_: Object = this.var_2561;
        if (_loc2_ !== param1) {
            this.var_2561 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yOffsetInnerModules", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    protected function get yOffsetOuterModules(): int {
        return this.var_1080;
    }

    protected function set yOffsetOuterModules(param1: int): void {
        var _loc2_: Object = this.var_1080;
        if (_loc2_ !== param1) {
            this.var_1080 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yOffsetOuterModules", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    protected function get yOffsetFirstRow(): int {
        return this.var_2421;
    }

    protected function set yOffsetFirstRow(param1: int): void {
        var _loc2_: Object = this.var_2421;
        if (_loc2_ !== param1) {
            this.var_2421 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yOffsetFirstRow", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    protected function get yOffsetSecondRow(): int {
        return this.var_2291;
    }

    protected function set yOffsetSecondRow(param1: int): void {
        var _loc2_: Object = this.var_2291;
        if (_loc2_ !== param1) {
            this.var_2291 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yOffsetSecondRow", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    protected function get yOffsetThirdRow(): int {
        return this.var_4915;
    }

    protected function set yOffsetThirdRow(param1: int): void {
        var _loc2_: Object = this.var_4915;
        if (_loc2_ !== param1) {
            this.var_4915 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yOffsetThirdRow", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    protected function get yOffsetFourthRow(): int {
        return this.var_2456;
    }

    protected function set yOffsetFourthRow(param1: int): void {
        var _loc2_: Object = this.var_2456;
        if (_loc2_ !== param1) {
            this.var_2456 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yOffsetFourthRow", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    protected function get yOffsetFifthRow(): int {
        return this.var_248;
    }

    protected function set yOffsetFifthRow(param1: int): void {
        var _loc2_: Object = this.var_248;
        if (_loc2_ !== param1) {
            this.var_248 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "yOffsetFifthRow", _loc2_, param1));
            }
        }
    }
}
}
