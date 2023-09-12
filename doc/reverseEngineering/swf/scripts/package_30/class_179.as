package package_30 {

import com.bigpoint.utils.class_122;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.text.AntiAliasType;
import flash.text.TextField;

import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.gui.class_58;

import package_11.class_39;

import package_9.ResourceManager;

public class class_179 extends class_91 {

    public static var var_3137: int = 1;

    public static var var_1920: int = 2;

    public static var var_3670: int = 3;


    protected var guiManager: class_58;

    protected var name_13: int;

    private var background: BitmapData;

    protected var var_3057: TextField;

    protected var var_4384: TextField;

    public function class_179(param1: int, param2: class_58, param3: int) {
        super(param1);
        this.guiManager = param2;
        this.name_13 = param3;
        this.init();
    }

    private function init(): void {
        var _loc1_: class_39 = class_39(ResourceManager.name_15.getFinisher("ui"));
        if (getID() == const_3119) {
            this.background = _loc1_.getEmbeddedBitmapData("spaceball_" + this.name_13);
        } else if (getID() == const_2102) {
            this.background = _loc1_.getEmbeddedBitmapData("invasion_" + this.name_13);
        } else if (getID() == const_2900) {
            this.background = _loc1_.getEmbeddedBitmapData("ctb_" + this.name_13);
        } else if (getID() == const_2226) {
            this.background = _loc1_.getEmbeddedBitmapData("tdm_scoreboard_left_" + this.name_13);
        } else if (getID() == const_2679) {
            this.background = _loc1_.getEmbeddedBitmapData("tdm_scoreboard_right_" + this.name_13);
        }
        this.addChild(new Bitmap(this.background));
        this.var_3057 = new TextField();
        this.var_3057.defaultTextFormat = class_18.const_2966;
        this.var_3057.embedFonts = class_18.var_2081;
        this.var_3057.antiAliasType = AntiAliasType.ADVANCED;
        this.var_3057.mouseEnabled = false;
        this.var_3057.selectable = false;
        this.var_3057.width = this.background.width;
        this.var_3057.height = NaN;
        this.var_3057.multiline = false;
        this.var_3057.y = 1;
        switch (this.name_13) {
            case var_3137:
                this.var_3057.text = "MMO";
                break;
            case var_1920:
                this.var_3057.text = "EIC";
                break;
            case var_3670:
                this.var_3057.text = "VRU";
        }
        this.addChild(this.var_3057);
        this.var_4384 = new TextField();
        this.var_4384.defaultTextFormat = class_18.const_2966;
        this.var_4384.embedFonts = class_18.var_2081;
        this.var_4384.antiAliasType = AntiAliasType.ADVANCED;
        this.var_4384.mouseEnabled = false;
        this.var_4384.selectable = false;
        this.var_4384.width = this.background.width;
        this.var_4384.height = NaN;
        this.var_4384.multiline = false;
        this.var_4384.y = 13;
        this.addChild(this.var_4384);
    }

    public function method_3125(param1: Number): void {
        this.var_4384.text = class_122.method_98(param1);
    }

    public function method_5979(): BitmapData {
        return this.background;
    }

    public function method_5773(): int {
        return this.name_13;
    }

    public function method_197(param1: int): void {
        this.var_3057.y = param1;
    }

    public function method_5697(param1: int): void {
        this.var_4384.y = param1;
    }

    public function method_4489(): class_58 {
        return this.guiManager;
    }
}
}
