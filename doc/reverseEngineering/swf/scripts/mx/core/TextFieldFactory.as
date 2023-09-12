package mx.core {

import flash.text.TextField;
import flash.utils.Dictionary;

public class TextFieldFactory implements ITextFieldFactory {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static var instance: ITextFieldFactory;


    private var textFields: Dictionary;

    private var fteTextFields: Dictionary;

    public function TextFieldFactory() {
        this.textFields = new Dictionary(true);
        this.fteTextFields = new Dictionary(true);
        super();
    }

    public static function getInstance(): ITextFieldFactory {
        if (!instance) {
            instance = new TextFieldFactory();
        }
        return instance;
    }

    public function createTextField(param1: IFlexModuleFactory): TextField {
        var _loc4_: * = null;
        var _loc2_: * = null;
        var _loc3_: Dictionary = this.textFields[param1];
        if (_loc3_) {
            var _loc5_: int = 0;
            var _loc6_: * = _loc3_;
            for (_loc4_ in _loc6_) {
                _loc2_ = TextField(_loc4_);
            }
        }
        if (!_loc2_) {
            if (param1) {
                _loc2_ = TextField(param1.create("flash.text.TextField"));
            } else {
                _loc2_ = new TextField();
            }
            if (!_loc3_) {
                _loc3_ = new Dictionary(true);
            }
            _loc3_[_loc2_] = 1;
            this.textFields[param1] = _loc3_;
        }
        return _loc2_;
    }

    public function createFTETextField(param1: IFlexModuleFactory): Object {
        var _loc4_: * = null;
        var _loc2_: * = null;
        var _loc3_: Dictionary = this.fteTextFields[param1];
        if (_loc3_) {
            var _loc5_: int = 0;
            var _loc6_: * = _loc3_;
            for (_loc2_ in _loc6_) {
            }
        }
        if (!_loc2_) {
            if (param1) {
                _loc2_ = param1.create("mx.core.FTETextField");
                _loc2_.fontContext = param1;
            }
            if (!_loc3_) {
                _loc3_ = new Dictionary(true);
            }
            _loc3_[_loc2_] = 1;
            this.fteTextFields[param1] = _loc3_;
        }
        return _loc2_;
    }
}
}
