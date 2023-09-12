package net.bigpoint.darkorbit.fui.components.window {

import com.bigpoint.utils.class_73;
import com.bigpoint.utils.class_968;

import flash.display.Sprite;

import net.bigpoint.darkorbit.fui.components.core.Container;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.model.vo.FeatureWindowVO;
import net.bigpoint.darkorbit.mvc.gui.interfaces.IWindow;

import package_11.class_39;

public class Window extends Container implements IWindow {


    public function Window() {
        super();
    }

    public function get id(): String {
        return "";
    }

    public function get position(): class_73 {
        return null;
    }

    public function get size(): class_73 {
        return null;
    }

    public function get maximized(): Boolean {
        return false;
    }

    public function update(param1: FeatureWindowVO, param2: Boolean): void {
    }

    public function maximize(param1: Boolean = true, param2: Boolean = false): void {
    }

    public function minimize(param1: Boolean = true, param2: Boolean = false): void {
    }

    public function setTitle(param1: String, param2: Boolean = true): void {
    }

    public function setWindowDimension(param1: class_73): void {
    }

    public function initIcon(param1: String, param2: class_39 = null, param3: class_968 = null): void {
    }

    public function get isTweening(): Boolean {
        return false;
    }

    public function get isTweaning(): Boolean {
        return false;
    }

    public function refreshWindow(): void {
    }

    public function showInProgressOverlay(): void {
    }

    public function hideInProgressOverlay(): void {
    }

    public function getUIContainer(): Sprite {
        return null;
    }
}
}
