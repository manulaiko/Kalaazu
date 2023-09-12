package package_378 {

import flash.display.Sprite;
import flash.events.Event;
import flash.filters.DropShadowFilter;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.utils.clearInterval;
import flash.utils.setInterval;

import net.bigpoint.darkorbit.settings.Settings;

public class class_2148 extends Sprite {

    public static var ships: int = 0;

    public static var var_5018: int = 0;

    public static var var_3525: int = 0;


    private var var_2977: TextField;

    private var _updateInterval: uint;

    public function class_2148() {
        super();
        this.var_2977 = new TextField();
        this.var_2977.autoSize = TextFieldAutoSize.LEFT;
        this.var_2977.background = false;
        this.var_2977.border = false;
        this.var_2977.defaultTextFormat = new TextFormat(null, 10, 16777215);
        addChild(this.var_2977);
        filters = [new DropShadowFilter(1, 0, 0, 1, 2, 2, 1, 0)];
        addEventListener(Event.ADDED_TO_STAGE, this.method_396);
        addEventListener(Event.REMOVED_FROM_STAGE, this.method_4189);
    }

    private function method_396(param1: Event): void {
        clearInterval(this._updateInterval);
        this._updateInterval = setInterval(this.update, 500);
        Settings.showUI.changed.add(this.method_4890);
        this.method_4890();
    }

    private function method_4189(param1: Event): void {
        clearInterval(this._updateInterval);
        Settings.showUI.changed.remove(this.method_4890);
    }

    private function method_4890(): void {
        visible = Settings.showUI.value;
    }

    private function update(): void {
    }
}
}
