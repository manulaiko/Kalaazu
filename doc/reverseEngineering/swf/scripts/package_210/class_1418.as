package package_210 {

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.gui.windows.class_57;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_38.class_944;

import package_50.class_147;

public class class_1418 extends SimpleCommand {


    public function class_1418() {
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc2_: class_944 = param1.getBody() as class_944;
        switch (_loc2_.var_2209) {
            case class_944.const_1028:
                this.method_5372();
                break;
            case class_944.const_3149:
                this.method_5831();
                break;
            case class_944.const_3237:
                this.method_5099();
        }
    }

    private function method_5099(): void {
        var _loc1_: * = null;
        _loc1_ = class_147(class_57.getInstance().createWindow(class_57.const_716, class_57.const_2956));
        _loc1_.title = class_88.getItem("sectorcontrol_popup_queue_full_title");
        _loc1_.method_4130(class_88.getItem("sectorcontrol_popup_queue_full_message"));
    }

    private function method_5372(): void {
        var _loc1_: * = null;
        _loc1_ = class_147(class_57.getInstance().createWindow(class_57.const_716, class_57.const_2956));
        _loc1_.title = class_88.getItem("sectorcontrol_popup_levelrequirement_title");
        _loc1_.method_4130(class_88.getItem("sectorcontrol_popup_levelrequirement_message"));
    }

    private function method_5831(): void {
        var _loc1_: class_147 = class_147(class_57.getInstance().createWindow(class_57.const_716, class_57.const_2956));
        _loc1_.title = class_88.getItem("sectorcontrol_popup_noticketsleft_title");
        _loc1_.method_4130(class_88.getItem("sectorcontrol_popup_noticketsleft_message"));
    }
}
}
