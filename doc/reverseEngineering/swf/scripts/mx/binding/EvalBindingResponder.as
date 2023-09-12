package mx.binding {

import mx.core.mx_internal;
import mx.rpc.IResponder;

public class EvalBindingResponder implements IResponder {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var binding: Binding;

    private var object: Object;

    public function EvalBindingResponder(param1: Binding, param2: Object) {
        super();
        this.binding = param1;
        this.object = param2;
    }

    public function result(param1: Object): void {
        this.binding.execute(this.object);
    }

    public function fault(param1: Object): void {
    }
}
}
