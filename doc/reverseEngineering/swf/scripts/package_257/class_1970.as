package package_257 {

import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
import net.bigpoint.darkorbit.mvc.gui.GuiConstants;

import org.puremvc.as3.multicore.interfaces.INotification;

import package_11.class_262;

import package_258.class_1655;

import package_407.TraininggroundsResultsWindowMediator;
import package_407.class_2303;

import package_46.class_131;

import package_84.class_243;

public class class_1970 extends class_243 {


    public function class_1970() {
        super();
    }

    override public function execute(param1: INotification): void {
        super.execute(param1);
        var _loc2_: class_131 = guiManager.method_468(GuiConstants.TRAINING_GROUNDS_RESULTS_WINDOW);
        if (_loc2_ == null) {
            this.method_1882();
        } else if (!_loc2_.maximized) {
            _loc2_.maximize();
        }
    }

    private function method_1882(): void {
        sendNotification(AssetNotifications.LOAD_ASSET, ["traininggrounds_resultsWindow", this.method_1617]);
    }

    public function method_1617(param1: class_262): void {
        var _loc2_: class_131 = this.method_650();
        var _loc3_: class_2303 = new class_2303(_loc2_);
        _loc2_.method_2321().addChild(_loc3_);
        var _loc4_: XML = param1.method_4925();
        UISystem.getInstance().loadAndBuild(_loc4_, _loc3_, this.method_866, [_loc3_]);
    }

    private function method_866(param1: class_2303): void {
        param1.method_866();
        registerMediator(new TraininggroundsResultsWindowMediator(TraininggroundsResultsWindowMediator.NAME, param1));
        facade.sendNotification(class_1655.REPROCESS_CACHED_DATA);
    }

    protected function method_650(): class_131 {
        var _loc1_: class_131 = guiManager.createWindow(GuiConstants.TRAINING_GROUNDS_RESULTS_WINDOW) as class_131;
        _loc1_.maximize();
        return _loc1_;
    }
}
}
