package org.osmf.media {

public class URLResource extends MediaResourceBase {


    private var _url: String;

    public function URLResource(param1: String) {
        super();
        this._url = param1;
    }

    public function get url(): String {
        return this._url;
    }
}
}
