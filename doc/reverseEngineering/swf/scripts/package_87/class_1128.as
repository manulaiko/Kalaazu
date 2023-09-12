package package_87 {

import com.bigpoint.utils.class_968;

import flash.display.DisplayObject;
import flash.events.ProgressEvent;

import net.bigpoint.darkorbit.class_81;
import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;
import net.bigpoint.darkorbit.mvc.gui.GuiNotifications;
import net.bigpoint.darkorbit.mvc.gui.featuresMenu.FeaturesMenuConstants;
import net.bigpoint.darkorbit.mvc.gui.itemsControlMenu.ItemsControlMenuConstants;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.AsyncCommand;

import package_11.class_262;
import package_11.class_38;
import package_11.class_39;
import package_11.class_65;

import package_13.class_51;

import package_22.class_1082;
import package_22.class_198;

import package_23.FileCollectionFileLoadEvent;

import package_269.class_1669;

import package_42.SystemManagerProxy;

import package_9.ResourceManager;

public class class_1128 extends AsyncCommand {

    private static const const_479: String = "init";


    protected var var_173: class_51;

    protected var var_570: uint;

    protected var var_4272: uint;

    protected var var_853: Vector.<Object>;

    protected var var_3128: class_1669;

    public function class_1128() {
        this.var_853 = new Vector.<Object>();
        super();
    }

    override public function execute(param1: INotification): void {
        var _loc4_: * = null;
        this.var_173 = param1.getBody() as class_51;
        this.var_173.main.method_1644();
        this.var_570 = 0;
        this.var_4272 = class_198.var_4417.length;
        var _loc2_: * = class_198.var_4417;
        var _loc3_: SystemManagerProxy = facade.retrieveProxy(SystemManagerProxy.NAME) as SystemManagerProxy;
        this.var_3128 = _loc3_.method_146().memory;
        for each(_loc4_ in class_198.var_4417) {
            ResourceManager.name_15.load(_loc4_.resKey, this.method_4573, this.method_2288);
        }
    }

    protected function method_2288(param1: FileCollectionFileLoadEvent): void {
    }

    protected function method_4573(param1: class_38): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        ++this.var_570;
        if (param1 is class_39) {
            _loc3_ = (param1 as class_39).getAsDisplayObject();
            if (_loc3_) {
                this.var_853.push(_loc3_);
            }
        } else if (param1 is class_262) {
            _loc2_ = (param1 as class_262).method_4925();
            if (_loc2_) {
                this.var_853.push(_loc2_);
            }
        }
        this.method_5754();
        if (this.var_570 == this.var_4272) {
            this.method_784();
            commandComplete();
        }
    }

    protected function method_5754(): void {
        var _loc1_: ProgressEvent = new ProgressEvent(ProgressEvent.PROGRESS);
        _loc1_.bytesLoaded = this.var_570;
        _loc1_.bytesTotal = this.var_4272;
        this.var_173.main.forwardEventDispatch(_loc1_);
    }

    protected function method_784(): void {
        var _loc4_: * = null;
        this.method_5754();
        var _loc1_: SystemManagerProxy = facade.retrieveProxy(SystemManagerProxy.NAME) as SystemManagerProxy;
        var _loc2_: uint = uint(this.var_853.length);
        var _loc3_: int = 0;
        while (_loc3_ < _loc2_) {
            if ((_loc4_ = this.var_853[_loc3_]) != null) {
                if (_loc4_[const_479] != null && !(_loc4_ is XML)) {
                    _loc4_[const_479](this.var_3128, class_81.method_1271);
                }
                this.method_2000();
            }
            _loc3_++;
        }
        this.var_3128.pack();
        sendNotification(GuiNotifications.SET_UI_FINISHER, class_39(ResourceManager.name_15.getFinisher("ui")));
        this.var_173 = null;
        this.var_3128 = null;
        _loc1_.method_979();
        this.method_6021();
    }

    private function method_6021(): void {
        this.assetsProxy.addBitmapAtlas(ItemsControlMenuConstants.ICONS_BITMAP_ATLAS, this.method_4987(ItemsControlMenuConstants.ICONS_TEXTURE, ItemsControlMenuConstants.ICONS_ATLAS_XML));
        this.assetsProxy.addBitmapAtlas(FeaturesMenuConstants.ICONS_BITMAP_ATLAS, this.method_4987(FeaturesMenuConstants.ICONS_TEXTURE, FeaturesMenuConstants.ICONS_ATLAS_XML));
    }

    protected function method_4987(param1: String, param2: String): class_968 {
        var _loc3_: class_65 = this.getFinisher(param1) as class_65;
        var _loc4_: class_262 = this.getFinisher(param2) as class_262;
        return new class_968(_loc3_.getBitmap(), _loc4_.method_4925());
    }

    protected function getFinisher(param1: String): class_38 {
        return ResourceManager.name_15.getFinisher(param1);
    }

    private function method_2000(): void {
    }

    private function get assetsProxy(): AssetsProxy {
        return facade.retrieveProxy(AssetsProxy.NAME) as AssetsProxy;
    }
}
}
