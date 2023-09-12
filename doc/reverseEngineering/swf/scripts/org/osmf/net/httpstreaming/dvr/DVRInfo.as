package org.osmf.net.httpstreaming.dvr {

public class DVRInfo {


    public var id: String;

    public var url: String;

    public var beginOffset: uint = 0;

    public var endOffset: uint = 0;

    public var offline: Boolean;

    public var isRecording: Boolean;

    public var curLength: Number;

    public var startTime: Number = NaN;

    public function DVRInfo() {
        super();
    }
}
}
