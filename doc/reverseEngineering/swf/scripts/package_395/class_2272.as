package package_395 {

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.gui.windows.class_57;
import net.bigpoint.darkorbit.mvc.common.view.components.LeaveGamePopUp;

import org.puremvc.as3.multicore.interfaces.IMediator;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_263.TDMStatusProxy;
import package_263.class_1666;

import package_27.class_82;

import package_453.TDMLeaveGamePopUpMediator;

public class class_2272 extends SimpleCommand {


    public function class_2272() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: * = null;
        var _loc4_: * = null;
        var _loc6_: * = null;
        super.execute(param1);
        _loc2_ = class_88.getItem("tdm_popup_leavegame_message");
        var _loc3_: TDMStatusProxy = facade.retrieveProxy(TDMStatusProxy.NAME) as TDMStatusProxy;
        if (_loc3_) {
            if ((_loc6_ = _loc3_.getData() as class_1666).name_101 < _loc6_.name_89) {
                _loc2_ = class_88.getItem("tdm_popup_leavegame_noreward_message");
            } else {
                _loc2_ = class_88.getItem("tdm_popup_leavegame_message");
            }
        }
        if ((_loc4_ = class_57.getInstance().method_4369(class_57.const_1042) as LeaveGamePopUp) == null) {
            (_loc4_ = class_57.getInstance().createWindow(class_57.const_1042, class_57.const_2956) as LeaveGamePopUp).title = class_88.getItem("tdm_popup_leavegame_title");
            _loc4_.message = _loc2_;
            if (_loc4_.visible) {
                class_82.playSoundEffect(class_126.const_1856);
            }
        }
        var _loc5_: IMediator = new TDMLeaveGamePopUpMediator(_loc4_);
        facade.registerMediator(_loc5_);
    }
}
}
