package package_333 {

import com.bigpoint.utils.class_73;
import com.greensock.TweenLite;

import flash.events.MouseEvent;

import net.bigpoint.darkorbit.gui.class_58;
import net.bigpoint.darkorbit.mvc.common.utils.ScreenScaleUtils;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureWindowVO;

import package_11.class_39;

import package_239.class_2284;

import package_38.class_516;

import package_46.class_131;

import package_9.ResourceManager;
import package_9.class_50;

public class class_1846 extends class_131 {


    private const const_1711: Number = 25;

    private const const_1665: Number = 4.5;

    private var var_2720: class_1843;

    private var _alignment: uint;

    private var var_3183: Number;

    private var var_98: Number;

    private var var_1946: Number;

    private var var_3522: Number;

    public function class_1846(param1: class_58, param2: FeatureWindowVO, param3: class_1843, param4: uint) {
        super();
        preinitialize(param2, param1, class_39(ResourceManager.name_15.getFinisher("window")));
        this.alpha = 0;
        this._alignment = param4;
        this.var_2720 = param3;
        var_4702.addEventListener(MouseEvent.CLICK, this.method_2252);
        setTitle("", false);
        setSize(param2.size.x, param2.size.y);
        addChild(param3);
        param3.x = 4.5;
        param3.y = 25;
        this.method_4575();
        class_50.getInstance().method_6313().addChild(this);
        param1.method_4511(GuiConstants.TARGETED_OFFERS_WINDOW, this);
    }

    public function show(): void {
        this.alpha = 1;
        TweenLite.to(this, 1, {
            "x": this.var_1946,
            "y": this.var_3522
        });
    }

    public function method_4575(): void {
        var _loc3_: * = null;
        var _loc1_: int = int(featureWindowVO.size.x);
        var _loc2_: int = int(featureWindowVO.size.y);
        switch (this._alignment) {
            case class_516.const_766:
                this.var_3183 = Number(class_50.method_1849()) - _loc1_ / 2;
                this.var_98 = -_loc2_ - 35;
                this.var_1946 = Number(class_50.method_1849()) - _loc1_ / 2;
                this.var_3522 = 70;
                break;
            case class_516.const_2793:
                this.var_3183 = class_50.method_6533() + 10;
                this.var_98 = 70;
                this.var_1946 = Number(class_50.method_6533()) - _loc1_ - 30;
                this.var_3522 = 70;
                break;
            case class_516.const_2803:
                this.var_3183 = class_50.method_6533() + 10;
                this.var_98 = Number(class_50.method_5866()) - _loc2_ / 2;
                this.var_1946 = Number(class_50.method_6533()) - _loc1_ - 30;
                this.var_3522 = Number(class_50.method_5866()) - _loc2_ / 2;
                break;
            case class_516.const_2309:
                this.var_3183 = class_50.method_6533() + 10;
                this.var_98 = Number(class_50.method_1269()) - _loc2_ - 30;
                this.var_1946 = Number(class_50.method_6533()) - _loc1_ - 30;
                this.var_3522 = Number(class_50.method_1269()) - _loc2_ - 30;
                break;
            case class_516.const_3072:
                this.var_3183 = Number(class_50.method_1849()) - _loc1_ / 2;
                this.var_98 = Number(class_50.method_1269()) - 10;
                this.var_1946 = Number(class_50.method_1849()) - _loc1_ / 2;
                this.var_3522 = Number(class_50.method_1269()) - _loc2_ - 30;
                break;
            case class_516.const_984:
                this.var_3183 = -_loc1_ - 10;
                this.var_98 = Number(class_50.method_1269()) - _loc2_ + 30;
                this.var_1946 = 5;
                this.var_3522 = Number(class_50.method_1269()) - _loc2_ - 35;
                break;
            case class_516.const_3137:
                this.var_3183 = -_loc1_ - 10;
                this.var_98 = Number(class_50.method_5866()) - _loc2_ / 2;
                this.var_1946 = Number(class_50.method_6533()) * 0.02;
                this.var_3522 = Number(class_50.method_5866()) - _loc2_ / 2;
                break;
            case class_516.const_2879:
                this.var_3183 = -_loc1_ - 10;
                this.var_98 = 70;
                this.var_1946 = 5;
                this.var_3522 = 70;
                break;
            case class_516.CENTER:
                this.var_3183 = Number(class_50.method_1849()) - _loc1_ / 2;
                this.var_98 = -_loc2_ - 50;
                this.var_1946 = Number(class_50.method_1849()) - _loc1_ / 2;
                this.var_3522 = Number(class_50.method_5866()) - _loc2_ / 2 + 50;
                break;
            default:
                _loc3_ = ScreenScaleUtils.getRealPosFromPercentagePos(class_50.getInstance().name_118, size, featureWindowVO.position);
                this.var_3183 = this.var_1946 = _loc3_.x;
                this.var_98 = this.var_3522 = _loc3_.y;
        }
        this.x = this.var_3183;
        this.y = this.var_98;
    }

    private function method_2252(param1: MouseEvent): void {
        dispatchEvent(new class_2284(class_2284.const_1966));
    }

    public function get method_496(): class_1843 {
        return this.var_2720;
    }

    public function get name_141(): Number {
        return this.var_1946;
    }

    public function get name_18(): Number {
        return this.var_3522;
    }

    public function get alignment(): uint {
        return this._alignment;
    }
}
}
