package package_180 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_179.class_1098;

import package_57.SoundToolMediator;

public class class_1099 extends SimpleCommand {


    public function class_1099() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        facade.registerMediator(new SoundToolMediator());
        facade.registerCommand(class_1098.PRE_TEST_SOUND_CONFIGURATION, class_1565);
        facade.registerCommand(class_1098.TEST_SOUND_CONFIGURATION, class_1566);
        facade.removeCommand(class_1098.SHOW_SOUND_CONFIGURATION);
    }
}
}
