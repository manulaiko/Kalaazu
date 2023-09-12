package package_207 {

import com.bigpoint.utils.class_129;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_38.class_678;

public class class_1253 extends SimpleCommand {

    private static const const_2592: RegExp = /%LOSER%/;

    private static const const_2154: RegExp = /%WINNER%/;

    private static const const_1781: RegExp = /%POINTS_WINNER%/;

    private static const const_2511: RegExp = /%POINTS_LOSER%/;

    private static const time: RegExp = /%TIME%/;


    public function class_1253() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: class_678 = param1.getBody() as class_678;
        var _loc3_: class_126 = class_126.getInstance();
        var _loc4_: String = _loc3_.method_2276[_loc2_.var_956.faction];
        var _loc5_: String = _loc3_.method_2276[_loc2_.var_4363.faction];
        var _loc6_: String = class_129.method_1101(_loc2_.var_3681);
        var _loc7_: String = (_loc7_ = class_88.getItem("tdm_result_msg")).replace(const_2592, _loc4_).replace(const_2154, _loc5_).replace(const_1781, _loc2_.var_2682).replace(const_2511, _loc2_.var_1843).replace(time, _loc6_);
        sendNotification(GuiNotifications.WRITE_NOTIFICATION, _loc7_);
    }
}
}
