package package_23 {

import flash.events.Event;

public class FileCollectionEvent extends Event {

    public static const RESOURCE_FILE_LOADED: String = "FileCollectionEvent.RESOURCE_FILE_LOADED";

    public static const RESOURCE_FILE_NOT_FOUND: String = "FileCollectionEvent.RESOURCE_FILE_NOT_FOUND";

    public static const EMBEDDED_OBJECT_NOT_FOUND: String = "FileCollectionEvent.EMBEDDED_OBJECT_NOT_FOUND";

    public static const RESOURCE_FILE_SECURITY_BREACH: String = "FileCollectionEvent.RESOURCE_FILE_SECURITY_BREACH";

    public static const const_1614: String = "FileCollectionEvent.RESOURCE_FILE_SECURITY_BREACH";

    public static const ALL_FILES_LOADED: String = "FileCollectionEvent.ALL_FILES_LOADED";

    public static const RESOURCE_XML_PARSED: String = "FileCollectionEvent.RESOURCE_XML_PARSED";

    public static const RESOURCE_CLEARED: String = "FileCollectionEvent.RESOURCE_CLEARED";


    private var _xml: XML;

    private var _text: String;

    public function FileCollectionEvent(param1: String, param2: Boolean = false, param3: Boolean = false) {
        super(param1, param2, param3);
    }

    public function get text(): String {
        return this._text;
    }

    public function set text(param1: String): void {
        this._text = param1;
    }

    public function get xml(): XML {
        return this._xml;
    }

    public function set xml(param1: XML): void {
        this._xml = param1;
    }
}
}
