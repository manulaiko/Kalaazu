package package_94 {

import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_11.class_38;

public class class_1125 extends AsyncCommand {


    public function class_1125() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: AssetsProxy = facade.retrieveProxy(AssetsProxy.NAME) as AssetsProxy;
        _loc2_.load("disablingPepper", this.method_919, this.method_75);
    }

    protected function method_919(param1: class_38): void {
        commandComplete();
    }

    protected function method_75(param1: class_38): void {
        commandComplete();
    }
}
}
