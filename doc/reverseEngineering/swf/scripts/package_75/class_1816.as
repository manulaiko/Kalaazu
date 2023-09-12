package package_75 {

import net.bigpoint.darkorbit.map.model.ship.class_86;

import package_10.class_1173;
import package_10.class_20;

import package_22.class_339;

import package_35.Effect;
import package_35.class_338;
import package_35.class_348;

public class class_1816 extends class_348 {


    public const repairBotId: class_1173 = new class_1173();

    public const repairSkillLevel: class_20 = new class_20();

    public function class_1816(param1: int, param2: class_86, param3: String, param4: int) {
        super(param1, param2, const_2311, new class_339(class_338.const_1081, ""));
        this.repairBotId.value = param3;
        this.repairSkillLevel.value = param4;
    }

    override public function method_5571(param1: Effect): void {
        super.method_5571(param1);
        this.repairBotId.value = class_1816(param1).repairBotId.value;
        this.repairSkillLevel.value = class_1816(param1).repairSkillLevel.value;
    }
}
}
