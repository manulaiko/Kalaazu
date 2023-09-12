package net.bigpoint.darkorbit.gui {

import com.greensock.TweenLite;
import com.greensock.easing.Strong;

import flash.display.InteractiveObject;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_18;

import package_11.class_39;

import package_182.class_1105;
import package_182.class_1106;
import package_182.class_1107;

import package_26.class_94;

import package_30.class_91;

import package_33.class_93;

import package_39.class_1052;

import package_46.class_131;

import package_9.ResourceManager;

public class class_223 {

    public static const const_2245: Array = [65280, 255, 16711680, 16777215];

    public static const const_1315: int = 45;

    public static const const_890: int = 70;

    public static const BORDER: int = 10;


    private var var_4483: TextField;

    private var var_766: MovieClip;

    private var var_948: MovieClip;

    private var var_2974: MovieClip;

    private var var_1861: MovieClip;

    private var var_1974: MovieClip;

    private var var_4371: Sprite;

    private var var_4866: class_93;

    private var _guiManager: class_58;

    private var var_3791: Array;

    private var var_841: class_131;

    private var var_4411: class_1105;

    public function class_223(param1: class_58) {
        super();
        this._guiManager = param1;
    }

    public function decorate(param1: class_131): void {
        this.method_780();
        this.var_841 = param1;
        this.var_4866 = this.var_841.method_3694(class_93.const_1181);
        param1.method_5820.removeEventListener(MouseEvent.MOUSE_DOWN, param1.method_1755);
        param1.setTitle("title_pet");
        this.method_3216();
        this.method_657();
        this.method_4464();
        this.method_760();
    }

    private function method_760(): void {
        var _loc1_: * = null;
        _loc1_ = new class_1106();
        _loc1_.x = Number(BORDER) * 13;
        _loc1_.y = Number(BORDER) * 13;
        var _loc2_: class_1107 = new class_1107();
        _loc1_.method_2038(_loc2_);
        this.var_841.addChild(_loc1_);
    }

    private function method_4464(): void {
        var _loc1_: class_91 = new class_91(class_91.const_2035);
        this.var_4371 = new Sprite();
        _loc1_.addChild(this.var_4371);
        _loc1_.x = 0;
        _loc1_.y = Number(BORDER) * 13;
        this.var_4866.addElement(_loc1_, class_93.const_2374);
        this.method_905();
    }

    private function method_657(): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc1_: class_91 = new class_91(class_91.const_2029);
        _loc2_ = new class_91(class_91.const_844);
        _loc3_ = new class_91(class_91.const_2514);
        _loc4_ = new class_91(class_91.const_2327);
        _loc5_ = new class_91(class_91.const_643);
        var _loc6_: class_91 = new class_91(class_91.const_989);
        this.var_1974.gotoAndStop(1);
        this.var_766.gotoAndStop(1);
        this.var_948.gotoAndStop(1);
        this.var_2974.gotoAndStop(1);
        this.var_1861.gotoAndStop(1);
        this.var_1974.buttonMode = this.var_1974.useHandCursor = true;
        this.var_766.buttonMode = this.var_766.useHandCursor = true;
        this.var_948.buttonMode = this.var_948.useHandCursor = true;
        this.var_2974.buttonMode = this.var_2974.useHandCursor = true;
        this.var_1861.buttonMode = this.var_1861.useHandCursor = true;
        this.var_1974.visible = false;
        this.var_1861.addEventListener(MouseEvent.CLICK, this.method_905);
        this.var_4411 = new class_1105();
        _loc6_.addChild(this.var_4411);
        this.var_4411.init();
        this.method_3334(this.var_766, "ttip_activate_pet");
        this.method_3334(this.var_1974, "ttip_repair_pet");
        this.method_3334(this.var_948, "ttip_deactivate_pet");
        this.method_3334(this.var_4411, "ttip_pet_gear_combobox");
        this.method_3334(this.var_2974, "label_buy_pet_fuel");
        _loc2_.addChild(this.var_948);
        _loc1_.addChild(this.var_766);
        _loc3_.addChild(this.var_1974);
        _loc4_.addChild(this.var_2974);
        _loc5_.addChild(this.var_1861);
        _loc3_.x = _loc2_.x = _loc1_.x = BORDER;
        _loc4_.x = Number(BORDER) * 7;
        _loc6_.x = Number(BORDER) * 12;
        _loc2_.y = _loc1_.y = _loc3_.y = _loc4_.y = _loc5_.y = _loc6_.y = 100;
        _loc5_.x = this.var_841.method_5820.x + 2;
        _loc5_.y = this.var_841.method_5820.y + 2;
        this.var_4866.addElement(_loc2_, class_93.const_2374);
        this.var_4866.addElement(_loc1_, class_93.const_2374);
        this.var_4866.addElement(_loc4_, class_93.const_2374);
        this.var_4866.addElement(_loc5_, class_93.const_2374);
        this.var_4866.addElement(_loc3_, class_93.const_2374);
        this.var_4866.addElement(_loc6_, class_93.const_2374);
        this.method_3593();
    }

    private function method_3593(): void {
        this.var_1974.addEventListener(MouseEvent.MOUSE_OVER, this.method_4458);
        this.var_1974.addEventListener(MouseEvent.MOUSE_OUT, this.method_2918);
        this.var_2974.addEventListener(MouseEvent.MOUSE_OVER, this.method_4458);
        this.var_2974.addEventListener(MouseEvent.MOUSE_OUT, this.method_2918);
        this.var_766.addEventListener(MouseEvent.MOUSE_OVER, this.method_4458);
        this.var_766.addEventListener(MouseEvent.MOUSE_OUT, this.method_2918);
        this.var_948.addEventListener(MouseEvent.MOUSE_OVER, this.method_4458);
        this.var_948.addEventListener(MouseEvent.MOUSE_OUT, this.method_2918);
    }

    private function method_3216(): void {
        var _loc2_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc1_: class_91 = new class_91(class_91.var_391);
        _loc2_ = new class_91(class_91.var_4782);
        var _loc3_: class_91 = new class_91(class_91.var_532);
        var _loc4_: class_91 = new class_91(class_91.var_4109);
        var _loc5_: class_91 = new class_91(class_91.var_2786);
        var _loc6_: class_91 = new class_91(class_91.const_629);
        var _loc7_: int = 0;
        var _loc8_: int = Number(BORDER) * 5;
        var _loc9_: int = Number(BORDER) * 6.5;
        _loc10_ = new class_1052(const_2245[_loc7_], this.var_3791[_loc7_]);
        _loc11_ = new class_1052(const_2245[++_loc7_], this.var_3791[_loc7_]);
        _loc13_ = new class_1052(const_2245[++_loc7_], this.var_3791[_loc7_]);
        _loc12_ = new class_1052(const_2245[++_loc7_], this.var_3791[_loc7_]);
        _loc1_.y = _loc8_;
        _loc1_.x = _loc9_;
        _loc4_.y = _loc8_ + Number(BORDER) * 2;
        _loc4_.x = _loc9_;
        _loc3_.y = _loc8_;
        _loc3_.x = _loc9_ + Number(BORDER) * 10.5;
        _loc2_.y = _loc8_ + Number(BORDER) * 2;
        _loc2_.x = _loc9_ + Number(BORDER) * 10.5;
        var _loc14_: TextFormat = class_18.const_693;
        this.var_4483 = new TextField();
        this.var_4483.antiAliasType = AntiAliasType.ADVANCED;
        this.var_4483.autoSize = TextFieldAutoSize.LEFT;
        this.var_4483.embedFonts = class_18.var_3911;
        this.var_4483.defaultTextFormat = _loc14_;
        this.var_4483.setTextFormat(_loc14_);
        this.var_4483.x = Number(BORDER) * 10;
        this.var_4483.y = Number(BORDER) * 3;
        this.var_4483.width = 140;
        _loc1_.addChild(_loc10_);
        _loc4_.addChild(_loc11_);
        _loc3_.addChild(_loc12_);
        _loc2_.addChild(_loc13_);
        _loc5_.addChild(this.var_4483);
        var _loc15_: Sprite = new Sprite();
        _loc15_.useHandCursor = true;
        _loc15_.buttonMode = true;
        _loc6_.x = BORDER;
        _loc6_.y = Number(BORDER) * 4;
        _loc6_.addChild(_loc15_);
        this.method_3334(_loc10_, "ttip_hitpoints");
        this.method_3334(_loc11_, "ttip_shield");
        this.method_3334(_loc13_, "ttip_experience");
        this.method_3334(_loc12_, "ttip_fuel");
        this.method_3334(_loc15_, "title_pet");
        this.var_4866.addElement(_loc6_, class_93.const_2374);
        this.var_4866.addElement(_loc5_, class_93.const_2374);
        this.var_4866.addElement(_loc1_, class_93.const_2374);
        this.var_4866.addElement(_loc2_, class_93.const_2374);
        this.var_4866.addElement(_loc3_, class_93.const_2374);
        this.var_4866.addElement(_loc4_, class_93.const_2374);
    }

    private function method_905(param1: MouseEvent = null): void {
        this.var_1861.removeEventListener(MouseEvent.CLICK, this.method_905);
        this.method_128(this.var_1861);
        this.method_5149();
    }

    private function method_4458(param1: MouseEvent): void {
        var _loc2_: MovieClip = param1.target as MovieClip;
        _loc2_.gotoAndStop(2);
    }

    private function method_2918(param1: MouseEvent): void {
        var _loc2_: MovieClip = param1.target as MovieClip;
        _loc2_.gotoAndStop(1);
    }

    private function method_5149(): void {
        var _loc1_: int = 0;
        if (this.method_1496()) {
            _loc1_ = -Number(const_1315);
        } else {
            _loc1_ = int(const_1315);
            this.method_4651(true);
        }
        TweenLite.to(this.var_841.method_5820, 1, {
            "y": this.var_841.method_5820.y + _loc1_,
            "ease": Strong.easeInOut,
            "onUpdate": this.method_1884,
            "onComplete": this.method_2170
        });
    }

    private function method_1884(): void {
        this.var_841.method_5152(this.var_841.method_5820.y + 2);
        this.var_4866.method_89(class_91.const_643).y = this.var_841.method_5820.y + 2;
    }

    private function method_2170(): void {
        this.var_1861.addEventListener(MouseEvent.CLICK, this.method_905);
        this.method_4651(!this.method_1496());
    }

    private function method_4651(param1: Boolean): void {
        this.var_4371.visible = param1;
    }

    private function method_128(param1: MovieClip): void {
        var _loc2_: int = 1;
        if (param1.currentFrame == _loc2_) {
            _loc2_ = 2;
        }
        param1.gotoAndStop(_loc2_);
    }

    private function method_780(): void {
        var _loc1_: class_39 = class_39(ResourceManager.name_15.getFinisher("window"));
        _loc1_ = class_39(ResourceManager.name_15.getFinisher("ui"));
        this.var_766 = _loc1_.getEmbeddedMovieClip("petPlayButton");
        this.var_948 = _loc1_.getEmbeddedMovieClip("petStopButton");
        this.var_2974 = _loc1_.getEmbeddedMovieClip("petFuelButton");
        this.var_1861 = _loc1_.getEmbeddedMovieClip("expandButton");
        this.var_1974 = _loc1_.getEmbeddedMovieClip("petRepairButton");
        this.var_3791 = [_loc1_.getEmbeddedBitmap("hp_small.png"), _loc1_.getEmbeddedBitmap("shild_small.png"), _loc1_.getEmbeddedBitmap("xp_small.png"), _loc1_.getEmbeddedBitmap("fuel_small.png")];
    }

    private function method_3334(param1: InteractiveObject, param2: String): void {
        var _loc3_: String = class_88.getItem(param2);
        if (param1 is class_1052) {
            (param1 as class_1052).var_2859 = _loc3_;
            (param1 as class_1052).var_1925 = class_94.getInstance().method_1211(param1, _loc3_);
        } else {
            class_94.getInstance().method_1211(param1, _loc3_);
        }
    }

    private function method_1496(): Boolean {
        return this.var_1861.currentFrame == 1;
    }
}
}
