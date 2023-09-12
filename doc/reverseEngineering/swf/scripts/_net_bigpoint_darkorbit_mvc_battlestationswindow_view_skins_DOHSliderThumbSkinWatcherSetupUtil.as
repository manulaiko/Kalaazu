package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import package_154.class_1518;

public class _net_bigpoint_darkorbit_mvc_battlestationswindow_view_skins_DOHSliderThumbSkinWatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_battlestationswindow_view_skins_DOHSliderThumbSkinWatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        class_1518.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_battlestationswindow_view_skins_DOHSliderThumbSkinWatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[1] = new PropertyWatcher("_rollOverStateBitmap", {"propertyChange": true}, [param4[1]], param2);
        param5[0] = new PropertyWatcher("_normalStateBitmap", {"propertyChange": true}, [param4[0], param4[2], param4[3]], param2);
        param5[1].updateParent(param1);
        param5[0].updateParent(param1);
    }
}
}
