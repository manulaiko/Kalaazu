package org.osmf.metadata {

import flash.events.TimerEvent;
import flash.utils.Dictionary;
import flash.utils.Timer;

import org.osmf.events.MediaElementEvent;
import org.osmf.events.MetadataEvent;
import org.osmf.events.PlayEvent;
import org.osmf.events.SeekEvent;
import org.osmf.events.TimelineMetadataEvent;
import org.osmf.media.MediaElement;
import org.osmf.traits.MediaTraitType;
import org.osmf.traits.PlayState;
import org.osmf.traits.PlayTrait;
import org.osmf.traits.SeekTrait;
import org.osmf.traits.TimeTrait;
import org.osmf.utils.OSMFStrings;

public class TimelineMetadata extends Metadata {

    private static const CHECK_INTERVAL: Number = 100;

    private static const TOLERANCE: Number = 0.25;


    private var temporalKeyCollection: Vector.<Number>;

    private var temporalValueCollection: Vector.<TimelineMarker>;

    private var media: MediaElement;

    private var timeTrait: TimeTrait;

    private var seekTrait: SeekTrait;

    private var playTrait: PlayTrait;

    private var lastFiredTemporalMetadataIndex: int;

    private var intervalTimer: Timer;

    private var restartTimer: Boolean;

    private var _enabled: Boolean;

    private var durationTimers: Dictionary;

    public function TimelineMetadata(param1: MediaElement) {
        super();
        if (param1 == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
        }
        this.media = param1;
        this._enabled = true;
        this.intervalTimer = new Timer(CHECK_INTERVAL);
        this.intervalTimer.addEventListener(TimerEvent.TIMER, this.onIntervalTimer);
        this.timeTrait = param1.getTrait(MediaTraitType.TIME) as TimeTrait;
        this.seekTrait = param1.getTrait(MediaTraitType.SEEK) as SeekTrait;
        this.setupTraitEventListener(MediaTraitType.SEEK);
        this.playTrait = param1.getTrait(MediaTraitType.PLAY) as PlayTrait;
        this.setupTraitEventListener(MediaTraitType.PLAY);
        param1.addEventListener(MediaElementEvent.TRAIT_ADD, this.onTraitAdd);
        param1.addEventListener(MediaElementEvent.TRAIT_REMOVE, this.onTraitRemove);
    }

    public function get numMarkers(): int {
        return !!this.temporalValueCollection ? this.temporalValueCollection.length : 0;
    }

    public function getMarkerAt(param1: int): TimelineMarker {
        if (param1 >= 0 && this.temporalValueCollection != null && param1 < this.temporalValueCollection.length) {
            return this.temporalValueCollection[param1];
        }
        return null;
    }

    public function addMarker(param1: TimelineMarker): void {
        if (param1 == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
        }
        this.addValue("" + param1.time, param1);
    }

    public function removeMarker(param1: TimelineMarker): TimelineMarker {
        if (param1 == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
        }
        return this.removeValue("" + param1.time);
    }

    override public function addValue(param1: String, param2: Object): void {
        var _loc5_: int = 0;
        var _loc3_: Number = new Number(param1);
        var _loc4_: TimelineMarker = param2 as TimelineMarker;
        if (param1 == null || isNaN(_loc3_) || _loc3_ < 0 || _loc4_ == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
        }
        if (this.temporalValueCollection == null) {
            this.temporalKeyCollection = new Vector.<Number>();
            this.temporalKeyCollection.push(_loc3_);
            this.temporalValueCollection = new Vector.<TimelineMarker>();
            this.temporalValueCollection.push(param2);
        } else if ((_loc5_ = this.findTemporalMetadata(0, this.temporalValueCollection.length - 1, _loc3_)) < 0) {
            _loc5_ *= -1;
            this.temporalKeyCollection.splice(_loc5_, 0, _loc3_);
            this.temporalValueCollection.splice(_loc5_, 0, _loc4_);
        } else if (_loc5_ == 0 && _loc3_ != this.temporalKeyCollection[0]) {
            this.temporalKeyCollection.splice(_loc5_, 0, _loc3_);
            this.temporalValueCollection.splice(_loc5_, 0, _loc4_);
        } else {
            this.temporalKeyCollection[_loc5_] = _loc3_;
            this.temporalValueCollection[_loc5_] = _loc4_;
        }
        this.enabled = true;
        dispatchEvent(new MetadataEvent(MetadataEvent.VALUE_ADD, false, false, param1, _loc4_));
        dispatchEvent(new TimelineMetadataEvent(TimelineMetadataEvent.MARKER_ADD, false, false, _loc4_));
    }

    override public function removeValue(param1: String): * {
        if (param1 == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
        }
        var _loc2_: Number = new Number(param1);
        var _loc3_: * = null;
        if ((!!this.temporalValueCollection ? this.findTemporalMetadata(0, this.temporalValueCollection.length - 1, _loc2_) : -1) >= 0) {
            this.temporalKeyCollection.splice(-1, 1);
            _loc3_ = this.temporalValueCollection.splice(-1, 1)[0];
            dispatchEvent(new MetadataEvent(MetadataEvent.VALUE_REMOVE, false, false, param1, _loc3_));
            dispatchEvent(new TimelineMetadataEvent(TimelineMetadataEvent.MARKER_REMOVE, false, false, _loc3_ as TimelineMarker));
        }
        return _loc3_;
    }

    override public function getValue(param1: String): * {
        var _loc3_: int = 0;
        var _loc4_: Number = NaN;
        if (param1 == null) {
            throw new ArgumentError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
        }
        var _loc2_: Number = new Number(param1);
        if (!isNaN(_loc2_)) {
            _loc3_ = 0;
            while (_loc3_ < this.temporalKeyCollection.length) {
                if ((_loc4_ = this.temporalKeyCollection[_loc3_]) == _loc2_) {
                    return this.temporalValueCollection[_loc3_];
                }
                _loc3_++;
            }
        }
        return null;
    }

    public function get enabled(): Boolean {
        return this._enabled;
    }

    public function set enabled(param1: Boolean): void {
        this._enabled = param1;
        this.reset(param1);
    }

    private function startTimer(param1: Boolean = true): void {
        if (!param1) {
            this.intervalTimer.stop();
        } else if (this.timeTrait != null && this.temporalValueCollection != null && this.temporalValueCollection.length > 0 && this.restartTimer && this.enabled && !this.intervalTimer.running) {
            if (this.playTrait != null && this.playTrait.playState == PlayState.PLAYING) {
                this.intervalTimer.start();
            }
        }
    }

    private function reset(param1: Boolean): void {
        this.lastFiredTemporalMetadataIndex = -1;
        this.restartTimer = true;
        this.intervalTimer.reset();
        this.intervalTimer.delay = CHECK_INTERVAL;
        if (param1) {
            this.startTimer();
        }
    }

    private function checkForTemporalMetadata(): void {
        var _loc1_: Number = this.timeTrait.currentTime;
        var _loc2_: int = this.findTemporalMetadata(this.lastFiredTemporalMetadataIndex + 1, this.temporalValueCollection.length - 1, _loc1_);
        if (_loc2_ <= 0) {
            _loc2_ *= -1;
            _loc2_ = _loc2_ > 0 ? _loc2_ - 1 : 0;
        }
        if (!this.checkTemporalMetadata(_loc2_, _loc1_) && _loc2_ + 1 < this.temporalValueCollection.length) {
            this.checkTemporalMetadata(_loc2_ + 1, _loc1_);
        }
    }

    private function setupTraitEventListener(param1: String, param2: Boolean = true): void {
        var _loc3_: * = null;
        if (param2) {
            if (param1 == MediaTraitType.SEEK && this.seekTrait != null) {
                this.seekTrait.addEventListener(SeekEvent.SEEKING_CHANGE, this.onSeekingChange);
            } else if (param1 == MediaTraitType.PLAY && this.playTrait != null) {
                this.playTrait.addEventListener(PlayEvent.PLAY_STATE_CHANGE, this.onPlayStateChange);
                if (this.playTrait.playState == PlayState.PLAYING) {
                    _loc3_ = new PlayEvent(PlayEvent.PLAY_STATE_CHANGE, false, false, PlayState.PLAYING);
                    this.onPlayStateChange(_loc3_);
                }
            }
        } else if (param1 == MediaTraitType.SEEK && this.seekTrait != null) {
            this.seekTrait.removeEventListener(SeekEvent.SEEKING_CHANGE, this.onSeekingChange);
        } else if (param1 == MediaTraitType.PLAY && this.playTrait != null) {
            this.playTrait.removeEventListener(PlayEvent.PLAY_STATE_CHANGE, this.onPlayStateChange);
        }
    }

    private function onSeekingChange(param1: SeekEvent): void {
        if (param1.seeking) {
            this.reset(true);
        }
    }

    private function onPlayStateChange(param1: PlayEvent): void {
        var _loc2_: * = null;
        if (param1.playState == PlayState.PLAYING) {
            if (this.durationTimers != null) {
                for each(_loc2_ in this.durationTimers) {
                    _loc2_.start();
                }
            }
            this.startTimer();
        } else {
            if (this.durationTimers != null) {
                for each(_loc2_ in this.durationTimers) {
                    _loc2_.stop();
                }
            }
            this.startTimer(false);
        }
    }

    private function findTemporalMetadata(param1: int, param2: int, param3: Number): int {
        var _loc4_: int = 0;
        if (param1 <= param2) {
            _loc4_ = (param1 + param2) / 2;
            if (param3 == this.temporalKeyCollection[_loc4_]) {
                return _loc4_;
            }
            if (param3 < this.temporalKeyCollection[_loc4_]) {
                return this.findTemporalMetadata(param1, _loc4_ - 1, param3);
            }
            return this.findTemporalMetadata(_loc4_ + 1, param2, param3);
        }
        return -param1;
    }

    private function dispatchTemporalEvents(param1: int): void {
        var marker: TimelineMarker = null;
        var timer: Timer = null;
        var endTime: Number = NaN;
        var onDurationTimer: Function = null;
        var var_654: int = param1;
        marker = this.temporalValueCollection[var_654];
        dispatchEvent(new TimelineMetadataEvent(TimelineMetadataEvent.MARKER_TIME_REACHED, false, false, marker));
        if (marker.duration > 0) {
            onDurationTimer = function (param1: TimerEvent): void {
                if (Boolean(timeTrait) && timeTrait.currentTime >= endTime) {
                    timer.removeEventListener(TimerEvent.TIMER, onDurationTimer);
                    delete durationTimers[marker];
                    dispatchEvent(new TimelineMetadataEvent(TimelineMetadataEvent.MARKER_DURATION_REACHED, false, false, marker));
                }
            };
            timer = new Timer(CHECK_INTERVAL);
            endTime = marker.time + marker.duration;
            if (this.durationTimers == null) {
                this.durationTimers = new Dictionary();
            }
            this.durationTimers[marker] = timer;
            timer.addEventListener(TimerEvent.TIMER, onDurationTimer);
            timer.start();
        }
    }

    private function checkTemporalMetadata(param1: int, param2: Number): Boolean {
        var _loc4_: Number = NaN;
        var _loc5_: Number = NaN;
        var _loc6_: Number = NaN;
        if (!this.temporalValueCollection || !this.temporalValueCollection.length) {
            return false;
        }
        var _loc3_: Boolean = false;
        if (this.temporalValueCollection[param1].time >= param2 - TOLERANCE && this.temporalValueCollection[param1].time <= param2 + TOLERANCE && param1 != this.lastFiredTemporalMetadataIndex) {
            this.lastFiredTemporalMetadataIndex = param1;
            this.dispatchTemporalEvents(param1);
            _loc4_ = this.temporalKeyCollection[param1];
            _loc6_ = (_loc6_ = ((_loc5_ = this.calcNextTime(param1)) - _loc4_) * 1000 / 4) > CHECK_INTERVAL ? _loc6_ : CHECK_INTERVAL;
            if (_loc4_ == _loc5_) {
                this.startTimer(false);
                this.restartTimer = false;
            } else if (_loc6_ != this.intervalTimer.delay) {
                this.intervalTimer.reset();
                this.intervalTimer.delay = _loc6_;
                this.startTimer();
            }
            _loc3_ = true;
        } else if (this.intervalTimer.delay != CHECK_INTERVAL && param2 + this.intervalTimer.delay / 1000 > this.calcNextTime(param1)) {
            this.intervalTimer.reset();
            this.intervalTimer.delay = CHECK_INTERVAL;
            this.startTimer();
        }
        return _loc3_;
    }

    private function calcNextTime(param1: int): Number {
        return this.temporalValueCollection[param1 + 1 < this.temporalKeyCollection.length ? param1 + 1 : this.temporalKeyCollection.length - 1].time;
    }

    private function onIntervalTimer(param1: TimerEvent): void {
        this.checkForTemporalMetadata();
    }

    private function onTraitAdd(param1: MediaElementEvent): void {
        switch (param1.traitType) {
            case MediaTraitType.TIME:
                this.timeTrait = this.media.getTrait(MediaTraitType.TIME) as TimeTrait;
                this.startTimer();
                break;
            case MediaTraitType.SEEK:
                this.seekTrait = this.media.getTrait(MediaTraitType.SEEK) as SeekTrait;
                break;
            case MediaTraitType.PLAY:
                this.playTrait = this.media.getTrait(MediaTraitType.PLAY) as PlayTrait;
        }
        this.setupTraitEventListener(param1.traitType);
    }

    private function onTraitRemove(param1: MediaElementEvent): void {
        this.setupTraitEventListener(param1.traitType, false);
        switch (param1.traitType) {
            case MediaTraitType.TIME:
                this.timeTrait = null;
                if (this.media.hasOwnProperty("numChildren") == false) {
                    this.startTimer(false);
                    break;
                }
                break;
            case MediaTraitType.SEEK:
                this.seekTrait = null;
                break;
            case MediaTraitType.PLAY:
                this.playTrait = null;
        }
    }
}
}
