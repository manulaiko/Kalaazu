package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import net.bigpoint.darkorbit.mvc.common.view.skins.scroller.vScroll.DOVScrollDownButtonSkin;

public class _net_bigpoint_darkorbit_mvc_common_view_skins_scroller_vScroll_DOVScrollDownButtonSkinWatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_common_view_skins_scroller_vScroll_DOVScrollDownButtonSkinWatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        DOVScrollDownButtonSkin.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_common_view_skins_scroller_vScroll_DOVScrollDownButtonSkinWatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[1] = new PropertyWatcher("_overStateBitmapData", {"propertyChange": true}, [param4[1]], param2);
        param5[0] = new PropertyWatcher("_upStateBitmapData", {"propertyChange": true}, [param4[0]], param2);
        param5[1].updateParent(param1);
        param5[0].updateParent(param1);
    }
}
}
