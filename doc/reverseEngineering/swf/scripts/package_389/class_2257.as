package package_389 {

import flash.display.Bitmap;
import flash.display.DisplayObjectContainer;
import flash.events.Event;
import flash.geom.Point;

import net.bigpoint.darkorbit.fui.components.image.ImageSlideShowElement;
import net.bigpoint.darkorbit.fui.system.modules.IUISetupModule;
import net.bigpoint.darkorbit.mvc.common.view.ScreenNotifications;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_11.class_65;

import package_31.class_92;

import package_38.class_595;

import package_388.HintSystemNotifications;
import package_388.class_2256;

import package_392.class_2265;

import package_447.class_2503;

import package_448.class_2504;
import package_448.class_2505;

import package_9.class_50;

import package_98.MapNotification;

public class class_2257 extends class_92 {

    public static const NAME: String = "HintSystemMediator";

    private static var var_2492: uint = 0;


    private var var_3225: IUISetupModule;

    private var win: class_2502;

    private var name_61: class_2265;

    private var var_3551: Bitmap;

    private var var_517: Bitmap;

    public function class_2257(param1: Object = null) {
        super(NAME, param1);
    }

    override public function onRegister(): void {
    }

    override public function onRemove(): void {
    }

    override public function listNotificationInterests(): Array {
        return [HintSystemNotifications.const_3073, ScreenNotifications.SCREEN_VIEWPORT_RESIZED, MapNotification.CLEANUP];
    }

    override public function handleNotification(param1: INotification): void {
        var _loc3_: * = null;
        super.handleNotification(param1);
        var _loc2_: String = param1.getName();
        switch (_loc2_) {
            case HintSystemNotifications.const_3073:
                _loc3_ = param1.getBody() as class_2265;
                this.method_3828(_loc3_);
                break;
            case ScreenNotifications.SCREEN_VIEWPORT_RESIZED:
                this.method_3986();
                break;
            case MapNotification.CLEANUP:
                if (Boolean(this.win) && Boolean(this.name_61)) {
                    if (this.name_61.method_998) {
                        this.method_2910();
                        break;
                    }
                    break;
                }
        }
    }

    protected function method_3828(param1: class_2265): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        ++var_2492;
        this.method_649.setUp();
        if (this.win) {
            this.method_138();
            this.method_2910();
        }
        this.name_61 = param1;
        this.win = new class_2502();
        this.method_4058();
        this.win.build(param1.method_462);
        var _loc2_: DisplayObjectContainer = this.method_3946();
        _loc2_.addChild(this.win);
        this.method_3986();
        var _loc3_: uint = uint(param1.content.method_4859);
        this.win.show(_loc3_);
        this.win.update(param1);
        if (_loc3_ == class_595.OPEN) {
            this.method_4303();
        }
        if (param1.content.method_3873 != null) {
            _loc4_ = param1.content.method_3873;
            _loc5_ = "null";
            this.method_994(_loc5_, param1, _loc4_);
        }
    }

    private function method_994(param1: String, param2: class_2265, param3: Class): void {
        var _loc4_: class_2504;
        (_loc4_ = new class_2504()).method_3359 = param1;
        _loc4_.name_61 = param2;
        facade.registerCommand(param1, param3);
        facade.sendNotification(param1, _loc4_);
    }

    private function method_4058(): void {
        this.win.addEventListener(class_2502.const_1582, this.method_2365);
        this.win.addEventListener(class_2502.const_1206, this.method_2660);
        this.win.addEventListener(class_2502.const_3159, this.method_4166);
        this.win.addEventListener(class_2502.const_2587, this.method_3948);
        this.win.addEventListener(class_2502.const_2175, this.method_5631);
    }

    private function method_138(): void {
        this.win.removeEventListener(class_2502.const_1582, this.method_2365);
        this.win.removeEventListener(class_2502.const_1206, this.method_2660);
        this.win.removeEventListener(class_2502.const_3159, this.method_4166);
        this.win.removeEventListener(class_2502.const_2587, this.method_3948);
        this.win.removeEventListener(class_2502.const_2175, this.method_5631);
    }

    protected function method_3948(param1: Event): void {
        if (this.name_61 != null) {
            sendNotification(HintSystemNotifications.const_211, [this.name_61, class_2256.const_3193]);
            this.name_61 = null;
        }
    }

    protected function method_5631(param1: Event): void {
        if (this.name_61 != null) {
            sendNotification(HintSystemNotifications.const_211, [this.name_61, class_2256.const_780]);
            this.name_61 = null;
        }
    }

    public function method_4166(param1: Event = null): void {
        this.method_2910();
    }

    protected function method_2910(): void {
        if (this.name_61 != null) {
            sendNotification(HintSystemNotifications.const_2428, [this.name_61]);
            this.name_61 = null;
        }
    }

    public function method_2298(): void {
        if (this.win) {
            this.win.method_1140();
        }
    }

    protected function method_3946(): DisplayObjectContainer {
        return class_50.getInstance().method_2602();
    }

    protected function method_2660(param1: Event = null): void {
        if (this.win) {
            this.win.update(this.name_61, false);
            this.method_4303();
        }
    }

    protected function method_4303(): void {
        if (this.var_517) {
            this.win.method_6373(this.var_517);
        }
        if (this.var_3551) {
            this.win.method_4739(this.var_3551);
        }
        var _loc1_: class_2505 = this.name_61.content.method_6490;
        sendNotification(HintSystemNotifications.const_2533, _loc1_);
    }

    public function method_3986(): void {
        if (this.win) {
            this.win.x = class_50.method_1849() - (Number(this.win.width) >> 1);
            this.win.y = 70;
        }
    }

    public function method_5123(param1: Vector.<ImageSlideShowElement>, param2: Boolean): void {
        if (this.win) {
            this.win.method_5123(param1, param2);
        }
    }

    public function method_4993(param1: class_65): void {
        this.var_517 = param1.getBitmap();
    }

    public function method_4112(param1: class_65): void {
        this.var_3551 = param1.getBitmap();
    }

    public function get method_649(): IUISetupModule {
        if (this.var_3225 == null) {
            this.var_3225 = new class_2503();
        }
        return this.var_3225;
    }

    public function method_2246(param1: Point): void {
        if (this.win) {
            this.win.method_2246(param1);
        }
    }

    protected function method_2365(param1: Event): void {
        sendNotification(HintSystemNotifications.const_3228);
    }

    public function method_874(): class_2502 {
        return this.win;
    }

    public function get method_2265(): uint {
        return var_2492;
    }
}
}
