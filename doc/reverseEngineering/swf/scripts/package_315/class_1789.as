package package_315 {

import net.bigpoint.darkorbit.mvc.hintSystem.model.class_2260;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_224.class_1277;

import package_314.class_2258;
import package_314.class_2259;
import package_314.class_2263;

import package_388.HintSystemNotifications;

import package_389.class_2257;

import package_390.class_2262;

import package_391.HintSystemHintOverviewWindowMediator;

public class class_1789 extends SimpleCommand {


    private var var_4957: Class;

    public function class_1789() {
        super();
    }

    override public function execute(param1: INotification): void {
        if (!facade.hasMediator(class_2257.NAME)) {
            facade.registerMediator(new class_2257());
        }
        if (!facade.hasMediator(HintSystemHintOverviewWindowMediator.NAME)) {
            facade.registerMediator(new HintSystemHintOverviewWindowMediator());
        }
        if (!facade.hasProxy(class_2260.NAME)) {
            facade.registerProxy(new class_2260());
        }
        if (!facade.hasCommand(HintSystemNotifications.const_2533)) {
            facade.registerCommand(HintSystemNotifications.const_2533, class_2263);
        }
        if (!facade.hasCommand(HintSystemNotifications.const_2428)) {
            facade.registerCommand(HintSystemNotifications.const_2428, class_2258);
        }
        if (!facade.hasCommand(HintSystemNotifications.const_888)) {
            facade.registerCommand(HintSystemNotifications.const_888, class_1277);
        }
        if (!facade.hasCommand(HintSystemNotifications.const_2008)) {
            facade.registerCommand(HintSystemNotifications.const_2008, class_1788);
        }
        if (!facade.hasCommand(HintSystemNotifications.const_3228)) {
            facade.registerCommand(HintSystemNotifications.const_3228, class_2259);
        }
        if (!facade.hasCommand(HintSystemNotifications.const_211)) {
            facade.registerCommand(HintSystemNotifications.const_211, class_2262);
        }
    }
}
}
