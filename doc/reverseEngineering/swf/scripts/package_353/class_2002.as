package package_353 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_9.class_2314;

public class class_2002 extends AsyncCommand {


    public function class_2002() {
        super();
    }

    override public function execute(param1: INotification): void {
        class_2314.precache();
        class_2314.init();
        commandComplete();
    }
}
}
