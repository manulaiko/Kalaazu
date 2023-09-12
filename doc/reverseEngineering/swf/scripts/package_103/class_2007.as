package package_103 {

import package_104.class_274;
import package_104.class_275;
import package_104.class_276;
import package_104.class_277;
import package_104.class_278;
import package_104.class_279;
import package_104.class_280;

public class class_2007 {


    public function class_2007() {
        super();
    }

    public static function method_3824(param1: String): class_274 {
        switch (param1) {
            case class_278.ID:
                return new class_278();
            case class_279.ID:
                return new class_279();
            case class_276.ID:
                return new class_276();
            case class_277.ID:
                return new class_277();
            case class_280.ID:
                return new class_280();
            case class_275.ID:
                return new class_275();
            default:
                throw new Error("ListLayoutFactory, no layout specified for layoutId: " + param1);
        }
    }
}
}
