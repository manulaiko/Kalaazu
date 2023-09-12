package package_87 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_202.class_1670;

public class class_1129 extends AsyncCommand {


    public function class_1129() {
        super();
    }

    override public function execute(param1: INotification): void {
        this.method_566();
        this.commandComplete();
    }

    private function method_566(): void {
        class_1670.const_3234[6] = 97;
        class_1670.const_3234[7] = 98;
        class_1670.const_3234[8] = 99;
        class_1670.const_3234[9] = 46;
        class_1670.const_3234[10] = 65;
    }
}
}
