package package_87 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_202.class_1670;

public class class_1130 extends AsyncCommand {


    public function class_1130() {
        super();
    }

    override public function execute(param1: INotification): void {
        this.method_1263();
        this.commandComplete();
    }

    private function method_1263(): void {
        class_1670.const_1561[0] = 70;
        class_1670.const_1561[5] = 2;
    }
}
}
