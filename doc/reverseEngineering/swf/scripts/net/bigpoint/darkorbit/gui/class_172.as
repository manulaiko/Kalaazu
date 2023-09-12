package net.bigpoint.darkorbit.gui {

import com.bigpoint.utils.class_73;

import flash.display.Bitmap;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFieldType;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.net.class_53;

import package_11.class_39;

import package_26.class_94;

import package_30.class_91;

import package_33.class_93;

import package_46.class_131;

import package_74.class_197;
import package_74.class_205;

import package_9.ResourceManager;

public class class_172 {

    private static const BORDER: int = 10;


    private var guiManager: class_58;

    public function class_172(param1: class_58) {
        super();
        this.guiManager = param1;
    }

    public function decorate(param1: class_131): void {
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc12_: * = null;
        var _loc14_: * = null;
        var _loc16_: * = null;
        var _loc2_: * = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
        var _loc3_: * = [16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 91, 92, 93];
        var _loc4_: *;
        (_loc4_ = [])[1] = new class_73(0, 185);
        _loc4_[2] = new class_73(107, 185);
        _loc4_[3] = new class_73(204, 136);
        _loc4_[4] = new class_73(204, 235);
        _loc4_[5] = new class_73(506, 0);
        _loc4_[6] = new class_73(408, 38);
        _loc4_[7] = new class_73(303, 87);
        _loc4_[8] = new class_73(508, 97);
        _loc4_[9] = new class_73(506, 375);
        _loc4_[10] = new class_73(407, 326);
        _loc4_[11] = new class_73(508, 192);
        _loc4_[12] = new class_73(301, 283);
        _loc4_[13] = new class_73(302, 182);
        _loc4_[14] = new class_73(398, 151);
        _loc4_[15] = new class_73(401, 219);
        _loc4_[16] = new class_73(272, 138);
        _loc4_[17] = new class_73(164, 171);
        _loc4_[18] = new class_73(84, 107);
        _loc4_[19] = new class_73(84, 238);
        _loc4_[20] = new class_73(0, 171);
        _loc4_[21] = new class_73(506, 131);
        _loc4_[22] = new class_73(506, 43);
        _loc4_[23] = new class_73(619, 93);
        _loc4_[24] = new class_73(619, 0);
        _loc4_[25] = new class_73(487, 269);
        _loc4_[26] = new class_73(519, 363);
        _loc4_[27] = new class_73(594, 269);
        _loc4_[28] = new class_73(628, 363);
        _loc4_[29] = new class_73(230, 297);
        _loc4_[91] = new class_73(388, 60);
        _loc4_[92] = new class_73(296, 18);
        _loc4_[93] = new class_73(202, 60);
        _loc7_ = class_39(ResourceManager.name_15.getFinisher("spacemap"));
        _loc8_ = new class_93(this.guiManager, class_93.const_1306);
        var _loc9_: class_197;
        (_loc9_ = new class_197(this.guiManager)).init(_loc4_, _loc2_, _loc3_);
        _loc9_.x = 15;
        _loc9_.y = 34;
        _loc8_.addElement(_loc9_);
        param1.method_1655(_loc8_);
        var _loc10_: class_93 = new class_93(this.guiManager, class_93.const_1098);
        var _loc11_: class_53 = this.guiManager.method_6185().method_6154();
        _loc12_ = new class_91(class_91.const_2677);
        var _loc13_: class_91 = new class_91(class_91.const_1230);
        _loc14_ = new class_91(class_91.const_760);
        var _loc15_: class_91 = new class_91(class_91.const_266);
        _loc16_ = new class_91(class_91.const_155);
        var _loc17_: class_91 = new class_91(class_91.const_1539);
        var _loc18_: class_91 = new class_91(class_91.const_414);
        var _loc19_: class_91 = new class_91(class_91.const_2486);
        var _loc20_: class_205;
        (_loc20_ = new class_205()).init(_loc2_, _loc4_, "advanced_page_0");
        _loc20_.method_5755(_loc11_);
        _loc20_.setPosition(60, 34);
        var _loc21_: class_205;
        (_loc21_ = new class_205()).init(_loc3_, _loc4_, "advanced_page_1");
        _loc21_.method_5755(_loc11_);
        _loc21_.setPosition(15, 34);
        _loc13_.addChild(_loc20_);
        _loc14_.addChild(_loc21_);
        var _loc22_: Bitmap;
        (_loc22_ = _loc7_.getEmbeddedBitmap("bottom_bar")).x = 5;
        _loc22_.y = 34;
        var _loc23_: Bitmap;
        (_loc23_ = _loc7_.getEmbeddedBitmap("advanced_jump_icon")).x = BORDER;
        _loc23_.y = 34;
        var _loc24_: TextField;
        (_loc24_ = new TextField()).x = _loc23_.x + _loc23_.width + BORDER;
        _loc24_.y = 36;
        _loc24_.text = class_88.getItem("title_advanced_jump_cpu");
        this.method_5998(_loc24_);
        _loc15_.addChild(_loc22_);
        _loc15_.addChild(_loc23_);
        _loc15_.addChild(_loc24_);
        var _loc25_: TextField = new TextField();
        this.method_5998(_loc25_);
        _loc25_.text = class_88.getItem("label_current_map");
        var _loc26_: TextField = new TextField();
        this.method_5998(_loc26_);
        _loc26_.text = class_88.getItem("label_selected_map");
        _loc26_.y = 40;
        var _loc27_: Bitmap;
        (_loc27_ = _loc7_.getEmbeddedBitmap("from_to_display")).x = BORDER + Math.max(_loc26_.width, _loc25_.width);
        _loc27_.y = 5;
        var _loc28_: TextField = new TextField();
        this.method_2679(_loc28_);
        _loc28_.x = _loc27_.x;
        _loc28_.y = _loc27_.y - 5;
        _loc28_.width = 50;
        var _loc29_: TextField = new TextField();
        this.method_2679(_loc29_);
        _loc29_.x = _loc27_.x;
        _loc29_.y = _loc27_.y + 35;
        _loc29_.width = 50;
        _loc16_.x = 30;
        _loc16_.y = 505;
        _loc16_.addChild(_loc27_);
        _loc16_.addChild(_loc28_);
        _loc16_.addChild(_loc29_);
        _loc16_.addChild(_loc25_);
        _loc16_.addChild(_loc26_);
        var _loc30_: Bitmap = _loc7_.getEmbeddedBitmap("price_display");
        var _loc31_: TextField;
        (_loc31_ = new TextField()).width = _loc30_.width;
        this.method_2679(_loc31_);
        _loc31_.y = 5;
        _loc17_.x = 310;
        _loc17_.y = 500;
        _loc17_.addChild(_loc30_);
        _loc17_.addChild(_loc31_);
        class_94.getInstance().method_1211(_loc17_, class_88.getItem("label_cpu_jump_price"));
        var _loc32_: TextField;
        (_loc32_ = new TextField()).name = "text";
        _loc32_.y = 0;
        _loc32_.defaultTextFormat = class_18.const_3045;
        _loc32_.embedFonts = class_18.var_130;
        _loc32_.width = _loc30_.width + 100;
        _loc32_.height = NaN;
        _loc19_.addChild(_loc32_);
        _loc19_.x = 260;
        _loc19_.y = 545;
        var _loc33_: MovieClip = _loc7_.getEmbeddedMovieClip("jumpButton");
        var _loc34_: TextField;
        (_loc34_ = new TextField()).width = _loc33_.width;
        this.method_2679(_loc34_);
        _loc34_.text = class_88.getItem("label_jump_now");
        _loc34_.y = 10;
        _loc34_.mouseEnabled = false;
        _loc34_.selectable = false;
        _loc18_.x = 500;
        _loc18_.y = 515;
        _loc18_.buttonMode = true;
        _loc18_.useHandCursor = true;
        _loc18_.addChild(_loc33_);
        _loc18_.addChild(_loc34_);
        var _loc35_: Sprite = new Sprite();
        var _loc36_: TextField = new TextField();
        this.method_5998(_loc36_);
        _loc36_.width = 350;
        _loc36_.mouseEnabled = false;
        _loc12_.x = 30;
        _loc12_.y = 40;
        _loc35_.graphics.beginFill(0, 0);
        _loc35_.graphics.drawRect(0, 0, _loc36_.width, _loc36_.height);
        _loc35_.graphics.endFill();
        _loc35_.useHandCursor = true;
        _loc35_.buttonMode = true;
        _loc35_.addChild(_loc36_);
        _loc12_.addChild(_loc35_);
        _loc10_.addElement(_loc13_, class_93.const_2374);
        _loc10_.addElement(_loc14_, class_93.const_2374);
        _loc10_.addElement(_loc15_, class_93.const_3298);
        _loc10_.addElement(_loc17_, class_93.const_2374);
        _loc10_.addElement(_loc16_, class_93.const_2374);
        _loc10_.addElement(_loc18_, class_93.const_2374);
        _loc10_.addElement(_loc12_, class_93.const_2374);
        _loc10_.addElement(_loc19_, class_93.const_2374);
        param1.method_1655(_loc10_);
        this.guiManager.method_2830();
    }

    private function method_5998(param1: TextField): void {
        param1.defaultTextFormat = class_18.const_180;
        param1.textColor = 16777215;
        param1.embedFonts = class_18.var_3911;
        param1.autoSize = TextFieldAutoSize.LEFT;
        param1.antiAliasType = AntiAliasType.ADVANCED;
        param1.selectable = false;
    }

    private function method_2679(param1: TextField): void {
        param1.defaultTextFormat = class_18.const_639;
        param1.type = TextFieldType.DYNAMIC;
        param1.textColor = 16777215;
        param1.embedFonts = class_18.var_3911;
        param1.autoSize = TextFieldAutoSize.CENTER;
        param1.antiAliasType = AntiAliasType.ADVANCED;
        param1.selectable = false;
    }
}
}
