package package_180 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_22.class_198;

import package_27.class_1007;

import package_57.SoundToolMediator;

import package_9.ResourceManager;

public class class_1565 extends SimpleCommand {


    public function class_1565() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        super.execute(param1);
        var _loc2_: SoundToolMediator = facade.retrieveMediator(SoundToolMediator.NAME) as SoundToolMediator;
        _loc2_.method_4199();
        _loc2_.writeToLog("===LOAD ALL THE SOUNDS===\n");
        for each(_loc3_ in class_198.var_3286) {
            ResourceManager.name_15.load(_loc3_.soundbank);
            _loc2_.writeToLog(_loc3_.soundbank + " loaded\n");
        }
        for each(_loc4_ in class_198.var_4756) {
            ResourceManager.name_15.load(_loc4_.soundbank);
            _loc2_.writeToLog(_loc4_.soundbank + " loaded\n");
        }
    }
}
}
