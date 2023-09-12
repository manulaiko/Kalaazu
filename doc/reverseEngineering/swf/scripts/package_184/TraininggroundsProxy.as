package package_184 {

import com.bigpoint.utils.class_122;

import flash.utils.Dictionary;
import flash.utils.clearTimeout;
import flash.utils.setTimeout;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.mvc.gui.abstract.model.DOAbstractProxy;
import net.bigpoint.darkorbit.net.HeroNotifications;

import org.puremvc.as3.multicore.interfaces.IProxy;

import package_127.class_356;

import package_256.class_1649;

import package_257.class_1651;
import package_257.class_1656;

import package_258.class_1655;
import package_258.class_1657;

import package_38.class_435;
import package_38.class_563;
import package_38.class_584;
import package_38.class_609;
import package_38.class_620;
import package_38.class_637;
import package_38.class_639;
import package_38.class_673;
import package_38.class_760;
import package_38.class_811;
import package_38.class_824;
import package_38.class_884;

public class TraininggroundsProxy extends DOAbstractProxy implements IProxy {

    public static const NAME: String = "TraininggroundsProxy";

    private static var var_1490: int;


    private var var_4166: class_609 = null;

    private var var_4392: class_609 = null;

    private const const_1738: Dictionary = new Dictionary();

    private var var_1794: class_1653;

    private var var_2085: class_1648;

    private var var_4551: uint;

    public function TraininggroundsProxy() {
        this.var_2085 = new class_1648();
        super(NAME, null);
        this.const_1738[class_609.const_1511] = this.method_582;
        this.const_1738[class_609.const_1109] = this.method_2046;
        this.const_1738[class_609.const_3184] = this.method_2608;
        this.const_1738[class_609.const_789] = this.method_369;
        this.const_1738[class_609.const_550] = this.method_4839;
        this.const_1738[class_609.const_1387] = this.method_2571;
        this.const_1738[class_609.const_1086] = this.method_486;
    }

    override public function onRegister(): void {
        super.onRegister();
        this.var_2085.method_1545.changed.add(this.method_4642);
        this.method_4642();
        var_1490 = class_90.method_5486;
        facade.registerCommand(class_1657.REPROCESS_CACHED_DATA, class_1651);
        facade.registerCommand(class_1655.REPROCESS_CACHED_DATA, class_1656);
    }

    override public function onRemove(): void {
        this.var_2085.method_1545.changed.remove(this.method_4642);
        this.var_2085.method_1545.value = this.var_2085.method_1545.minValue;
        super.onRemove();
    }

    private function method_4642(): void {
        sendNotification(class_1657.UPDATE_SEASON_TIME, this.var_2085);
    }

    public function method_6451(param1: class_609): void {
        if (param1.var_2454 == class_609.const_1086) {
            this.var_4392 = param1;
        } else {
            this.var_4166 = param1;
        }
    }

    public function updateView(): void {
        if (this.var_4166) {
            this.method_3230(this.var_4166, false);
        }
        this.method_679();
    }

    public function method_1950(): void {
        if (this.var_4392) {
            this.method_3230(this.var_4392, false);
        }
    }

    public function method_3230(param1: class_609, param2: Boolean = true): void {
        if (param2) {
            this.method_6451(param1);
        }
        facade.removeCommand(HeroNotifications.HERO_DIED);
        this.const_1738[param1.var_2454](param1);
        if (param1.var_2454 != class_609.const_1387) {
            this.method_308();
        }
    }

    private function method_308(): void {
        if (this.var_1794) {
            map.removeEntity(this.var_1794);
        }
    }

    private function method_486(param1: class_609): void {
        var _loc4_: * = null;
        var _loc5_: Number = 0;
        var _loc6_: * = null;
        var _loc7_: * = null;
        sendNotification(class_1655.CREATE_WINDOW);
        var _loc2_: class_811 = param1.var_1324 as class_811;
        var _loc3_: Vector.<Vector.<String>> = new Vector.<Vector.<String>>();
        if (_loc2_) {
            for each(_loc4_ in _loc2_.var_4531) {
                _loc6_ = new Vector.<String>();
                _loc7_ = class_126.getInstance().var_2033[_loc4_.lootId] as class_356;
                _loc6_.push(!!_loc7_ ? _loc7_.name : _loc4_.lootId);
                _loc6_.push(_loc4_.amount.toString());
                _loc3_.push(_loc6_);
            }
            if (_loc2_.var_3065 == class_811.const_2032) {
                _loc5_ = 0;
            } else if (_loc2_.var_3065 == class_811.const_1328) {
                _loc5_ = 0;
            } else if (_loc2_.var_3065 == class_811.const_474) {
                _loc5_ = 0;
            }
            sendNotification(class_1655.const_51, new class_1654(_loc5_, _loc2_.name_158, _loc2_.var_2568, _loc2_.var_371, class_122.round(_loc2_.playerScore), class_122.round(_loc2_.var_3651), _loc3_));
        }
    }

    private function method_2571(param1: class_609): void {
        var _loc2_: * = null;
        this.method_308();
        this.var_1794 = new class_1653();
        map.method_4903(this.var_1794);
        this.method_332();
        facade.registerCommand(HeroNotifications.HERO_DIED, class_1649);
        sendNotification(class_1657.const_2570, class_1650.const_1469);
        if (param1.var_1324 is class_673) {
            _loc2_ = param1.var_1324 as class_673;
            sendNotification(class_1657.UPDATE_FIGHT_PHASE_INFO, new class_1652(_loc2_.name_158, _loc2_.name_152, _loc2_.var_970, _loc2_.var_546.name_6, _loc2_.var_546.name_46, _loc2_.var_546.name_80, _loc2_.var_546.name_66, _loc2_.var_546.name_165, _loc2_.var_546.name_68, _loc2_.var_546.name_57, _loc2_.var_546.name_125, _loc2_.var_546.name_138, _loc2_.var_546.name_86, _loc2_.var_2313.var_276, _loc2_.name_168));
        }
    }

    private function method_332(): void {
        sendNotification(GuiNotifications.CLOSE_WINDOW_BY_ID, GuiConstants.TRAINING_GROUNDS_RESULTS_WINDOW);
    }

    private function method_4839(param1: class_609): void {
        var _loc2_: * = null;
        sendNotification(class_1657.const_2570, class_1650.const_242);
        if (param1.var_1324 is class_620) {
            _loc2_ = param1.var_1324 as class_620;
            sendNotification(class_1657.UPDATE_PREPARATION_PHASE_INFO, [_loc2_.timer, _loc2_.var_4445.var_409]);
        }
    }

    private function method_369(param1: class_609): void {
        var _loc2_: * = null;
        sendNotification(class_1657.const_2570, class_1650.const_1568);
        if (param1.var_1324 is class_760) {
            _loc2_ = param1.var_1324 as class_760;
            sendNotification(class_1657.UPDATE_CONFIRMATION_PHASE_INFO, [_loc2_.timer, _loc2_.var_2481.var_409]);
        }
    }

    private function method_2608(param1: class_609): void {
        sendNotification(class_1657.const_2570, class_1650.const_1187);
    }

    private function method_2046(param1: class_609): void {
        var _loc2_: * = null;
        sendNotification(class_1657.const_2570, class_1650.const_2084);
        if (param1.var_1324 is class_639) {
            _loc2_ = param1.var_1324 as class_639;
            this.method_5721(_loc2_.rank);
            this.method_1583(_loc2_.name_124);
            this.method_3669(_loc2_.name_60);
        }
    }

    private function method_582(param1: class_609): void {
        sendNotification(class_1657.const_2570, class_1650.DISABLED);
        var _loc2_: String = class_88.getItem(class_126.getInstance().var_1044[(param1.var_1324 as class_435).type]);
        sendNotification(class_1657.UPDATE_DISABLED_REASON, _loc2_);
    }

    public function get method_6141(): class_1653 {
        return this.var_1794;
    }

    public function method_786(param1: class_637): void {
        this.var_2085.rank = param1.rank;
        this.var_2085.name_124 = param1.name_168;
        this.method_679();
    }

    public function method_3669(param1: class_584): void {
        this.var_2085.name_60 = param1.name_60;
        this.method_679();
    }

    public function method_5721(param1: class_884): void {
        this.var_2085.name_143 = param1.name_143;
        this.var_2085.rank = param1.rank;
        this.var_2085.name_121 = param1.name_121;
        this.var_2085.method_5956 = param1.points;
        this.method_679();
    }

    public function method_1583(param1: class_824): void {
        this.var_2085.name_124 = param1.name_168;
        this.var_2085.method_1545.value = param1.var_3870;
        this.var_2085.rewards = param1.var_4531;
        this.method_679();
    }

    private function method_679(): void {
        clearTimeout(this.var_4551);
        this.var_4551 = setTimeout(sendNotification, 1, class_1657.UPDATE_REGISTRATION_PHASE_INFO, this.var_2085);
    }
}
}
