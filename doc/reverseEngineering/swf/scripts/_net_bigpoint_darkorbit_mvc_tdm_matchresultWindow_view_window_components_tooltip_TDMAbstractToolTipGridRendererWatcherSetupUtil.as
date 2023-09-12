package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import package_3.class_2289;

public class _net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_tooltip_TDMAbstractToolTipGridRendererWatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_tooltip_TDMAbstractToolTipGridRendererWatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        class_2289.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_tdm_matchresultWindow_view_window_components_tooltip_TDMAbstractToolTipGridRendererWatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[0] = new PropertyWatcher("_fontSize", {"propertyChange": true}, [param4[0]], param2);
        param5[4] = new PropertyWatcher("_text", {"propertyChange": true}, [param4[4]], param2);
        param5[2] = new PropertyWatcher("_color", {"propertyChange": true}, [param4[2]], param2);
        param5[3] = new PropertyWatcher("_textAlign", {"propertyChange": true}, [param4[3]], param2);
        param5[1] = new PropertyWatcher("_font", {"propertyChange": true}, [param4[1]], param2);
        param5[0].updateParent(param1);
        param5[4].updateParent(param1);
        param5[2].updateParent(param1);
        param5[3].updateParent(param1);
        param5[1].updateParent(param1);
    }
}
}
