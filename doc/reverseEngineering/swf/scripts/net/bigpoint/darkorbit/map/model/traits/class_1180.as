package net.bigpoint.darkorbit.map.model.traits {

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;

import package_10.class_1173;
import package_10.class_19;
import package_10.class_20;
import package_10.class_305;

import package_17.class_62;

import package_22.FullResourcePattern;

import package_27.class_82;

import package_38.class_750;

public class class_1180 extends class_319 {

    private static const const_290: int = 0;

    private static const const_1342: int = 10;

    public static const const_994: int = 0;

    public static const const_2201: int = 1;


    public const const_250: class_20 = new class_20();

    public const text: class_1173 = new class_1173(null);

    public const highlight: class_19 = new class_19(false);

    private var var_3837: FullResourcePattern;

    public function class_1180(param1: FullResourcePattern, param2: int, param3: int = 0, param4: class_305 = null) {
        super(param2, param3, 0, -87, param4);
        this.var_3837 = param1;
        var_2338 = false;
        enabled.changed.add(this.method_1162);
        enabled.value = false;
    }

    public function get method_3109(): FullResourcePattern {
        return this.var_3837;
    }

    override public function method_4753(): void {
        if (false) {
            class_62.getInstance().sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_750(owner.id));
        }
        super.method_4753();
    }

    public function method_3611(param1: Boolean, param2: String = null): void {
        this.enabled.value = param1;
        this.toolTip = param2;
    }

    private function method_1162(): void {
        clickPriority = !true ? int(const_1342) : int(const_290);
        if (false) {
            class_82.playSoundEffect(class_126.const_1536);
        }
    }
}
}
