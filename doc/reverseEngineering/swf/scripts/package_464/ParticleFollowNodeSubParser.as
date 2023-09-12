package package_464 {

import package_431.class_2407;

import package_466.class_2598;

public class ParticleFollowNodeSubParser extends class_2593 {


    public function ParticleFollowNodeSubParser() {
        super();
    }

    public static function get identifier(): * {
        return class_2598.ParticleFollowNodeSubParser;
    }

    override protected function method_196(): Boolean {
        if (var_117) {
            var_4806 = new class_2407(_data.usesPosition, _data.usesRotation);
        }
        return super.method_196();
    }
}
}
