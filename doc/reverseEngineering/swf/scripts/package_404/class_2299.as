package package_404 {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_406.SettingsWindowFUIProxy;
import package_406.class_2532;
import package_406.class_2533;
import package_406.class_2534;
import package_406.class_2535;

import package_84.class_243;

public class class_2299 extends class_243 {


    public function class_2299() {
        super();
    }

    override public function execute(param1: INotification): void {
        if (param1.getBody() is class_2535) {
            this.method_959.method_4156(param1.getBody() as class_2535);
        } else if (param1.getBody() is class_2532) {
            this.method_959.method_1268(param1.getBody() as class_2532);
        } else if (param1.getBody() is class_2533) {
            this.method_959.method_6218(param1.getBody() as class_2533);
        } else if (param1.getBody() is class_2534) {
            this.method_959.method_3906(param1.getBody() as class_2534);
        }
    }

    private function get method_959(): SettingsWindowFUIProxy {
        return facade.retrieveProxy(SettingsWindowFUIProxy.NAME) as SettingsWindowFUIProxy;
    }
}
}
