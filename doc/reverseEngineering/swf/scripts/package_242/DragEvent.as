package package_242 {

import flash.events.Event;

public class DragEvent extends Event {

    public static const const_190: String = "dragAccepted";

    public static const const_2159: String = "dragNotAccepted";

    public static const DRAG_ENTER: String = "dragEnter";

    public static const DRAG_EXIT: String = "dragExit";

    public static const DRAG_OVER: String = "dragOver";

    public static const DRAG_START: String = "dragStart";


    private var var_545: IDraggable;

    private var var_97: IDropable;

    public function DragEvent(param1: String, param2: IDraggable = null, param3: IDropable = null) {
        super(param1, true);
        this.var_545 = param2;
        this.var_97 = param3;
    }

    public function get method_1419(): IDraggable {
        return this.var_545;
    }

    public function get dropTarget(): IDropable {
        return this.var_97;
    }
}
}
