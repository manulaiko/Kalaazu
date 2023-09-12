package net.bigpoint.darkorbit.mvc.common.model {

import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
import net.bigpoint.darkorbit.net.class_53;

import org.puremvc.as3.multicore.interfaces.IProxy;
import org.puremvc.as3.multicore.patterns.proxy.Proxy;

import package_37.ICommand;

public class ConnectionProxy extends Proxy implements IProxy {

    public static const NAME: String = "ConnectionProxy";


    public function ConnectionProxy() {
        super(NAME, null);
    }

    override public function setData(param1: Object): void {
        super.setData(param1);
        sendNotification(ConnectionNotifications.READY);
    }

    public function get connectionManager(): class_53 {
        return data as class_53;
    }

    public function sendCommand(param1: String, param2: Array = null): void {
        this.connectionManager.sendCommand(param1, param2);
    }

    public function sendNettyRequest(param1: ICommand): void {
        this.connectionManager.sendRequest(param1);
    }

    public function connectToMap(param1: int): void {
        this.connectionManager.connectToMap(param1);
    }

    public function handleVersionResponce(param1: Boolean, param2: int, param3: int, param4: int): void {
        this.connectionManager.method_171(param1, param2, param3, param4);
    }
}
}
