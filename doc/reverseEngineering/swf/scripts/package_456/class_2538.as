package package_456 {

import net.bigpoint.darkorbit.fui.components.list.itemlist.DefaultItemDataAssigner;
import net.bigpoint.darkorbit.fui.components.text.label.Label;

public class class_2538 extends DefaultItemDataAssigner {


    private var var_3835: Label;

    private var var_4552: Label;

    public function class_2538() {
        super();
    }

    override public function assignChildren(): void {
        super.assignChildren();
        this.var_3835 = getChildByName("rewardColumn") as Label;
        this.var_4552 = getChildByName("amountColumn") as Label;
    }

    override public function set data(param1: Object): void {
        super.data = param1;
        var _loc2_: Vector.<String> = param1 as Vector.<String>;
        if (_loc2_) {
            this.var_3835.text = _loc2_[0];
            this.var_4552.text = _loc2_[1];
            this.visible = true;
        } else {
            this.var_3835.text = "";
            this.var_4552.text = "";
            this.visible = false;
        }
    }
}
}
