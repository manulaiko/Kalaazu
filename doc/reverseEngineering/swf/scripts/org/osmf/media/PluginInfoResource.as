package org.osmf.media {

public class PluginInfoResource extends MediaResourceBase {


    private var _pluginInfo: PluginInfo;

    public function PluginInfoResource(param1: PluginInfo) {
        super();
        this._pluginInfo = param1;
    }

    public function get pluginInfo(): PluginInfo {
        return this._pluginInfo;
    }
}
}
