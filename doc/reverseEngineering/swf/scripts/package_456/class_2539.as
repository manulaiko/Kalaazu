package package_456 {

import net.bigpoint.darkorbit.fui.components.list.itemlist.DefaultItemDataAssigner;
import net.bigpoint.darkorbit.fui.components.text.label.Label;

public class class_2539 extends DefaultItemDataAssigner {


    private var var_906: Label;

    private var var_2371: Label;

    private var var_3436: Label;

    public function class_2539() {
        super();
    }

    override public function assignChildren(): void {
        super.assignChildren();
        this.var_906 = getChildByName("dataColumn") as Label;
        this.var_2371 = getChildByName("winnerColumn") as Label;
        this.var_3436 = getChildByName("loserColumn") as Label;
    }

    override public function set data(param1: Object): void {
        super.data = param1;
        var _loc2_: Vector.<String> = param1 as Vector.<String>;
        this.var_906.text = _loc2_[0];
        this.var_2371.text = _loc2_[1];
        this.var_3436.text = _loc2_[2];
    }
}
}
