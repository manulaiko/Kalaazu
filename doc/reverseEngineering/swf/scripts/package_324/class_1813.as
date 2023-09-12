package package_324 {

import net.bigpoint.darkorbit.mvc.tdm.lobbyWindow.TeamDeathMatchLobbywindowNotifications;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_331.class_2273;

import package_396.TeamDeathMatchLobbywindowProxy;

import package_397.class_2274;

import package_47.TeamDeathMatchLobbywindowMediator;

import package_54.TeamDeathMatchErrorPopUpMediator;
import package_54.TeamDeathMatchLevelRequirementPopupMediator;
import package_54.TeamDeathMatchParticipationPopupMediator;

public class class_1813 extends SimpleCommand {


    public function class_1813() {
        super();
    }

    override public function execute(param1: INotification): void {
        if (!facade.hasMediator(TeamDeathMatchLobbywindowMediator.NAME)) {
            facade.registerMediator(new TeamDeathMatchLobbywindowMediator());
        }
        if (!facade.hasMediator(TeamDeathMatchLevelRequirementPopupMediator.NAME)) {
            facade.registerMediator(new TeamDeathMatchLevelRequirementPopupMediator());
        }
        if (!facade.hasMediator(TeamDeathMatchParticipationPopupMediator.NAME)) {
            facade.registerMediator(new TeamDeathMatchParticipationPopupMediator());
        }
        if (!facade.hasMediator(TeamDeathMatchErrorPopUpMediator.NAME)) {
            facade.registerMediator(new TeamDeathMatchErrorPopUpMediator());
        }
        if (!facade.hasProxy(TeamDeathMatchLobbywindowProxy.NAME)) {
            facade.registerProxy(new TeamDeathMatchLobbywindowProxy());
        }
        if (!facade.hasCommand(TeamDeathMatchLobbywindowNotifications.const_645)) {
            facade.registerCommand(TeamDeathMatchLobbywindowNotifications.const_645, class_2273);
        }
        if (!facade.hasCommand(TeamDeathMatchLobbywindowNotifications.const_3112)) {
            facade.registerCommand(TeamDeathMatchLobbywindowNotifications.const_3112, class_2274);
        }
    }
}
}
