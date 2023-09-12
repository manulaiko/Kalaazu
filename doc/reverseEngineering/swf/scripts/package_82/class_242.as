package package_82 {

import org.puremvc.as3.multicore.interfaces.ICommand;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_97.class_257;

public class class_242 extends SimpleCommand implements ICommand {


    public function class_242() {
        super();
    }

    override public function execute(param1: INotification): void {
        facade.registerCommand(class_257.const_2074, class_1112);
    }
}
}
