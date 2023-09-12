package package_321 {

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.mvc.gui.abstract.model.DOAbstractProxy;

import package_320.InfluenceWindowNotifications;

public class InfluenceWindowProxy extends DOAbstractProxy {

    public static const NAME: String = "InfluenceWindowProxy";


    public function InfluenceWindowProxy(param1: Object = null) {
        super(NAME, param1);
    }

    private function get method_3300(): class_2269 {
        return data as class_2269;
    }

    public function method_4202(param1: Number): void {
        this.method_3300.playerScore = param1;
        sendNotification(InfluenceWindowNotifications.UPDATE_PLAYER_INFLUENCE, param1);
    }

    public function updateView(): void {
        sendNotification(InfluenceWindowNotifications.UPDATE_ALL, this.method_3300);
    }

    public function method_4461(param1: Number, param2: Number, param3: Number): void {
        this.method_3300.name_107 = param1;
        this.method_3300.name_139 = param2;
        this.method_3300.name_27 = param3;
        this.method_3971();
        this.updateView();
    }

    private function method_3971(): void {
        this.method_3300.list.sort(this.method_6343);
    }

    private function method_6343(param1: class_2270, param2: class_2270): int {
        var _loc3_: String = class_126.instance.method_1709[class_81.factionID];
        if (param1.faction == _loc3_) {
            return -1;
        }
        if (param2.faction == _loc3_) {
            return 1;
        }
        return Number(param2.score) - Number(param1.score);
    }
}
}
