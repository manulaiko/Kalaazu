package package_210 {

import net.bigpoint.darkorbit.mvc.sectorControlWindow.view.class_265;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_11.class_39;

import package_9.ResourceManager;

public class class_1991 extends AsyncCommand {


    public function class_1991() {
        super();
    }

    override public function execute(param1: INotification): void {
        ResourceManager.method_1412(class_265.name_129, this.method_919, this.method_75);
    }

    protected function method_919(param1: class_39): void {
        commandComplete();
    }

    protected function method_75(param1: class_39): void {
        commandComplete();
    }
}
}
