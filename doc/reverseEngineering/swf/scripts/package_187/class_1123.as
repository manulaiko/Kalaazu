package package_187 {

import org.puremvc.as3.multicore.interfaces.INotification;

import package_108.GroupProxy;

import package_264.GroupSystemMediator;

import package_44.GroupSystemNotification;

public class class_1123 extends class_1122 {


    public function class_1123() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        facade.removeMediator(GroupSystemMediator.NAME);
        facade.removeProxy(GroupProxy.NAME);
        facade.removeCommand(GroupSystemNotification.CHANGE_SHIP_GROUP_STATE);
        facade.removeCommand(GroupSystemNotification.UPDATE_MODEL_PING_STATE);
        facade.removeCommand(GroupSystemNotification.RELATED_DATA_CHANGED);
        facade.removeCommand(GroupSystemNotification.CLEANUP);
        facade.removeCommand(GroupSystemNotification.UPDATE_GROUP_CHAT_STATE);
        facade.removeCommand(GroupSystemNotification.REMOVE_INVITATION_BY_MEMBER_ID);
    }
}
}
