package package_86 {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_260.class_1661;

public class class_1953 extends class_245 {


    public function class_1953() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: class_1661 = param1.getBody() as class_1661;
        method_435.showContacts = _loc2_.showContacts;
        method_435.showClanmembers = _loc2_.var_1684;
        method_435.showRequests = _loc2_.showRequests;
        method_435.name_3 = _loc2_.name_3;
    }
}
}
