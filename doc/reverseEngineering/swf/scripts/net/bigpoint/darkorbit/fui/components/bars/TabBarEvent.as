package net.bigpoint.darkorbit.fui.components.bars {

import flash.events.Event;

public class TabBarEvent extends Event {

    public static const EVENT_SELECTION_CHANGED: String = "selectionChanged";


    public function TabBarEvent(param1: String) {
        super(param1);
    }
}
}
