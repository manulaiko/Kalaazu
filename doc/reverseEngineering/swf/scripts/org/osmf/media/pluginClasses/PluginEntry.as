package org.osmf.media.pluginClasses {

import org.osmf.media.MediaElement;

class PluginEntry {


    private var _pluginElement: MediaElement;

    private var _state: PluginLoadingState;

    function PluginEntry(param1: MediaElement, param2: PluginLoadingState) {
        super();
        this._pluginElement = param1;
        this._state = param2;
    }

    public function get pluginElement(): MediaElement {
        return this._pluginElement;
    }

    public function get state(): PluginLoadingState {
        return this._state;
    }

    public function set state(param1: PluginLoadingState): void {
        this._state = param1;
    }
}
}
