package package_23 {

import flash.events.Event;

import package_24.class_75;

public class FileCollectionFileLoadEvent extends Event {

    public static const FILE_LOADED: String = "FileCollectionFileLoadEvent.FILE_LOADED";

    public static const FILE_LOAD_ERROR: String = "FileCollectionFileLoadEvent.FILE_LOAD_ERROR";


    public var name_58: class_75;

    public function FileCollectionFileLoadEvent(param1: String, param2: class_75, param3: Boolean = false, param4: Boolean = false) {
        this.name_58 = param2;
        super(param1, param3, param4);
    }
}
}
