package package_271 {

import flash.events.Event;

public class BPLocalLoader {


    private var var_1838: Vector.<XML>;

    private var len: uint;

    private var callback: Function;

    public function BPLocalLoader() {
        super();
    }

    public function method_3425(param1: Vector.<class_1675>, param2: Function): void {
        var _loc3_: * = null;
        this.callback = param2;
        this.len = param1.length;
        this.var_1838 = new Vector.<XML>();
        var _loc4_: int = 0;
        while (_loc4_ < this.len) {
            _loc3_ = new BPlocalInternalLoader();
            _loc3_.addEventListener(Event.COMPLETE, this.method_5431);
            _loc3_.loadVO(param1[_loc4_]);
            _loc4_++;
        }
    }

    private function method_5431(param1: Event): void {
        var var_338: BPlocalInternalLoader = null;
        var var_228: XML = null;
        var var_2243: Event = param1;
        try {
            var_338 = var_2243.target as BPlocalInternalLoader;
            var_228 = XML(var_338.data);
            var_228 = new XML("<root><category name=\'" + var_338.vo.category + "\'>" + var_228.children() + "</category></root>");
            this.var_1838.push(var_228);
            var_338.removeEventListener(Event.COMPLETE, this.method_5431);
            if (this.var_1838.length == this.len) {
                this.callback(this.var_1838);
                this.var_1838 = null;
                var_2243 = null;
                this.callback = null;
            }
        } catch (error: Error) {
        }
    }
}
}

import flash.net.URLLoader;
import flash.net.URLRequest;

import package_271.class_1675;

class BPlocalInternalLoader extends URLLoader {


    public var vo: class_1675;

    function BPlocalInternalLoader() {
        super();
    }

    public function loadVO(param1: class_1675): void {
        this.vo = param1;
        load(new URLRequest(param1.url));
    }
}
