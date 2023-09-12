package package_322 {

import com.bigpoint.utils.class_73;

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.gui.windows.class_57;
import net.bigpoint.darkorbit.map.model.traits.class_1180;
import net.bigpoint.darkorbit.mvc.common.ConnectionNotifications;
import net.bigpoint.darkorbit.mvc.common.model.assets.UberAssetsLib;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;

import package_17.class_62;

import package_27.class_82;

import package_29.class_85;

import package_38.class_439;
import package_38.class_445;
import package_38.class_868;
import package_38.class_928;

public class class_1808 extends class_85 {

    private static var var_1042: Object;

    private static const const_1221: Object = {};

    private static const const_2291: Object = {};

    {
        const_1221[class_439.MMO] = {};
        const_1221[class_439.MMO][class_445.const_2477] = "headquarters_home_mmo";
        const_1221[class_439.MMO][class_445.const_1965] = "headquarters_outpost_mmo";
        const_1221[class_439.EIC] = {};
        const_1221[class_439.EIC][class_445.const_2477] = "headquarters_home_eic";
        const_1221[class_439.EIC][class_445.const_1965] = "headquarters_outpost_eic";
        const_1221[class_439.VRU] = {};
        const_1221[class_439.VRU][class_445.const_2477] = "headquarters_home_vru";
        const_1221[class_439.VRU][class_445.const_1965] = "headquarters_outpost_vru";
        const_2291[class_439.MMO] = class_126.const_3000;
        const_2291[class_439.EIC] = class_126.const_1435;
        const_2291[class_439.VRU] = class_126.const_2728;
    }

    private var var_2321: int = 0;

    private var var_146: int;

    private var _type: uint;

    private var var_3685: Boolean;

    public function class_1808(param1: class_868) {
        super(param1.name_115, new class_73(param1.var_4787, param1.var_2295));
        this.var_146 = param1.factionId;
        this._type = param1.type.var_2008;
        this.var_3685 = param1.var_4985;
        this.update();
    }

    public static function method_5437(param1: Object): void {
        var_1042 = param1;
    }

    public function update(): void {
        removeAllTraits();
        var _loc1_: Object = var_1042 || const_1221;
        UberAssetsLib.instance.fillTraits(this, _loc1_[this.var_146][this._type], UberAssetsLib.LIB_DEFAULT, !!this.var_3685 ? this.handleIconClick : null);
        var _loc2_: class_1180 = method_1954(class_1180) as class_1180;
        if (_loc2_) {
            _loc2_.const_3038.add(this.method_1860);
        }
        this.var_2321 = const_2291[this.var_146];
    }

    private function handleIconClick(): void {
        class_82.playSoundEffect(this.var_2321);
        class_62.getInstance().sendNotification(GuiNotifications.OPEN_COMPANY_HIERARCHY_WINDOW);
        class_62.getInstance().sendNotification(ConnectionNotifications.SEND_NETTY_REQUEST, new class_928());
    }

    private function method_1860(): void {
        class_62.getInstance().sendNotification(GuiNotifications.CLOSE_WINDOW_BY_TYPE, class_57.const_3096);
    }
}
}
