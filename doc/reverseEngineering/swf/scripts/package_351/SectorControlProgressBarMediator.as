package package_351 {

import com.greensock.TweenLite;

import net.bigpoint.as3toolbox.bplocale.class_88;
import net.bigpoint.darkorbit.net.HeroNotifications;

import org.puremvc.as3.multicore.interfaces.IMediator;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.mediator.Mediator;

import package_135.class_391;

import package_274.class_1987;

import package_313.class_1786;

import package_350.class_1984;

import package_38.class_439;

import package_98.MapNotification;

public class SectorControlProgressBarMediator extends Mediator implements IMediator {

    public static const NAME: String = "SectorControlProgressBarMediator";


    private var var_1129: int = -1;

    private var var_436: int = -1;

    public function SectorControlProgressBarMediator(param1: class_1984) {
        super(NAME, param1);
    }

    private function get view(): class_1984 {
        return getViewComponent() as class_1984;
    }

    override public function onRemove(): void {
        this.removeView();
        super.onRemove();
        facade.registerCommand(class_391.INIT, class_1987);
    }

    private function removeView(): void {
        if (Boolean(this.view) && Boolean(this.view.parent)) {
            this.view.parent.removeChild(this.view);
        }
    }

    override public function setViewComponent(param1: Object): void {
        this.removeView();
        super.setViewComponent(param1);
    }

    override public function listNotificationInterests(): Array {
        return [class_391.const_2951, MapNotification.CLEANUP, HeroNotifications.HERO_DIED];
    }

    override public function handleNotification(param1: INotification): void {
        var _loc2_: * = null;
        var _loc3_: int = 0;
        var _loc4_: * = null;
        var _loc5_: * = false;
        switch (param1.getName()) {
            case class_391.const_2951:
                _loc2_ = param1.getBody() as class_1786;
                if (this.var_1129 != _loc2_.faction) {
                    this.view.method_5064(_loc2_.faction);
                    this.var_1129 = _loc2_.faction;
                }
                _loc3_ = 0;
                if (_loc2_.progress >= 100) {
                    _loc3_ = int(_loc2_.faction);
                }
                if (this.var_436 != _loc3_) {
                    this.view.method_1427(_loc3_);
                    this.var_436 = _loc3_;
                }
                _loc4_ = "";
                switch (_loc2_.direction) {
                    case class_1786.const_2051:
                        if (_loc2_.progress < 100) {
                            _loc4_ = class_88.getItem("sectorcontrol_progressbar_neutralizing_capitals");
                            break;
                        }
                        break;
                    case class_1786.const_2013:
                        if (_loc2_.progress > 0) {
                            _loc4_ = class_88.getItem("sectorcontrol_progressbar_conquering_capitals");
                            break;
                        }
                        break;
                    default:
                        _loc4_ = "";
                }
                this.view.text.text = _loc4_;
                _loc5_ = _loc2_.var_4941 != null;
                if (_loc2_.var_4941 != null) {
                    TweenLite.to(this.view.bar, 0.5, {
                        "scaleX": Number(_loc2_.progress) / 100,
                        "onComplete": this.method_4002,
                        "onCompleteParams": [_loc5_]
                    });
                    break;
                }
                TweenLite.to(this.view.bar, 0.5, {"scaleX": Number(_loc2_.progress) / 100});
                this.method_4002(_loc5_);
                break;
            case MapNotification.CLEANUP:
            case HeroNotifications.HERO_DIED:
                this.method_4002(false);
        }
    }

    private function method_4002(param1: Boolean): void {
        this.view.visible = param1;
    }
}
}
