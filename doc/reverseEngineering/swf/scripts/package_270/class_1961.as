package package_270 {

import net.bigpoint.darkorbit.class_9;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_133.class_1849;

import package_22.class_198;

import package_84.class_243;

public class class_1961 extends class_243 {


    public function class_1961() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: class_1849 = param1.getBody() as class_1849;
        if (_loc2_.isActive) {
            class_198.method_3975(class_9.var_2751, class_9.var_2751.patterns.laserDefinitionsAprilsFools as XMLList);
        } else {
            class_198.method_3975(class_9.var_2751, class_9.var_2751.patterns.laserDefinitions as XMLList);
        }
    }
}
}
