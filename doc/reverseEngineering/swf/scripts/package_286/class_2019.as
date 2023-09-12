package package_286 {

import flash.display.Sprite;

import net.bigpoint.darkorbit.map.model.traits.class_306;
import net.bigpoint.darkorbit.map.model.traits.class_309;
import net.bigpoint.darkorbit.map.view2D.class_1206;

import package_29.class_85;

import package_35.class_348;

public class class_2019 extends class_1734 {


    public function class_2019(param1: class_1206, param2: class_348, param3: Boolean = true, param4: Boolean = true, param5: Boolean = false) {
        super(param1, param2, param3);
        if (param5) {
            if (this.method_5878) {
                if (param4) {
                    this.method_5878.addChild(this);
                } else {
                    this.method_5878.addChildAt(this, 0);
                }
            }
        } else {
            this.method_6135.position.changed.add(this.method_306);
            this.method_306();
            param1.fxLayer.addChild(this);
        }
    }

    protected function get method_6135(): class_85 {
        return (effect as class_348).source;
    }

    override public function disposeView(param1: Boolean = false): void {
        if (this.method_6135) {
            this.method_6135.position.changed.remove(this.method_306);
        }
        super.disposeView(param1);
    }

    private function method_306(): void {
        if (this.method_6135) {
            this.x = this.method_6135.position.x;
            this.y = this.method_6135.position.y;
        }
    }

    protected function get method_5878(): Sprite {
        return (method_3528.method_5826.method_6501(this.method_6135.method_1954(class_309)) || method_3528.method_5826.method_6501(this.method_6135.method_1954(class_306))) as Sprite;
    }
}
}
