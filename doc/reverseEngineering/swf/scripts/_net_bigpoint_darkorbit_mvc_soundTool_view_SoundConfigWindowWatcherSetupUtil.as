package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import package_57.class_153;

public class _net_bigpoint_darkorbit_mvc_soundTool_view_SoundConfigWindowWatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_soundTool_view_SoundConfigWindowWatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        class_153.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_soundTool_view_SoundConfigWindowWatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[1] = new PropertyWatcher("musicPatternList", {"propertyChange": true}, [param4[1]], param2);
        param5[0] = new PropertyWatcher("patternList", {"propertyChange": true}, [param4[0]], param2);
        param5[1].updateParent(param1);
        param5[0].updateParent(param1);
    }
}
}
