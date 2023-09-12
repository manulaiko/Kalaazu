package package_276 {

import org.puremvc.as3.multicore.interfaces.ICommand;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_265.CompanyHierarchyProxy;

public class class_1990 extends SimpleCommand implements ICommand {


    public function class_1990() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: CompanyHierarchyProxy = facade.retrieveProxy(CompanyHierarchyProxy.NAME) as CompanyHierarchyProxy;
        _loc2_.method_4955(param1.getBody() as int);
    }
}
}
