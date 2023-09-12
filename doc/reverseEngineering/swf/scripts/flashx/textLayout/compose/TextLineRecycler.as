package flashx.textLayout.compose {

import flash.text.engine.TextBlock;
import flash.text.engine.TextLine;
import flash.utils.Dictionary;

import flashx.textLayout.tlf_internal;

public class TextLineRecycler {

    private static const _textLineRecyclerCanBeEnabled: Boolean = new TextBlock().hasOwnProperty("recreateTextLine");

    private static var _textLineRecyclerEnabled: Boolean = _textLineRecyclerCanBeEnabled;

    private static var reusableLineCache: Dictionary = new Dictionary(true);


    public function TextLineRecycler() {
        super();
    }

    public static function get textLineRecyclerEnabled(): Boolean {
        return _textLineRecyclerEnabled;
    }

    public static function set textLineRecyclerEnabled(param1: Boolean): void {
        _textLineRecyclerEnabled = param1 ? _textLineRecyclerCanBeEnabled : false;
    }

    public static function addLineForReuse(param1: TextLine): void {
        if (_textLineRecyclerEnabled) {
            reusableLineCache[param1] = null;
        }
    }

    public static function getLineForReuse(): TextLine {
        var _loc1_: * = null;
        if (_textLineRecyclerEnabled) {
            var _loc2_: int = 0;
            var _loc3_: * = reusableLineCache;
            for (_loc1_ in _loc3_) {
                delete reusableLineCache[_loc1_];
                return _loc1_ as TextLine;
            }
        }
        return null;
    }

    tlf_internal static function emptyReusableLineCache(): void {
        reusableLineCache = new Dictionary(true);
    }
}
}
