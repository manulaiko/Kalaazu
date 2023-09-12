package net.bigpoint.darkorbit.fui.builder.repository {

import flash.utils.Dictionary;

import net.bigpoint.darkorbit.fui.UISystem;
import net.bigpoint.darkorbit.fui.components.core.skins.ISkin;

public class SkinRepository {

    private static var instance: SkinRepository;


    private var skins: Dictionary;

    public function SkinRepository() {
        super();
        this.skins = new Dictionary();
    }

    public static function getInstance(): SkinRepository {
        if (instance == null) {
            instance = new SkinRepository();
        }
        return instance;
    }

    public function registerSkin(param1: String, param2: ISkin): void {
        UISystem.log("Register skin = " + param1, UISystem.LOG_LEVEL_WARN);
        if (this.skins[param1] == null) {
            this.skins[param1] = param2;
        } else {
            UISystem.log("A skin with the name " + param1 + " already exists.", UISystem.LOG_LEVEL_WARN);
        }
    }

    public function unregisterSkin(param1: String): void {
        if (this.skins[param1] != null) {
            this.skins[param1] = null;
            delete this.skins[param1];
        }
    }

    public function getSkin(param1: String): ISkin {
        var _loc2_: * = null;
        if (this.skins[param1]) {
            _loc2_ = this.skins[param1];
            return _loc2_.clone();
        }
        throw new Error("Couldn´t find skin with the name = " + param1 + ".");
    }
}
}
