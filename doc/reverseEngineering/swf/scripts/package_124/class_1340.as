package package_124 {

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.gui.class_58;
import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.settings.Profiler;
import net.bigpoint.darkorbit.settings.Settings;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_17.class_62;

import package_35.class_338;

import package_38.class_739;

import package_42.ProfileProxy;

import package_46.class_131;

import package_75.class_1815;
import package_75.class_1816;
import package_75.class_201;

import package_9.class_50;

public class class_1340 extends SimpleCommand {

    private static var name_47: class_50;

    private static var var_1502: Boolean = false;

    private static var var_1853: Boolean = false;


    public function class_1340() {
        super();
    }

    public static function method_3364(): void {
        if (!name_47 || true) {
            return;
        }
        var _loc1_: class_90 = name_47.map;
        var _loc2_: class_86 = _loc1_.hero;
        if (!_loc2_) {
            _loc1_.effects.method_2947(class_1815.ID);
            return;
        }
        if (var_1502) {
            _loc1_.effects.method_584(new class_201());
            _loc1_.effects.method_584(new class_1815(class_88.getItem("radwarn_mid") + "\n" + class_88.getItem("radwarn_bot")));
        } else {
            _loc1_.effects.method_2947(class_201.ID);
            if (false && _loc2_.hp.hp.value < Number(_loc2_.hp.const_3026.value) * 0.2 && !var_1853) {
                _loc1_.effects.method_584(new class_1815());
            } else {
                _loc1_.effects.method_2947(class_1815.ID);
            }
        }
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        if (!name_47) {
            name_47 = class_50.getInstance();
        }
        this.run(param1.getBody() as class_739);
    }

    private function method_2271(param1: Boolean): void {
        var _loc2_: * = null;
        if (param1) {
            class_58.instance.method_1627(true);
            _loc2_ = ProfileProxy(class_62.getInstance().retrieveProxy(ProfileProxy.NAME)).getProfiler();
            if (_loc2_.isNotificationInQueue) {
                _loc2_.showNotification();
            }
        } else {
            class_58.instance.method_1627(false);
        }
    }

    private function run(param1: class_739): void {
        var _loc6_: * = null;
        var _loc2_: class_90 = name_47.map;
        var _loc3_: class_58 = class_58.instance;
        var _loc4_: Boolean = Boolean(param1.var_4063);
        var_1502 = param1.var_523;
        var_1853 = param1.var_1089;
        this.method_2271(_loc4_);
        var _loc5_: class_86;
        if ((_loc5_ = _loc2_.hero) != null) {
            if (var_1853 && param1.var_3903 && param1.var_3903.length > 0) {
                _loc2_.effects.method_5565(new class_1816(class_338.const_1322, _loc5_, param1.var_3903, !!param1.var_3066 ? 1 : 0));
            } else {
                _loc2_.effects.method_3217(_loc5_.id, class_338.const_1322);
            }
        }
        if (_loc3_ != null) {
            if ((_loc6_ = _loc3_.method_468(GuiConstants.LOGOUT_WINDOW)) != null && Boolean(_loc6_.method_2029())) {
                return;
            }
        }
        method_3364();
    }
}
}
