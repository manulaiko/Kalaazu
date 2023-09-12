package package_273 {

import net.bigpoint.darkorbit.mvc.battlestationswindow.BattleStationNotification;
import net.bigpoint.darkorbit.mvc.battlestationswindow.class_1023;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_163.BattleStationProxy;
import package_163.class_1520;
import package_163.class_1908;

import package_59.BattleStationWindowViewMediator;

public class class_1977 extends SimpleCommand {


    public function class_1977() {
        super();
    }

    override public function execute(param1: INotification): void {
        this.method_897.name_156.filterFunction = this.filter;
        this.method_897.name_156.refresh();
        sendNotification(BattleStationNotification.const_2077, this.method_897.name_156, class_1023.const_2503);
    }

    private function filter(param1: class_1520): Boolean {
        return this.method_3996(param1.category);
    }

    private function method_3996(param1: String): Boolean {
        var _loc2_: * = null;
        for each(_loc2_ in this.method_897.method_4562) {
            if (_loc2_.category == param1) {
                return _loc2_.selected;
            }
        }
        return false;
    }

    protected function get method_897(): BattleStationProxy {
        return facade.retrieveProxy(BattleStationProxy.NAME) as BattleStationProxy;
    }

    private function get method_2993(): BattleStationWindowViewMediator {
        return facade.retrieveProxy(BattleStationWindowViewMediator.NAME) as BattleStationWindowViewMediator;
    }
}
}
