package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import package_154.class_1519;

public class _net_bigpoint_darkorbit_mvc_battlestationswindow_view_skins_DOHSliderSkinInnerClass0WatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_battlestationswindow_view_skins_DOHSliderSkinInnerClass0WatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        class_1519.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_battlestationswindow_view_skins_DOHSliderSkinInnerClass0WatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[0] = new PropertyWatcher("_tipBgWidth", {"propertyChange": true}, [param4[0]], param2);
        param5[3] = new PropertyWatcher("data", {"dataChange": true}, [param4[3]], param2);
        param5[1] = new PropertyWatcher("_sliderArrowPos", {"propertyChange": true}, [param4[1]], param2);
        param5[0].updateParent(param1);
        param5[3].updateParent(param1);
        param5[1].updateParent(param1);
    }
}
}
