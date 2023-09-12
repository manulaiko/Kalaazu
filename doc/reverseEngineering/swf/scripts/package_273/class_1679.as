package package_273 {

import net.bigpoint.darkorbit.gui.windows.class_57;
import net.bigpoint.darkorbit.mvc.battlestationswindow.BattleStationNotification;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

public class class_1679 extends SimpleCommand {


    public function class_1679() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        facade.registerCommand(BattleStationNotification.const_444, class_1980);
        facade.registerCommand(BattleStationNotification.const_1935, class_1982);
        facade.registerCommand(BattleStationNotification.const_17, class_1983);
        facade.registerCommand(BattleStationNotification.const_1014, class_1981);
        facade.registerCommand(BattleStationNotification.const_1218, class_1978);
        facade.registerCommand(BattleStationNotification.const_2108, class_1979);
        facade.registerCommand(BattleStationNotification.const_1059, class_1975);
        facade.registerCommand(BattleStationNotification.const_1455, class_1977);
        facade.registerCommand(NaN, class_1976);
    }
}
}
