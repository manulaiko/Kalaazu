package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import package_4.class_1901;

public class _net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_DOTDMTabButtonSkinWatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_DOTDMTabButtonSkinWatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        class_1901.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_DOTDMTabButtonSkinWatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[2] = new PropertyWatcher("over", {"propertyChange": true}, [param4[2]], param2);
        param5[5] = new PropertyWatcher("downAndSelected", {"propertyChange": true}, [param4[5]], param2);
        param5[7] = new PropertyWatcher("disabledAndSelected", {"propertyChange": true}, [param4[7]], param2);
        param5[10] = new PropertyWatcher("hostComponent", {"propertyChange": true}, [param4[10]], param2);
        param5[11] = new PropertyWatcher("factionGraphic", {"propertyChange": true}, [param4[10]], null);
        param5[4] = new PropertyWatcher("down", {"propertyChange": true}, [param4[4]], param2);
        param5[3] = new PropertyWatcher("overAndSelected", {"propertyChange": true}, [param4[3]], param2);
        param5[6] = new PropertyWatcher("disabled", {"propertyChange": true}, [param4[6]], param2);
        param5[1] = new PropertyWatcher("upAndSelected", {"propertyChange": true}, [param4[1]], param2);
        param5[0] = new PropertyWatcher("up", {"propertyChange": true}, [param4[0]], param2);
        param5[2].updateParent(param1);
        param5[5].updateParent(param1);
        param5[7].updateParent(param1);
        param5[10].updateParent(param1);
        param5[10].addChild(param5[11]);
        param5[4].updateParent(param1);
        param5[3].updateParent(param1);
        param5[6].updateParent(param1);
        param5[1].updateParent(param1);
        param5[0].updateParent(param1);
    }
}
}
