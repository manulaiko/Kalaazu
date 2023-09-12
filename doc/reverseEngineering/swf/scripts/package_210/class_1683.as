package package_210 {

import net.bigpoint.darkorbit.mvc.sectorControlWindow.SectorControlWindowNotifications;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

public class class_1683 extends SimpleCommand {


    public function class_1683() {
        super();
    }

    override public function execute(param1: INotification): void {
        facade.registerCommand(SectorControlWindowNotifications.const_3040, class_1994);
        facade.registerCommand(SectorControlWindowNotifications.const_107, class_1992);
        facade.registerCommand(SectorControlWindowNotifications.const_561, class_1993);
        facade.registerCommand(SectorControlWindowNotifications.const_2275, class_1991);
    }
}
}
