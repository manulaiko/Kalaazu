package {

import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import package_55.class_151;

public class _net_bigpoint_darkorbit_mvc_companyhierarchy_view_components_CompanyHierarchyWindowViewWatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_companyhierarchy_view_components_CompanyHierarchyWindowViewWatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        class_151.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_companyhierarchy_view_components_CompanyHierarchyWindowViewWatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        param5[4] = new PropertyWatcher("tabList", {"propertyChange": true}, [param4[2]], param2);
        param5[1] = new PropertyWatcher("mainTabBar", {"propertyChange": true}, [param4[1]], param2);
        param5[3] = new PropertyWatcher("height", {"heightChanged": true}, [param4[1]], null);
        param5[2] = new PropertyWatcher("y", {"yChanged": true}, [param4[1]], null);
        param5[4].updateParent(param1);
        param5[1].updateParent(param1);
        param5[1].addChild(param5[3]);
        param5[1].addChild(param5[2]);
    }
}
}
