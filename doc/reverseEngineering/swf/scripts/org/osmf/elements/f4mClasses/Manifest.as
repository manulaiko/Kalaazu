package org.osmf.elements.f4mClasses {

import org.osmf.net.httpstreaming.dvr.DVRInfo;

public class Manifest {


    public var id: String;

    public var baseURL: String;

    public var duration: Number;

    public var mimeType: String;

    public var streamType: String;

    public var deliveryType: String;

    public var startTime: Date;

    public var bootstrapInfos: Vector.<BootstrapInfo>;

    public var drmAdditionalHeaders: Vector.<DRMAdditionalHeader>;

    public var media: Vector.<Media>;

    public var dvrInfo: DVRInfo = null;

    public function Manifest() {
        this.bootstrapInfos = new Vector.<BootstrapInfo>();
        this.drmAdditionalHeaders = new Vector.<DRMAdditionalHeader>();
        this.media = new Vector.<Media>();
        super();
    }
}
}
