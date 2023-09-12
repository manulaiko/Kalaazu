package org.osmf.net.httpstreaming.f4f {

import flash.net.URLRequest;
import flash.utils.ByteArray;

import org.osmf.elements.f4mClasses.BootstrapInfo;
import org.osmf.events.DVRStreamInfoEvent;
import org.osmf.events.HTTPStreamingFileHandlerEvent;
import org.osmf.events.HTTPStreamingIndexHandlerEvent;
import org.osmf.net.dvr.DVRUtils;
import org.osmf.net.httpstreaming.HTTPStreamRequest;
import org.osmf.net.httpstreaming.HTTPStreamingFileHandlerBase;
import org.osmf.net.httpstreaming.HTTPStreamingIndexHandlerBase;
import org.osmf.net.httpstreaming.flv.FLVTagScriptDataObject;

public class HTTPStreamingF4FIndexHandler extends HTTPStreamingIndexHandlerBase {

    public static const DEFAULT_FRAGMENTS_THRESHOLD: uint = 5;


    private var pendingIndexLoads: int;

    private var pendingIndexUpdates: int;

    private var bootstrapBoxes: Vector.<AdobeBootstrapBox>;

    private var serverBaseURL: String;

    private var streamInfos: Vector.<HTTPStreamingF4FStreamInfo>;

    private var currentQuality: int;

    private var currentFAI: FragmentAccessInformation;

    private var fragmentsThreshold: uint;

    private var fragmentRunTablesUpdating: Boolean;

    private var f4fIndexInfo: HTTPStreamingF4FIndexInfo;

    private var fileHandler: HTTPStreamingFileHandlerBase;

    private var dvrGetStreamInfoCall: Boolean;

    private var playInProgress: Boolean;

    private var offsetFromCurrent: Number = 5;

    private var delay: Number = 0.05;

    private var pureLiveOffset: Number = NaN;

    public function HTTPStreamingF4FIndexHandler(param1: HTTPStreamingFileHandlerBase, param2: uint = 5) {
        super();
        this.currentQuality = -1;
        this.currentFAI = null;
        this.fragmentRunTablesUpdating = false;
        this.fileHandler = param1;
        this.fragmentsThreshold = param2;
        this.dvrGetStreamInfoCall = false;
        param1.addEventListener(HTTPStreamingFileHandlerEvent.NOTIFY_BOOTSTRAP_BOX, this.onNewBootstrapBox);
    }

    public function get bootstrapInfo(): AdobeBootstrapBox {
        return this.currentQuality < 0 ? null : this.bootstrapBoxes[this.currentQuality];
    }

    override public function dvrGetStreamInfo(param1: Object): void {
        this.dvrGetStreamInfoCall = true;
        this.playInProgress = false;
        this.initialize(param1);
    }

    override public function initialize(param1: Object): void {
        var _loc2_: * = null;
        var _loc4_: * = null;
        this.f4fIndexInfo = param1 as HTTPStreamingF4FIndexInfo;
        if (this.f4fIndexInfo == null || this.f4fIndexInfo.streamInfos == null || this.f4fIndexInfo.streamInfos.length <= 0) {
            dispatchEvent(new HTTPStreamingIndexHandlerEvent(HTTPStreamingIndexHandlerEvent.NOTIFY_ERROR));
            return;
        }
        this.bootstrapBoxes = new Vector.<AdobeBootstrapBox>(this.f4fIndexInfo.streamInfos.length);
        this.fragmentRunTablesUpdating = false;
        this.playInProgress = false;
        this.pendingIndexLoads = 0;
        this.pureLiveOffset = NaN;
        this.serverBaseURL = this.f4fIndexInfo.serverBaseURL;
        this.streamInfos = this.f4fIndexInfo.streamInfos;
        var _loc3_: int = 0;
        while (_loc3_ < this.streamInfos.length) {
            if ((_loc4_ = this.streamInfos[_loc3_].bootstrapInfo) == null || _loc4_.url == null && _loc4_.data == null) {
                dispatchEvent(new HTTPStreamingIndexHandlerEvent(HTTPStreamingIndexHandlerEvent.NOTIFY_ERROR));
                return;
            }
            if (_loc4_.data != null) {
                _loc2_ = this.processBootstrapData(_loc4_.data, null);
                if (_loc2_ == null) {
                    dispatchEvent(new HTTPStreamingIndexHandlerEvent(HTTPStreamingIndexHandlerEvent.NOTIFY_ERROR));
                    return;
                }
                this.bootstrapBoxes[_loc3_] = _loc2_;
            } else {
                ++this.pendingIndexLoads;
                dispatchEvent(new HTTPStreamingIndexHandlerEvent(HTTPStreamingIndexHandlerEvent.REQUEST_LOAD_INDEX, false, false, false, NaN, null, null, new URLRequest(_loc4_.url), _loc3_, true));
            }
            _loc3_++;
        }
        if (this.pendingIndexLoads == 0) {
            dispatchEvent(new HTTPStreamingIndexHandlerEvent(HTTPStreamingIndexHandlerEvent.NOTIFY_RATES, false, false, false, NaN, this.getStreamNames(this.streamInfos), this.getQualityRates(this.streamInfos)));
            this.notifyIndexReady(0);
        }
    }

    override public function processIndexData(param1: *, param2: Object): void {
        var _loc3_: int = param2 as int;
        var _loc4_: AdobeBootstrapBox;
        if ((_loc4_ = this.processBootstrapData(param1, _loc3_)) == null) {
            dispatchEvent(new HTTPStreamingIndexHandlerEvent(HTTPStreamingIndexHandlerEvent.NOTIFY_ERROR));
            return;
        }
        if (!this.fragmentRunTablesUpdating) {
            --this.pendingIndexLoads;
        } else {
            --this.pendingIndexUpdates;
            if (this.pendingIndexUpdates == 0) {
                this.fragmentRunTablesUpdating = false;
                this.notifyTotalDuration(_loc4_.totalDuration / _loc4_.timeScale, param2 as int);
                this.dispatchDVRStreamInfo(_loc4_);
            }
        }
        if (this.bootstrapBoxes[_loc3_] == null || this.bootstrapBoxes[_loc3_].bootstrapVersion < _loc4_.bootstrapVersion || this.bootstrapBoxes[_loc3_].currentMediaTime < _loc4_.currentMediaTime) {
            this.delay = 0.05;
            this.bootstrapBoxes[_loc3_] = _loc4_;
        }
        if (this.pendingIndexLoads == 0 && !this.fragmentRunTablesUpdating) {
            dispatchEvent(new HTTPStreamingIndexHandlerEvent(HTTPStreamingIndexHandlerEvent.NOTIFY_RATES, false, false, false, NaN, this.getStreamNames(this.streamInfos), this.getQualityRates(this.streamInfos)));
            this.notifyIndexReady(_loc3_);
        }
    }

    override public function getFileForTime(param1: Number, param2: int): HTTPStreamRequest {
        var _loc6_: * = null;
        var _loc7_: * = 0;
        var _loc8_: * = null;
        var _loc3_: AdobeBootstrapBox = this.bootstrapBoxes[param2];
        var _loc4_: * = null;
        if (!this.playInProgress && this.stopPlaying(_loc3_)) {
            return null;
        }
        this.checkMetadata(param2, _loc3_);
        var _loc5_: AdobeFragmentRunTable = this.getFragmentRunTable(_loc3_);
        if (param1 >= 0 && param1 * _loc3_.timeScale <= _loc3_.currentMediaTime && param2 >= 0 && param2 < this.streamInfos.length) {
            this.currentFAI = _loc5_.findFragmentIdByTime(param1 * _loc3_.timeScale, _loc3_.currentMediaTime, _loc3_.contentComplete() ? false : _loc3_.live);
            if (this.currentFAI == null || this.fragmentOverflow(_loc3_, this.currentFAI.fragId)) {
                if (_loc3_.contentComplete()) {
                    if (_loc3_.live) {
                        return new HTTPStreamRequest(null, param2, -1, -1, true);
                    }
                    return null;
                }
                this.adjustDelay();
                this.refreshBootstrapInfo(param2);
                return new HTTPStreamRequest(null, param2, 0, this.delay);
            }
            this.playInProgress = true;
            _loc6_ = _loc5_.fragmentDurationPairs[0];
            _loc7_ = _loc3_.findSegmentId(this.currentFAI.fragId - _loc6_.firstFragment + 1);
            _loc8_ = "";
            if ((this.streamInfos[param2].streamName as String).indexOf("http") != 0) {
                _loc8_ = this.serverBaseURL + "/" + this.streamInfos[param2].streamName + "Seg" + _loc7_ + "-Frag" + this.currentFAI.fragId;
            } else {
                _loc8_ = this.streamInfos[param2].streamName + "Seg" + _loc7_ + "-Frag" + this.currentFAI.fragId;
            }
            _loc4_ = new HTTPStreamRequest(_loc8_);
            this.checkQuality(param2);
            this.notifyFragmentDuration(this.currentFAI.fragDuration / _loc3_.timeScale);
        }
        return _loc4_;
    }

    override public function getNextFile(param1: int): HTTPStreamRequest {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = 0;
        var _loc8_: * = null;
        var _loc2_: AdobeBootstrapBox = this.bootstrapBoxes[param1];
        var _loc3_: * = null;
        if (!this.playInProgress && this.stopPlaying(_loc2_)) {
            return null;
        }
        this.checkMetadata(param1, _loc2_);
        if (param1 >= 0 && param1 < this.streamInfos.length) {
            _loc4_ = this.getFragmentRunTable(_loc2_);
            _loc5_ = this.currentFAI;
            this.currentFAI = _loc4_.validateFragment(this.currentFAI.fragId + 1, _loc2_.currentMediaTime, _loc2_.contentComplete() ? false : _loc2_.live);
            if (this.currentFAI == null || this.fragmentOverflow(_loc2_, this.currentFAI.fragId)) {
                if (!_loc2_.live || _loc2_.contentComplete()) {
                    if (_loc2_.live) {
                        return new HTTPStreamRequest(null, param1, -1, -1, true);
                    }
                    return null;
                }
                this.adjustDelay();
                this.currentFAI = _loc5_;
                this.refreshBootstrapInfo(param1);
                return new HTTPStreamRequest(null, param1, 0, this.delay);
            }
            this.playInProgress = true;
            _loc6_ = _loc4_.fragmentDurationPairs[0];
            _loc7_ = _loc2_.findSegmentId(this.currentFAI.fragId - _loc6_.firstFragment + 1);
            _loc8_ = "";
            if ((this.streamInfos[param1].streamName as String).indexOf("http") != 0) {
                _loc8_ = this.serverBaseURL + "/" + this.streamInfos[param1].streamName + "Seg" + _loc7_ + "-Frag" + this.currentFAI.fragId;
            } else {
                _loc8_ = this.streamInfos[param1].streamName + "Seg" + _loc7_ + "-Frag" + this.currentFAI.fragId;
            }
            _loc3_ = new HTTPStreamRequest(_loc8_);
            this.checkQuality(param1);
            this.notifyFragmentDuration(this.currentFAI.fragDuration / _loc2_.timeScale);
        }
        return _loc3_;
    }

    function calculateSegmentDuration(param1: AdobeBootstrapBox, param2: Number): Number {
        var _loc6_: * = null;
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc3_: Vector.<FragmentDurationPair> = param1.fragmentRunTables[0].fragmentDurationPairs;
        var _loc4_: uint = this.currentFAI.fragId;
        var _loc5_: int = _loc3_.length - 1;
        while (_loc5_ >= 0) {
            if ((_loc6_ = _loc3_[_loc5_]).firstFragment <= _loc4_) {
                _loc7_ = _loc6_.duration;
                _loc8_ = (_loc8_ = _loc6_.durationAccrued) + (_loc4_ - _loc6_.firstFragment) * _loc6_.duration;
                if (param2 > 0) {
                    _loc7_ -= param2 - _loc8_;
                }
                return _loc7_;
            }
            _loc5_--;
        }
        return 0;
    }

    private function checkQuality(param1: int): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc4_: * = null;
        if (this.currentQuality != param1) {
            _loc2_ = this.currentQuality < 0 ? null : this.streamInfos[this.currentQuality].additionalHeader;
            this.currentQuality = param1;
            _loc3_ = this.streamInfos[this.currentQuality].additionalHeader;
            if (_loc3_ != _loc2_ && _loc3_ != null) {
                (_loc4_ = new FLVTagScriptDataObject()).data = _loc3_;
                dispatchEvent(new HTTPStreamingIndexHandlerEvent(HTTPStreamingIndexHandlerEvent.NOTIFY_SCRIPT_DATA, false, false, false, NaN, null, null, null, null, true, 0, _loc4_, true, false));
            }
        }
    }

    private function checkMetadata(param1: int, param2: AdobeBootstrapBox): void {
        if (this.currentQuality != param1) {
            this.notifyTotalDuration(param2.totalDuration / param2.timeScale, param1);
        }
    }

    private function refreshBootstrapInfo(param1: uint): void {
        ++this.pendingIndexUpdates;
        this.fragmentRunTablesUpdating = true;
        dispatchEvent(new HTTPStreamingIndexHandlerEvent(HTTPStreamingIndexHandlerEvent.REQUEST_LOAD_INDEX, false, false, false, NaN, null, null, new URLRequest((this.streamInfos[param1] as HTTPStreamingF4FStreamInfo).bootstrapInfo.url), param1, true));
    }

    private function processBootstrapData(param1: *, param2: Object): AdobeBootstrapBox {
        var boxes: Vector.<Box> = null;
        var var_2412: * = param1;
        var indexContext: Object = param2;
        var bootstrapBox: AdobeBootstrapBox = null;
        var parser: BoxParser = new BoxParser();
        var_2412.position = 0;
        parser.init(var_2412);
        try {
            boxes = parser.getBoxes();
        } catch (e: Error) {
            boxes = null;
        }
        if (boxes == null || boxes.length < 1) {
            return null;
        }
        bootstrapBox = boxes[0] as AdobeBootstrapBox;
        if (bootstrapBox == null) {
            return null;
        }
        if (this.serverBaseURL == null || this.serverBaseURL.length <= 0) {
            if (bootstrapBox.serverBaseURLs == null || bootstrapBox.serverBaseURLs.length <= 0) {
                return null;
            }
        }
        return bootstrapBox;
    }

    private function getQualityRates(param1: Vector.<HTTPStreamingF4FStreamInfo>): Array {
        var _loc3_: int = 0;
        var _loc4_: * = null;
        var _loc2_: * = [];
        if (param1.length >= 1) {
            _loc3_ = 0;
            while (_loc3_ < param1.length) {
                _loc4_ = param1[_loc3_] as HTTPStreamingF4FStreamInfo;
                _loc2_.push(_loc4_.bitrate);
                _loc3_++;
            }
        }
        return _loc2_;
    }

    private function getStreamNames(param1: Vector.<HTTPStreamingF4FStreamInfo>): Array {
        var _loc3_: int = 0;
        var _loc4_: * = null;
        var _loc2_: * = [];
        if (param1.length >= 1) {
            _loc3_ = 0;
            while (_loc3_ < param1.length) {
                _loc4_ = param1[_loc3_] as HTTPStreamingF4FStreamInfo;
                _loc2_.push(_loc4_.streamName);
                _loc3_++;
            }
        }
        return _loc2_;
    }

    private function getFragmentRunTable(param1: AdobeBootstrapBox): AdobeFragmentRunTable {
        return param1.fragmentRunTables[0];
    }

    private function notifyTotalDuration(param1: Number, param2: int): void {
        var _loc3_: FLVTagScriptDataObject = new FLVTagScriptDataObject();
        var _loc4_: Object;
        if ((_loc4_ = this.f4fIndexInfo.streamInfos[param2].streamMetadata) == null) {
            _loc4_ = new Object();
        }
        _loc4_.duration = param1;
        _loc3_.objects = ["onMetaData", _loc4_];
        dispatchEvent(new HTTPStreamingIndexHandlerEvent(HTTPStreamingIndexHandlerEvent.NOTIFY_SCRIPT_DATA, false, false, false, NaN, null, null, null, null, false, 0, _loc3_, false, true));
    }

    private function notifyFragmentDuration(param1: Number): void {
        dispatchEvent(new HTTPStreamingIndexHandlerEvent(HTTPStreamingIndexHandlerEvent.NOTIFY_SEGMENT_DURATION, false, false, false, NaN, null, null, null, null, true, param1));
    }

    private function notifyIndexReady(param1: int): void {
        var _loc2_: AdobeBootstrapBox = this.bootstrapBoxes[param1];
        var _loc3_: AdobeFragmentRunTable = this.getFragmentRunTable(_loc2_);
        this.dispatchDVRStreamInfo(_loc2_);
        if (!this.dvrGetStreamInfoCall) {
            if (_loc2_.live && this.f4fIndexInfo.dvrInfo == null && isNaN(this.pureLiveOffset)) {
                this.pureLiveOffset = _loc2_.currentMediaTime - this.offsetFromCurrent * _loc2_.timeScale > 0 ? _loc2_.currentMediaTime / _loc2_.timeScale - this.offsetFromCurrent : NaN;
            }
            dispatchEvent(new HTTPStreamingIndexHandlerEvent(HTTPStreamingIndexHandlerEvent.NOTIFY_INDEX_READY, false, false, _loc2_.live, this.pureLiveOffset));
        }
        this.dvrGetStreamInfoCall = false;
    }

    private function stopPlaying(param1: AdobeBootstrapBox): Boolean {
        var _loc2_: AdobeFragmentRunTable = this.getFragmentRunTable(param1);
        if (this.f4fIndexInfo.dvrInfo == null && param1.live && _loc2_.tableComplete() || this.f4fIndexInfo.dvrInfo != null && this.f4fIndexInfo.dvrInfo.offline) {
            return true;
        }
        return false;
    }

    private function onNewBootstrapBox(param1: HTTPStreamingFileHandlerEvent): void {
        var _loc2_: AdobeBootstrapBox = this.bootstrapBoxes[this.currentQuality];
        if (_loc2_.bootstrapVersion < param1.bootstrapBox.bootstrapVersion || _loc2_.currentMediaTime < param1.bootstrapBox.currentMediaTime) {
            this.bootstrapBoxes[this.currentQuality] = param1.bootstrapBox;
            this.dispatchDVRStreamInfo(param1.bootstrapBox);
        }
    }

    private function dispatchDVRStreamInfo(param1: AdobeBootstrapBox): void {
        var _loc2_: AdobeFragmentRunTable = this.getFragmentRunTable(param1);
        if (this.f4fIndexInfo.dvrInfo != null) {
            this.f4fIndexInfo.dvrInfo.isRecording = !_loc2_.tableComplete();
            if (isNaN(this.f4fIndexInfo.dvrInfo.startTime)) {
                this.f4fIndexInfo.dvrInfo.startTime = _loc2_.tableComplete() ? 0 : DVRUtils.calculateOffset(this.f4fIndexInfo.dvrInfo.beginOffset < 0 || isNaN(this.f4fIndexInfo.dvrInfo.beginOffset) ? 0 : this.f4fIndexInfo.dvrInfo.beginOffset, this.f4fIndexInfo.dvrInfo.endOffset < 0 || isNaN(this.f4fIndexInfo.dvrInfo.endOffset) ? 0 : this.f4fIndexInfo.dvrInfo.endOffset, param1.totalDuration / param1.timeScale);
                this.f4fIndexInfo.dvrInfo.startTime += _loc2_.fragmentDurationPairs[0].durationAccrued / param1.timeScale;
                if (this.f4fIndexInfo.dvrInfo.startTime > param1.currentMediaTime) {
                    this.f4fIndexInfo.dvrInfo.startTime = param1.currentMediaTime;
                }
            }
            this.f4fIndexInfo.dvrInfo.curLength = param1.currentMediaTime / param1.timeScale - this.f4fIndexInfo.dvrInfo.startTime;
            dispatchEvent(new DVRStreamInfoEvent(DVRStreamInfoEvent.DVRSTREAMINFO, false, false, this.f4fIndexInfo.dvrInfo));
        }
    }

    private function fragmentOverflow(param1: AdobeBootstrapBox, param2: uint): Boolean {
        var _loc3_: AdobeFragmentRunTable = param1.fragmentRunTables[0];
        var _loc4_: FragmentDurationPair = _loc3_.fragmentDurationPairs[0];
        var _loc5_: AdobeSegmentRunTable;
        return (_loc5_ = param1.segmentRunTables[0]) == null || _loc5_.totalFragments + _loc4_.firstFragment - 1 < param2;
    }

    private function adjustDelay(): void {
        if (this.delay < 1) {
            this.delay *= 2;
            if (this.delay > 1) {
                this.delay = 1;
            }
        }
    }
}
}
