package package_276 {

import net.bigpoint.darkorbit.mvc.companyhierarchy.class_1936;

import org.puremvc.as3.multicore.interfaces.ICommand;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

public class class_1682 extends SimpleCommand implements ICommand {


    public function class_1682() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        facade.registerCommand(class_1936.const_774, class_1990);
    }
}
}
