package package_71 {

import flash.events.Event;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_9;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.questWindow.model.vo.class_1055;

import package_33.class_93;

import package_65.class_203;

import package_70.SimpleWindowEvent;

public class class_189 extends class_93 {


    private var var_282: class_1054;

    private var var_2035: class_203;

    public function class_189(param1: class_9) {
        super(param1.method_4489(), class_93.const_1156);
        guiManager = param1.method_4489();
        addElement(this.var_282 = new class_1054(), class_93.const_2568);
        this.var_282.addEventListener(class_1054.const_2446, this.method_1493);
    }

    private function method_477(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        this.var_282.method_4825.method_3928();
        for each(_loc1_ in this.var_2035.rewards) {
            _loc2_ = class_88.method_734("items", "items_" + _loc1_.lootId.toString() + "_fullname");
            this.var_282.method_4825.addItem(new class_1056(_loc2_, _loc1_.amount), -1, -1);
        }
        this.method_1493();
    }

    private function method_1493(param1: Event = null): void {
        guiManager.method_468(GuiConstants.QUEST_WINDOW).dispatchEvent(new SimpleWindowEvent(SimpleWindowEvent.const_1674));
    }

    public function set isDefaultVisible(param1: Boolean): void {
        this.var_282.isDefaultVisible = param1;
    }

    public function get isDefaultVisible(): Boolean {
        return this.var_282.isDefaultVisible;
    }

    public function get quest(): class_203 {
        return this.var_2035;
    }

    public function method_1322(): void {
        this.var_282.questTitle = this.quest.title;
    }

    public function set quest(param1: class_203): void {
        this.var_2035 = param1;
        this.var_282.questTitle = param1.title;
        this.method_477();
    }

    public function clearContent(): void {
        this.var_282.method_4825.method_3928();
    }
}
}
