package package_65 {

import flash.display.MovieClip;
import flash.events.MouseEvent;

import net.bigpoint.darkorbit.class_9;

import package_11.class_39;

import package_33.class_93;

import package_38.class_232;

import package_9.ResourceManager;

public class class_173 extends class_93 {

    public static const const_708: Number = 26;


    private var var_5054: Array;

    private var var_4584: Array;

    private var var_574: class_9;

    public function class_173(param1: class_9) {
        this.var_5054 = [];
        this.var_4584 = [];
        super(param1.method_4489(), class_93.const_3185);
        this.var_574 = param1;
    }

    public function update(): void {
        var _loc2_: int = 0;
        var _loc1_: int = 0;
        var _loc3_: int = 0;
        if (this.var_574.method_2732().method_345 != null) {
            _loc3_ = int(this.var_574.method_2732().method_345.id);
        }
        var _loc4_: int = 0;
        while (_loc4_ < this.var_4584.length) {
            if (this.var_4584[_loc4_] != null) {
                _loc2_ = int(this.var_4584[_loc4_]);
                if (_loc3_ == _loc2_) {
                    this.var_5054[_loc2_].gotoAndStop("active");
                } else {
                    this.var_5054[_loc2_].gotoAndStop("inactive");
                }
                this.var_5054[_loc2_].x = _loc1_;
                _loc1_ += this.var_5054[_loc2_].width + 4;
            }
            _loc4_++;
        }
    }

    private function method_1001(param1: MovieClip, param2: int): void {
        param1.addEventListener(MouseEvent.CLICK, this.method_6199);
        param1.buttonMode = true;
    }

    private function method_6199(param1: MouseEvent): void {
        var _loc3_: * = null;
        var _loc2_: int = int(this.var_5054.indexOf(MovieClip(param1.target)));
        if (_loc2_ != this.var_574.method_2732().method_345.id) {
            _loc3_ = new class_232();
            _loc3_.var_1537 = _loc2_;
            this.var_574.method_6154().sendRequest(_loc3_);
        }
    }

    public function method_6351(param1: int): Boolean {
        var _loc3_: * = null;
        var _loc2_: Boolean = false;
        if (this.var_5054[param1] == null) {
            _loc3_ = this.method_5976("pagedot");
            this.var_5054[param1] = _loc3_;
            this.var_4584.push(param1);
            this.method_1001(_loc3_, param1);
            addChild(_loc3_);
            _loc2_ = true;
        }
        this.update();
        return _loc2_;
    }

    public function method_3515(param1: int): void {
        var _loc2_: * = null;
        var _loc3_: int = 0;
        if (this.var_5054[param1] != null) {
            _loc2_ = MovieClip(this.var_5054[param1]);
            if (contains(_loc2_)) {
                removeChild(_loc2_);
            }
            delete this.var_5054[param1];
            _loc3_ = 0;
            while (_loc3_ < this.var_4584.length) {
                if (this.var_4584[_loc3_] == param1) {
                    delete this.var_4584[_loc3_];
                }
                _loc3_++;
            }
        }
        this.update();
    }

    private function method_5976(param1: String): MovieClip {
        var _loc2_: class_39 = class_39(ResourceManager.name_15.getFinisher("questSystem"));
        return _loc2_.getEmbeddedMovieClip(param1);
    }
}
}
