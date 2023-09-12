package package_87 {

import net.bigpoint.darkorbit.settings.Settings;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_13.class_51;

import package_42.ProfileProxy;

public class class_1143 extends AsyncCommand {


    public function class_1143() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: * = "undefinedxml/profile.xml?__cv=undefined";
        if (class_51(param1.getBody()).flashVars.resourcesPath != undefined) {
            _loc2_ = class_51(param1.getBody()).flashVars.resourcesPath + "xml/profile.xml?cv=";
        }
        var _loc3_: ProfileProxy = facade.retrieveProxy(ProfileProxy.NAME) as ProfileProxy;
        _loc3_.load(_loc2_, this.method_4355);
    }

    protected function method_4355(): void {
        this.commandComplete();
    }
}
}
