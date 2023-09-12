package spark.components.mediaClasses {

public class DynamicStreamingVideoSource {


    private var _host: Object;

    private var _initialIndex: int;

    private var _streamItems: Vector.<DynamicStreamingVideoItem>;

    private var _streamType: String = "any";

    public function DynamicStreamingVideoSource() {
        super();
    }

    public function get host(): Object {
        return this._host;
    }

    public function set host(param1: Object): void {
        this._host = param1;
    }

    public function get initialIndex(): int {
        return this._initialIndex;
    }

    public function set initialIndex(param1: int): void {
        this._initialIndex = param1;
    }

    public function get streamItems(): Vector.<DynamicStreamingVideoItem> {
        return this._streamItems;
    }

    public function set streamItems(param1: Vector.<DynamicStreamingVideoItem>): void {
        this._streamItems = param1;
    }

    public function get streamType(): String {
        return this._streamType;
    }

    public function set streamType(param1: String): void {
        this._streamType = param1;
    }
}
}
