package package_124 {

import net.bigpoint.darkorbit.gui.windows.class_57;
import net.bigpoint.darkorbit.map.model.traits.class_1180;
import net.bigpoint.darkorbit.mvc.common.utils.TextUtils;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;

import package_29.class_84;

import package_322.QuestGiver;

import package_329.class_1823;
import package_329.class_1824;
import package_329.class_1825;
import package_329.class_1826;
import package_329.class_1827;
import package_329.class_1828;
import package_329.class_1829;
import package_329.class_1830;
import package_329.class_1831;
import package_329.class_1832;

import package_37.ICommand;
import package_37.class_170;

import package_38.class_451;
import package_38.class_561;

import package_80.QuestProxy;

import package_81.class_237;

import package_9.class_50;

public class class_1430 extends class_170 {


    public function class_1430() {
        super();
    }

    public static function run(param1: ICommand): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc2_: class_451 = param1 as class_451;
        var _loc3_: class_84 = class_50.getInstance().map.method_328(class_1180);
        for each(_loc4_ in _loc3_.traits) {
            if (_loc4_.owner is QuestGiver) {
                _loc4_.enabled.value = false;
            }
        }
        for each(_loc5_ in _loc2_.var_4776) {
            if (_loc7_ = map.method_5806(_loc5_.var_2772, class_1180) as class_1180) {
                _loc7_.method_3611(true, TextUtils.getTooltipText(_loc5_.toolTip, true));
            }
        }
        if (!(_loc6_ = var_271.retrieveProxy(QuestProxy.NAME) as QuestProxy)) {
            var_271.registerProxy(new QuestProxy(QuestProxy.NAME));
            (_loc6_ = var_271.retrieveProxy(QuestProxy.NAME) as QuestProxy).method_5755(var_574.method_6154());
            _loc6_.method_5808(var_574.method_2732());
            var_271.registerCommand(class_237.const_1272, class_1829);
            var_271.registerCommand(class_237.ACCEPT_QUEST, class_1825);
            var_271.registerCommand(class_237.ABORT_QUEST, class_1831);
            var_271.registerCommand(class_237.const_2749, class_1824);
            var_271.registerCommand(class_237.const_1661, class_1830);
            var_271.registerCommand(class_237.const_1678, class_1823);
            var_271.registerCommand(class_237.const_2117, class_1828);
            var_271.registerCommand(class_237.const_1919, class_1832);
            var_271.registerCommand(class_237.const_854, class_1827);
            var_271.registerCommand(NaN, class_1826);
        }
    }
}
}
