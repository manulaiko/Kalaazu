package org.osmf.elements.f4mClasses {

import flash.utils.ByteArray;

class Media {


    public var drmAdditionalHeader: DRMAdditionalHeader;

    public var bootstrapInfo: BootstrapInfo;

    public var metadata: Object;

    public var xmp: ByteArray;

    public var url: String;

    public var bitrate: Number;

    public var moov: ByteArray;

    public var width: Number;

    public var height: Number;

    function Media() {
        this.drmAdditionalHeader = new DRMAdditionalHeader();
        super();
    }
}
}
