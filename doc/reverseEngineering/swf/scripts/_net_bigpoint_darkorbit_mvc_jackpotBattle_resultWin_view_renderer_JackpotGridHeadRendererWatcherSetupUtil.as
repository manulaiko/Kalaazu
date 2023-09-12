package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import package_20.class_71;

public class _net_bigpoint_darkorbit_mvc_jackpotBattle_resultWin_view_renderer_JackpotGridHeadRendererWatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_jackpotBattle_resultWin_view_renderer_JackpotGridHeadRendererWatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        class_71.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_jackpotBattle_resultWin_view_renderer_JackpotGridHeadRendererWatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[1] = new PropertyWatcher("headerText", {"propertyChange": true}, [param4[1]], param2);
        param5[1].updateParent(param1);
    }
}
}
