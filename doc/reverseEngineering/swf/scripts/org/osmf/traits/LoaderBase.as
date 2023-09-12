package org.osmf.traits {

import flash.errors.IllegalOperationError;
import flash.events.EventDispatcher;

import org.osmf.events.LoaderEvent;
import org.osmf.media.MediaResourceBase;
import org.osmf.utils.OSMFStrings;

public class LoaderBase extends EventDispatcher {


    public function LoaderBase() {
        super();
    }

    public function canHandleResource(param1: MediaResourceBase): Boolean {
        return false;
    }

    public final function load(param1: LoadTrait): void {
        this.validateLoad(param1);
        this.executeLoad(param1);
    }

    public final function unload(param1: LoadTrait): void {
        this.validateUnload(param1);
        this.executeUnload(param1);
    }

    protected function executeLoad(param1: LoadTrait): void {
    }

    protected function executeUnload(param1: LoadTrait): void {
    }

    protected final function updateLoadTrait(param1: LoadTrait, param2: String): void {
        var _loc3_: * = null;
        if (param2 != param1.loadState) {
            _loc3_ = param1.loadState;
            dispatchEvent(new LoaderEvent(LoaderEvent.LOAD_STATE_CHANGE, false, false, this, param1, _loc3_, param2));
        }
    }

    private function validateLoad(param1: LoadTrait): void {
        if (param1 == null) {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
        }
        if (param1.loadState == LoadState.READY) {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.ALREADY_READY));
        }
        if (param1.loadState == LoadState.LOADING) {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.ALREADY_LOADING));
        }
        if (this.canHandleResource(param1.resource) == false) {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.LOADER_CANT_HANDLE_RESOURCE));
        }
    }

    private function validateUnload(param1: LoadTrait): void {
        if (param1 == null) {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
        }
        if (param1.loadState == LoadState.UNLOADING) {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.ALREADY_UNLOADING));
        }
        if (param1.loadState == LoadState.UNINITIALIZED) {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.ALREADY_UNLOADED));
        }
        if (this.canHandleResource(param1.resource) == false) {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.LOADER_CANT_HANDLE_RESOURCE));
        }
    }
}
}
