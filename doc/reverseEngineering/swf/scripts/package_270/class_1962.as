package package_270 {

import net.bigpoint.darkorbit.mvc.common.utils.ClassUtils;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_132.class_382;

import package_133.class_1849;
import package_133.class_1850;
import package_133.class_1851;
import package_133.class_1852;
import package_133.class_1853;
import package_133.class_1854;
import package_133.class_1855;
import package_133.class_383;

import package_201.EventNotifications;

public class class_1962 extends SimpleCommand {


    public function class_1962() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: class_382 = param1.getBody() as class_382;
        switch (ClassUtils.getClass(_loc2_)) {
            case class_1850:
                sendNotification(EventNotifications.CHRISTMAS_TREES, _loc2_);
                break;
            case class_1854:
                sendNotification(EventNotifications.FROSTED_GATES, _loc2_);
                break;
            case class_1849:
                sendNotification(EventNotifications.APRILS_FOOLS, _loc2_);
                break;
            case class_1852:
                sendNotification(EventNotifications.MOOD_ASSETS, _loc2_);
                break;
            case class_1853:
                sendNotification(EventNotifications.MOOD_ASSETS_DESTRIBUTION, _loc2_);
                break;
            case class_1855:
                sendNotification(EventNotifications.EXCHANGE_MAP, _loc2_);
                break;
            case class_1851:
                sendNotification(EventNotifications.DEMOLISHED_HQ, _loc2_);
                break;
            case class_383:
                sendNotification(EventNotifications.EVENT_DOMINATION_FACTION, _loc2_);
        }
    }
}
}
