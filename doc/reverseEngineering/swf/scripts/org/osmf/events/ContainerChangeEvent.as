package org.osmf.events {

import flash.events.Event;

import org.osmf.containers.IMediaContainer;

public class ContainerChangeEvent extends Event {

    public static const CONTAINER_CHANGE: String = "containerChange";


    private var _oldContainer: IMediaContainer;

    private var _newContainer: IMediaContainer;

    public function ContainerChangeEvent(param1: String, param2: Boolean = false, param3: Boolean = false, param4: IMediaContainer = null, param5: IMediaContainer = null) {
        super(param1, param2, param3);
        this._oldContainer = param4;
        this._newContainer = param5;
    }

    public function get oldContainer(): IMediaContainer {
        return this._oldContainer;
    }

    public function get newContainer(): IMediaContainer {
        return this._newContainer;
    }

    override public function clone(): Event {
        return new ContainerChangeEvent(type, bubbles, cancelable, this._oldContainer, this._newContainer);
    }
}
}
