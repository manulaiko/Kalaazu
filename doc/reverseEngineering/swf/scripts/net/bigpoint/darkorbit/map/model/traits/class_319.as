package net.bigpoint.darkorbit.map.model.traits {

import com.bigpoint.utils.class_73;

import net.bigpoint.darkorbit.map.class_87;

import package_10.class_19;
import package_10.class_305;

import package_19.class_68;
import package_19.class_70;

import package_26.class_79;

import package_29.class_267;

public class class_319 extends class_267 {


    public var clickRadius: int = 0;

    public var clickPriority: int = 0;

    public const const_649: class_73 = new class_73(0, 0);

    public const enabled: class_19 = new class_19(true);

    public const clicked: class_68 = new class_70();

    public const const_2955: class_68 = new class_70();

    public const const_1038: class_68 = new class_70();

    public const const_3038: class_68 = new class_70();

    public var toolTip: String;

    protected var var_2338: Boolean = true;

    private var var_377: class_305;

    private const const_787: class_73 = new class_73();

    public function class_319(param1: int, param2: int = 0, param3: int = 0, param4: int = 0, param5: class_305 = null) {
        super();
        this.clickRadius = param1;
        this.clickPriority = param2;
        this.const_649.x = param3;
        this.const_649.y = param4;
        this.var_377 = param5 || new class_305();
        this.enabled.changed.add(this.method_1162);
    }

    public function method_1974(param1: class_87): class_73 {
        param1.method_4683(owner.x + this.var_377.x, owner.y + this.var_377.y, owner.z + this.var_377.z, this.const_787);
        this.const_787.incrementBy(this.const_649);
        return this.const_787;
    }

    public function method_4753(): void {
        if (this.enabled.value) {
            this.clicked.dispatch();
        }
    }

    public function mouseOver(): void {
        if (this.enabled.value) {
            this.const_2955.dispatch();
            if (this.toolTip) {
                class_79.getInstance().show(this.toolTip);
            }
        }
    }

    public function mouseOut(): void {
        if (this.enabled.value) {
            this.const_1038.dispatch();
        }
        class_79.getInstance().hide();
    }

    private function method_1162(): void {
        if (this.enabled.value == false) {
            this.const_3038.dispatch();
        }
    }

    public function get method_2996(): Boolean {
        return this.var_2338;
    }
}
}
