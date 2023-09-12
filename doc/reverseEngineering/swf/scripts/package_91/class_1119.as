package package_91 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

public class class_1119 extends AsyncCommand {


    public function class_1119() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        commandComplete();
    }
}
}
