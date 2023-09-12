package org.osmf.events {

import flash.events.Event;

import org.osmf.media.MediaElement;
import org.osmf.media.MediaResourceBase;

public class MediaFactoryEvent extends Event {

    public static const PLUGIN_LOAD: String = "pluginLoad";

    public static const PLUGIN_LOAD_ERROR: String = "pluginLoadError";

    public static const MEDIA_ELEMENT_CREATE: String = "mediaElementCreate";


    private var _resource: MediaResourceBase;

    private var _mediaElement: MediaElement;

    public function MediaFactoryEvent(param1: String, param2: Boolean = false, param3: Boolean = false, param4: MediaResourceBase = null, param5: MediaElement = null) {
        super(param1, param2, param3);
        this._resource = param4;
        this._mediaElement = param5;
    }

    public function get resource(): MediaResourceBase {
        return this._resource;
    }

    public function get mediaElement(): MediaElement {
        return this._mediaElement;
    }

    override public function clone(): Event {
        return new MediaFactoryEvent(type, bubbles, cancelable, this._resource, this._mediaElement);
    }
}
}
