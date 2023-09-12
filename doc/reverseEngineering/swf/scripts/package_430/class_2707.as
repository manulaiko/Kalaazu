package package_430 {

import away3d.animators.class_2120;
import away3d.animators.class_2649;
import away3d.arcane;

import package_386.class_2666;

import package_431.class_2667;

public class class_2707 extends class_2440 implements class_2706 {


    private var var_147: Vector.<class_2666>;

    private var var_4393: class_2667;

    private var var_1372: uint = 0;

    private var var_848: Boolean;

    private var var_1134: Boolean;

    private var var_2044: Boolean;

    private var var_3514: Boolean;

    public function class_2707(param1: class_2120, param2: class_2667) {
        super(param1, param2);
        this.var_4393 = param2;
        this.var_147 = this.var_4393.frames;
    }

    public function set reverse(param1: Boolean): void {
        this.var_1134 = false;
        this.var_848 = param1;
    }

    public function set backAndForth(param1: Boolean): void {
        if (param1) {
            this.var_848 = false;
        }
        this.var_1134 = false;
        this.var_2044 = param1;
    }

    public function get currentFrameData(): class_2666 {
        if (var_3035) {
            this.method_1483();
        }
        return this.var_147[this.var_1372];
    }

    public function get currentFrameNumber(): uint {
        return this.var_1372;
    }

    public function set currentFrameNumber(param1: uint): void {
        this.var_1372 = param1 > this.var_147.length - 1 ? this.var_147.length - 1 : param1;
        this.var_3514 = true;
    }

    arcane function get totalFrames(): uint {
        return !this.var_147 ? 0 : uint(this.var_147.length);
    }

    override protected function method_1483(): void {
        if (this.var_3514) {
            this.var_3514 = false;
            return;
        }
        super.method_1483();
        if (this.var_848) {
            if (this.var_1372 - 1 > -1) {
                --this.var_1372;
            } else {
                if (this.var_4393.method_3310) {
                    if (this.var_2044) {
                        this.var_848 = false;
                        ++this.var_1372;
                    } else {
                        this.var_1372 = this.var_147.length - 1;
                    }
                }
                class_2649(_animator).dispatchCycleEvent();
            }
        } else if (this.var_1372 < this.var_147.length - 1) {
            ++this.var_1372;
        } else {
            if (this.var_4393.method_3310) {
                if (this.var_2044) {
                    this.var_848 = true;
                    --this.var_1372;
                } else {
                    this.var_1372 = 0;
                }
            }
            class_2649(_animator).dispatchCycleEvent();
        }
    }
}
}
