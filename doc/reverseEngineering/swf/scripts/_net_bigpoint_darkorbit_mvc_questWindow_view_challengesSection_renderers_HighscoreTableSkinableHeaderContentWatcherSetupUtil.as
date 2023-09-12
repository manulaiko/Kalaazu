package {

import mx.binding.FunctionReturnWatcher;
import mx.binding.IWatcherSetupUtil2;
import mx.binding.PropertyWatcher;
import mx.core.IFlexModuleFactory;

import package_12.class_76;

public class _net_bigpoint_darkorbit_mvc_questWindow_view_challengesSection_renderers_HighscoreTableSkinableHeaderContentWatcherSetupUtil implements IWatcherSetupUtil2 {


    public function _net_bigpoint_darkorbit_mvc_questWindow_view_challengesSection_renderers_HighscoreTableSkinableHeaderContentWatcherSetupUtil() {
        super();
    }

    public static function init(param1: IFlexModuleFactory): void {
        class_76.watcherSetupUtil = new _net_bigpoint_darkorbit_mvc_questWindow_view_challengesSection_renderers_HighscoreTableSkinableHeaderContentWatcherSetupUtil();
    }

    public function setup(param1: Object, param2: Function, param3: Function, param4: Array, param5: Array): void {
        var target: Object = param1;
        var propertyGetter: Function = param2;
        var staticPropertyGetter: Function = param3;
        var bindings: Array = param4;
        var watchers: Array = param5;
        watchers[1] = new FunctionReturnWatcher("getStyle", target, function (): Array {
            return ["columnundefined1align"];
        }, null, [bindings[1]], propertyGetter, true);
        watchers[6] = new FunctionReturnWatcher("getStyle", target, function (): Array {
            return ["paddingLeft"];
        }, null, [bindings[5]], propertyGetter, true);
        watchers[5] = new FunctionReturnWatcher("getStyle", target, function (): Array {
            return ["paddingBottom"];
        }, null, [bindings[4]], propertyGetter, true);
        watchers[2] = new PropertyWatcher("columnIndex", {"propertyChange": true}, [bindings[1]], propertyGetter);
        watchers[4] = new FunctionReturnWatcher("getStyle", target, function (): Array {
            return ["paddingRight"];
        }, null, [bindings[3]], propertyGetter, true);
        watchers[3] = new FunctionReturnWatcher("getStyle", target, function (): Array {
            return ["paddingTop"];
        }, null, [bindings[2]], propertyGetter, true);
        watchers[0] = new PropertyWatcher("headerText", {"propertyChange": true}, [bindings[0]], propertyGetter);
        watchers[1].updateParent(target);
        watchers[6].updateParent(target);
        watchers[5].updateParent(target);
        watchers[2].updateParent(target);
        watchers[4].updateParent(target);
        watchers[3].updateParent(target);
        watchers[0].updateParent(target);
    }
}
}
