package package_119 {

import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.gui.class_58;
import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
import net.bigpoint.darkorbit.mvc.common.utils.ParserUtility;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.net.class_74;

import package_17.class_62;

import package_30.class_1192;
import package_30.class_1193;

import package_33.class_93;

import package_46.class_131;

import package_9.class_50;

public class class_327 {


    private var guiManager: class_58;

    private var var_1160: Object;

    public function class_327() {
        this.var_1160 = {};
        super();
        this.guiManager = class_58.instance;
    }

    public function method_105(param1: Array): void {
        var _loc2_: Boolean = false;
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        var _loc7_: Number = NaN;
        var _loc8_: * = null;
        var _loc9_: int = 0;
        var _loc10_: int = 0;
        var _loc11_: int = 0;
        switch (param1[3]) {
            case class_74.const_492:
                _loc2_ = ParserUtility.parseBooleanFromInt(param1[4]);
                if (_loc2_) {
                    this.method_4515();
                    break;
                }
                this.method_5247();
                this.cleanup();
                break;
            case class_74.const_1869:
                _loc3_ = int(param1[4]);
                _loc4_ = int(param1[5]);
                this.method_2665(_loc3_, _loc4_);
                break;
            case class_74.const_953:
                _loc5_ = Number(param1[4]);
                _loc6_ = Number(param1[5]);
                _loc7_ = Number(param1[6]);
                (_loc8_ = []).push(_loc5_);
                _loc8_.push(_loc6_);
                _loc8_.push(_loc7_);
                this.method_1301(_loc8_);
                break;
            case class_74.const_496:
                _loc3_ = int(param1[4]);
                _loc9_ = int(param1[5]);
                _loc10_ = int(param1[6]);
                this.method_5394(_loc3_, _loc9_, _loc10_);
                break;
            case class_74.const_1570:
                _loc11_ = parseInt(param1[4]);
                _loc3_ = int(param1[5]);
                this.method_1392(_loc11_, _loc3_);
                break;
            case class_74.const_3285:
                _loc11_ = int(param1[4]);
                this.method_3603(_loc11_);
        }
    }

    public function method_3603(param1: int): void {
        this.map.method_2390(param1, class_1191);
    }

    private function get map(): class_90 {
        return class_50.getInstance().map;
    }

    public function cleanup(): void {
        this.var_1160 = {};
    }

    public function method_5394(param1: int, param2: int, param3: int): void {
        var _loc4_: int = 0;
        if (this.var_1160[param1] == null) {
            _loc4_ = 0;
            this.map.method_4903(new class_1190(_loc4_, param1, param2, param3));
            this.var_1160[param1] = _loc4_;
        }
    }

    public function method_4515(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        class_62.getInstance().sendNotification(AssetNotifications.PRELOAD_LIST, "ctb", AssetNotifications.TYPE_PRELOAD_LIST_TYPE_PATTERN_KEY);
        if (this.guiManager.method_468(GuiConstants.CTB_WINDOW) == null) {
            _loc1_ = this.guiManager.createWindow(GuiConstants.CTB_WINDOW) as class_131;
            _loc2_ = new class_93(this.guiManager, class_93.const_233);
            _loc3_ = 0;
            _loc4_ = 1;
            _loc2_.x = 12;
            _loc2_.y = 35;
            _loc5_ = 1;
            while (_loc5_ < 4) {
                (_loc6_ = new class_1192(this.guiManager, _loc5_)).method_197(-4);
                _loc6_.method_5697(32);
                _loc6_.method_3125(0);
                if (_loc5_ == class_81.factionID) {
                    _loc6_.order = 0;
                } else {
                    _loc6_.order = _loc4_++;
                }
                _loc2_.addElement(_loc6_, class_93.const_2374);
                _loc5_++;
            }
            (_loc7_ = _loc2_.method_1864()).sortOn("order", Array.NUMERIC);
            _loc5_ = 0;
            while (_loc5_ < _loc7_.length) {
                (_loc6_ = _loc7_[_loc5_]).x = _loc3_;
                _loc3_ += _loc6_.method_5979().width;
                _loc5_++;
            }
            (_loc8_ = new class_1193()).x = -2;
            _loc8_.y = -3;
            _loc2_.addElement(_loc8_, class_93.const_2374);
            _loc1_.method_1655(_loc2_);
        }
    }

    public function method_5247(): void {
        var _loc1_: class_131 = !!this.guiManager ? this.guiManager.method_468(GuiConstants.CTB_WINDOW) : null;
        if (_loc1_ != null) {
            this.guiManager.closeWindow(_loc1_);
        }
    }

    public function method_2665(param1: int, param2: int): void {
        var _loc4_: * = null;
        var _loc5_: int = 0;
        var _loc6_: int = 0;
        var _loc7_: * = null;
        var _loc3_: class_131 = !!this.guiManager ? this.guiManager.method_468(GuiConstants.CTB_WINDOW) : null;
        if (_loc3_ != null) {
            _loc5_ = int((_loc4_ = param1.toString().split(""))[1]);
            _loc6_ = int(_loc4_[2]);
            if ((_loc7_ = class_1192(this.guiManager.method_785(GuiConstants.CTB_WINDOW, class_93.const_233, _loc5_))) != null) {
                _loc7_.method_5781(param1, _loc6_, param2);
            }
        }
    }

    public function method_1301(param1: Array): void {
        var _loc3_: int = 0;
        var _loc4_: * = null;
        var _loc2_: class_131 = !!this.guiManager ? this.guiManager.method_468(GuiConstants.CTB_WINDOW) : null;
        if (_loc2_ != null) {
            _loc3_ = 0;
            while (_loc3_ < param1.length) {
                if ((_loc4_ = class_1192(this.guiManager.method_785(GuiConstants.CTB_WINDOW, class_93.const_233, _loc3_ + 1))) != null) {
                    _loc4_.method_3125(param1[_loc3_]);
                }
                _loc3_++;
            }
        }
    }

    public function method_1392(param1: int, param2: int): void {
        var _loc3_: class_1191 = this.map.method_5806(param1, class_1191) as class_1191;
        if (_loc3_ == null) {
            this.map.method_2677(param1, new class_1191(param2));
        } else {
            _loc3_.const_523.value = param2;
        }
    }
}
}
