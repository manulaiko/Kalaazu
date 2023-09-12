package package_64 {

import net.bigpoint.darkorbit.class_126;
import net.bigpoint.darkorbit.gui.class_1044;
import net.bigpoint.darkorbit.map.model.class_90;
import net.bigpoint.darkorbit.mvc.common.AssetNotifications;
import net.bigpoint.darkorbit.settings.Settings;

import package_27.class_82;

import package_37.class_170;

import package_38.class_200;

public class class_171 extends class_170 {

    private static var var_4717: class_200 = null;


    public function class_171() {
        super();
    }

    public static function run(param1: class_200, param2: Boolean = false): void {
        if (!param2) {
            var_4717 = param1;
        }
        var _loc3_: Boolean = Settings.soundVolume != param1.sound || Settings.voiceVolume != param1.var_946;
        var _loc4_: * = Settings.musicVolume != param1.music;
        Settings.soundVolume = param1.sound;
        Settings.playSFX = false;
        Settings.musicVolume = param1.music;
        Settings.playMusic = false;
        Settings.voiceVolume = param1.var_946;
        Settings.playVoice = false;
        Settings.playCombatMusic = param1.playCombatMusic;
        if (class_1044.getInstance()) {
            class_1044.getInstance().method_1326();
        }
        var _loc5_: class_90 = var_574.name_47.map;
        if (true) {
            class_82.method_5398();
        } else {
            if (false && false) {
                class_82.method_2019(class_126.const_1041, true, 0.5);
            } else if (_loc5_ != null) {
                class_82.method_2019(_loc5_.method_1123(), false, 0.5);
            }
            if (_loc4_) {
                class_82.method_2282();
            }
        }
        if (false) {
            if (_loc5_) {
                _loc5_.method_2778();
            }
        } else if (_loc5_) {
            _loc5_.method_2204();
        }
        if (_loc3_) {
            if (false) {
                var_271.sendNotification(AssetNotifications.PRELOAD_LIST, "sounds", AssetNotifications.TYPE_PRELOAD_LIST_TYPE_PATTERN_KEY);
            }
            class_82.method_2916();
        }
    }

    public static function method_4215(param1: class_200): void {
        var_4717 = param1;
    }

    public static function method_1172(): void {
        if (var_4717 != null) {
            run(var_4717);
        }
    }
}
}
