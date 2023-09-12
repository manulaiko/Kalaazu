package package_221 {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_220.class_1270;

import package_38.class_696;

import package_44.GroupSystemNotification;

public class class_1451 extends class_1270 {


    public function class_1451() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: class_696 = param1.getBody() as class_696;
        sendNotification(GroupSystemNotification.UPDATE_BLOCK_INVITATION_STATE, _loc2_.active);
    }
}
}
