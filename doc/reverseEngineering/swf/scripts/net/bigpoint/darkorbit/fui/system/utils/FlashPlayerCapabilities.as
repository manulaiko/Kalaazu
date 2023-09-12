package net.bigpoint.darkorbit.fui.system.utils {

import flash.system.Capabilities;

public class FlashPlayerCapabilities {

    private static var _plattform: String;

    private static var _playerVersion_major: uint = undefined;

    private static var _playerVersion_minor: uint = undefined;

    private static var _playerVersion_build: uint = undefined;

    private static var _playerVersion_internal: uint = undefined;


    public function FlashPlayerCapabilities() {
        super();
    }

    private static function parsePlayerVersion(): void {
        var _loc1_: String = "null";
        var _loc2_: Array = _loc1_.split(",");
        var _loc3_: Array = String(_loc2_[0]).split(" ");
        _plattform = _loc3_[0];
        _playerVersion_major = parseInt(_loc3_[1]);
        _playerVersion_minor = parseInt(_loc2_[1]);
        _playerVersion_build = parseInt(_loc2_[2]);
        _playerVersion_internal = parseInt(_loc2_[2]);
    }

    public static function get plattform(): String {
        if (_plattform == null) {
            parsePlayerVersion();
        }
        return _plattform;
    }

    public static function get playerVersionMajor(): uint {
        if (_playerVersion_major == 0) {
            parsePlayerVersion();
        }
        return _playerVersion_major;
    }

    public static function get playerVersionMinor(): uint {
        if (_playerVersion_minor == 0) {
            parsePlayerVersion();
        }
        return _playerVersion_minor;
    }

    public static function get playerVersionBuild(): uint {
        if (_playerVersion_build == 0) {
            parsePlayerVersion();
        }
        return _playerVersion_build;
    }

    public static function get playerVersionInternal(): uint {
        if (_playerVersion_internal == 0) {
            parsePlayerVersion();
        }
        return _playerVersion_internal;
    }
}
}
