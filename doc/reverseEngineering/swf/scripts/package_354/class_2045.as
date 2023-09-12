package package_354 {

import net.bigpoint.darkorbit.map.view2D.class_1206;

import package_286.class_2019;

import package_35.class_348;

import package_9.ResourceManager;

public class class_2045 extends class_2019 {


    public function class_2045(param1: class_1206, param2: class_348) {
        super(param1, param2, true, false);
    }

    override protected function method_30(): void {
        this.var_1714 = ResourceManager.getMovieClip("shockwaves", "protectionBuffRing");
        this.addChild(this.var_1714);
        this.method_2332(this.var_1714);
        this.method_6420();
        method_5878.addChild(this.var_1714);
    }
}
}
