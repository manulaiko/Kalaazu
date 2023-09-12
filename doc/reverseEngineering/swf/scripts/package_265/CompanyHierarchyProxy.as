package package_265 {

import mx.collections.ArrayList;

import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.mvc.companyhierarchy.class_1936;

import org.puremvc.as3.multicore.interfaces.IProxy;
import org.puremvc.as3.multicore.patterns.proxy.Proxy;

public class CompanyHierarchyProxy extends Proxy implements IProxy {

    public static const NAME: String = "CompanyHierarchyProxy";


    private var var_928: Vector.<ArrayList>;

    public function CompanyHierarchyProxy() {
        super(NAME);
        this.var_928 = new Vector.<ArrayList>();
    }

    public function method_4955(param1: int): void {
        sendNotification(class_1936.const_60, this.var_928[param1]);
    }

    public function method_4480(param1: Vector.<ArrayList>, param2: int): void {
        if (param2 == 0) {
            param2 = 0;
        }
        this.var_928 = param1;
        facade.sendNotification(class_1936.const_774, param2);
    }
}
}
