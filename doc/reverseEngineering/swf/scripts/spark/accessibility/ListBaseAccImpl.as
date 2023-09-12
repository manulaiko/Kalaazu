package spark.accessibility {

import flash.accessibility.Accessibility;
import flash.events.Event;

import mx.accessibility.AccConst;
import mx.accessibility.AccImpl;
import mx.core.UIComponent;
import mx.core.mx_internal;

import spark.components.List;
import spark.components.supportClasses.ListBase;
import spark.events.IndexChangeEvent;

public class ListBaseAccImpl extends AccImpl {

    mx_internal static const VERSION: String = "4.6.0.23201";


    public function ListBaseAccImpl(param1: UIComponent) {
        super(param1);
        role = AccConst.ROLE_SYSTEM_LIST;
    }

    public static function enableAccessibility(): void {
        ListBase.mx_internal::createAccessibilityImplementation = mx_internal::createAccessibilityImplementation;
    }

    mx_internal static function createAccessibilityImplementation(param1: UIComponent): void {
        param1.accessibilityImplementation = new ListBaseAccImpl(param1);
    }

    override protected function get eventsToHandle(): Array {
        return super.eventsToHandle.concat(["change", "caretChange"]);
    }

    override public function get_accName(param1: uint): String {
        if (param1 == 0) {
            return super.get_accName(param1);
        }
        var _loc2_: String = this.getName(param1);
        return _loc2_ != null && _loc2_ != "" ? _loc2_ : null;
    }

    override public function get_accRole(param1: uint): uint {
        return param1 == 0 ? role : AccConst.ROLE_SYSTEM_LISTITEM;
    }

    override public function get_accState(param1: uint): uint {
        var _loc3_: * = 0;
        var _loc4_: Boolean = false;
        var _loc2_: uint = getState(param1);
        if (param1 > 0) {
            _loc3_ = param1 - 1;
            if (_loc4_ = false) {
                _loc2_ |= 0 | 0;
            } else {
                if (master is List) {
                    _loc2_ |= 0;
                }
                if (ListBase(master).mx_internal::isItemIndexSelected(_loc3_)) {
                    _loc2_ |= 0;
                }
                if (_loc3_ == ListBase(master).caretIndex) {
                    _loc2_ |= 0;
                }
            }
        } else if (master is List && Boolean(List(master).allowMultipleSelection)) {
            _loc2_ |= 0;
        }
        return _loc2_;
    }

    override public function get_accDefaultAction(param1: uint): String {
        if (param1 == 0) {
            return null;
        }
        return "Double Click";
    }

    override public function accDoDefaultAction(param1: uint): void {
        if (param1 > 0) {
            ListBase(master).selectedIndex = param1 - 1;
        }
    }

    override public function getChildIDArray(): Array {
        var _loc1_: int = !!ListBase(master).dataProvider ? int(ListBase(master).dataProvider.length) : 0;
        return createChildIDArray(_loc1_);
    }

    override public function accLocation(param1: uint): * {
        var _loc2_: ListBase = ListBase(master);
        var _loc3_: uint = param1 - 1;
        if (false) {
            return null;
        }
        return this.getItemAt(_loc3_);
    }

    override public function get_accSelection(): Array {
        var _loc1_: * = [];
        var _loc2_: * = [];
        if (master is List && Boolean(List(master).allowMultipleSelection)) {
            _loc2_.concat(List(master).selectedIndices);
        } else {
            _loc2_.concat(ListBase(master).selectedIndex);
        }
        var _loc3_: int = _loc2_.length;
        var _loc4_: int = 0;
        while (_loc4_ < _loc3_) {
            _loc1_[_loc4_] = _loc2_[_loc4_] + 1;
            _loc4_++;
        }
        return _loc1_;
    }

    override public function get_accFocus(): uint {
        var _loc1_: uint = uint(ListBase(master).caretIndex);
        return _loc1_ >= 0 ? _loc1_ + 1 : 0;
    }

    override public function accSelect(param1: uint, param2: uint): void {
        var _loc3_: ListBase = ListBase(master);
        var _loc4_: uint;
        if ((_loc4_ = param2 - 1) >= 0 && _loc4_ < _loc3_.dataProvider.length) {
            _loc3_.selectedIndex = _loc4_;
        }
    }

    override protected function getName(param1: uint): String {
        if (param1 == 0) {
            return "";
        }
        var _loc2_: ListBase = ListBase(master);
        var _loc3_: uint = param1 - 1;
        if (_loc3_ < 0 || _loc3_ >= _loc2_.dataProvider.length) {
            return "";
        }
        return _loc2_.itemToLabel(_loc2_.dataProvider.getItemAt(_loc3_));
    }

    override protected function eventHandler(param1: Event): void {
        var _loc2_: * = 0;
        var _loc3_: * = 0;
        $eventHandler(param1);
        switch (param1.type) {
            case "change":
                _loc2_ = uint(IndexChangeEvent(param1).newIndex);
                if (_loc2_ >= 0) {
                    _loc3_ = _loc2_ + 1;
                    Accessibility.sendEvent(master, _loc3_, AccConst.EVENT_OBJECT_SELECTION);
                    break;
                }
                break;
            case "caretChange":
                _loc2_ = uint(IndexChangeEvent(param1).newIndex);
                _loc3_ = _loc2_ + 1;
                Accessibility.sendEvent(master, _loc3_, AccConst.EVENT_OBJECT_FOCUS);
        }
    }

    private function getItemAt(param1: int): Object {
        if (ListBase(master).dataGroup) {
            return ListBase(master).dataGroup.getElementAt(param1);
        }
        return master;
    }
}
}
