package net.bigpoint.darkorbit.mvc.common.sounds.controller {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_27.class_82;

import package_38.class_834;

public class PlaySoundTriggerModuleCommand extends SimpleCommand {


    public function PlaySoundTriggerModuleCommand() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: class_834 = param1.getBody() as class_834;
        if (_loc2_.name_92) {
            class_82.playSoundEffect(_loc2_.name_137);
        }
    }
}
}
