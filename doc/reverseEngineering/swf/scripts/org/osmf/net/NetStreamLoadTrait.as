package org.osmf.net {

import flash.errors.IllegalOperationError;
import flash.events.NetStatusEvent;
import flash.net.NetConnection;
import flash.net.NetStream;
import flash.utils.Dictionary;

import org.osmf.events.LoadEvent;
import org.osmf.media.MediaResourceBase;
import org.osmf.traits.LoadState;
import org.osmf.traits.LoadTrait;
import org.osmf.traits.LoaderBase;
import org.osmf.traits.MediaTraitBase;
import org.osmf.utils.OSMFStrings;

public class NetStreamLoadTrait extends LoadTrait {


    private var _connection: NetConnection;

    private var _switchManager: NetStreamSwitchManagerBase;

    private var traits: Dictionary;

    private var _netConnectionFactory: NetConnectionFactoryBase;

    private var isStreamingResource: Boolean;

    private var _netStream: NetStream;

    public function NetStreamLoadTrait(param1: LoaderBase, param2: MediaResourceBase) {
        this.traits = new Dictionary();
        super(param1, param2);
        this.isStreamingResource = NetStreamUtils.isStreamingResource(param2);
    }

    public function get connection(): NetConnection {
        return this._connection;
    }

    public function set connection(param1: NetConnection): void {
        this._connection = param1;
    }

    public function get netStream(): NetStream {
        return this._netStream;
    }

    public function set netStream(param1: NetStream): void {
        this._netStream = param1;
    }

    public function get switchManager(): NetStreamSwitchManagerBase {
        return this._switchManager;
    }

    public function set switchManager(param1: NetStreamSwitchManagerBase): void {
        this._switchManager = param1;
    }

    public function setTrait(param1: MediaTraitBase): void {
        if (param1 == null) {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
        }
        this.traits[param1.traitType] = param1;
    }

    public function getTrait(param1: String): MediaTraitBase {
        return this.traits[param1];
    }

    public function get netConnectionFactory(): NetConnectionFactoryBase {
        return this._netConnectionFactory;
    }

    public function set netConnectionFactory(param1: NetConnectionFactoryBase): void {
        this._netConnectionFactory = param1;
    }

    override protected function loadStateChangeStart(param1: String): void {
        if (param1 == LoadState.READY) {
            if (!this.isStreamingResource && (this.netStream.bytesTotal <= 0 || this.netStream.bytesTotal == uint.MAX_VALUE)) {
                this.netStream.addEventListener(NetStatusEvent.NET_STATUS, this.onNetStatus);
            }
        } else if (param1 == LoadState.UNINITIALIZED) {
            this.netStream = null;
            dispatchEvent(new LoadEvent(LoadEvent.BYTES_LOADED_CHANGE, false, false, null, this.bytesLoaded));
            dispatchEvent(new LoadEvent(LoadEvent.BYTES_TOTAL_CHANGE, false, false, null, this.bytesTotal));
        }
    }

    override public function get bytesLoaded(): Number {
        return this.isStreamingResource ? NaN : (this.netStream != null ? this.netStream.bytesLoaded : NaN);
    }

    override public function get bytesTotal(): Number {
        return this.isStreamingResource ? NaN : (this.netStream != null ? this.netStream.bytesTotal : NaN);
    }

    private function onNetStatus(param1: NetStatusEvent): void {
        if (this.netStream != null && this.netStream.bytesTotal > 0) {
            dispatchEvent(new LoadEvent(LoadEvent.BYTES_TOTAL_CHANGE, false, false, null, this.netStream.bytesTotal));
            this.netStream.removeEventListener(NetStatusEvent.NET_STATUS, this.onNetStatus);
        }
    }
}
}
