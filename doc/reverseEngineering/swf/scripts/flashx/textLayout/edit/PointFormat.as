package flashx.textLayout.edit {

import flashx.textLayout.elements.FlowElement;
import flashx.textLayout.elements.LinkElement;
import flashx.textLayout.elements.TCYElement;
import flashx.textLayout.formats.ITextLayoutFormat;
import flashx.textLayout.formats.TextLayoutFormat;
import flashx.textLayout.tlf_internal;

public class PointFormat extends TextLayoutFormat implements ITextLayoutFormat {


    private var _id;

    private var _linkElement: LinkElement;

    private var _tcyElement: TCYElement;

    public function PointFormat(param1: ITextLayoutFormat = null) {
        super(param1);
    }

    public static function isEqual(param1: ITextLayoutFormat, param2: ITextLayoutFormat): Boolean {
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (!TextLayoutFormat.isEqual(param1, param2)) {
            return false;
        }
        if (param1 is PointFormat != param2 is PointFormat) {
            return false;
        }
        if (param1 is PointFormat) {
            _loc3_ = param1 as PointFormat;
            _loc4_ = param2 as PointFormat;
            return _loc3_.id == _loc4_.id && isEqualLink(_loc3_.linkElement, _loc4_.linkElement) && _loc3_.tcyElement == null == (_loc4_.tcyElement == null);
        }
        return true;
    }

    private static function isEqualLink(param1: LinkElement, param2: LinkElement): Boolean {
        if (param1 == null != (param2 == null)) {
            return false;
        }
        if (param1 == null) {
            return true;
        }
        return param1.href == param2.href && param1.target == param2.target;
    }

    tlf_internal static function clone(param1: PointFormat): PointFormat {
        var _loc2_: PointFormat = new PointFormat(param1);
        _loc2_.id = param1.id;
        _loc2_.linkElement = param1.linkElement === undefined || !param1.linkElement ? param1.linkElement : param1.linkElement.shallowCopy() as LinkElement;
        _loc2_.tcyElement = param1.tcyElement === undefined || !param1.tcyElement ? param1.tcyElement : param1.tcyElement.shallowCopy() as TCYElement;
        return _loc2_;
    }

    tlf_internal static function createFromFlowElement(param1: FlowElement): PointFormat {
        if (!param1) {
            return new PointFormat();
        }
        var _loc2_: PointFormat = new PointFormat(param1.format);
        var _loc3_: LinkElement = param1.getParentByType(LinkElement) as LinkElement;
        if (_loc3_) {
            _loc2_.linkElement = _loc3_.shallowCopy() as LinkElement;
        }
        var _loc4_: TCYElement;
        if (_loc4_ = param1.getParentByType(TCYElement) as TCYElement) {
            _loc2_.tcyElement = _loc4_.shallowCopy() as TCYElement;
        }
        return _loc2_;
    }

    public function get linkElement(): * {
        return this._linkElement;
    }

    public function set linkElement(param1: LinkElement): void {
        this._linkElement = param1;
    }

    public function get tcyElement(): * {
        return this._tcyElement;
    }

    public function set tcyElement(param1: TCYElement): void {
        this._tcyElement = param1;
    }

    public function get id(): * {
        return this._id;
    }

    public function set id(param1: *): void {
        this._id = param1;
    }
}
}
