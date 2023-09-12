package spark.components {

import mx.core.IDataRenderer;
import mx.core.mx_internal;
import mx.events.FlexEvent;

public class DataRenderer extends Group implements IDataRenderer {

    mx_internal static const VERSION: String = "4.6.0.23201";


    private var _data: Object;

    public function DataRenderer() {
        super();
    }

    [Bindable("dataChange")]
    public function get data(): Object {
        return this._data;
    }

    public function set data(param1: Object): void {
        this._data = param1;
        if (hasEventListener(FlexEvent.DATA_CHANGE)) {
            dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
        }
    }
}
}
