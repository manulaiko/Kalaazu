package package_68 {

import net.bigpoint.darkorbit.settings.Settings;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_63.ChatNotifications;

public class class_211 extends SimpleCommand {


    public function class_211() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: String = "null";
        if (_loc2_ == "dev") {
            _loc2_ = "de";
        }
        if (_loc2_ == "br") {
            _loc2_ = "pt";
        }
        if (_loc2_ == "us") {
            _loc2_ = "en";
        }
        if (_loc2_ == "mx") {
            _loc2_ = "es";
        }
        if (_loc2_ == "sk") {
            _loc2_ = "cs";
        }
        sendNotification(ChatNotifications.const_2611, _loc2_);
    }
}
}
