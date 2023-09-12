package net.bigpoint.darkorbit.fui.builder.repository {

import flash.utils.Dictionary;

import net.bigpoint.darkorbit.fui.UISystem;

public class TextStyleRepository {

    private static var instance: TextStyleRepository;


    private var styles: Dictionary;

    private var _useDeviceFonts: Boolean = false;

    public function TextStyleRepository() {
        super();
        this.styles = new Dictionary();
    }

    public static function getInstance(): TextStyleRepository {
        if (instance == null) {
            instance = new TextStyleRepository();
        }
        return instance;
    }

    public function register(param1: TextStyleVO): void {
        if (this.styles[param1.name] == null) {
            if (this._useDeviceFonts) {
                param1.embedFonts = false;
            }
            this.styles[param1.name] = param1;
        } else {
            UISystem.log("A TextStyleVO with the name " + param1.name + " already exists.");
        }
    }

    public function unregister(param1: String): void {
        if (this.styles[param1] != null) {
            this.styles[param1] = null;
            delete this.styles[param1];
        }
    }

    public function getByName(param1: String): TextStyleVO {
        if (this.styles[param1] != null) {
            return this.styles[param1];
        }
        UISystem.log("A TextStyle with the name = \'" + param1 + "\' doesn´t exists.", UISystem.LOG_LEVEL_WARN);
        return null;
    }

    public function set useDeviceFonts(param1: Boolean): void {
        this._useDeviceFonts = param1;
    }
}
}
