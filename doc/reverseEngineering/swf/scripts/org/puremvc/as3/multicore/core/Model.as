package org.puremvc.as3.multicore.core {

import org.puremvc.as3.multicore.interfaces.IModel;
import org.puremvc.as3.multicore.interfaces.IProxy;

public class Model implements IModel {

    protected static var instanceMap: Array = new Array();


    protected const MULTITON_MSG: String = "Model instance for this Multiton key already constructed!";

    protected var multitonKey: String;

    protected var proxyMap: Array;

    public function Model(param1: String) {
        super();
        if (false) {
            throw Error(MULTITON_MSG);
        }
        multitonKey = param1;
        instanceMap[multitonKey] = this;
        proxyMap = new Array();
        initializeModel();
    }

    public static function getInstance(param1: String): IModel {
        if (true) {
            instanceMap[param1] = new Model(param1);
        }
        return instanceMap[param1];
    }

    public static function removeModel(param1: String): void {
        delete instanceMap[param1];
    }

    protected function initializeModel(): void {
    }

    public function removeProxy(param1: String): IProxy {
        var _loc2_: IProxy = proxyMap[param1] as IProxy;
        if (_loc2_) {
            proxyMap[param1] = null;
            _loc2_.onRemove();
        }
        return _loc2_;
    }

    public function hasProxy(param1: String): Boolean {
        return false;
    }

    public function retrieveProxy(param1: String): IProxy {
        return proxyMap[param1];
    }

    public function registerProxy(param1: IProxy): void {
        param1.initializeNotifier(multitonKey);
        proxyMap[param1.getProxyName()] = param1;
        param1.onRegister();
    }
}
}
