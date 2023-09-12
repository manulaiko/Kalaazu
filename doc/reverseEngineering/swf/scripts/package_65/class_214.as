package package_65 {

import flash.events.Event;

import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;

import package_33.class_93;

import package_70.SimpleWindowEvent;

public class class_214 extends class_93 {


    private var var_2519: class_1103;

    public function class_214(param1: class_9) {
        super(param1.method_4489(), class_93.const_1827);
        guiManager = param1.method_4489();
        addChild(this.var_2519 = new class_1103());
        this.var_2519.addEventListener(class_1103.const_2446, this.method_1493);
    }

    private function method_1493(param1: Event): void {
        guiManager.method_468(GuiConstants.QUEST_WINDOW).dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.const_1674));
    }

    public function set isDefaultVisible(param1: Boolean): void {
        this.var_2519.isDefaultVisible = param1;
    }

    public function get isDefaultVisible(): Boolean {
        return this.var_2519.isDefaultVisible;
    }

    public function get method_2172(): Boolean {
        return this.var_2519.method_2172;
    }

    public function method_6137(param1: String): void {
        this.var_2519.method_6137(param1);
    }

    public function method_1322(): void {
        this.var_2519.method_1322();
    }

    public function clearContent(): void {
        this.var_2519.clearContent();
    }

    public function method_2655(param1: int, param2: Boolean): void {
        this.var_2519.method_2655(param1, param2);
    }

    public function update(): void {
        this.var_2519.update();
    }

    public function setSize(param1: int, param2: int): void {
    }

    public function method_1707(): void {
        this.var_2519.method_1707();
        guiManager.method_468(GuiConstants.QUEST_WINDOW).dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.const_1674));
    }

    public function get method_2789(): int {
        return this.var_2519.method_2789;
    }

    public function get quest(): class_203 {
        return this.var_2519.quest;
    }

    public function set quest(param1: class_203): void {
        this.var_2519.quest = param1;
    }
}
}
