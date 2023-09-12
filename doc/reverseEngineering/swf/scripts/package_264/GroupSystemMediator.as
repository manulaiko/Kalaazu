package package_264 {

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
import net.bigpoint.darkorbit.mvc.common.KeyboardNotifications;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.mvc.gui.model.vo.LogMessageVO;
import net.bigpoint.darkorbit.mvc.mapElements.assets.MapAssetNotification;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.mediator.Mediator;

import package_139.Group;
import package_139.class_1154;
import package_139.class_1934;

import package_190.class_1152;

import package_259.class_1658;

import package_278.class_1688;

import package_345.class_1931;
import package_345.class_1932;
import package_345.class_1933;

import package_38.class_495;
import package_38.class_518;
import package_38.class_667;
import package_38.class_686;
import package_38.class_719;
import package_38.class_815;
import package_38.class_844;
import package_38.class_908;
import package_38.class_916;
import package_38.class_927;
import package_38.class_939;
import package_38.class_966;

import package_44.GroupSystemNotification;

public class GroupSystemMediator extends Mediator {

    public static const NAME: String = "GroupSystemMediator";


    public function GroupSystemMediator(param1: Object = null) {
        super(NAME);
        this.setViewComponent(param1);
    }

    private function get method_83(): class_1688 {
        return viewComponent as class_1688;
    }

    override public function onRemove(): void {
        this.removeEventListeners();
        sendNotification(GuiNotifications.CLOSE_WINDOW_BY_ID, GuiConstants.GROUP_SYSTEM_WINDOW);
        super.onRemove();
    }

    private function removeEventListeners(): void {
        this.method_83.removeEventListener(class_1931.TOGGLE_PING_MODE_BUTTON_CLICKED, this.method_1555);
        this.method_83.removeEventListener(class_1931.CHANGE_LEADER, this.method_4299);
        this.method_83.removeEventListener(class_1931.FLY_TO_MEMBER, this.method_4959);
        this.method_83.removeEventListener(class_1932.INVITATION_BEHAVIOR_TOGGLE, this.method_2043);
        this.method_83.removeEventListener(class_1931.INVITATION_BLOCK_TOGGLE, this.method_6231);
        this.method_83.removeEventListener(class_1931.KICK_MEMBER, this.method_2302);
        this.method_83.removeEventListener(class_1931.LEAVE_GROUP, this.method_3108);
        this.method_83.removeEventListener(class_1931.TRY_TO_SELECT_MAPASSET, this.method_3309);
        this.method_83.removeEventListener(class_1932.INVITATION_BEHAVIOR_TOGGLE, this.method_2043);
        this.method_83.removeEventListener(class_1933.ACCEPT, this.method_5893);
        this.method_83.removeEventListener(class_1933.INVITE, this.method_5350);
        this.method_83.removeEventListener(class_1933.REJECT, this.method_6386);
        this.method_83.removeEventListener(class_1933.REVOKE, this.method_4853);
        this.method_83.removeEventListener(class_1931.BLOCK_KEYBOARD, this.method_1495);
        this.method_83.removeEventListener(class_1931.UNBLOCK_KEYBOARD, this.method_3703);
    }

    override public function setViewComponent(param1: Object): void {
        super.setViewComponent(param1);
        this.addEventListeners();
    }

    private function addEventListeners(): void {
        this.method_83.addEventListener(class_1931.TOGGLE_PING_MODE_BUTTON_CLICKED, this.method_1555);
        this.method_83.addEventListener(class_1931.PING_MEMBER, this.method_943);
        this.method_83.addEventListener(class_1931.CHANGE_LEADER, this.method_4299);
        this.method_83.addEventListener(class_1931.FLY_TO_MEMBER, this.method_4959);
        this.method_83.addEventListener(class_1931.INVITATION_BLOCK_TOGGLE, this.method_6231);
        this.method_83.addEventListener(class_1931.KICK_MEMBER, this.method_2302);
        this.method_83.addEventListener(class_1931.LEAVE_GROUP, this.method_3108);
        this.method_83.addEventListener(class_1931.TRY_TO_SELECT_MAPASSET, this.method_3309);
        this.method_83.addEventListener(class_1932.INVITATION_BEHAVIOR_TOGGLE, this.method_2043);
        this.method_83.addEventListener(class_1933.ACCEPT, this.method_5893);
        this.method_83.addEventListener(class_1933.INVITE, this.method_5350);
        this.method_83.addEventListener(class_1933.REJECT, this.method_6386);
        this.method_83.addEventListener(class_1933.REVOKE, this.method_4853);
        this.method_83.addEventListener(class_1931.BLOCK_KEYBOARD, this.method_1495);
        this.method_83.addEventListener(class_1931.UNBLOCK_KEYBOARD, this.method_3703);
    }

    private function method_3703(param1: class_1931): void {
        sendNotification(KeyboardNotifications.UNLOCK_KEYBOARD);
    }

    private function method_1495(param1: class_1931): void {
        sendNotification(KeyboardNotifications.LOCK_KEYBOARD);
    }

    private function method_943(param1: class_1931): void {
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_966(param1.method_4995.id));
    }

    private function method_4853(param1: class_1933): void {
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_927(param1.method_926));
        sendNotification(GroupSystemNotification.REMOVE_INVITATION_BY_MEMBER_ID, new class_1934(param1.method_926, class_1934.const_2122));
    }

    private function method_6386(param1: class_1933): void {
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_908(param1.method_926));
        sendNotification(GroupSystemNotification.REMOVE_INVITATION_BY_MEMBER_ID, new class_1934(param1.method_926, class_1934.const_1933));
    }

    private function method_5350(param1: class_1933): void {
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_815(param1.name_82));
    }

    private function method_5893(param1: class_1933): void {
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_495(param1.method_926));
        sendNotification(GroupSystemNotification.REMOVE_INVITATION_BY_MEMBER_ID, new class_1934(param1.method_926, class_1934.const_1933));
    }

    private function method_3309(param1: class_1931): void {
        if (param1.method_4995 != null) {
            sendNotification(class_1658.const_179, [param1.method_4995.id, param1.method_4995.var_5016]);
            sendNotification(MapAssetNotification.TRY_TO_SELECT_MAPASSET, [param1.method_4995.id, param1.method_4995.var_4787, param1.method_4995.var_2295, 1, 1]);
        }
    }

    private function method_3108(param1: class_1931): void {
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_939());
    }

    private function method_2302(param1: class_1931): void {
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_916(param1.method_4995.id));
    }

    private function method_6231(param1: class_1931): void {
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_844());
    }

    private function method_2043(param1: class_1932): void {
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_686(new class_719(param1.mode)));
    }

    private function method_4959(param1: class_1931): void {
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_667(param1.method_4995.id));
    }

    private function method_4299(param1: class_1931): void {
        sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_518(param1.method_4995.id));
    }

    private function method_1555(param1: class_1931): void {
        sendNotification(GroupSystemNotification.UPDATE_MODEL_PING_STATE, this.method_83.method_5594);
    }

    override public function listNotificationInterests(): Array {
        return [GroupSystemNotification.CLEANUP_UI, GroupSystemNotification.PREPARE_USER, GroupSystemNotification.UPDATE_UI_PING_MODE, GroupSystemNotification.UPDATE_UI, GroupSystemNotification.REMOVE_MEMBER_CLIP, GroupSystemNotification.ADD_INVITATION, GroupSystemNotification.REMOVE_INVITATION_UI, GroupSystemNotification.UPDATE_BLOCK_INVITATION_STATE, GroupSystemNotification.RELATED_DATA_CHANGED];
    }

    override public function handleNotification(param1: INotification): void {
        var _loc2_: * = null;
        switch (param1.getName()) {
            case GroupSystemNotification.UPDATE_UI:
                this.method_83.method_859(param1.getBody() as Group);
                this.method_83.update();
                break;
            case GroupSystemNotification.REMOVE_MEMBER_CLIP:
                this.method_83.method_5066(int(param1.getBody()));
                break;
            case GroupSystemNotification.ADD_INVITATION:
                this.method_1126(param1.getBody() as class_1154);
                break;
            case GroupSystemNotification.REMOVE_INVITATION_UI:
                _loc2_ = param1.getBody() as class_1152;
                this.method_83.method_4510(_loc2_.name_136, _loc2_.var_1436);
                break;
            case GroupSystemNotification.UPDATE_BLOCK_INVITATION_STATE:
                this.method_83.method_3802(Boolean(param1.getBody()));
                break;
            case GroupSystemNotification.UPDATE_UI_PING_MODE:
                this.method_83.method_5594 = Boolean(param1.getBody());
                break;
            case GroupSystemNotification.PREPARE_USER:
                this.method_83.method_6256(param1.getBody() as String);
                break;
            case GroupSystemNotification.CLEANUP_UI:
                this.cleanup();
                break;
            case GroupSystemNotification.RELATED_DATA_CHANGED:
                this.method_83.method_4571();
        }
    }

    private function method_1126(param1: class_1154): void {
        this.method_83.method_1126(param1);
        if (param1.method_3057().id != class_81.userID) {
            sendNotification(GuiNotifications.WRITE_TO_LOG, new LogMessageVO(class_88.getItem("label_grp_inv_from").replace(/%name%/, param1.method_3057().var_5016)));
        }
    }

    private function cleanup(): void {
        this.method_83.dispose();
        this.method_83.update();
    }
}
}
