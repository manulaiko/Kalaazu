package org.osmf.net.drm {

import flash.events.DRMStatusEvent;
import flash.system.SystemUpdater;

import org.osmf.events.DRMEvent;
import org.osmf.events.MediaError;
import org.osmf.traits.DRMTrait;

public class NetStreamDRMTrait extends DRMTrait {


    private var drmServices: DRMServices;

    public function NetStreamDRMTrait() {
        this.drmServices = new DRMServices();
        super();
        this.drmServices.addEventListener(DRMEvent.DRM_STATE_CHANGE, this.onStateChange);
    }

    public function set drmMetadata(param1: Object): void {
        if (param1 != this.drmServices.drmMetadata) {
            this.drmServices.drmMetadata = param1;
        }
    }

    public function get drmMetadata(): Object {
        return this.drmServices.drmMetadata;
    }

    public function update(param1: String): SystemUpdater {
        return this.drmServices.update(param1);
    }

    override public function authenticate(param1: String = null, param2: String = null): void {
        this.drmServices.authenticate(param1, param2);
    }

    override public function authenticateWithToken(param1: Object): void {
        this.drmServices.authenticateWithToken(param1);
    }

    public function inlineDRMFailed(param1: MediaError): void {
        this.drmServices.inlineDRMFailed(param1);
    }

    public function inlineOnVoucher(param1: DRMStatusEvent): void {
        this.drmServices.inlineOnVoucher(param1);
    }

    private function onStateChange(param1: DRMEvent): void {
        setPeriod(param1.period);
        setStartDate(param1.startDate);
        setEndDate(param1.endDate);
        setDrmState(param1.drmState);
        dispatchEvent(new DRMEvent(DRMEvent.DRM_STATE_CHANGE, drmState, false, false, startDate, endDate, period, param1.serverURL, param1.token, param1.mediaError));
    }
}
}
