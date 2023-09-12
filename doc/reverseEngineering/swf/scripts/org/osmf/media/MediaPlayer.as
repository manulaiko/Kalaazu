package org.osmf.media {

import flash.display.DisplayObject;
import flash.errors.IllegalOperationError;
import flash.events.TimerEvent;
import flash.utils.Timer;

import org.osmf.events.AudioEvent;
import org.osmf.events.BufferEvent;
import org.osmf.events.DRMEvent;
import org.osmf.events.DisplayObjectEvent;
import org.osmf.events.DynamicStreamEvent;
import org.osmf.events.LoadEvent;
import org.osmf.events.MediaElementChangeEvent;
import org.osmf.events.MediaElementEvent;
import org.osmf.events.MediaError;
import org.osmf.events.MediaErrorCodes;
import org.osmf.events.MediaErrorEvent;
import org.osmf.events.MediaPlayerCapabilityChangeEvent;
import org.osmf.events.MediaPlayerStateChangeEvent;
import org.osmf.events.PlayEvent;
import org.osmf.events.SeekEvent;
import org.osmf.events.TimeEvent;
import org.osmf.traits.AudioTrait;
import org.osmf.traits.BufferTrait;
import org.osmf.traits.DRMState;
import org.osmf.traits.DRMTrait;
import org.osmf.traits.DisplayObjectTrait;
import org.osmf.traits.DynamicStreamTrait;
import org.osmf.traits.LoadState;
import org.osmf.traits.LoadTrait;
import org.osmf.traits.MediaTraitBase;
import org.osmf.traits.MediaTraitType;
import org.osmf.traits.PlayState;
import org.osmf.traits.PlayTrait;
import org.osmf.traits.SeekTrait;
import org.osmf.traits.TimeTrait;
import org.osmf.traits.TraitEventDispatcher;
import org.osmf.utils.OSMFStrings;

public class MediaPlayer extends TraitEventDispatcher {

    private static const DEFAULT_UPDATE_INTERVAL: Number = 250;


    private var lastCurrentTime: Number = 0;

    private var lastBytesLoaded: Number = NaN;

    private var _autoPlay: Boolean = true;

    private var _autoRewind: Boolean = true;

    private var _loop: Boolean = false;

    private var _currentTimeUpdateInterval: Number = 250;

    private var _currentTimeTimer: Timer;

    private var _state: String;

    private var _bytesLoadedUpdateInterval: Number = 250;

    private var _bytesLoadedTimer: Timer;

    private var inExecuteAutoRewind: Boolean = false;

    private var inSeek: Boolean = false;

    private var mediaAtEnd: Boolean = false;

    private var mediaPlayerVolume: Number = 1;

    private var mediaPlayerVolumeSet: Boolean = false;

    private var mediaPlayerMuted: Boolean = false;

    private var mediaPlayerMutedSet: Boolean = false;

    private var mediaPlayerAudioPan: Number = 0;

    private var mediaPlayerAudioPanSet: Boolean = false;

    private var mediaPlayerBufferTime: Number = 0;

    private var mediaPlayerBufferTimeSet: Boolean = false;

    private var mediaPlayerMaxAllowedDynamicStreamIndex: int = 0;

    private var mediaPlayerMaxAllowedDynamicStreamIndexSet: Boolean = false;

    private var mediaPlayerAutoDynamicStreamSwitch: Boolean = true;

    private var mediaPlayerAutoDynamicStreamSwitchSet: Boolean = false;

    private var _canPlay: Boolean;

    private var _canSeek: Boolean;

    private var _temporal: Boolean;

    private var _hasAudio: Boolean;

    private var _hasDisplayObject: Boolean;

    private var _canLoad: Boolean;

    private var _canBuffer: Boolean;

    private var _isDynamicStream: Boolean;

    private var _hasDRM: Boolean;

    public function MediaPlayer(param1: MediaElement = null) {
        this._currentTimeTimer = new Timer(DEFAULT_UPDATE_INTERVAL);
        this._bytesLoadedTimer = new Timer(DEFAULT_UPDATE_INTERVAL);
        super();
        this._state = MediaPlayerState.UNINITIALIZED;
        this.media = param1;
        this._currentTimeTimer.addEventListener(TimerEvent.TIMER, this.onCurrentTimeTimer);
        this._bytesLoadedTimer.addEventListener(TimerEvent.TIMER, this.onBytesLoadedTimer);
    }

    override public function set media(param1: MediaElement): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (param1 != media) {
            this.mediaAtEnd = false;
            if (media != null) {
                if (this.playing) {
                    (this.getTraitOrThrow(MediaTraitType.PLAY) as PlayTrait).stop();
                }
                if (this.canLoad) {
                    _loc3_ = media.getTrait(MediaTraitType.LOAD) as LoadTrait;
                    if (_loc3_.loadState == LoadState.READY) {
                        _loc3_.unload();
                    }
                }
                this.setState(MediaPlayerState.UNINITIALIZED);
                if (media) {
                    media.removeEventListener(MediaElementEvent.TRAIT_ADD, this.onTraitAdd);
                    media.removeEventListener(MediaElementEvent.TRAIT_REMOVE, this.onTraitRemove);
                    media.removeEventListener(MediaErrorEvent.MEDIA_ERROR, this.onMediaError);
                    for each(_loc2_ in media.traitTypes) {
                        this.updateTraitListeners(_loc2_, false);
                    }
                }
            }
            super.media = param1;
            if (media != null) {
                media.addEventListener(MediaElementEvent.TRAIT_ADD, this.onTraitAdd);
                media.addEventListener(MediaElementEvent.TRAIT_REMOVE, this.onTraitRemove);
                media.addEventListener(MediaErrorEvent.MEDIA_ERROR, this.onMediaError);
                if (media.hasTrait(MediaTraitType.LOAD) == false) {
                    this.processReadyState();
                }
                for each(_loc2_ in media.traitTypes) {
                    this.updateTraitListeners(_loc2_, true);
                }
            }
            dispatchEvent(new MediaElementChangeEvent(MediaElementChangeEvent.MEDIA_ELEMENT_CHANGE));
        }
    }

    public function set autoRewind(param1: Boolean): void {
        this._autoRewind = param1;
    }

    public function get autoRewind(): Boolean {
        return this._autoRewind;
    }

    public function set autoPlay(param1: Boolean): void {
        this._autoPlay = param1;
    }

    public function get autoPlay(): Boolean {
        return this._autoPlay;
    }

    public function set loop(param1: Boolean): void {
        this._loop = param1;
    }

    public function get loop(): Boolean {
        return this._loop;
    }

    public function set currentTimeUpdateInterval(param1: Number): void {
        if (this._currentTimeUpdateInterval != param1) {
            this._currentTimeUpdateInterval = param1;
            if (isNaN(this._currentTimeUpdateInterval) || this._currentTimeUpdateInterval <= 0) {
                this._currentTimeTimer.stop();
            } else {
                this._currentTimeTimer.delay = this._currentTimeUpdateInterval;
                if (this.temporal) {
                    this._currentTimeTimer.start();
                }
            }
        }
    }

    public function get currentTimeUpdateInterval(): Number {
        return this._currentTimeUpdateInterval;
    }

    public function set bytesLoadedUpdateInterval(param1: Number): void {
        if (this._bytesLoadedUpdateInterval != param1) {
            this._bytesLoadedUpdateInterval = param1;
            if (isNaN(this._bytesLoadedUpdateInterval) || this._bytesLoadedUpdateInterval <= 0) {
                this._bytesLoadedTimer.stop();
            } else {
                this._bytesLoadedTimer.delay = this._bytesLoadedUpdateInterval;
                if (this.canLoad) {
                    this._bytesLoadedTimer.start();
                }
            }
        }
    }

    public function get bytesLoadedUpdateInterval(): Number {
        return this._bytesLoadedUpdateInterval;
    }

    public function get state(): String {
        return this._state;
    }

    public function get canPlay(): Boolean {
        return this._canPlay;
    }

    public function get canPause(): Boolean {
        return this.canPlay ? (this.getTraitOrThrow(MediaTraitType.PLAY) as PlayTrait).canPause : false;
    }

    public function get canSeek(): Boolean {
        return this._canSeek;
    }

    public function get temporal(): Boolean {
        return this._temporal;
    }

    public function get hasAudio(): Boolean {
        return this._hasAudio;
    }

    public function get isDynamicStream(): Boolean {
        return this._isDynamicStream;
    }

    public function get canLoad(): Boolean {
        return this._canLoad;
    }

    public function get canBuffer(): Boolean {
        return this._canBuffer;
    }

    public function get hasDRM(): Boolean {
        return this._hasDRM;
    }

    public function get volume(): Number {
        return this.hasAudio ? Number(AudioTrait(this.getTraitOrThrow(MediaTraitType.AUDIO)).volume) : this.mediaPlayerVolume;
    }

    public function set volume(param1: Number): void {
        var _loc2_: Boolean = false;
        if (this.hasAudio) {
            (this.getTraitOrThrow(MediaTraitType.AUDIO) as AudioTrait).volume = param1;
        } else if (param1 != this.mediaPlayerVolume) {
            _loc2_ = true;
        }
        this.mediaPlayerVolume = param1;
        this.mediaPlayerVolumeSet = true;
        if (_loc2_) {
            dispatchEvent(new AudioEvent(AudioEvent.VOLUME_CHANGE, false, false, false, param1));
        }
    }

    public function get muted(): Boolean {
        return this.hasAudio ? Boolean(AudioTrait(this.getTraitOrThrow(MediaTraitType.AUDIO)).muted) : this.mediaPlayerMuted;
    }

    public function set muted(param1: Boolean): void {
        var _loc2_: Boolean = false;
        if (this.hasAudio) {
            (this.getTraitOrThrow(MediaTraitType.AUDIO) as AudioTrait).muted = param1;
        } else if (param1 != this.mediaPlayerMuted) {
            _loc2_ = true;
        }
        this.mediaPlayerMuted = param1;
        this.mediaPlayerMutedSet = true;
        if (_loc2_) {
            dispatchEvent(new AudioEvent(AudioEvent.MUTED_CHANGE, false, false, param1));
        }
    }

    public function get audioPan(): Number {
        return this.hasAudio ? Number(AudioTrait(this.getTraitOrThrow(MediaTraitType.AUDIO)).pan) : this.mediaPlayerAudioPan;
    }

    public function set audioPan(param1: Number): void {
        var _loc2_: Boolean = false;
        if (this.hasAudio) {
            (this.getTraitOrThrow(MediaTraitType.AUDIO) as AudioTrait).pan = param1;
        } else if (param1 != this.mediaPlayerAudioPan) {
            _loc2_ = true;
        }
        this.mediaPlayerAudioPan = param1;
        this.mediaPlayerAudioPanSet = true;
        if (_loc2_) {
            dispatchEvent(new AudioEvent(AudioEvent.PAN_CHANGE, false, false, false, NaN, param1));
        }
    }

    public function get paused(): Boolean {
        return this.canPlay ? (this.getTraitOrThrow(MediaTraitType.PLAY) as PlayTrait).playState == PlayState.PAUSED : false;
    }

    public function pause(): void {
        (this.getTraitOrThrow(MediaTraitType.PLAY) as PlayTrait).pause();
    }

    public function get playing(): Boolean {
        return this.canPlay ? (this.getTraitOrThrow(MediaTraitType.PLAY) as PlayTrait).playState == PlayState.PLAYING : false;
    }

    public function play(): void {
        if (this.canPlay && this.canSeek && this.canSeekTo(0) && this.mediaAtEnd) {
            this.executeAutoRewind(true);
        } else {
            (this.getTraitOrThrow(MediaTraitType.PLAY) as PlayTrait).play();
        }
    }

    public function get seeking(): Boolean {
        return this.canSeek ? (this.getTraitOrThrow(MediaTraitType.SEEK) as SeekTrait).seeking : false;
    }

    public function seek(param1: Number): void {
        this.inSeek = true;
        (this.getTraitOrThrow(MediaTraitType.SEEK) as SeekTrait).seek(param1);
        this.inSeek = false;
    }

    public function canSeekTo(param1: Number): Boolean {
        return (this.getTraitOrThrow(MediaTraitType.SEEK) as SeekTrait).canSeekTo(param1);
    }

    public function stop(): void {
        (this.getTraitOrThrow(MediaTraitType.PLAY) as PlayTrait).stop();
        if (this.canSeek) {
            this.executeAutoRewind(false);
        }
    }

    public function get mediaWidth(): Number {
        return this._hasDisplayObject ? (this.getTraitOrThrow(MediaTraitType.DISPLAY_OBJECT) as DisplayObjectTrait).mediaWidth : NaN;
    }

    public function get mediaHeight(): Number {
        return this._hasDisplayObject ? (this.getTraitOrThrow(MediaTraitType.DISPLAY_OBJECT) as DisplayObjectTrait).mediaHeight : NaN;
    }

    public function get autoDynamicStreamSwitch(): Boolean {
        return this.isDynamicStream ? (this.getTraitOrThrow(MediaTraitType.DYNAMIC_STREAM) as DynamicStreamTrait).autoSwitch : this.mediaPlayerAutoDynamicStreamSwitch;
    }

    public function set autoDynamicStreamSwitch(param1: Boolean): void {
        var _loc2_: Boolean = false;
        if (this.isDynamicStream) {
            (this.getTraitOrThrow(MediaTraitType.DYNAMIC_STREAM) as DynamicStreamTrait).autoSwitch = param1;
        } else if (param1 != this.mediaPlayerAutoDynamicStreamSwitch) {
            _loc2_ = true;
        }
        this.mediaPlayerAutoDynamicStreamSwitch = param1;
        this.mediaPlayerAutoDynamicStreamSwitchSet = true;
        if (_loc2_) {
            dispatchEvent(new DynamicStreamEvent(DynamicStreamEvent.AUTO_SWITCH_CHANGE, false, false, this.dynamicStreamSwitching, this.mediaPlayerAutoDynamicStreamSwitch));
        }
    }

    public function get currentDynamicStreamIndex(): int {
        return this.isDynamicStream ? (this.getTraitOrThrow(MediaTraitType.DYNAMIC_STREAM) as DynamicStreamTrait).currentIndex : 0;
    }

    public function get numDynamicStreams(): int {
        return this.isDynamicStream ? (this.getTraitOrThrow(MediaTraitType.DYNAMIC_STREAM) as DynamicStreamTrait).numDynamicStreams : 0;
    }

    public function getBitrateForDynamicStreamIndex(param1: int): Number {
        return (this.getTraitOrThrow(MediaTraitType.DYNAMIC_STREAM) as DynamicStreamTrait).getBitrateForIndex(param1);
    }

    public function get maxAllowedDynamicStreamIndex(): int {
        return this.isDynamicStream ? (this.getTraitOrThrow(MediaTraitType.DYNAMIC_STREAM) as DynamicStreamTrait).maxAllowedIndex : this.mediaPlayerMaxAllowedDynamicStreamIndex;
    }

    public function set maxAllowedDynamicStreamIndex(param1: int): void {
        if (this.isDynamicStream) {
            (this.getTraitOrThrow(MediaTraitType.DYNAMIC_STREAM) as DynamicStreamTrait).maxAllowedIndex = param1;
        }
        this.mediaPlayerMaxAllowedDynamicStreamIndex = param1;
        this.mediaPlayerMaxAllowedDynamicStreamIndexSet = true;
    }

    public function get dynamicStreamSwitching(): Boolean {
        return this.isDynamicStream ? (this.getTraitOrThrow(MediaTraitType.DYNAMIC_STREAM) as DynamicStreamTrait).switching : false;
    }

    public function switchDynamicStreamIndex(param1: int): void {
        (this.getTraitOrThrow(MediaTraitType.DYNAMIC_STREAM) as DynamicStreamTrait).switchTo(param1);
    }

    public function get displayObject(): DisplayObject {
        return this._hasDisplayObject ? (this.getTraitOrThrow(MediaTraitType.DISPLAY_OBJECT) as DisplayObjectTrait).displayObject : null;
    }

    public function get duration(): Number {
        return this.temporal ? (this.getTraitOrThrow(MediaTraitType.TIME) as TimeTrait).duration : 0;
    }

    public function get currentTime(): Number {
        return this.temporal ? (this.getTraitOrThrow(MediaTraitType.TIME) as TimeTrait).currentTime : 0;
    }

    public function get buffering(): Boolean {
        return this.canBuffer ? (this.getTraitOrThrow(MediaTraitType.BUFFER) as BufferTrait).buffering : false;
    }

    public function get bufferLength(): Number {
        return this.canBuffer ? (this.getTraitOrThrow(MediaTraitType.BUFFER) as BufferTrait).bufferLength : 0;
    }

    public function get bufferTime(): Number {
        return this.canBuffer ? (this.getTraitOrThrow(MediaTraitType.BUFFER) as BufferTrait).bufferTime : this.mediaPlayerBufferTime;
    }

    public function set bufferTime(param1: Number): void {
        var _loc2_: Boolean = false;
        if (this.canBuffer) {
            (this.getTraitOrThrow(MediaTraitType.BUFFER) as BufferTrait).bufferTime = param1;
        } else if (param1 != this.mediaPlayerBufferTime) {
            _loc2_ = true;
        }
        this.mediaPlayerBufferTime = param1;
        this.mediaPlayerBufferTimeSet = true;
        if (_loc2_) {
            dispatchEvent(new BufferEvent(BufferEvent.BUFFER_TIME_CHANGE, false, false, this.buffering, this.mediaPlayerBufferTime));
        }
    }

    public function get bytesLoaded(): Number {
        var _loc1_: Number = 0;
        if (this.canLoad) {
            _loc1_ = (this.getTraitOrThrow(MediaTraitType.LOAD) as LoadTrait).bytesLoaded;
            if (isNaN(_loc1_)) {
                _loc1_ = 0;
            }
        }
        return _loc1_;
    }

    public function get bytesTotal(): Number {
        var _loc1_: Number = 0;
        if (this.canLoad) {
            _loc1_ = (this.getTraitOrThrow(MediaTraitType.LOAD) as LoadTrait).bytesTotal;
            if (isNaN(_loc1_)) {
                _loc1_ = 0;
            }
        }
        return _loc1_;
    }

    public function authenticate(param1: String = null, param2: String = null): void {
        (this.getTraitOrThrow(MediaTraitType.DRM) as DRMTrait).authenticate(param1, param2);
    }

    public function authenticateWithToken(param1: Object): void {
        (this.getTraitOrThrow(MediaTraitType.DRM) as DRMTrait).authenticateWithToken(param1);
    }

    public function get drmState(): String {
        return this.hasDRM ? DRMTrait(media.getTrait(MediaTraitType.DRM)).drmState : DRMState.UNINITIALIZED;
    }

    public function get drmStartDate(): Date {
        return this.hasDRM ? DRMTrait(media.getTrait(MediaTraitType.DRM)).startDate : null;
    }

    public function get drmEndDate(): Date {
        return this.hasDRM ? DRMTrait(media.getTrait(MediaTraitType.DRM)).endDate : null;
    }

    public function get drmPeriod(): Number {
        return this.hasDRM ? Number(DRMTrait(media.getTrait(MediaTraitType.DRM)).period) : NaN;
    }

    private function getTraitOrThrow(param1: String): MediaTraitBase {
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (!media || !media.hasTrait(param1)) {
            _loc2_ = OSMFStrings.getString(OSMFStrings.CAPABILITY_NOT_SUPPORTED);
            _loc3_ = param1.replace("[class ", "");
            _loc3_ = _loc3_.replace("]", "").toLowerCase();
            _loc2_ = _loc2_.replace("*trait*", _loc3_);
            throw new IllegalOperationError(_loc2_);
        }
        return media.getTrait(param1);
    }

    private function onMediaError(param1: MediaErrorEvent): void {
        this.setState(MediaPlayerState.PLAYBACK_ERROR);
        dispatchEvent(param1.clone());
    }

    private function onTraitAdd(param1: MediaElementEvent): void {
        this.updateTraitListeners(param1.traitType, true);
    }

    private function onTraitRemove(param1: MediaElementEvent): void {
        this.updateTraitListeners(param1.traitType, false);
    }

    private function updateTraitListeners(param1: String, param2: Boolean, param3: Boolean = true): void {
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc9_: * = null;
        var _loc10_: * = null;
        var _loc11_: * = null;
        if (this.state == MediaPlayerState.PLAYBACK_ERROR && param3 && param1 != MediaTraitType.LOAD) {
            return;
        }
        if (param2) {
            this.updateCapabilityForTrait(param1, param2);
        }
        switch (param1) {
            case MediaTraitType.TIME:
                this.changeListeners(param2, param1, TimeEvent.COMPLETE, this.onComplete);
                this._temporal = param2;
                if (param2 && this._currentTimeUpdateInterval > 0 && !isNaN(this._currentTimeUpdateInterval)) {
                    this._currentTimeTimer.start();
                } else {
                    this._currentTimeTimer.stop();
                }
                if ((_loc4_ = TimeTrait(media.getTrait(MediaTraitType.TIME))).currentTime != 0 && this._currentTimeUpdateInterval > 0 && !isNaN(this._currentTimeUpdateInterval)) {
                    dispatchEvent(new TimeEvent(TimeEvent.CURRENT_TIME_CHANGE, false, false, this.currentTime));
                }
                if (_loc4_.duration != 0) {
                    dispatchEvent(new TimeEvent(TimeEvent.DURATION_CHANGE, false, false, this.duration));
                    break;
                }
                break;
            case MediaTraitType.PLAY:
                this.changeListeners(param2, param1, PlayEvent.PLAY_STATE_CHANGE, this.onPlayStateChange);
                this._canPlay = param2;
                _loc5_ = PlayTrait(media.getTrait(MediaTraitType.PLAY));
                if (this.autoPlay && this.canPlay && !this.playing && !this.inSeek) {
                    this.play();
                } else if (_loc5_.playState != PlayState.STOPPED) {
                    dispatchEvent(new PlayEvent(PlayEvent.PLAY_STATE_CHANGE, false, false, param2 ? _loc5_.playState : PlayState.STOPPED));
                }
                if (_loc5_.canPause) {
                    dispatchEvent(new PlayEvent(PlayEvent.CAN_PAUSE_CHANGE, false, false, null, param2));
                    break;
                }
                break;
            case MediaTraitType.AUDIO:
                this._hasAudio = param2;
                _loc6_ = AudioTrait(media.getTrait(MediaTraitType.AUDIO));
                if (this.mediaPlayerVolumeSet) {
                    this.volume = this.mediaPlayerVolume;
                } else if (this.mediaPlayerVolume != _loc6_.volume) {
                    dispatchEvent(new AudioEvent(AudioEvent.VOLUME_CHANGE, false, false, this.muted, this.volume, this.audioPan));
                }
                if (this.mediaPlayerMutedSet) {
                    this.muted = this.mediaPlayerMuted;
                } else if (this.mediaPlayerMuted != _loc6_.muted) {
                    dispatchEvent(new AudioEvent(AudioEvent.MUTED_CHANGE, false, false, this.muted, this.volume, this.audioPan));
                }
                if (this.mediaPlayerAudioPanSet) {
                    this.audioPan = this.mediaPlayerAudioPan;
                    break;
                }
                if (this.mediaPlayerAudioPan != _loc6_.pan) {
                    dispatchEvent(new AudioEvent(AudioEvent.PAN_CHANGE, false, false, this.muted, this.volume, this.audioPan));
                    break;
                }
                break;
            case MediaTraitType.SEEK:
                this.changeListeners(param2, param1, SeekEvent.SEEKING_CHANGE, this.onSeeking);
                this._canSeek = param2;
                if (Boolean(SeekTrait(media.getTrait(MediaTraitType.SEEK)).seeking) && !this.inExecuteAutoRewind) {
                    dispatchEvent(new SeekEvent(SeekEvent.SEEKING_CHANGE, false, false, param2));
                    break;
                }
                break;
            case MediaTraitType.DYNAMIC_STREAM:
                this._isDynamicStream = param2;
                _loc7_ = DynamicStreamTrait(media.getTrait(MediaTraitType.DYNAMIC_STREAM));
                if (this.mediaPlayerMaxAllowedDynamicStreamIndexSet) {
                    this.maxAllowedDynamicStreamIndex = this.mediaPlayerMaxAllowedDynamicStreamIndex;
                }
                if (this.mediaPlayerAutoDynamicStreamSwitchSet) {
                    this.autoDynamicStreamSwitch = this.mediaPlayerAutoDynamicStreamSwitch;
                } else if (this.mediaPlayerAutoDynamicStreamSwitch != _loc7_.autoSwitch) {
                    dispatchEvent(new DynamicStreamEvent(DynamicStreamEvent.AUTO_SWITCH_CHANGE, false, false, this.dynamicStreamSwitching, this.autoDynamicStreamSwitch));
                }
                if (_loc7_.switching) {
                    dispatchEvent(new DynamicStreamEvent(DynamicStreamEvent.SWITCHING_CHANGE, false, false, this.dynamicStreamSwitching, this.autoDynamicStreamSwitch));
                }
                dispatchEvent(new DynamicStreamEvent(DynamicStreamEvent.NUM_DYNAMIC_STREAMS_CHANGE, false, false, this.dynamicStreamSwitching, this.autoDynamicStreamSwitch));
                break;
            case MediaTraitType.DISPLAY_OBJECT:
                this._hasDisplayObject = param2;
                if ((_loc8_ = DisplayObjectTrait(media.getTrait(MediaTraitType.DISPLAY_OBJECT))).displayObject != null) {
                    dispatchEvent(new DisplayObjectEvent(DisplayObjectEvent.DISPLAY_OBJECT_CHANGE, false, false, null, this.displayObject, NaN, NaN, this.mediaWidth, this.mediaHeight));
                }
                if (!isNaN(_loc8_.mediaHeight) || !isNaN(_loc8_.mediaWidth)) {
                    dispatchEvent(new DisplayObjectEvent(DisplayObjectEvent.MEDIA_SIZE_CHANGE, false, false, null, this.displayObject, NaN, NaN, this.mediaWidth, this.mediaHeight));
                    break;
                }
                break;
            case MediaTraitType.LOAD:
                this.changeListeners(param2, param1, LoadEvent.LOAD_STATE_CHANGE, this.onLoadState);
                this._canLoad = param2;
                if ((_loc9_ = LoadTrait(media.getTrait(MediaTraitType.LOAD))).bytesLoaded > 0) {
                    dispatchEvent(new LoadEvent(LoadEvent.BYTES_LOADED_CHANGE, false, false, null, this.bytesLoaded));
                }
                if (_loc9_.bytesTotal > 0) {
                    dispatchEvent(new LoadEvent(LoadEvent.BYTES_TOTAL_CHANGE, false, false, null, this.bytesTotal));
                }
                if (param2) {
                    if ((_loc11_ = (media.getTrait(param1) as LoadTrait).loadState) != LoadState.READY && _loc11_ != LoadState.LOADING) {
                        this.load();
                    } else if (this.autoPlay && this.canPlay && !this.playing) {
                        this.play();
                    }
                    if (this._bytesLoadedUpdateInterval > 0 && !isNaN(this._bytesLoadedUpdateInterval)) {
                        this._bytesLoadedTimer.start();
                        break;
                    }
                    this._bytesLoadedTimer.stop();
                    break;
                }
                break;
            case MediaTraitType.BUFFER:
                this.changeListeners(param2, param1, BufferEvent.BUFFERING_CHANGE, this.onBuffering);
                this._canBuffer = param2;
                _loc10_ = BufferTrait(media.getTrait(MediaTraitType.BUFFER));
                if (this.mediaPlayerBufferTimeSet) {
                    this.bufferTime = this.mediaPlayerBufferTime;
                } else if (this.mediaPlayerBufferTime != _loc10_.bufferTime) {
                    dispatchEvent(new BufferEvent(BufferEvent.BUFFER_TIME_CHANGE, false, false, false, this.bufferTime));
                }
                if (_loc10_.buffering) {
                    dispatchEvent(new BufferEvent(BufferEvent.BUFFERING_CHANGE, false, false, this.buffering));
                    break;
                }
                break;
            case MediaTraitType.DRM:
                this._hasDRM = param2;
                dispatchEvent(new DRMEvent(DRMEvent.DRM_STATE_CHANGE, this.drmState, false, false, this.drmStartDate, this.drmEndDate, this.drmPeriod));
        }
        if (param2 == false) {
            this.updateCapabilityForTrait(param1, false);
        }
    }

    private function updateCapabilityForTrait(param1: String, param2: Boolean): void {
        var _loc3_: * = null;
        switch (param1) {
            case MediaTraitType.AUDIO:
                _loc3_ = "null";
                this._hasAudio = param2;
                break;
            case MediaTraitType.BUFFER:
                _loc3_ = "null";
                this._canBuffer = param2;
                break;
            case MediaTraitType.DISPLAY_OBJECT:
                _loc3_ = "null";
                break;
            case MediaTraitType.DRM:
                _loc3_ = "null";
                this._hasDRM = param2;
                break;
            case MediaTraitType.DYNAMIC_STREAM:
                _loc3_ = "null";
                this._isDynamicStream = param2;
                break;
            case MediaTraitType.LOAD:
                _loc3_ = "null";
                this._canLoad = param2;
                break;
            case MediaTraitType.PLAY:
                _loc3_ = "null";
                this._canPlay = param2;
                break;
            case MediaTraitType.SEEK:
                _loc3_ = "null";
                this._canSeek = param2;
                break;
            case MediaTraitType.TIME:
                _loc3_ = "null";
                this._temporal = param2;
        }
        if (_loc3_ != null) {
            dispatchEvent(new MediaPlayerCapabilityChangeEvent(_loc3_, false, false, param2));
        }
    }

    private function changeListeners(param1: Boolean, param2: String, param3: String, param4: Function): void {
        var _loc5_: int = 0;
        if (param1) {
            _loc5_ = 1;
            media.getTrait(param2).addEventListener(param3, param4, false, _loc5_);
        } else if (media.hasTrait(param2)) {
            media.getTrait(param2).removeEventListener(param3, param4);
        }
    }

    private function onSeeking(param1: SeekEvent): void {
        this.mediaAtEnd = false;
        if (param1.type == SeekEvent.SEEKING_CHANGE && param1.seeking) {
            this.setState(MediaPlayerState.BUFFERING);
        } else if (this.canPlay && this.playing) {
            this.setState(MediaPlayerState.PLAYING);
        } else if (this.canPlay && this.paused) {
            this.setState(MediaPlayerState.PAUSED);
        } else if (this.canBuffer && this.buffering) {
            this.setState(MediaPlayerState.BUFFERING);
        } else if (!this.inExecuteAutoRewind) {
            this.setState(MediaPlayerState.READY);
        }
    }

    private function onPlayStateChange(param1: PlayEvent): void {
        if (param1.playState == PlayState.PLAYING) {
            if (this.canBuffer == false || this.bufferLength > 0) {
                this.setState(MediaPlayerState.PLAYING);
            }
        } else if (param1.playState == PlayState.PAUSED) {
            this.setState(MediaPlayerState.PAUSED);
        }
    }

    private function onLoadState(param1: LoadEvent): void {
        if (param1.loadState == LoadState.READY && this.state == MediaPlayerState.LOADING) {
            this.processReadyState();
        } else if (param1.loadState == LoadState.UNINITIALIZED) {
            this.setState(MediaPlayerState.UNINITIALIZED);
        } else if (param1.loadState == LoadState.LOAD_ERROR) {
            this.setState(MediaPlayerState.PLAYBACK_ERROR);
        } else if (param1.loadState == LoadState.LOADING) {
            this.setState(MediaPlayerState.LOADING);
        }
    }

    private function processReadyState(): void {
        this.setState(MediaPlayerState.READY);
        if (this.autoPlay && this.canPlay && !this.playing) {
            this.play();
        }
    }

    private function onComplete(param1: TimeEvent): void {
        this.mediaAtEnd = true;
        if (this.loop && this.canSeek && this.canPlay) {
            this.executeAutoRewind(true);
        } else if (!this.loop && this.canPlay) {
            (this.getTraitOrThrow(MediaTraitType.PLAY) as PlayTrait).stop();
            if (this.autoRewind && this.canSeek) {
                this.executeAutoRewind(false);
            } else {
                this.setState(MediaPlayerState.READY);
            }
        } else {
            this.setState(MediaPlayerState.READY);
        }
    }

    private function executeAutoRewind(param1: Boolean): void {
        var onSeekingChange: Function = null;
        var playAfterAutoRewind: Boolean = param1;
        if (this.inExecuteAutoRewind == false) {
            onSeekingChange = function (param1: SeekEvent): void {
                if (param1.seeking == false) {
                    removeEventListener(SeekEvent.SEEKING_CHANGE, onSeekingChange);
                    if (playAfterAutoRewind) {
                        play();
                    } else {
                        setState(MediaPlayerState.READY);
                    }
                    inExecuteAutoRewind = false;
                }
            };
            this.inExecuteAutoRewind = true;
            this.mediaAtEnd = false;
            addEventListener(SeekEvent.SEEKING_CHANGE, onSeekingChange);
            this.seek(0);
        }
    }

    private function onCurrentTimeTimer(param1: TimerEvent): void {
        if (this.temporal && this.currentTime != this.lastCurrentTime && (!this.canSeek || !this.seeking)) {
            this.lastCurrentTime = this.currentTime;
            dispatchEvent(new TimeEvent(TimeEvent.CURRENT_TIME_CHANGE, false, false, this.currentTime));
        }
    }

    private function onBytesLoadedTimer(param1: TimerEvent): void {
        var _loc2_: * = null;
        if (this.canLoad && this.bytesLoaded != this.lastBytesLoaded) {
            _loc2_ = new LoadEvent(LoadEvent.BYTES_LOADED_CHANGE, false, false, null, this.bytesLoaded);
            this.lastBytesLoaded = this.bytesLoaded;
            dispatchEvent(_loc2_);
        }
    }

    private function onBuffering(param1: BufferEvent): void {
        if (param1.buffering) {
            this.setState(MediaPlayerState.BUFFERING);
        } else if (this.canPlay && this.playing) {
            this.setState(MediaPlayerState.PLAYING);
        } else if (this.canPlay && this.paused) {
            this.setState(MediaPlayerState.PAUSED);
        } else {
            this.setState(MediaPlayerState.READY);
        }
    }

    private function setState(param1: String): void {
        var _loc2_: Boolean = false;
        var _loc3_: * = null;
        if (this._state != param1) {
            this._state = param1;
            dispatchEvent(new MediaPlayerStateChangeEvent(MediaPlayerStateChangeEvent.MEDIA_PLAYER_STATE_CHANGE, false, false, this._state));
            if (param1 == MediaPlayerState.PLAYBACK_ERROR) {
                _loc2_ = this.playing;
                for each(_loc3_ in media.traitTypes) {
                    if (_loc3_ != MediaTraitType.LOAD) {
                        this.updateTraitListeners(_loc3_, false, false);
                    }
                }
                if (_loc2_) {
                    (this.getTraitOrThrow(MediaTraitType.PLAY) as PlayTrait).stop();
                }
            }
        }
    }

    private function load(): void {
        var loadTrait: LoadTrait = null;
        try {
            loadTrait = media.getTrait(MediaTraitType.LOAD) as LoadTrait;
            if (loadTrait.loadState != LoadState.LOADING && loadTrait.loadState != LoadState.READY) {
                loadTrait.load();
            }
        } catch (error: IllegalOperationError) {
            setState(MediaPlayerState.PLAYBACK_ERROR);
            dispatchEvent(new MediaErrorEvent(MediaErrorEvent.MEDIA_ERROR, false, false, new MediaError(MediaErrorCodes.MEDIA_LOAD_FAILED, error.message)));
        }
    }
}
}
