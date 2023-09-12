package org.osmf.metadata {

import flash.errors.IllegalOperationError;

import org.osmf.events.MetadataEvent;
import org.osmf.utils.OSMFStrings;

public class MetadataWatcher {


    private var parentMetadata: Metadata;

    private var namespaceURL: String;

    private var key: String;

    private var callback: Function;

    private var currentMetadata: Metadata;

    private var watching: Boolean;

    public function MetadataWatcher(param1: Metadata, param2: String, param3: String, param4: Function) {
        super();
        if (param1 == null || param2 == null || param4 == null) {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
        }
        this.parentMetadata = param1;
        this.namespaceURL = param2;
        this.key = param3;
        this.callback = param4;
    }

    public function watch(param1: Boolean = true): void {
        if (this.watching == false) {
            this.watching = true;
            this.parentMetadata.addEventListener(MetadataEvent.VALUE_ADD, this.onMetadataAdd, false, 0, true);
            this.processWatchedMetadataChange(this.parentMetadata.getValue(this.namespaceURL) as Metadata);
            if (param1 == true) {
                if (this.key != null) {
                    this.callback(!!this.currentMetadata ? this.currentMetadata.getValue(this.key) : undefined);
                } else {
                    this.callback(!!this.currentMetadata ? this.currentMetadata : undefined);
                }
            }
        }
    }

    public function unwatch(): void {
        if (this.watching == true) {
            this.processWatchedMetadataChange(null, false);
            this.parentMetadata.removeEventListener(MetadataEvent.VALUE_ADD, this.onMetadataAdd);
            this.watching = false;
        }
    }

    private function processWatchedMetadataChange(param1: Metadata, param2: Boolean = true): void {
        var _loc3_: * = null;
        if (this.currentMetadata != param1) {
            _loc3_ = this.currentMetadata;
            if (this.currentMetadata) {
                this.currentMetadata.removeEventListener(MetadataEvent.VALUE_CHANGE, this.onValueChange);
                this.currentMetadata.removeEventListener(MetadataEvent.VALUE_ADD, this.onValueAdd);
                this.currentMetadata.removeEventListener(MetadataEvent.VALUE_REMOVE, this.onValueRemove);
                this.parentMetadata.removeEventListener(MetadataEvent.VALUE_REMOVE, this.onMetadataRemove);
            } else {
                this.parentMetadata.removeEventListener(MetadataEvent.VALUE_ADD, this.onMetadataAdd);
            }
            this.currentMetadata = param1;
            if (param1) {
                param1.addEventListener(MetadataEvent.VALUE_CHANGE, this.onValueChange, false, 0, true);
                param1.addEventListener(MetadataEvent.VALUE_ADD, this.onValueAdd, false, 0, true);
                param1.addEventListener(MetadataEvent.VALUE_REMOVE, this.onValueRemove, false, 0, true);
                this.parentMetadata.addEventListener(MetadataEvent.VALUE_REMOVE, this.onMetadataRemove);
            } else {
                this.parentMetadata.addEventListener(MetadataEvent.VALUE_ADD, this.onMetadataAdd);
            }
        }
    }

    private function onMetadataAdd(param1: MetadataEvent): void {
        var _loc2_: Metadata = param1.value as Metadata;
        if (Boolean(_loc2_) && param1.key == this.namespaceURL) {
            this.processWatchedMetadataChange(_loc2_);
            if (this.key == null) {
                this.callback(_loc2_);
            } else {
                this.callback(_loc2_.getValue(this.key));
            }
        }
    }

    private function onMetadataRemove(param1: MetadataEvent): void {
        var _loc2_: Metadata = param1.value as Metadata;
        if (Boolean(_loc2_) && param1.key == this.namespaceURL) {
            this.processWatchedMetadataChange(null);
            this.callback(undefined);
        }
    }

    private function onValueChange(param1: MetadataEvent): void {
        if (this.key) {
            if (this.key == param1.key) {
                this.callback(param1.value);
            }
        } else {
            this.callback(param1.target as Metadata);
        }
    }

    private function onValueAdd(param1: MetadataEvent): void {
        if (this.key) {
            if (this.key == param1.key) {
                this.callback(param1.value);
            }
        } else {
            this.callback(param1.target as Metadata);
        }
    }

    private function onValueRemove(param1: MetadataEvent): void {
        if (this.key) {
            if (this.key == param1.key) {
                this.callback(undefined);
            }
        } else {
            this.callback(param1.target as Metadata);
        }
    }
}
}
