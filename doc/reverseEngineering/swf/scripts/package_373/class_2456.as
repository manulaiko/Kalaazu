package package_373 {

import flash.utils.setTimeout;

import net.bigpoint.darkorbit.map.common.IDisposable;

import package_10.class_1173;

import package_200.Settings3D;

import package_310.class_1780;

import package_379.class_2149;
import package_379.class_2477;
import package_379.class_2648;

public class class_2456 extends class_2454 implements IDisposable {


    private var var_1699: Class;

    private var var_1333: class_2149;

    private var _alpha: Number = 1;

    public function class_2456(param1: XML, param2: class_1173 = null, param3: Class = null) {
        this.var_1699 = param3 || class_2648;
        super(param1, param2);
    }

    public function get mesh(): class_2149 {
        return this.var_1333;
    }

    public function set alpha(param1: Number): void {
        this._alpha = param1;
        if (this.var_1333) {
            this.var_1333.alpha = param1;
        }
    }

    public function addMethod(param1: class_1780): void {
        if (this.var_1333) {
            this.var_1333.addMethod(param1);
        }
    }

    public function method_804(param1: class_1780): void {
        if (this.var_1333) {
            this.var_1333.method_804(param1);
        }
    }

    public function method_2531(): void {
        if (this.var_1333) {
            this.var_1333.method_2531();
        }
    }

    public function get glow(): Number {
        return !!this.var_1333 ? Number(this.var_1333.name_55.glow) : 0;
    }

    public function set glow(param1: Number): void {
        if (this.var_1333) {
            this.var_1333.name_55.glow = param1;
        }
    }

    override protected function method_352(): void {
        this.var_1333 = new this.var_1699(class_2477.method_2989(_descriptor), Settings3D.method_2441(String(_descriptor.@shader)), Settings3D.method_2953(String(_descriptor.@tex_settings)));
        this.var_1333.name = "content";
        this.var_1333.alpha = this._alpha;
        addChild(this.var_1333);
        if (this.var_1333.numChildren > 0) {
            setTimeout(ready.dispatch, 1);
        } else {
            this.var_1333.changed.add(this.method_660);
        }
        this.var_1333.zOffset = Number(String(_descriptor.@zOffset)) || false;
    }

    override protected function unloadView(): void {
        if (this.var_1333) {
            removeChild(this.var_1333);
            this.var_1333.dispose();
            this.var_1333.changed.remove(this.method_660);
            this.var_1333 = null;
        }
    }

    private function method_660(): void {
        this.var_1333.changed.remove(this.method_660);
        setTimeout(ready.dispatch, 1);
    }
}
}
