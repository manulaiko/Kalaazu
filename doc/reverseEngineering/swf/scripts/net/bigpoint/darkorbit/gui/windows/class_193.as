package net.bigpoint.darkorbit.gui.windows {

import flash.events.MouseEvent;
import flash.text.TextFormatAlign;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.gui.class_58;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureWindowVO;

import package_11.class_39;

import package_17.class_62;

import package_30.VideoElement;
import package_30.class_185;
import package_30.class_209;
import package_30.class_218;

import package_33.class_93;

import package_93.class_252;

public class class_193 extends class_192 {

    private static const const_1867: Number = 50;


    public function class_193(param1: class_58, param2: FeatureWindowVO, param3: int, param4: int, param5: int, param6: String, param7: Boolean, param8: int = 0) {
        super(param1, param2, param3, param4, param5, param6, param7, param8);
    }

    override protected function method_1893(): void {
        super.method_1893();
        class_62.getInstance().method_2407(class_252.SHOW);
    }

    override protected function method_3994(): String {
        return "btn_lable_fix_it";
    }

    override protected function method_1421(): void {
        var_2249 = new VideoElement(-1);
    }

    override protected function method_949(param1: class_39): void {
        var_2348 = new class_218(class_185.const_386, class_88.getItem("video_btn_showAll"), param1.getEmbeddedMovieClip("button1"));
        var_2348.addEventListener(MouseEvent.CLICK, method_3816);
        var_2348.x = Number(width) - 0 - Number(const_1867);
        var_2348.y = Number(height) - 0 - Number(const_1867);
        var_2348.visible = false;
        simpleContainer.addElement(var_2348, class_93.const_2374);
    }

    override protected function method_324(param1: class_39): void {
        var_5019 = new class_218(class_185.const_1146, "", param1.getEmbeddedMovieClip("button1"));
        var_5019.addEventListener(MouseEvent.CLICK, method_3214);
        simpleContainer.addElement(var_5019, class_93.const_2374);
        var_5019.y = Number(height) - 0 - Number(const_1867);
        var_5019.visible = false;
    }

    override protected function method_5238(): void {
        var_3997 = new class_209(Number(width) - Number(const_1867), 125, TextFormatAlign.LEFT);
        simpleContainer.addElement(var_3997, class_93.const_2568);
    }
}
}
