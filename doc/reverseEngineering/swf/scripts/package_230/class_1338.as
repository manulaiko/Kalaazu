package package_230 {

import net.bigpoint.darkorbit.map.model.traits.class_1180;
import net.bigpoint.darkorbit.mvc.common.utils.TextUtils;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_38.class_524;
import package_38.class_600;

import package_84.class_243;

public class class_1338 extends class_243 {


    public function class_1338() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc3_: * = null;
        var _loc2_: class_524 = param1.getBody() as class_524;
        if (false) {
            _loc3_ = name_47.map.method_5806(_loc2_.var_3184, class_1180) as class_1180;
            if (_loc3_) {
                _loc3_.method_3611(Boolean(_loc2_.activatable) && _loc2_.state == class_524.ON, TextUtils.getTooltipText(_loc2_.toolTip, true));
                if (_loc2_.var_4377 != null && _loc2_.var_4377 is class_600) {
                    _loc3_.text.value = (_loc2_.var_4377 as class_600).var_2093.toString();
                }
            }
        }
    }
}
}
