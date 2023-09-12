package spark.components {

import flash.display.DisplayObject;
import flash.display.StageDisplayState;
import flash.events.Event;
import flash.events.FullScreenEvent;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.geom.Rectangle;
import flash.media.Video;
import flash.system.ApplicationDomain;
import flash.utils.Timer;

import mx.core.FlexGlobals;
import mx.core.IVisualElementContainer;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.managers.PopUpManager;
import mx.utils.BitFlagUtil;

import org.osmf.events.LoadEvent;
import org.osmf.events.MediaPlayerStateChangeEvent;
import org.osmf.events.TimeEvent;
import org.osmf.media.MediaPlayerState;

import spark.components.mediaClasses.MuteButton;
import spark.components.mediaClasses.ScrubBar;
import spark.components.mediaClasses.VolumeBar;
import spark.components.supportClasses.ButtonBase;
import spark.components.supportClasses.SkinnableComponent;
import spark.components.supportClasses.ToggleButtonBase;
import spark.core.IDisplayText;
import spark.events.TrackBaseEvent;

public class VideoPlayer extends SkinnableComponent {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static const AUTO_DISPLAY_FIRST_FRAME_PROPERTY_FLAG: uint = 1;

    private static const AUTO_PLAY_PROPERTY_FLAG: uint = 2;

    private static const AUTO_REWIND_PROPERTY_FLAG: uint = 4;

    private static const LOOP_PROPERTY_FLAG: uint = 8;

    private static const SCALE_MODE_PROPERTY_FLAG: uint = 16;

    private static const MUTED_PROPERTY_FLAG: uint = 32;

    private static const SOURCE_PROPERTY_FLAG: uint = 64;

    private static const VOLUME_PROPERTY_FLAG: uint = 128;

    private static const PAUSE_WHEN_HIDDEN_PROPERTY_FLAG: uint = 256;

    private static const THUMBNAIL_SOURCE_PROPERTY_FLAG: uint = 512;

    private static var _screenClass: Class;

    private static var checkedForScreenClass: Boolean;

    mx_internal static var createAccessibilityImplementation: Function;


    [SkinPart(required="true")]
    public var videoDisplay: VideoDisplay;

    [SkinPart(required="false")]
    public var currentTimeDisplay: IDisplayText;

    [SkinPart(required="false")]
    public var fullScreenButton: ButtonBase;

    [SkinPart(required="false")]
    public var muteButton: MuteButton;

    [SkinPart(required="false")]
    public var pauseButton: ButtonBase;

    [SkinPart(required="false")]
    public var playButton: ButtonBase;

    [SkinPart(required="false")]
    public var playerControls: DisplayObject;

    [SkinPart(required="false")]
    public var playPauseButton: ToggleButtonBase;

    [SkinPart(required="false")]
    public var scrubBar: ScrubBar;

    [SkinPart(required="false")]
    public var stopButton: ButtonBase;

    [SkinPart(required="false")]
    public var durationDisplay: IDisplayText;

    [SkinPart(required="false")]
    public var volumeBar: VolumeBar;

    private var videoDisplayProperties: Object;

    private var exitingFullScreenPauseWhenHidden: Boolean;

    private var needsToUpdatePauseWhenHidden: Boolean = false;

    private var videoDisplay_updateCompleteHandlerProperties: Object;

    private var fullScreen: Boolean = false;

    private var beforeFullScreenInfo: Object;

    private var fullScreenHideControlTimer: Timer;

    private var scrubBarMouseCaptured: Boolean;

    private var wasPlayingBeforeSeeking: Boolean;

    private var scrubBarChanging: Boolean;

    public function VideoPlayer() {
        this.videoDisplayProperties = {};
        super();
    }

    private static function get screenClass(): Class {
        if (!checkedForScreenClass) {
            checkedForScreenClass = true;
            if (ApplicationDomain.currentDomain.hasDefinition("flash.display::Screen")) {
                _screenClass = Class(ApplicationDomain.currentDomain.getDefinition("flash.display::Screen"));
            }
        }
        return _screenClass;
    }

    public function get autoDisplayFirstFrame(): Boolean {
        var _loc1_: * = undefined;
        if (this.videoDisplay) {
            return this.videoDisplay.autoDisplayFirstFrame;
        }
        _loc1_ = this.videoDisplayProperties.autoDisplayFirstFrame;
        return _loc1_ === undefined ? true : _loc1_;
    }

    public function set autoDisplayFirstFrame(param1: Boolean): void {
        if (this.videoDisplay) {
            this.videoDisplay.autoDisplayFirstFrame = param1;
            this.videoDisplayProperties = BitFlagUtil.update(this.videoDisplayProperties as uint, AUTO_DISPLAY_FIRST_FRAME_PROPERTY_FLAG, true);
        } else {
            this.videoDisplayProperties.autoDisplayFirstFrame = param1;
        }
    }

    public function get autoPlay(): Boolean {
        var _loc1_: * = undefined;
        if (this.videoDisplay) {
            return this.videoDisplay.autoPlay;
        }
        _loc1_ = this.videoDisplayProperties.autoPlay;
        return _loc1_ === undefined ? true : _loc1_;
    }

    public function set autoPlay(param1: Boolean): void {
        if (this.videoDisplay) {
            this.videoDisplay.autoPlay = param1;
            this.videoDisplayProperties = BitFlagUtil.update(this.videoDisplayProperties as uint, AUTO_PLAY_PROPERTY_FLAG, true);
        } else {
            this.videoDisplayProperties.autoPlay = param1;
        }
    }

    public function get autoRewind(): Boolean {
        var _loc1_: * = undefined;
        if (this.videoDisplay) {
            return this.videoDisplay.autoRewind;
        }
        _loc1_ = this.videoDisplayProperties.autoRewind;
        return _loc1_ === undefined ? true : _loc1_;
    }

    public function set autoRewind(param1: Boolean): void {
        if (this.videoDisplay) {
            this.videoDisplay.autoRewind = param1;
            this.videoDisplayProperties = BitFlagUtil.update(this.videoDisplayProperties as uint, AUTO_REWIND_PROPERTY_FLAG, true);
        } else {
            this.videoDisplayProperties.autoRewind = param1;
        }
    }

    [Bindable("mediaPlayerStateChange")]
    [Bindable("bytesLoadedChange")]
    public function get bytesLoaded(): Number {
        if (this.videoDisplay) {
            return this.videoDisplay.bytesLoaded;
        }
        return 0;
    }

    [Bindable("mediaPlayerStateChange")]
    public function get bytesTotal(): Number {
        if (this.videoDisplay) {
            return this.videoDisplay.bytesTotal;
        }
        return 0;
    }

    [Bindable("mediaPlayerStateChange")]
    [Bindable("currentTimeChange")]
    public function get currentTime(): Number {
        if (this.videoDisplay) {
            return this.videoDisplay.currentTime;
        }
        return 0;
    }

    [Bindable("mediaPlayerStateChange")]
    [Bindable("durationChange")]
    public function get duration(): Number {
        if (this.videoDisplay) {
            return this.videoDisplay.duration;
        }
        return 0;
    }

    public function get loop(): Boolean {
        var _loc1_: * = undefined;
        if (this.videoDisplay) {
            return this.videoDisplay.loop;
        }
        _loc1_ = this.videoDisplayProperties.loop;
        return _loc1_ === undefined ? false : _loc1_;
    }

    public function set loop(param1: Boolean): void {
        if (this.videoDisplay) {
            this.videoDisplay.loop = param1;
            this.videoDisplayProperties = BitFlagUtil.update(this.videoDisplayProperties as uint, LOOP_PROPERTY_FLAG, true);
        } else {
            this.videoDisplayProperties.loop = param1;
        }
    }

    [Bindable("mediaPlayerStateChange")]
    public function get mediaPlayerState(): String {
        if (this.videoDisplay) {
            return this.videoDisplay.mediaPlayerState;
        }
        return MediaPlayerState.UNINITIALIZED;
    }

    [Bindable("volumeChanged")]
    public function get muted(): Boolean {
        var _loc1_: * = undefined;
        if (this.videoDisplay) {
            return this.videoDisplay.muted;
        }
        _loc1_ = this.videoDisplayProperties.muted;
        return _loc1_ === undefined ? false : _loc1_;
    }

    public function set muted(param1: Boolean): void {
        if (this.videoDisplay) {
            this.videoDisplay.muted = param1;
            this.videoDisplayProperties = BitFlagUtil.update(this.videoDisplayProperties as uint, MUTED_PROPERTY_FLAG, true);
        } else {
            this.videoDisplayProperties.muted = param1;
        }
        if (this.volumeBar) {
            this.volumeBar.muted = param1;
        }
        if (this.muteButton) {
            this.muteButton.muted = param1;
        }
    }

    public function get pauseWhenHidden(): Boolean {
        var _loc1_: * = undefined;
        if (this.needsToUpdatePauseWhenHidden) {
            return this.exitingFullScreenPauseWhenHidden;
        }
        if (this.videoDisplay) {
            return this.videoDisplay.pauseWhenHidden;
        }
        _loc1_ = this.videoDisplayProperties.pauseWhenHidden;
        return _loc1_ === undefined ? false : _loc1_;
    }

    public function set pauseWhenHidden(param1: Boolean): void {
        if (this.needsToUpdatePauseWhenHidden) {
            this.exitingFullScreenPauseWhenHidden = param1;
        } else if (this.videoDisplay) {
            this.videoDisplay.pauseWhenHidden = param1;
            this.videoDisplayProperties = BitFlagUtil.update(this.videoDisplayProperties as uint, PAUSE_WHEN_HIDDEN_PROPERTY_FLAG, true);
        } else {
            this.videoDisplayProperties.pauseWhenHidden = param1;
        }
    }

    [Bindable("mediaPlayerStateChange")]
    public function get playing(): Boolean {
        if (this.videoDisplay) {
            return this.videoDisplay.playing;
        }
        return false;
    }

    public function get scaleMode(): String {
        var _loc1_: * = undefined;
        if (this.videoDisplay) {
            return this.videoDisplay.scaleMode;
        }
        _loc1_ = this.videoDisplayProperties.scaleMode;
        return _loc1_ === undefined ? "letterbox" : _loc1_;
    }

    public function set scaleMode(param1: String): void {
        if (this.videoDisplay) {
            this.videoDisplay.scaleMode = param1;
            this.videoDisplayProperties = BitFlagUtil.update(this.videoDisplayProperties as uint, SCALE_MODE_PROPERTY_FLAG, true);
        } else {
            this.videoDisplayProperties.scaleMode = param1;
        }
    }

    [Bindable("sourceChanged")]
    public function get source(): Object {
        var _loc1_: * = undefined;
        if (this.videoDisplay) {
            return this.videoDisplay.source;
        }
        _loc1_ = this.videoDisplayProperties.source;
        return _loc1_ === undefined ? null : _loc1_;
    }

    public function set source(param1: Object): void {
        if (this.videoDisplay) {
            this.videoDisplay.source = param1;
            this.videoDisplayProperties = BitFlagUtil.update(this.videoDisplayProperties as uint, SOURCE_PROPERTY_FLAG, true);
        } else {
            this.videoDisplayProperties.source = param1;
        }
    }

    mx_internal function get thumbnailSource(): Object {
        var _loc1_: * = undefined;
        if (this.videoDisplay) {
            return this.videoDisplay.mx_internal::thumbnailSource;
        }
        _loc1_ = this.videoDisplayProperties.thumbnailSource;
        return _loc1_ === undefined ? null : _loc1_;
    }

    mx_internal function set thumbnailSource(param1: Object): void {
        if (this.videoDisplay) {
            this.videoDisplay.mx_internal::thumbnailSource = param1;
            this.videoDisplayProperties = BitFlagUtil.update(this.videoDisplayProperties as uint, THUMBNAIL_SOURCE_PROPERTY_FLAG, true);
        } else {
            this.videoDisplayProperties.thumbnailSource = param1;
        }
    }

    public function get videoObject(): Video {
        if (this.videoDisplay) {
            return this.videoDisplay.videoObject;
        }
        return null;
    }

    [Bindable("volumeChanged")]
    public function get volume(): Number {
        var _loc1_: * = undefined;
        if (this.videoDisplay) {
            return this.videoDisplay.volume;
        }
        _loc1_ = this.videoDisplayProperties.volume;
        return _loc1_ === undefined ? 1 : _loc1_;
    }

    public function set volume(param1: Number): void {
        if (this.videoDisplay) {
            this.videoDisplay.volume = param1;
            this.videoDisplayProperties = BitFlagUtil.update(this.videoDisplayProperties as uint, VOLUME_PROPERTY_FLAG, true);
        } else {
            this.videoDisplayProperties.volume = param1;
        }
        if (this.volumeBar) {
            this.volumeBar.value = param1;
        }
    }

    override protected function initializeAccessibility(): void {
        if (false) {
            VideoPlayer.mx_internal::createAccessibilityImplementation(this);
        }
    }

    override protected function getCurrentSkinState(): String {
        if (!this.videoDisplay || !this.videoDisplay.mx_internal::videoPlayer) {
            return null;
        }
        var _loc1_: String = this.videoDisplay.mx_internal::videoPlayer.state;
        if (!enabled) {
            _loc1_ = "disabled";
        }
        if (this.fullScreen) {
            return _loc1_ + "AndFullScreen";
        }
        return _loc1_;
    }

    override protected function partAdded(param1: String, param2: Object): void {
        var _loc3_: * = 0;
        super.partAdded(param1, param2);
        if (param2 == this.videoDisplay) {
            this.videoDisplay.addEventListener(TimeEvent.CURRENT_TIME_CHANGE, this.videoDisplay_currentTimeChangeHandler);
            this.videoDisplay.addEventListener(LoadEvent.BYTES_LOADED_CHANGE, this.videoDisplay_bytesLoadedChangeHandler);
            this.videoDisplay.addEventListener(MediaPlayerStateChangeEvent.MEDIA_PLAYER_STATE_CHANGE, this.videoDisplay_mediaPlayerStateChangeHandler);
            this.videoDisplay.addEventListener(TimeEvent.DURATION_CHANGE, this.videoDisplay_durationChangeHandler);
            this.videoDisplay.addEventListener(TimeEvent.COMPLETE, dispatchEvent);
            this.videoDisplay.addEventListener("sourceChanged", dispatchEvent);
            this.videoDisplay.addEventListener("volumeChanged", this.videoDisplay_volumeChangedHandler);
            _loc3_ = 0;
            if (this.videoDisplayProperties.source !== undefined) {
                this.videoDisplay.source = this.videoDisplayProperties.source;
                _loc3_ = BitFlagUtil.update(_loc3_ as uint, SOURCE_PROPERTY_FLAG, true);
            }
            if (this.videoDisplayProperties.autoPlay !== undefined) {
                this.videoDisplay.autoPlay = this.videoDisplayProperties.autoPlay;
                _loc3_ = BitFlagUtil.update(_loc3_ as uint, AUTO_PLAY_PROPERTY_FLAG, true);
            }
            if (this.videoDisplayProperties.volume !== undefined) {
                this.videoDisplay.volume = this.videoDisplayProperties.volume;
                _loc3_ = BitFlagUtil.update(_loc3_ as uint, VOLUME_PROPERTY_FLAG, true);
            }
            if (this.videoDisplayProperties.autoRewind !== undefined) {
                this.videoDisplay.autoRewind = this.videoDisplayProperties.autoRewind;
                _loc3_ = BitFlagUtil.update(_loc3_ as uint, AUTO_REWIND_PROPERTY_FLAG, true);
            }
            if (this.videoDisplayProperties.loop !== undefined) {
                this.videoDisplay.loop = this.videoDisplayProperties.loop;
                _loc3_ = BitFlagUtil.update(_loc3_ as uint, LOOP_PROPERTY_FLAG, true);
            }
            if (this.videoDisplayProperties.scaleMode !== undefined) {
                this.videoDisplay.scaleMode = this.videoDisplayProperties.scaleMode;
                _loc3_ = BitFlagUtil.update(_loc3_ as uint, SCALE_MODE_PROPERTY_FLAG, true);
            }
            if (this.videoDisplayProperties.muted !== undefined) {
                this.videoDisplay.muted = this.videoDisplayProperties.muted;
                _loc3_ = BitFlagUtil.update(_loc3_ as uint, MUTED_PROPERTY_FLAG, true);
            }
            if (this.videoDisplayProperties.pauseWhenHidden !== undefined) {
                this.videoDisplay.pauseWhenHidden = this.videoDisplayProperties.pauseWhenHidden;
                _loc3_ = BitFlagUtil.update(_loc3_ as uint, PAUSE_WHEN_HIDDEN_PROPERTY_FLAG, true);
            }
            if (this.videoDisplayProperties.autoDisplayFirstFrame !== undefined) {
                this.videoDisplay.autoDisplayFirstFrame = this.videoDisplayProperties.autoDisplayFirstFrame;
                _loc3_ = BitFlagUtil.update(_loc3_ as uint, AUTO_DISPLAY_FIRST_FRAME_PROPERTY_FLAG, true);
            }
            if (this.videoDisplayProperties.thumbnailSource !== undefined) {
                this.videoDisplay.mx_internal::thumbnailSource = this.videoDisplayProperties.thumbnailSource;
                _loc3_ = BitFlagUtil.update(_loc3_ as uint, THUMBNAIL_SOURCE_PROPERTY_FLAG, true);
            }
            if (this.videoDisplayProperties.currentTime !== undefined || this.videoDisplayProperties.playing !== undefined) {
                this.videoDisplay_updateCompleteHandlerProperties = {
                    "autoPlay": this.videoDisplay.autoPlay,
                    "playing": this.videoDisplayProperties.playing,
                    "currentTime": this.videoDisplayProperties.currentTime
                };
                this.videoDisplay.autoPlay = false;
                this.videoDisplay.addEventListener(FlexEvent.UPDATE_COMPLETE, this.videoDisplay_updateCompleteHandler);
            }
            this.videoDisplayProperties = _loc3_;
            if (this.volumeBar) {
                this.volumeBar.value = this.videoDisplay.volume;
                this.volumeBar.muted = this.videoDisplay.muted;
            }
            if (this.muteButton) {
                this.muteButton.volume = this.videoDisplay.volume;
                this.muteButton.muted = this.videoDisplay.muted;
            }
            if (this.scrubBar) {
                this.updateScrubBar();
            }
            if (this.currentTimeDisplay) {
                this.updateCurrentTime();
            }
            if (this.durationDisplay) {
                this.updateDuration();
            }
        } else if (param2 == this.playButton) {
            this.playButton.addEventListener(MouseEvent.CLICK, this.playButton_clickHandler);
        } else if (param2 == this.pauseButton) {
            this.pauseButton.addEventListener(MouseEvent.CLICK, this.pauseButton_clickHandler);
        } else if (param2 == this.playPauseButton) {
            this.playPauseButton.addEventListener(MouseEvent.CLICK, this.playPauseButton_clickHandler);
        } else if (param2 == this.stopButton) {
            this.stopButton.addEventListener(MouseEvent.CLICK, this.stopButton_clickHandler);
        } else if (param2 == this.muteButton) {
            if (this.videoDisplay) {
                this.muteButton.muted = this.muted;
                this.muteButton.volume = this.volume;
            }
            this.muteButton.addEventListener(FlexEvent.MUTED_CHANGE, this.muteButton_mutedChangeHandler);
        } else if (param2 == this.volumeBar) {
            this.volumeBar.minimum = 0;
            this.volumeBar.maximum = 1;
            if (this.videoDisplay) {
                this.volumeBar.value = this.volume;
                this.volumeBar.muted = this.muted;
            }
            this.volumeBar.addEventListener(Event.CHANGE, this.volumeBar_changeHandler);
            this.volumeBar.addEventListener(FlexEvent.MUTED_CHANGE, this.volumeBar_mutedChangeHandler);
        } else if (param2 == this.scrubBar) {
            if (this.videoDisplay) {
                this.updateScrubBar();
            }
            this.scrubBar.addEventListener(TrackBaseEvent.THUMB_PRESS, this.scrubBar_thumbPressHandler);
            this.scrubBar.addEventListener(TrackBaseEvent.THUMB_RELEASE, this.scrubBar_thumbReleaseHandler);
            this.scrubBar.addEventListener(Event.CHANGE, this.scrubBar_changeHandler);
            this.scrubBar.addEventListener(FlexEvent.CHANGE_END, this.scrubBar_changeEndHandler);
            this.scrubBar.addEventListener(FlexEvent.CHANGE_START, this.scrubBar_changeStartHandler);
        } else if (param2 == this.fullScreenButton) {
            this.fullScreenButton.addEventListener(MouseEvent.CLICK, this.fullScreenButton_clickHandler);
        } else if (param2 == this.currentTimeDisplay) {
            if (this.videoDisplay) {
                this.updateCurrentTime();
            }
        } else if (param2 == this.durationDisplay) {
            if (this.videoDisplay) {
                this.updateDuration();
            }
        }
    }

    private function videoDisplay_updateCompleteHandler(param1: FlexEvent): void {
        if (this.videoDisplay_updateCompleteHandlerProperties.autoPlay) {
            this.videoDisplay.autoPlay = true;
        }
        if (this.videoDisplay_updateCompleteHandlerProperties.currentTime !== undefined) {
            this.videoDisplay.seek(this.videoDisplay_updateCompleteHandlerProperties.currentTime);
        }
        if (this.videoDisplay_updateCompleteHandlerProperties.playing) {
            this.videoDisplay.play();
        }
        this.videoDisplay_updateCompleteHandlerProperties = null;
        this.videoDisplay.removeEventListener(FlexEvent.UPDATE_COMPLETE, this.videoDisplay_updateCompleteHandler);
    }

    override protected function partRemoved(param1: String, param2: Object): void {
        var _loc3_: * = null;
        super.partRemoved(param1, param2);
        if (param2 == this.videoDisplay) {
            this.videoDisplay.validateNow();
            _loc3_ = {};
            if (BitFlagUtil.isSet(this.videoDisplayProperties as uint, SOURCE_PROPERTY_FLAG)) {
                _loc3_.source = this.videoDisplay.source;
            }
            if (BitFlagUtil.isSet(this.videoDisplayProperties as uint, AUTO_PLAY_PROPERTY_FLAG)) {
                _loc3_.autoPlay = this.videoDisplay.autoPlay;
            }
            if (BitFlagUtil.isSet(this.videoDisplayProperties as uint, VOLUME_PROPERTY_FLAG)) {
                _loc3_.volume = this.videoDisplay.volume;
            }
            if (BitFlagUtil.isSet(this.videoDisplayProperties as uint, AUTO_REWIND_PROPERTY_FLAG)) {
                _loc3_.autoRewind = this.videoDisplay.autoRewind;
            }
            if (BitFlagUtil.isSet(this.videoDisplayProperties as uint, LOOP_PROPERTY_FLAG)) {
                _loc3_.loop = this.videoDisplay.loop;
            }
            if (BitFlagUtil.isSet(this.videoDisplayProperties as uint, SCALE_MODE_PROPERTY_FLAG)) {
                _loc3_.scaleMode = this.videoDisplay.scaleMode;
            }
            if (BitFlagUtil.isSet(this.videoDisplayProperties as uint, MUTED_PROPERTY_FLAG)) {
                _loc3_.muted = this.videoDisplay.muted;
            }
            if (BitFlagUtil.isSet(this.videoDisplayProperties as uint, PAUSE_WHEN_HIDDEN_PROPERTY_FLAG)) {
                _loc3_.pauseWhenHidden = this.videoDisplay.pauseWhenHidden;
            }
            if (BitFlagUtil.isSet(this.videoDisplayProperties as uint, AUTO_DISPLAY_FIRST_FRAME_PROPERTY_FLAG)) {
                _loc3_.autoDisplayFirstFrame = this.videoDisplay.autoDisplayFirstFrame;
            }
            if (BitFlagUtil.isSet(this.videoDisplayProperties as uint, THUMBNAIL_SOURCE_PROPERTY_FLAG)) {
                _loc3_.thumbnailSource = this.videoDisplay.mx_internal::thumbnailSource;
            }
            _loc3_.currentTime = this.videoDisplay.currentTime;
            _loc3_.playing = this.videoDisplay.playing;
            this.videoDisplay.stop();
            this.videoDisplayProperties = _loc3_;
            this.videoDisplay.removeEventListener(TimeEvent.CURRENT_TIME_CHANGE, this.videoDisplay_currentTimeChangeHandler);
            this.videoDisplay.removeEventListener(LoadEvent.BYTES_LOADED_CHANGE, this.videoDisplay_bytesLoadedChangeHandler);
            this.videoDisplay.removeEventListener(MediaPlayerStateChangeEvent.MEDIA_PLAYER_STATE_CHANGE, this.videoDisplay_mediaPlayerStateChangeHandler);
            this.videoDisplay.removeEventListener(TimeEvent.DURATION_CHANGE, this.videoDisplay_durationChangeHandler);
            this.videoDisplay.removeEventListener(TimeEvent.COMPLETE, dispatchEvent);
            this.videoDisplay.removeEventListener("sourceChanged", dispatchEvent);
            this.videoDisplay.removeEventListener("volumeChanged", this.videoDisplay_volumeChangedHandler);
        } else if (param2 == this.playButton) {
            this.playButton.removeEventListener(MouseEvent.CLICK, this.playButton_clickHandler);
        } else if (param2 == this.pauseButton) {
            this.pauseButton.removeEventListener(MouseEvent.CLICK, this.pauseButton_clickHandler);
        } else if (param2 == this.playPauseButton) {
            this.playPauseButton.removeEventListener(MouseEvent.CLICK, this.playPauseButton_clickHandler);
        } else if (param2 == this.stopButton) {
            this.stopButton.removeEventListener(MouseEvent.CLICK, this.stopButton_clickHandler);
        } else if (param2 == this.muteButton) {
            this.playButton.removeEventListener(FlexEvent.MUTED_CHANGE, this.muteButton_mutedChangeHandler);
        } else if (param2 == this.volumeBar) {
            this.volumeBar.removeEventListener(Event.CHANGE, this.volumeBar_changeHandler);
            this.volumeBar.removeEventListener(FlexEvent.MUTED_CHANGE, this.volumeBar_mutedChangeHandler);
        } else if (param2 == this.scrubBar) {
            this.scrubBar.removeEventListener(TrackBaseEvent.THUMB_PRESS, this.scrubBar_thumbPressHandler);
            this.scrubBar.removeEventListener(TrackBaseEvent.THUMB_RELEASE, this.scrubBar_thumbReleaseHandler);
            this.scrubBar.removeEventListener(Event.CHANGE, this.scrubBar_changeHandler);
            this.scrubBar.removeEventListener(FlexEvent.CHANGE_END, this.scrubBar_changeEndHandler);
            this.scrubBar.removeEventListener(FlexEvent.CHANGE_START, this.scrubBar_changeStartHandler);
        } else if (param2 == this.fullScreenButton) {
            this.fullScreenButton.removeEventListener(MouseEvent.CLICK, this.fullScreenButton_clickHandler);
        }
    }

    override protected function commitProperties(): void {
        super.commitProperties();
        if (this.needsToUpdatePauseWhenHidden) {
            this.needsToUpdatePauseWhenHidden = false;
            this.pauseWhenHidden = this.exitingFullScreenPauseWhenHidden;
        }
    }

    public function pause(): void {
        this.videoDisplay.pause();
    }

    public function play(): void {
        this.videoDisplay.play();
    }

    public function seek(param1: Number): void {
        this.videoDisplay.seek(param1);
    }

    public function stop(): void {
        this.videoDisplay.stop();
    }

    private function updateScrubBar(): void {
        if (!this.videoDisplay) {
            return;
        }
        if (!this.scrubBarMouseCaptured && !this.scrubBarChanging) {
            this.scrubBar.minimum = 0;
            this.scrubBar.maximum = this.videoDisplay.duration;
            this.scrubBar.value = this.videoDisplay.currentTime;
        }
        if (!this.videoDisplay.mx_internal::videoPlayer.canLoad) {
            this.scrubBar.loadedRangeEnd = this.videoDisplay.duration;
        } else if (this.videoDisplay.bytesTotal == 0) {
            this.scrubBar.loadedRangeEnd = 0;
        } else {
            this.scrubBar.loadedRangeEnd = this.videoDisplay.bytesLoaded / this.videoDisplay.bytesTotal * this.videoDisplay.duration;
        }
    }

    private function updateDuration(): void {
        this.durationDisplay.text = this.formatTimeValue(this.duration);
    }

    protected function formatTimeValue(param1: Number): String {
        param1 = Math.round(param1);
        var _loc2_: uint = Math.floor(param1 / 3600) % 24;
        var _loc3_: uint = Math.floor(param1 / 60) % 60;
        var _loc4_: uint = param1 % 60;
        var _loc5_: * = "";
        if (_loc2_ != 0) {
            _loc5_ = _loc2_ + ":";
        }
        if (Boolean(_loc5_) && _loc3_ < 10) {
            _loc5_ += "0" + _loc3_ + ":";
        } else {
            _loc5_ += _loc3_ + ":";
        }
        if (_loc4_ < 10) {
            _loc5_ += "0" + _loc4_;
        } else {
            _loc5_ += _loc4_;
        }
        return _loc5_;
    }

    private function updateCurrentTime(): void {
        this.currentTimeDisplay.text = this.formatTimeValue(this.currentTime);
    }

    mx_internal function getScreenBounds(): Rectangle {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc1_: Rectangle = new Rectangle(0, 0, stage.fullScreenWidth, stage.fullScreenHeight);
        if (screenClass) {
            try {
                _loc2_ = stage["nativeWindow"]["bounds"];
                _loc3_ = screenClass["getScreensForRectangle"](_loc2_)[0];
                _loc1_ = _loc3_["bounds"];
            } catch (e: Error) {
            }
        }
        return _loc1_;
    }

    private function videoDisplay_currentTimeChangeHandler(param1: TimeEvent): void {
        if (this.scrubBar) {
            this.updateScrubBar();
        }
        if (this.currentTimeDisplay) {
            this.updateCurrentTime();
        }
        dispatchEvent(param1);
    }

    private function videoDisplay_bytesLoadedChangeHandler(param1: LoadEvent): void {
        if (this.scrubBar) {
            this.updateScrubBar();
        }
        dispatchEvent(param1);
    }

    private function videoDisplay_mediaPlayerStateChangeHandler(param1: MediaPlayerStateChangeEvent): void {
        invalidateSkinState();
        if (this.scrubBar) {
            this.updateScrubBar();
        }
        if (this.durationDisplay) {
            this.updateDuration();
        }
        if (this.currentTimeDisplay) {
            this.updateCurrentTime();
        }
        if (this.playPauseButton) {
            this.playPauseButton.selected = this.playing;
        }
        dispatchEvent(param1);
    }

    private function videoDisplay_durationChangeHandler(param1: TimeEvent): void {
        if (this.scrubBar) {
            this.updateScrubBar();
        }
        if (this.durationDisplay) {
            this.updateDuration();
        }
        dispatchEvent(param1);
    }

    private function videoDisplay_volumeChangedHandler(param1: Event): void {
        if (this.volumeBar) {
            this.volumeBar.value = this.volume;
            this.volumeBar.muted = this.muted;
        }
        if (this.muteButton) {
            this.muteButton.muted = this.muted;
            this.muteButton.volume = this.volume;
        }
        dispatchEvent(param1);
    }

    private function fullScreenButton_clickHandler(param1: MouseEvent): void {
        var _loc2_: * = null;
        var _loc3_: Boolean = false;
        var _loc4_: Number = NaN;
        var _loc5_: * = null;
        if (!this.fullScreen) {
            if (!systemManager.getTopLevelRoot()) {
                return;
            }
            _loc2_ = this.mx_internal::getScreenBounds();
            this.fullScreen = true;
            invalidateSkinState();
            _loc3_ = this.pauseWhenHidden;
            this.beforeFullScreenInfo = {
                "parent": this.parent,
                "x": this.x,
                "y": this.y,
                "explicitWidth": this.explicitWidth,
                "explicitHeight": this.explicitHeight,
                "percentWidth": this.percentWidth,
                "percentHeight": this.percentHeight,
                "isPopUp": this.isPopUp
            };
            this.pauseWhenHidden = false;
            if (!isPopUp) {
                if (parent is IVisualElementContainer) {
                    _loc5_ = IVisualElementContainer(parent);
                    this.beforeFullScreenInfo.childIndex = _loc5_.getElementIndex(this);
                    _loc5_.removeElement(this);
                } else {
                    this.beforeFullScreenInfo.childIndex = parent.getChildIndex(this);
                    parent.removeChild(this);
                }
                PopUpManager.addPopUp(this, FlexGlobals.topLevelApplication as DisplayObject, false, null, moduleFactory);
            }
            setLayoutBoundsSize(_loc2_.width, _loc2_.height, true);
            this.explicitWidth = width;
            this.explicitHeight = height;
            setLayoutBoundsPosition(0, 0, true);
            if (this.videoDisplay.videoObject) {
                this.beforeFullScreenInfo.smoothing = this.videoDisplay.videoObject.smoothing;
                this.beforeFullScreenInfo.deblocking = this.videoDisplay.videoObject.deblocking;
                this.videoDisplay.videoObject.smoothing = false;
                this.videoDisplay.videoObject.deblocking = 0;
            }
            this.validateNow();
            systemManager.stage.addEventListener(FullScreenEvent.FULL_SCREEN, this.fullScreenEventHandler);
            systemManager.stage.displayState = StageDisplayState.FULL_SCREEN;
            this.pauseWhenHidden = _loc3_;
            if ((_loc4_ = getStyle("fullScreenHideControlsDelay")) == 0) {
                this.playerControls.visible = false;
                if (this.volumeBar) {
                    this.volumeBar.closeDropDown(true);
                }
            } else if (_loc4_ < Infinity) {
                this.fullScreenHideControlTimer = new Timer(_loc4_, 1);
                this.fullScreenHideControlTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.fullScreenHideControlTimer_timerCompleteHandler, false, 0, true);
                systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_DOWN, this.resetFullScreenHideControlTimer);
                systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_MOVE, this.resetFullScreenHideControlTimer);
                systemManager.getSandboxRoot().addEventListener(MouseEvent.MOUSE_WHEEL, this.resetFullScreenHideControlTimer);
                systemManager.getSandboxRoot().addEventListener(KeyboardEvent.KEY_DOWN, this.resetFullScreenHideControlTimer);
                this.fullScreenHideControlTimer.start();
            }
        } else {
            systemManager.stage.displayState = StageDisplayState.NORMAL;
        }
    }

    private function fullScreenHideControlTimer_timerCompleteHandler(param1: TimerEvent): void {
        this.playerControls.visible = false;
        if (this.volumeBar) {
            this.volumeBar.closeDropDown(true);
        }
    }

    private function resetFullScreenHideControlTimer(param1: Event): void {
        this.playerControls.visible = true;
        if (this.fullScreenHideControlTimer) {
            this.fullScreenHideControlTimer.reset();
            this.fullScreenHideControlTimer.start();
        } else {
            this.fullScreenHideControlTimer = new Timer(getStyle("fullScreenHideControlsDelay"), 1);
            this.fullScreenHideControlTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.fullScreenHideControlTimer_timerCompleteHandler, false, 0, true);
        }
    }

    private function fullScreenEventHandler(param1: FullScreenEvent): void {
        if (param1.fullScreen) {
            return;
        }
        this.exitingFullScreenPauseWhenHidden = this.pauseWhenHidden;
        this.pauseWhenHidden = false;
        this.fullScreen = false;
        systemManager.stage.removeEventListener(FullScreenEvent.FULL_SCREEN, this.fullScreenEventHandler);
        systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_DOWN, this.resetFullScreenHideControlTimer);
        systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_MOVE, this.resetFullScreenHideControlTimer);
        systemManager.getSandboxRoot().removeEventListener(MouseEvent.MOUSE_WHEEL, this.resetFullScreenHideControlTimer);
        systemManager.getSandboxRoot().removeEventListener(KeyboardEvent.KEY_DOWN, this.resetFullScreenHideControlTimer);
        if (this.fullScreenHideControlTimer) {
            this.fullScreenHideControlTimer.stop();
            this.fullScreenHideControlTimer = null;
        }
        this.playerControls.visible = true;
        this.x = this.beforeFullScreenInfo.x;
        this.y = this.beforeFullScreenInfo.y;
        this.explicitWidth = this.beforeFullScreenInfo.explicitWidth;
        this.explicitHeight = this.beforeFullScreenInfo.explicitHeight;
        this.percentWidth = this.beforeFullScreenInfo.percentWidth;
        this.percentHeight = this.beforeFullScreenInfo.percentHeight;
        if (Boolean(this.videoDisplay.videoObject) && this.beforeFullScreenInfo.smoothing !== undefined) {
            this.videoDisplay.videoObject.smoothing = this.beforeFullScreenInfo.smoothing;
            this.videoDisplay.videoObject.deblocking = this.beforeFullScreenInfo.deblocking;
        }
        if (!this.beforeFullScreenInfo.isPopUp) {
            PopUpManager.removePopUp(this);
            if (this.beforeFullScreenInfo.parent is IVisualElementContainer) {
                this.beforeFullScreenInfo.parent.addElementAt(this, this.beforeFullScreenInfo.childIndex);
            } else {
                this.beforeFullScreenInfo.parent.addChildAt(this, this.beforeFullScreenInfo.childIndex);
            }
        }
        if (this.exitingFullScreenPauseWhenHidden) {
            this.needsToUpdatePauseWhenHidden = true;
            invalidateProperties();
        }
        this.beforeFullScreenInfo = null;
        invalidateSkinState();
        invalidateSize();
        invalidateDisplayList();
    }

    private function playButton_clickHandler(param1: MouseEvent): void {
        if (!this.playing) {
            this.play();
        }
    }

    private function pauseButton_clickHandler(param1: MouseEvent): void {
        this.pause();
    }

    private function stopButton_clickHandler(param1: MouseEvent): void {
        this.stop();
    }

    private function playPauseButton_clickHandler(param1: MouseEvent): void {
        if (this.playing) {
            this.pause();
        } else {
            this.play();
        }
        this.playPauseButton.selected = this.playing;
    }

    private function muteButton_mutedChangeHandler(param1: FlexEvent): void {
        this.muted = this.muteButton.muted;
    }

    private function volumeBar_changeHandler(param1: Event): void {
        if (this.volume != this.volumeBar.value) {
            this.volume = this.volumeBar.value;
        }
    }

    private function volumeBar_mutedChangeHandler(param1: FlexEvent): void {
        if (this.muted != this.volumeBar.muted) {
            this.muted = this.volumeBar.muted;
        }
    }

    private function scrubBar_changeStartHandler(param1: Event): void {
        this.scrubBarChanging = true;
    }

    private function scrubBar_thumbPressHandler(param1: TrackBaseEvent): void {
        this.scrubBarMouseCaptured = true;
        if (this.playing) {
            this.pause();
            this.wasPlayingBeforeSeeking = true;
        }
    }

    private function scrubBar_thumbReleaseHandler(param1: TrackBaseEvent): void {
        this.scrubBarMouseCaptured = false;
        if (this.wasPlayingBeforeSeeking) {
            this.play();
            this.wasPlayingBeforeSeeking = false;
        }
    }

    private function scrubBar_changeHandler(param1: Event): void {
        this.seek(this.scrubBar.value);
    }

    private function scrubBar_changeEndHandler(param1: Event): void {
        this.scrubBarChanging = false;
    }
}
}
