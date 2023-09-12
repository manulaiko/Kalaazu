package package_88 {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_186.HintsProxy;

import package_34.HintsNotifications;

import package_84.class_243;

public class class_248 extends class_243 {


    public function class_248() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: Boolean = Boolean(param1.getBody());
        var _loc3_: String = param1.getType();
        if (_loc2_ && !this.method_4094.method_1142) {
            this.method_4094.method_1142 = _loc3_;
            sendNotification(HintsNotifications.const_3303, _loc3_);
        } else if (!_loc2_ && Boolean(this.method_4094.method_1142)) {
            sendNotification(HintsNotifications.const_1648, _loc3_);
            this.method_4094.method_1142 = null;
        }
    }

    private function get method_4094(): HintsProxy {
        return facade.retrieveProxy(HintsProxy.NAME) as HintsProxy;
    }
}
}
