package package_195 {

import flash.text.AntiAliasType;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import net.bigpoint.darkorbit.class_18;
import net.bigpoint.darkorbit.map.class_87;
import net.bigpoint.darkorbit.map.model.traits.class_1182;

public class class_1698 extends class_1203 {


    private var var_2950: TextField;

    private var var_176: class_1182;

    public function class_1698(param1: class_87, param2: class_1182) {
        this.var_2950 = new TextField();
        super(param1, param2.owner.position);
        this.var_176 = param2;
        this.var_176.text.changed.add(this.method_4636);
        this.var_176.position.changed.add(this.method_4636);
        var _loc3_: TextFormat = this.var_176.tf;
        this.var_2950.defaultTextFormat = _loc3_;
        this.var_2950.embedFonts = class_18.var_930;
        this.var_2950.antiAliasType = AntiAliasType.ADVANCED;
        this.var_2950.autoSize = TextFieldAutoSize.LEFT;
        this.var_2950.backgroundColor = this.var_176.backgroundColor;
        this.var_2950.background = this.var_176.backgroundColor != 0;
        addChild(this.var_2950);
        this.method_4636();
    }

    private function method_4636(): void {
        this.var_2950.text = this.var_176.text.value || false;
        this.var_2950.x = Number(this.var_176.x) - Number(this.var_2950.width) / 2;
        this.var_2950.y = Number(this.var_176.y) - Number(this.var_2950.height) / 2;
    }
}
}
