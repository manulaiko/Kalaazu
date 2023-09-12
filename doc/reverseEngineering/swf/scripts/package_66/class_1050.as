package package_66 {

import com.greensock.TweenLite;
import com.greensock.easing.Linear;

import flash.display.Bitmap;
import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;

import package_11.class_39;

import package_26.class_94;

import package_30.class_185;
import package_30.class_218;
import package_30.class_219;
import package_30.class_91;

import package_33.class_93;

import package_38.class_163;
import package_38.class_906;

import package_46.class_131;

import package_76.class_215;

import package_9.ResourceManager;
import package_9.class_50;

public class class_1050 extends class_1045 {


    private var var_2214: String;

    private var var_758: int = 0;

    private var var_3860: String;

    private var tooltipKey: String;

    public function class_1050(param1: class_175, param2: int, param3: String, param4: String, param5: String, param6: String = null) {
        super(param1, param2, param3, param4);
        this.var_2214 = param5;
        this.tooltipKey = param6;
        this.init();
        this.buttonMode = true;
    }

    public function method_420(): class_1049 {
        var _loc1_: Bitmap = finisher.getEmbeddedBitmap(this.var_2214);
        return new class_1049(this.type, _loc1_, this.tooltipKey);
    }

    public function method_2920(): void {
        method_451.setText(this.var_758.toString());
    }

    public function method_4016(param1: int): void {
        this.var_758 = param1;
    }

    private function init(): void {
        var _loc1_: * = null;
        _background = finisher.getEmbeddedBitmap("sourceSlot");
        this.addChild(_background);
        _loc1_ = finisher.getEmbeddedBitmap(resKey);
        _loc1_.x = 0 - _loc1_.width / 2;
        _loc1_.y = 0 - _loc1_.height / 2;
        this.addChild(_loc1_);
        this.addEventListener(MouseEvent.MOUSE_DOWN, this.method_793);
        method_3371();
        this.method_5928(0);
        if (this.tooltipKey != null) {
            class_94.getInstance().method_1211(this, class_88.getItem(this.tooltipKey));
        }
    }

    private function method_793(param1: MouseEvent): void {
        var _loc6_: * = null;
        if (this.var_758 == 0) {
            return;
        }
        var _loc2_: class_93 = var_2016.guiManager.method_468(GuiConstants.REFINEMENT_WINDOW).method_3694(class_93.const_922);
        var _loc3_: Array = _loc2_.method_1864();
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_.length) {
            if (_loc3_[_loc4_] is class_1046) {
                _loc6_ = _loc3_[_loc4_];
                if (this.isValid(_loc6_)) {
                    _loc6_.highlight();
                }
            }
            _loc4_++;
        }
        var _loc5_: MovieClip;
        (_loc5_ = this.method_6227()).startDrag();
    }

    private function method_4181(param1: MouseEvent): void {
        var _loc8_: * = null;
        var _loc2_: MovieClip = param1.target as MovieClip;
        var _loc3_: * = null;
        var _loc4_: class_93;
        var _loc5_: Array = (_loc4_ = var_2016.guiManager.method_468(GuiConstants.REFINEMENT_WINDOW).method_3694(class_93.const_922)).method_1864();
        var _loc6_: int = 0;
        while (_loc6_ < _loc5_.length) {
            if (_loc5_[_loc6_] is class_1046) {
                (_loc8_ = _loc5_[_loc6_]).removeHighlight();
                if (_loc4_.mouseX > _loc8_.x && _loc4_.mouseX < _loc8_.x + _loc8_.width && _loc4_.mouseY > _loc8_.y && _loc4_.mouseY < _loc8_.y + _loc8_.height) {
                    _loc3_ = _loc8_;
                }
            }
            _loc6_++;
        }
        if (!this.isValid(_loc3_)) {
            this.method_922(_loc2_);
            return;
        }
        _loc2_.removeEventListener(MouseEvent.MOUSE_UP, this.method_4181);
        var _loc7_: class_131 = var_2016.guiManager.method_468(GuiConstants.REFINEMENT_WINDOW);
        class_215.removeDisplayObject(_loc2_);
        this.var_3860 = _loc3_.identifier;
        if (_loc3_.method_3483 == null) {
            this.method_627();
        } else if (_loc3_.method_3483.id == type) {
            this.method_627();
        } else {
            this.method_2509();
        }
    }

    private function isValid(param1: class_1046): Boolean {
        return !(param1 == null || this.type == class_163.const_763 && param1.identifier == "SHIELD" || this.type == class_163.const_763 && param1.identifier == "DRIVING" || this.type == class_163.const_2322 && param1.identifier == "LASER" || this.type == class_163.const_2322 && param1.identifier == "ROCKET" || this.type == class_163.SEPROM && param1.identifier == "DRIVING");
    }

    private function method_627(): void {
        var _loc1_: class_131 = method_6320.guiManager.createWindow(GuiConstants.REFINEMENT_COUNT_WINDOW, class_50.getInstance().method_6313()) as class_131;
        var _loc2_: class_93 = new class_93(method_6320.guiManager, class_93.const_1852);
        _loc2_.x = 20;
        _loc2_.y = 35;
        var _loc3_: class_219 = new class_219(340, 20, new TextFormat(class_18.const_693.font, class_18.const_693.size, 16777215), class_88.getItem("lab_count"), TextFormatAlign.LEFT);
        _loc2_.addElement(_loc3_);
        var _loc4_: class_1048;
        (_loc4_ = new class_1048(method_6320.guiManager)).method_4625(this.var_758);
        _loc2_.addElement(_loc4_, class_93.const_3298);
        _loc2_.y = 30;
        var _loc5_: class_39 = class_39(ResourceManager.name_15.getFinisher("ui"));
        var _loc6_: class_218;
        (_loc6_ = new class_218(class_185.const_2597, class_88.getItem("lab_update"), _loc5_.getEmbeddedMovieClip("button1"))).addEventListener(MouseEvent.CLICK, this.method_2795);
        _loc2_.addElement(_loc6_);
        _loc6_.y = 60;
        var _loc7_: class_218 = new class_218(class_185.const_2551, class_88.getItem("lab_cancel"), _loc5_.getEmbeddedMovieClip("button1"));
        _loc2_.addElement(_loc7_, class_93.const_2568);
        _loc7_.y = 60;
        _loc7_.addEventListener(MouseEvent.CLICK, this.method_5977);
        _loc1_.method_1655(_loc2_);
        _loc1_.method_1321(true);
    }

    private function method_2795(param1: MouseEvent): void {
        var _loc2_: class_131 = method_6320.guiManager.method_468(GuiConstants.REFINEMENT_COUNT_WINDOW);
        var _loc3_: class_1048 = class_1048(_loc2_.method_3694(class_93.const_1852).method_89(class_91.const_1723));
        var _loc4_: int = parseInt(_loc3_.name_54.selectedLabel);
        var _loc5_: class_906;
        (_loc5_ = new class_906()).var_200.var_3265 = class_175.method_2527(this.var_3860);
        _loc5_.var_428.var_4809.var_2008 = type;
        _loc5_.var_428.count = _loc4_;
        var_2016.guiManager.method_6185().method_6154().sendRequest(_loc5_);
        this.method_902();
    }

    private function method_5977(param1: MouseEvent): void {
        this.method_902();
    }

    private function method_902(): void {
        var _loc4_: * = null;
        var _loc1_: class_131 = method_6320.guiManager.method_468(GuiConstants.REFINEMENT_COUNT_WINDOW);
        var _loc2_: Array = _loc1_.method_3694(class_93.const_1852).method_632(class_91.const_2623);
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_.length) {
            if ((_loc4_ = _loc2_[_loc3_]).getType() == class_185.const_2551) {
                _loc4_.removeEventListener(MouseEvent.CLICK, this.method_5977);
            }
            if (_loc4_.getType() == class_185.const_2597) {
                _loc4_.removeEventListener(MouseEvent.CLICK, this.method_2795);
            }
            _loc3_++;
        }
        method_6320.guiManager.closeWindow(_loc1_, false);
        method_6320.guiManager.method_1705(_loc1_.id);
    }

    private function method_2509(): void {
        var _loc1_: class_131 = method_6320.guiManager.createWindow(GuiConstants.REFINEMENT_UPDATE_WINDOW) as class_131;
        var _loc2_: class_93 = new class_93(method_6320.guiManager, class_93.const_1852);
        _loc2_.x = 20;
        _loc2_.y = 35;
        var _loc3_: class_219 = new class_219(340, 50, new TextFormat(class_18.const_693.font, class_18.const_693.size, 16777215), class_88.getItem("lab_alert"), TextFormatAlign.LEFT);
        _loc2_.addElement(_loc3_);
        var _loc4_: class_39 = class_39(ResourceManager.name_15.getFinisher("ui"));
        var _loc5_: class_218;
        (_loc5_ = new class_218(class_185.const_2216, class_88.getItem("lab_update"), _loc4_.getEmbeddedMovieClip("button1"))).y = _loc2_.y + 10;
        _loc5_.addEventListener(MouseEvent.CLICK, this.method_1291);
        _loc2_.addElement(_loc5_, class_93.const_3298);
        var _loc6_: class_218;
        (_loc6_ = new class_218(class_185.const_2551, class_88.getItem("lab_cancel"), _loc4_.getEmbeddedMovieClip("button1"))).y = _loc2_.y + 10;
        _loc2_.addElement(_loc6_, class_93.const_2568);
        _loc6_.addEventListener(MouseEvent.CLICK, this.method_542);
        _loc1_.method_1655(_loc2_);
        _loc1_.method_1321(true);
    }

    private function method_1291(param1: MouseEvent): void {
        this.method_3602();
        this.method_627();
    }

    private function method_542(param1: MouseEvent): void {
        this.method_3602();
    }

    private function method_3602(): void {
        var _loc4_: * = null;
        var _loc1_: class_131 = method_6320.guiManager.method_468(GuiConstants.REFINEMENT_UPDATE_WINDOW);
        var _loc2_: Array = _loc1_.method_3694(class_93.const_1852).method_632(class_91.const_2623);
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_.length) {
            if ((_loc4_ = _loc2_[_loc3_]).getType() == class_185.const_2216) {
            }
            if (_loc4_.getType() == class_185.const_2551) {
                _loc4_.removeEventListener(MouseEvent.CLICK, this.method_542);
            }
            _loc3_++;
        }
        method_6320.guiManager.closeWindow(_loc1_);
    }

    private function method_922(param1: MovieClip): void {
        var _loc2_: class_93 = var_2016.guiManager.method_468(GuiConstants.REFINEMENT_WINDOW).method_3694(class_93.const_1597);
        var _loc3_: class_131 = var_2016.guiManager.method_468(GuiConstants.REFINEMENT_WINDOW);
        var _loc4_: int = _loc3_.x + _loc2_.x + this.x + Number(this.width) / 2;
        var _loc5_: int = _loc3_.y + _loc2_.y + this.y + Number(this.height) / 2;
        TweenLite.to(param1, 0.25, {
            "alpha": 0,
            "x": _loc4_,
            "y": _loc5_,
            "onComplete": this.method_3239,
            "onCompleteParams": [param1]
        });
    }

    public function method_6227(param1: Boolean = true): MovieClip {
        var _loc2_: class_131 = var_2016.guiManager.method_468(GuiConstants.REFINEMENT_WINDOW);
        var _loc3_: Bitmap = finisher.getEmbeddedBitmap(this.var_2214);
        var _loc4_: MovieClip;
        (_loc4_ = new MovieClip()).addChild(_loc3_);
        _loc4_.addEventListener(MouseEvent.MOUSE_UP, this.method_4181);
        _loc4_.x = Number(_loc2_.parent.mouseX) - _loc4_.width / 2;
        _loc4_.y = Number(_loc2_.parent.mouseY) - _loc4_.height / 2;
        _loc2_.parent.addChild(_loc4_);
        if (param1) {
            _loc4_.alpha = 0;
            TweenLite.to(_loc4_, 0.25, {
                "ease": Linear.easeNone,
                "alpha": 1
            });
        }
        return _loc4_;
    }

    private function method_3239(param1: MovieClip): void {
        param1.removeEventListener(MouseEvent.MOUSE_UP, this.method_4181);
        class_215.removeDisplayObject(param1);
    }

    public function method_5928(param1: int): void {
        method_451.setText(param1.toString());
    }
}
}
