package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import package_51.class_141;

public class _net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_TDMMatchResultWindowWatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_TDMMatchResultWindowWatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        class_141.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_TDMMatchResultWindowWatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[12] = new PropertyWatcher("_tabs", {"propertyChange": true}, [param4[15]], param2);
        param5[6] = new PropertyWatcher("_headerImage", {"propertyChange": true}, [param4[5]], param2);
        param5[0] = new PropertyWatcher("width", {"widthChanged": true}, [param4[0], param4[6], param4[11]], param2);
        param5[17] = new PropertyWatcher("_accordionData", {"propertyChange": true}, [param4[20]], param2);
        param5[19] = new PropertyWatcher("_hint", {"propertyChange": true}, [param4[22]], param2);
        param5[3] = new PropertyWatcher("headerPic", {"propertyChange": true}, [param4[3], param4[4]], param2);
        param5[5] = new PropertyWatcher("height", {"heightChanged": true}, [param4[4]], null);
        param5[4] = new PropertyWatcher("width", {"widthChanged": true}, [param4[3]], null);
        param5[13] = new PropertyWatcher("_rewards", {"propertyChange": true}, [param4[16]], param2);
        param5[12].updateParent(param1);
        param5[6].updateParent(param1);
        param5[0].updateParent(param1);
        param5[17].updateParent(param1);
        param5[19].updateParent(param1);
        param5[3].updateParent(param1);
        param5[3].addChild(param5[5]);
        param5[3].addChild(param5[4]);
        param5[13].updateParent(param1);
    }
}
}
