package package_187 {

import net.bigpoint.darkorbit.map.model.ship.class_86;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_108.GroupProxy;

import package_84.class_243;

public class class_1924 extends class_243 {


    public function class_1924() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc3_: int = 0;
        var _loc4_: * = null;
        var _loc2_: GroupProxy = facade.retrieveProxy(GroupProxy.NAME) as GroupProxy;
        if (_loc2_) {
            _loc3_ = int(param1.getBody());
            if (_loc4_ = map.method_327(_loc3_) as class_86) {
                _loc4_.name_166.value = _loc2_.name_166(_loc3_);
                if (_loc4_.pet != null) {
                    _loc4_.pet.name_166.value = _loc4_.name_166.value;
                }
            }
        }
    }
}
}
