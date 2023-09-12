package package_86 {

import flash.display.Sprite;

import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_11.class_262;

import package_403.ContactsWindowMediator;
import package_403.class_2293;

import package_46.class_131;

public class class_1949 extends class_245 {


    public function class_1949() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: String = param1.getName();
        facade.removeCommand(_loc2_);
        this.method_1882();
    }

    private function method_1882(): void {
        sendNotification(AssetNotifications.LOAD_ASSET, ["contacts_baseWindow", this.method_1617]);
    }

    public function method_1617(param1: class_262): void {
        var _loc2_: class_131 = this.method_650();
        var _loc3_: class_2293 = new class_2293(_loc2_);
        var _loc4_: Sprite;
        (_loc4_ = _loc2_.getUIContainer() as Sprite).x = 0;
        _loc4_.y = 0;
        _loc4_.addChild(_loc3_);
        var _loc5_: XML = param1.method_4925();
        UISystem.getInstance().loadAndBuild(_loc5_, _loc3_, this.method_866, [_loc3_]);
    }

    private function method_866(param1: class_2293): void {
        if (retrieveMediator(ContactsWindowMediator.NAME) != null) {
            throw new Error("tried to create another ContactsWindow");
        }
        registerMediator(new ContactsWindowMediator(param1));
        param1.method_866();
        if (method_435) {
            method_435.method_3647();
        }
    }

    protected function method_650(): class_131 {
        var _loc1_: class_131 = guiManager.method_468(GuiConstants.CONTACTLIST_WINDOW);
        if (_loc1_ == null) {
            _loc1_ = guiManager.createWindow(GuiConstants.CONTACTLIST_WINDOW) as class_131;
        }
        return _loc1_;
    }
}
}
