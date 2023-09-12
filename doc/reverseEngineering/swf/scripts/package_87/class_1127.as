package package_87 {

import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.mvc.common.model.ConnectionProxy;
import net.bigpoint.darkorbit.net.class_53;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_268.class_1668;

import package_42.SystemManagerProxy;

public class class_1127 extends AsyncCommand {


    private var _loader: class_1668;

    private var _instance: Object;

    public function class_1127() {
        super();
    }

    override public function execute(param1: INotification): void {
        this._loader = new class_1668();
        this._loader.initialize(this.method_1061);
    }

    protected function method_1061(param1: Object): void {
        var _loc2_: ConnectionProxy = facade.retrieveProxy(ConnectionProxy.NAME) as ConnectionProxy;
        var _loc3_: class_53 = _loc2_.connectionManager;
        _loc3_.method_989(param1);
        this._instance = param1;
        var _loc4_: SystemManagerProxy = facade.retrieveProxy(SystemManagerProxy.NAME) as SystemManagerProxy;
        this._instance["initialize"](this.method_5142, _loc4_.method_146().memory, class_81.method_1271);
    }

    protected function method_5142(...rest): void {
        var _loc2_: SystemManagerProxy = facade.retrieveProxy(SystemManagerProxy.NAME) as SystemManagerProxy;
        if (_loc2_.method_3341()) {
            class_81.method_6319();
            commandComplete();
            this._instance = null;
        }
    }
}
}
