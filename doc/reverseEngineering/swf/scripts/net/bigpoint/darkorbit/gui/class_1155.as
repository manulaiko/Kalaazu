package net.bigpoint.darkorbit.gui {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.text.TextField;
import flash.text.TextFormat;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_18;

import package_139.class_1156;

import package_26.class_94;

import package_278.class_1687;
import package_278.class_1688;
import package_278.class_1689;

public class class_1155 extends MovieClip {

    public static const const_498: int = 1;

    public static const const_2196: int = 2;


    private var var_27: TextField;

    private var var_914: class_1687;

    private var var_2743: class_1689;

    private var var_4352: class_1689;

    private var var_1087: class_1689;

    private var var_100: class_1156;

    private var var_4010: TextFormat;

    private var _type: int;

    private var var_3726: int;

    private var var_786: class_1688;

    private var _bg: Bitmap;

    public function class_1155() {
        super();
        this._bg = new Bitmap(new BitmapData(128, 28, true, 0));
        addChild(this._bg);
        this.var_4010 = new TextFormat(class_18.const_1629.font, class_18.const_2668, 16777215);
        this.var_27 = new TextField();
        this.method_3413(this.var_27);
        this.var_27.width = 104;
        this.var_27.x = 24;
        this.var_27.y = 6;
        addChild(this.var_27);
    }

    public function get method_5843(): TextField {
        return this.var_27;
    }

    private function method_3413(param1: TextField): void {
        param1.defaultTextFormat = this.var_4010;
        param1.embedFonts = class_18.var_620;
        param1.height = NaN;
        param1.multiline = false;
        param1.selectable = false;
    }

    public function init(param1: class_1156): void {
        this.var_100 = param1;
        this.var_3726 = this.var_100.id;
        this.var_27.text = param1.var_5016;
        this.method_1868();
    }

    private function method_1868(param1: Boolean = false): void {
        if (param1 && this.var_914 != null) {
            if (contains(this.var_914)) {
                removeChild(this.var_914);
            }
            this.var_914 = null;
        }
        if (this.var_786 != null && this.var_100 != null && this.var_914 == null) {
            this.var_914 = new class_1687();
            this.var_914.method_1736 = this.var_786.method_4371(this.var_100.var_4179.var_4184);
            this.var_914.y = 8;
            addChild(this.var_914);
        }
    }

    public function get type(): int {
        return this._type;
    }

    public function set type(param1: int): void {
        if (this._type != param1) {
            this._type = param1;
            if (this._type == const_498) {
                this.var_2743 = this.var_786.method_6335(class_1689.const_473);
                this.var_2743.x = this.var_27.x + this.var_27.width + 4;
                class_94.getInstance().method_1211(this.var_2743, class_88.getItem("label_grp_invitation_accept"));
                addChild(this.var_2743);
                this.var_4352 = this.var_786.method_6335(class_1689.const_1476);
                this.var_4352.x = this.var_2743.x + this.var_2743.width + 4;
                class_94.getInstance().method_1211(this.var_4352, class_88.getItem("label_grp_invitation_reject"));
                addChild(this.var_4352);
            } else if (this._type == const_2196) {
                this.var_1087 = this.var_786.method_6335(class_1689.const_1972);
                this.var_1087.x = this.var_27.x + this.var_27.width + 4;
                class_94.getInstance().method_1211(this.var_1087, class_88.getItem("label_grp_invitation_revoke"));
                addChild(this.var_1087);
            }
        }
    }

    public function get acceptButton(): class_1689 {
        return this.var_2743;
    }

    public function get method_4343(): class_1689 {
        return this.var_4352;
    }

    public function get revokeButton(): class_1689 {
        return this.var_1087;
    }

    public function get name_136(): int {
        return this.var_3726;
    }

    public function get method_83(): class_1688 {
        return this.var_786;
    }

    public function set method_83(param1: class_1688): void {
        this.var_786 = param1;
        this.method_1868();
    }
}
}
