package package_86 {

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_185.class_1113;

import package_259.class_1658;

public class class_1671 extends SimpleCommand {


    public function class_1671() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        if (!facade.hasProxy(class_1113.NAME)) {
            facade.registerProxy(new class_1113());
        }
        facade.registerCommand(class_1658.const_2827, class_1959);
        facade.registerCommand(class_1658.const_2135, class_1958);
        facade.registerCommand(class_1658.const_1562, class_1957);
        facade.registerCommand(class_1658.const_3276, class_1951);
        facade.registerCommand(class_1658.CREATE_WINDOW, class_1949);
        facade.registerCommand(class_1658.const_179, class_1960);
        facade.registerCommand(class_1658.const_1981, class_1945);
        facade.registerCommand(class_1658.const_1499, class_1948);
        facade.registerCommand(class_1658.const_2233, class_1952);
        facade.registerCommand(class_1658.const_879, class_1944);
        facade.registerCommand(class_1658.const_243, class_1946);
        facade.registerCommand(class_1658.const_2009, class_1947);
        facade.registerCommand(class_1658.const_2722, class_1955);
        facade.registerCommand(class_1658.const_2310, class_1943);
        facade.registerCommand(class_1658.const_926, class_1954);
        facade.registerCommand(class_1658.const_18, class_1953);
        facade.registerCommand(class_1658.const_3277, class_1956);
        facade.registerCommand(class_1658.const_2389, class_1950);
    }
}
}
