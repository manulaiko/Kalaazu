package package_108 {

import flash.utils.Dictionary;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.gui.class_1155;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.mvc.gui.model.vo.LogMessageVO;

import org.puremvc.as3.multicore.patterns.proxy.Proxy;

import package_139.Group;
import package_139.class_1153;
import package_139.class_1154;
import package_139.class_1156;

import package_190.class_1152;

import package_38.class_432;
import package_38.class_433;
import package_38.class_439;
import package_38.class_472;
import package_38.class_493;
import package_38.class_508;
import package_38.class_512;
import package_38.class_515;
import package_38.class_568;
import package_38.class_626;
import package_38.class_696;
import package_38.class_733;
import package_38.class_743;
import package_38.class_767;
import package_38.class_791;
import package_38.class_953;

import package_44.GroupSystemNotification;

import package_63.ChatNotifications;

public class GroupProxy extends Proxy {

    private static const const_262: String = "/";

    public static const NAME: String = "GroupProxy";


    private var var_1111: Boolean;

    private var var_2504: Dictionary;

    public function GroupProxy(param1: Object = null) {
        this.var_2504 = new Dictionary();
        super(NAME);
        setData(param1);
    }

    private function get group(): Group {
        return data as Group;
    }

    public function name_166(param1: int): Boolean {
        return Boolean(this.group) && Boolean(this.group.name_113) && Boolean(this.group.method_6494(param1));
    }

    public function method_2568(param1: int): void {
        var _loc2_: * = null;
        if (!this.method_955()) {
            return;
        }
        for each(_loc2_ in this.group.name_113) {
            _loc2_.name_111 = _loc2_.id == param1;
        }
        this.group.method_3369 = param1 == class_81.userID;
        sendNotification(GroupSystemNotification.UPDATE_UI, this.group);
    }

    public function method_4732(param1: int): void {
        if (this.group != null) {
            if (this.group.method_3852 != param1) {
                this.group.method_3852 = param1;
                sendNotification(GroupSystemNotification.UPDATE_UI, this.group);
            }
        }
    }

    public function method_955(): Boolean {
        if (this.group != null && this.group.name_113.length > 0) {
            return true;
        }
        return false;
    }

    public function method_6470(param1: int, param2: int): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (param1 != class_81.userID && Boolean(this.group)) {
            _loc3_ = this.group.method_6494(param1);
            switch (param2) {
                case class_515.const_1816:
                    _loc4_ = "msg_grp_leave_group_reason_kick";
                    break;
                case class_515.const_1887:
                    _loc4_ = "msg_grp_leave_group_reason_leave";
                    break;
                case class_515.NONE:
                    _loc4_ = "msg_grp_leave_group_reason_none";
                default:
                    _loc4_ = "msg_grp_leave_group_reason_none";
            }
            if (_loc3_ != null) {
                sendNotification(GuiNotifications.WRITE_TO_LOG, new LogMessageVO(class_88.getItem(_loc4_).replace(/%name%/, _loc3_.var_5016)));
            }
            this.method_3863(param1);
            sendNotification(GroupSystemNotification.UPDATE_UI, this.group);
        } else {
            this.method_777();
        }
    }

    public function method_777(param1: Boolean = true): void {
        var _loc2_: * = null;
        if (this.group) {
            for each(_loc2_ in this.group.name_113) {
                if (_loc2_.id != class_81.userID) {
                    this.group.method_2123(_loc2_.id);
                    sendNotification(GroupSystemNotification.CHANGE_SHIP_GROUP_STATE, _loc2_.id);
                }
            }
            if (param1) {
                sendNotification(ChatNotifications.const_2630);
            }
        }
        setData(null);
        sendNotification(GroupSystemNotification.UPDATE_UI, this.group);
    }

    public function method_3595(param1: int, param2: int, param3: int, param4: int, param5: int): void {
        this.method_777(false);
        setData(new Group());
        this.group.init(param1, param2, param3, param4, param5);
        this.joinGroupChat();
        sendNotification(GroupSystemNotification.UPDATE_UI, this.group);
    }

    public function method_281(param1: class_1156): void {
        this.group.method_281(param1);
        sendNotification(GroupSystemNotification.CHANGE_SHIP_GROUP_STATE, param1.id);
    }

    public function method_3863(param1: int): void {
        this.group.method_2123(param1);
        if (param1 != class_81.userID) {
            sendNotification(GroupSystemNotification.REMOVE_MEMBER_CLIP, param1);
        }
        this.group.method_2123(param1);
        sendNotification(GroupSystemNotification.CHANGE_SHIP_GROUP_STATE, param1);
    }

    public function joinGroupChat(): void {
        if (this.group != null) {
            sendNotification(ChatNotifications.const_2266, this.group.id);
        }
    }

    public function method_5399(param1: int, param2: Vector.<class_432>): void {
        var _loc4_: * = null;
        if (this.group == null) {
            return;
        }
        var _loc3_: class_1156 = this.group.method_6494(param1);
        if (_loc3_ == null) {
            return;
        }
        for each(_loc4_ in param2) {
            this.method_3384(_loc3_, _loc4_);
        }
        sendNotification(GroupSystemNotification.UPDATE_UI, this.group);
    }

    private function method_3384(param1: class_1156, param2: class_432): void {
        switch (param2.method_1330()) {
            case class_743.ID:
                param1.var_2477 = (param2 as class_743).active;
                break;
            case class_791.ID:
                param1.name_145 = (param2 as class_791).name_145;
                break;
            case class_733.ID:
                param1.var_3150 = (param2 as class_733).active;
                break;
            case class_439.ID:
                param1.factionID = (param2 as class_439).faction;
                break;
            case class_626.ID:
                param1.var_1147 = (param2 as class_626).active;
                break;
            case class_508.ID:
                param1.var_4179.var_111 = (param2 as class_508).hp;
                param1.var_4179.var_707 = (param2 as class_508).var_737;
                param1.var_4179.var_4409 = (param2 as class_508).var_2217;
                param1.var_4179.var_2451 = (param2 as class_508).var_3738;
                param1.var_4179.var_4678 = (param2 as class_508).shield;
                param1.var_4179.name_105 = (param2 as class_508).name_105;
                break;
            case class_696.ID:
                break;
            case class_512.ID:
                param1.var_1706 = (param2 as class_512).level;
                break;
            case class_568.ID:
                param1.var_4787 = (param2 as class_568).x;
                param1.var_2295 = (param2 as class_568).y;
                param1.mapID = (param2 as class_568).mapId;
                break;
            case class_767.ID:
                param1.name_157 = (param2 as class_767).var_5046;
                break;
            case class_433.ID:
                param1.var_4179.var_4184 = (param2 as class_433).var_2971;
                break;
            case class_472.ID:
                param1.name_22 = new class_1153();
                param1.name_22.var_4879 = (param2 as class_472).name;
                param1.name_22.var_4184 = (param2 as class_472).var_4184.var_2971;
                param1.name_22.var_111 = (param2 as class_472).var_2749.hp;
                param1.name_22.var_707 = (param2 as class_472).var_2749.var_737;
                param1.name_22.var_4678 = (param2 as class_472).var_2749.shield;
                param1.name_22.name_105 = (param2 as class_472).var_2749.name_105;
                param1.name_22.var_4409 = (param2 as class_472).var_2749.var_2217;
                param1.name_22.var_2451 = (param2 as class_472).var_2749.var_3738;
                break;
            case class_493.ID:
                param1.var_3592 = (param2 as class_493).var_3867;
                param1.var_311 = (param2 as class_493).var_881;
        }
    }

    public function method_3586(param1: int, param2: String): void {
        if (this.method_955()) {
            this.group.method_538(param1);
            sendNotification(GroupSystemNotification.UPDATE_UI, this.group);
        }
        sendNotification(GroupSystemNotification.PREPARE_USER, param2);
    }

    public function method_3001(param1: class_1154): void {
        var _loc2_: * = null;
        if (param1.method_3057().id != class_81.userID && param1.method_4059().id != class_81.userID) {
            _loc2_ = class_88.getItem("msg_grp_inv_info_from_to").replace(/%inviter%/, param1.method_3057().var_5016).replace(/%candidate%/, param1.method_4059().var_5016);
            sendNotification(GuiNotifications.WRITE_TO_LOG, new LogMessageVO(_loc2_));
        } else if (Boolean(param1.method_4059()) && Boolean(param1.method_3057())) {
            this.method_6350(param1.method_3057().id, param1.method_4059().id);
            this.var_2504[this.method_686(param1.method_4059().id, param1.method_3057().id)] = param1;
            sendNotification(GroupSystemNotification.ADD_INVITATION, param1);
            sendNotification(GroupSystemNotification.UPDATE_UI, this.group);
        }
    }

    private function method_686(param1: int, param2: int): String {
        return param1.toString() + const_262 + param2.toString();
    }

    public function method_6350(param1: int, param2: int, param3: int = -1): void {
        var _loc4_: int = 0;
        var _loc5_: int = 0;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: Boolean = false;
        var _loc11_: * = null;
        var _loc6_: String = this.method_686(param2, param1);
        if (param1 == class_81.userID) {
            _loc4_ = param2;
            _loc5_ = 0;
        } else {
            _loc4_ = param1;
            _loc5_ = 0;
        }
        if (param3 != -1) {
            _loc8_ = "%name%";
            _loc9_ = "";
            _loc10_ = true;
            if (_loc11_ = this.var_2504[_loc6_]) {
                switch (param3) {
                    case class_953.REVOKE:
                        _loc7_ = "msg_grp_inv_revoke_inviter";
                        if (_loc5_ == class_1155.const_498) {
                            _loc10_ = false;
                            _loc9_ = _loc11_.method_3057().var_5016;
                            break;
                        }
                        break;
                    case class_953.REJECT:
                        _loc7_ = "msg_grp_inv_invitation_rejected_candidate";
                        if (_loc5_ == class_1155.const_2196) {
                            _loc10_ = false;
                            _loc9_ = _loc11_.method_4059().var_5016;
                            break;
                        }
                        break;
                    case class_953.TIMEOUT:
                        if (_loc5_ == class_1155.const_2196) {
                            _loc7_ = "msg_grp_inv_timeout_checked_inviter";
                            _loc8_ = "%invited%";
                            _loc9_ = _loc11_.method_4059().var_5016;
                            _loc10_ = false;
                            break;
                        }
                        if (_loc5_ == class_1155.const_498) {
                            _loc7_ = "msg_grp_inv_timeout_checked_candidate";
                            _loc8_ = "%inviter%";
                            _loc9_ = _loc11_.method_3057().var_5016;
                            _loc10_ = false;
                            break;
                        }
                        break;
                }
            }
            if (!_loc10_) {
                sendNotification(GuiNotifications.WRITE_TO_LOG, new LogMessageVO(class_88.getItem(_loc7_).replace(_loc8_, _loc9_)));
            }
        }
        sendNotification(GroupSystemNotification.REMOVE_INVITATION_UI, new class_1152(_loc4_, _loc5_));
        sendNotification(GroupSystemNotification.UPDATE_UI, this.group);
        delete this.var_2504[_loc6_];
    }

    public function get method_2251(): Boolean {
        return this.var_1111;
    }

    public function set method_2251(param1: Boolean): void {
        this.var_1111 = param1;
        sendNotification(GroupSystemNotification.UPDATE_UI_PING_MODE, this.var_1111);
    }

    public function cleanup(): void {
        setData(null);
    }

    public function method_3588(): void {
        var _loc1_: * = null;
        for each(_loc1_ in this.var_2504) {
            this.method_6350(_loc1_.method_3057().id, _loc1_.method_4059().id);
        }
        this.var_2504 = new Dictionary();
    }

    public function method_4571(): void {
        sendNotification(GroupSystemNotification.RELATED_DATA_CHANGED);
    }
}
}
