package package_289 {

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.common.class_80;
import net.bigpoint.darkorbit.map.model.ship.class_86;
import net.bigpoint.darkorbit.map.model.traits.class_306;

import package_359.class_2082;

import package_426.BattleStationDecorator2D;
import package_426.class_2367;
import package_426.class_2368;
import package_426.class_2370;
import package_426.class_2371;
import package_426.class_2372;
import package_426.class_2373;
import package_426.class_2374;
import package_426.class_2375;
import package_426.class_2376;

import package_427.class_2369;

public class class_2083 extends class_2082 {

    private static const const_2191: Object = {};

    {
        const_2191["relay"] = class_2367;
        const_2191["plague"] = class_2376;
        const_2191["collectable"] = class_2368;
        const_2191["healthStation"] = class_2374;
        const_2191["sectorControlBeacon"] = class_2375;
        const_2191["trident"] = class_2372;
        const_2191["battleStation"] = BattleStationDecorator2D;
        const_2191["tdmLogo"] = class_2371;
        const_2191["billboard"] = class_2373;
        const_2191["portal"] = class_2369;
        const_2191["mine"] = class_2370;
    }

    private var var_176: class_306;

    private var var_390: Vector.<class_2366>;

    public function class_2083(param1: class_306) {
        this.var_390 = new Vector.<class_2366>();
        this.var_176 = param1;
        var _loc2_: * = param1.descriptor.display2D[0];
        if (param1.owner is class_86) {
            _loc2_ = null;
        }
        super(_loc2_, true, param1.state, param1.owner, param1.debug);
        x = this.var_176.owner.x;
        y = this.var_176.owner.y;
        this.var_176.const_820.add(method_6420);
    }

    override public function disposeView(param1: Boolean = false): void {
        this.var_176.const_820.remove(method_6420);
        super.disposeView(param1);
    }

    override protected function method_206(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        super.method_206();
        for each(_loc1_ in this.var_176.decorators) {
            if (false) {
                _loc2_ = new const_2191[_loc1_.id]();
                this.var_390.push(_loc2_);
                if (_loc2_ is class_80) {
                    _manager.method_1164(_loc2_ as class_80);
                }
                if (_loc2_ is IDisposable) {
                    _manager.method_1490(_loc2_ as IDisposable);
                }
                _loc2_.method_1804(this.var_176, this, _loc1_);
            } else {
                log("unknown decorator");
            }
        }
    }
}
}
