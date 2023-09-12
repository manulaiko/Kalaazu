package package_207 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_311.TeamDeathMatchPopupNotifications;

import package_38.class_922;

import package_54.TeamDeathMatchErrorPopUpMediator;

public class class_1349 extends SimpleCommand {


    public function class_1349() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: class_922 = param1.getBody() as class_922;
        var _loc3_: uint = uint(_loc2_.var_2209);
        if (!facade.hasMediator(TeamDeathMatchErrorPopUpMediator.NAME)) {
            facade.registerMediator(new TeamDeathMatchErrorPopUpMediator());
        }
        switch (_loc3_) {
            case class_922.const_1028:
                sendNotification(TeamDeathMatchPopupNotifications.OPEN_LEVEL_TOO_LOW_POPUP);
                break;
            case class_922.const_802:
                sendNotification(TeamDeathMatchPopupNotifications.OPEN_MATCH_ENDED_POPUP);
                break;
            case class_922.const_1303:
                sendNotification(TeamDeathMatchPopupNotifications.OPEN_NO_MATCH_FOR_FACTION_POPUP);
        }
    }
}
}
