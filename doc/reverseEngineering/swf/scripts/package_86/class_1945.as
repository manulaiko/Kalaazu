package package_86 {

import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_38.class_935;

import package_403.class_2292;

public class class_1945 extends class_245 {


    public function class_1945() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: String = (param1.getBody() as Array)[0];
        var _loc3_: Boolean = (param1.getBody() as Array)[1] as Boolean;
        switch (_loc2_) {
            case class_2292.CONTACTS_CHECKBOX:
                method_435.showContacts = _loc3_;
                break;
            case class_2292.CLANMEMBERS_CHECKBOX:
                method_435.showClanmembers = _loc3_;
                break;
            case class_2292.REQUESTS_CHECKBOX:
                method_435.showRequests = _loc3_;
                break;
            case class_2292.BLACKLISTED_CHECKBOX:
                method_435.name_3 = _loc3_;
        }
        method_435.method_3647();
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_935(method_435.showContacts, method_435.showClanmembers, method_435.showRequests, method_435.name_3));
    }
}
}
