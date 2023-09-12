package org.osmf.net.drm {

import flash.errors.IllegalOperationError;
import flash.events.DRMAuthenticationCompleteEvent;
import flash.events.DRMAuthenticationErrorEvent;
import flash.events.DRMErrorEvent;
import flash.events.DRMStatusEvent;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.events.StatusEvent;
import flash.net.drm.DRMContentData;
import flash.net.drm.DRMManager;
import flash.net.drm.DRMVoucher;
import flash.net.drm.LoadVoucherSetting;
import flash.system.SystemUpdater;
import flash.system.SystemUpdaterType;
import flash.utils.ByteArray;

import org.osmf.events.DRMEvent;
import org.osmf.events.MediaError;
import org.osmf.events.MediaErrorCodes;
import org.osmf.traits.DRMState;
import org.osmf.utils.OSMFStrings;

class DRMServices extends EventDispatcher {

    private static const DRM_AUTHENTICATION_FAILED: int = 3301;

    private static const DRM_NEEDS_AUTHENTICATION: int = 3330;

    private static const DRM_CONTENT_NOT_YET_VALID: int = 3331;

    private static var updater: SystemUpdater;


    private var _drmState: String = "uninitialized";

    private var lastToken: ByteArray;

    private var drmContentData: DRMContentData;

    private var voucher: DRMVoucher;

    private var drmManager: DRMManager;

    function DRMServices() {
        super();
        this.drmManager = DRMManager.getDRMManager();
    }

    public function get drmState(): String {
        return this._drmState;
    }

    public function set drmMetadata(param1: Object): void {
        var onComplete: Function = null;
        var value: Object = param1;
        this.lastToken = null;
        if (value is DRMContentData) {
            this.drmContentData = value as DRMContentData;
            this.retrieveVoucher();
        } else {
            try {
                this.drmContentData = new DRMContentData(value as ByteArray);
                this.retrieveVoucher();
            } catch (argError: ArgumentError) {
                updateDRMState(DRMState.AUTHENTICATION_ERROR, new MediaError(argError.errorID, "DRMContentData invalid"));
            } catch (error: IllegalOperationError) {
                onComplete = function (param1: Event): void {
                    updater.removeEventListener(Event.COMPLETE, onComplete);
                    drmMetadata = value;
                };
                update(SystemUpdaterType.DRM);
                updater.addEventListener(Event.COMPLETE, onComplete);
            }
        }
    }

    public function get drmMetadata(): Object {
        return this.drmContentData;
    }

    public function authenticate(param1: String = null, param2: String = null): void {
        if (this.drmContentData == null) {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.DRM_METADATA_NOT_SET));
        }
        this.drmManager.addEventListener(DRMAuthenticationErrorEvent.AUTHENTICATION_ERROR, this.authError);
        this.drmManager.addEventListener(DRMAuthenticationCompleteEvent.AUTHENTICATION_COMPLETE, this.authComplete);
        if (param2 == null && param1 == null) {
            this.retrieveVoucher();
        } else {
            this.drmManager.authenticate(this.drmContentData.serverURL, this.drmContentData.domain, param1, param2);
        }
    }

    public function authenticateWithToken(param1: Object): void {
        if (this.drmContentData == null) {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.DRM_METADATA_NOT_SET));
        }
        this.drmManager.setAuthenticationToken(this.drmContentData.serverURL, this.drmContentData.domain, param1 as ByteArray);
        this.retrieveVoucher();
    }

    public function get startDate(): Date {
        if (this.voucher != null) {
            return !!this.voucher.playbackTimeWindow ? this.voucher.playbackTimeWindow.startDate : this.voucher.voucherStartDate;
        }
        return null;
    }

    public function get endDate(): Date {
        if (this.voucher != null) {
            return !!this.voucher.playbackTimeWindow ? this.voucher.playbackTimeWindow.endDate : this.voucher.voucherEndDate;
        }
        return null;
    }

    public function get period(): Number {
        if (this.voucher != null) {
            return !!this.voucher.playbackTimeWindow ? this.voucher.playbackTimeWindow.period : (Boolean(this.voucher.voucherEndDate) && Boolean(this.voucher.voucherStartDate) ? (this.voucher.voucherEndDate.time - this.voucher.voucherStartDate.time) / 1000 : 0);
        }
        return NaN;
    }

    public function inlineDRMFailed(param1: MediaError): void {
        this.updateDRMState(DRMState.AUTHENTICATION_ERROR, param1);
    }

    public function inlineOnVoucher(param1: DRMStatusEvent): void {
        this.drmContentData = param1.contentData;
        this.onVoucherLoaded(param1);
    }

    public function update(param1: String): SystemUpdater {
        this.updateDRMState(DRMState.DRM_SYSTEM_UPDATING);
        if (updater == null) {
            updater = new SystemUpdater();
            this.toggleErrorListeners(updater, true);
            updater.update(param1);
        } else {
            this.toggleErrorListeners(updater, true);
        }
        return updater;
    }

    private function retrieveVoucher(): void {
        this.updateDRMState(DRMState.AUTHENTICATING);
        this.drmManager.addEventListener(DRMErrorEvent.DRM_ERROR, this.onDRMError);
        this.drmManager.addEventListener(DRMStatusEvent.DRM_STATUS, this.onVoucherLoaded);
        this.drmManager.loadVoucher(this.drmContentData, LoadVoucherSetting.ALLOW_SERVER);
    }

    private function onVoucherLoaded(param1: DRMStatusEvent): void {
        var _loc2_: * = null;
        if (param1.contentData == this.drmContentData) {
            _loc2_ = new Date();
            if (Boolean(param1.voucher) && ((param1.voucher.voucherEndDate == null || param1.voucher.voucherEndDate.time >= _loc2_.time) && (param1.voucher.voucherStartDate == null || param1.voucher.voucherStartDate.time <= _loc2_.time))) {
                this.voucher = param1.voucher;
                this.removeEventListeners();
                if (this.voucher.playbackTimeWindow == null) {
                    this.updateDRMState(DRMState.AUTHENTICATION_COMPLETE, null, this.voucher.voucherStartDate, this.voucher.voucherEndDate, this.period, this.lastToken);
                } else {
                    this.updateDRMState(DRMState.AUTHENTICATION_COMPLETE, null, this.voucher.playbackTimeWindow.startDate, this.voucher.playbackTimeWindow.endDate, this.voucher.playbackTimeWindow.period, this.lastToken);
                }
            } else {
                this.forceRefreshVoucher();
            }
        }
    }

    private function forceRefreshVoucher(): void {
        this.drmManager.loadVoucher(this.drmContentData, LoadVoucherSetting.FORCE_REFRESH);
    }

    private function onDRMError(param1: DRMErrorEvent): void {
        if (param1.contentData == this.drmContentData) {
            switch (param1.errorID) {
                case DRM_CONTENT_NOT_YET_VALID:
                    this.forceRefreshVoucher();
                    break;
                case DRM_NEEDS_AUTHENTICATION:
                    this.updateDRMState(DRMState.AUTHENTICATION_NEEDED, null, null, null, 0, null, param1.contentData.serverURL);
                    break;
                default:
                    this.removeEventListeners();
                    this.updateDRMState(DRMState.AUTHENTICATION_ERROR, new MediaError(param1.errorID, param1.text));
            }
        }
    }

    private function removeEventListeners(): void {
        this.drmManager.removeEventListener(DRMErrorEvent.DRM_ERROR, this.onDRMError);
        this.drmManager.removeEventListener(DRMStatusEvent.DRM_STATUS, this.onVoucherLoaded);
    }

    private function authComplete(param1: DRMAuthenticationCompleteEvent): void {
        this.drmManager.removeEventListener(DRMAuthenticationErrorEvent.AUTHENTICATION_ERROR, this.authError);
        this.drmManager.removeEventListener(DRMAuthenticationCompleteEvent.AUTHENTICATION_COMPLETE, this.authComplete);
        this.lastToken = param1.token;
        this.retrieveVoucher();
    }

    private function authError(param1: DRMAuthenticationErrorEvent): void {
        this.drmManager.removeEventListener(DRMAuthenticationErrorEvent.AUTHENTICATION_ERROR, this.authError);
        this.drmManager.removeEventListener(DRMAuthenticationCompleteEvent.AUTHENTICATION_COMPLETE, this.authComplete);
        this.updateDRMState(DRMState.AUTHENTICATION_ERROR, new MediaError(param1.errorID, param1.toString()));
    }

    private function toggleErrorListeners(param1: SystemUpdater, param2: Boolean): void {
        if (param2) {
            param1.addEventListener(Event.COMPLETE, this.onUpdateComplete);
            param1.addEventListener(Event.CANCEL, this.onUpdateComplete);
            param1.addEventListener(IOErrorEvent.IO_ERROR, this.onUpdateError);
            param1.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onUpdateError);
            param1.addEventListener(StatusEvent.STATUS, this.onUpdateError);
        } else {
            param1.removeEventListener(Event.COMPLETE, this.onUpdateComplete);
            param1.removeEventListener(Event.CANCEL, this.onUpdateComplete);
            param1.removeEventListener(IOErrorEvent.IO_ERROR, this.onUpdateError);
            param1.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.onUpdateError);
            param1.removeEventListener(StatusEvent.STATUS, this.onUpdateError);
        }
    }

    private function onUpdateComplete(param1: Event): void {
        this.toggleErrorListeners(updater, false);
    }

    private function onUpdateError(param1: Event): void {
        this.toggleErrorListeners(updater, false);
        this.updateDRMState(DRMState.AUTHENTICATION_ERROR, new MediaError(MediaErrorCodes.DRM_SYSTEM_UPDATE_ERROR, param1.toString()));
    }

    private function updateDRMState(param1: String, param2: MediaError = null, param3: Date = null, param4: Date = null, param5: Number = 0, param6: Object = null, param7: String = null): void {
        this._drmState = param1;
        dispatchEvent(new DRMEvent(DRMEvent.DRM_STATE_CHANGE, param1, false, false, param3, param4, param5, param7, param6, param2));
    }
}
}
