package package_220 {

import package_108.GroupProxy;

import package_264.GroupSystemMediator;

import package_84.class_243;

public class class_1270 extends class_243 {


    public function class_1270() {
        super();
    }

    protected function get method_625(): GroupSystemMediator {
        return facade.retrieveMediator(GroupSystemMediator.NAME) as GroupSystemMediator;
    }

    protected function get method_2479(): GroupProxy {
        return facade.retrieveProxy(GroupProxy.NAME) as GroupProxy;
    }
}
}
