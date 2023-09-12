package net.bigpoint.darkorbit.fui.system.loader.parser {

public class PlainLibraryParser implements IUILoaderLibParser {


    public function PlainLibraryParser() {
        super();
    }

    public function parseLibs(param1: Object): Vector.<String> {
        var _loc2_: Vector.<String> = param1 is Vector.<String> ? param1 as Vector.<String> : new Vector.<String>();
        if (param1 is String) {
            _loc2_.push(param1);
        }
        return _loc2_;
    }
}
}
