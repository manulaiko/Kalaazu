package package_314 {

import flash.utils.Dictionary;

import net.bigpoint.darkorbit.fui.components.image.ImageSlideShowElement;
import net.bigpoint.darkorbit.mvc.common.model.assets.AssetsProxy;

import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.command.SimpleCommand;

import package_11.class_65;

import package_389.class_2257;

import package_448.class_2505;
import package_448.class_2507;

public class class_2263 extends SimpleCommand {


    private var var_2531: uint = 0;

    private var var_2429: uint = 0;

    private var var_4538: Dictionary;

    private var _playlist: Vector.<ImageSlideShowElement>;

    private var _repeat: Boolean;

    private var var_4459: uint;

    public function class_2263() {
        super();
    }

    override public function execute(param1: INotification): void {
        this.var_4538 = new Dictionary();
        this.var_4459 = this.method_5639();
        var _loc2_: class_2505 = param1.getBody() as class_2505;
        this._repeat = _loc2_.repeat;
        this.var_2531 = _loc2_.playlist.length;
        this._playlist = new Vector.<ImageSlideShowElement>();
        this.method_5416(_loc2_.playlist, this.method_5424);
    }

    private function method_5416(param1: Vector.<class_2507>, param2: Function): void {
        var _loc5_: * = null;
        var _loc3_: uint = param1.length;
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_) {
            _loc5_ = param1[_loc4_];
            this.method_6085(_loc5_, param2);
            _loc4_++;
        }
    }

    private function method_6085(param1: class_2507, param2: Function): void {
        var _loc3_: ImageSlideShowElement = new ImageSlideShowElement();
        _loc3_.duration = param1.duration;
        _loc3_.transitionEffect = param1.transitionEffect;
        this.var_4538[param1.resKey] = _loc3_;
        this._playlist.push(_loc3_);
        var _loc4_: AssetsProxy;
        (_loc4_ = facade.retrieveProxy(AssetsProxy.NAME) as AssetsProxy).load(param1.resKey, param2);
    }

    private function method_5424(param1: class_65): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (this.var_4459 != this.method_5639()) {
            this.method_5604();
            return;
        }
        if (this.var_2429 <= this.var_2531) {
            ++this.var_2429;
            _loc2_ = param1.name_58.id;
            _loc3_ = this.var_4538[_loc2_];
            _loc3_.target = param1.getBitmap();
        }
        if (this.var_2429 == this.var_2531) {
            (_loc4_ = facade.retrieveMediator(class_2257.NAME) as class_2257).method_5123(this._playlist, this._repeat);
        }
    }

    private function method_5639(): uint {
        var _loc1_: class_2257 = facade.retrieveMediator(class_2257.NAME) as class_2257;
        return _loc1_.method_2265;
    }

    private function method_5604(): void {
        this.var_4538 = null;
        this._playlist = null;
    }
}
}
