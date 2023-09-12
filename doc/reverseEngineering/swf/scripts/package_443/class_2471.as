package package_443 {

import net.bigpoint.darkorbit.map.common.IDisposable;
import net.bigpoint.darkorbit.map.model.traits.class_306;
import net.bigpoint.darkorbit.mvc.battleStation.BattleStation;

import package_373.class_2134;

public class class_2471 implements class_2461, IDisposable {


    private var var_176: class_306;

    private var var_127: class_2134;

    public function class_2471() {
        super();
    }

    public function initialize(param1: class_306, param2: class_2134, param3: Object): void {
        this.var_127 = param2;
        this.var_176 = param1;
    }

    public function decorate(): void {
        this.battleStation.changed.add(this.updateVisuals);
        this.updateVisuals();
    }

    public function disposeView(param1: Boolean = false): void {
        this.battleStation.changed.remove(this.updateVisuals);
        this.var_176 = null;
        this.var_127 = null;
    }

    private function updateVisuals(): void {
        this.var_127.method_4434("mesh.content.hull_left").visible = this.battleStation.hullExpansion >= 5;
        this.var_127.method_4434("mesh.content.hull_right").visible = this.battleStation.hullExpansion >= 10;
        this.var_127.method_4434("mesh.content.deflector_level_1").visible = this.battleStation.deflectorShildExpansion >= 0;
        this.var_127.method_4434("mesh.content.deflector_level_2").visible = this.battleStation.deflectorShildExpansion >= 5;
        this.var_127.method_4434("mesh.content.deflector_level_3").visible = this.battleStation.deflectorShildExpansion >= 10;
    }

    private function get battleStation(): BattleStation {
        return this.var_176.owner as BattleStation;
    }
}
}
