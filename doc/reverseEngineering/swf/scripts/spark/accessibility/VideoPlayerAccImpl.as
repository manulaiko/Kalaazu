package spark.accessibility {

import flash.accessibility.Accessibility;
import flash.events.Event;
import flash.events.FocusEvent;
import flash.events.MouseEvent;

import mx.accessibility.AccConst;
import mx.accessibility.AccImpl;
import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.events.FlexEvent;
import mx.resources.IResourceManager;
import mx.resources.ResourceManager;

import org.osmf.events.TimeEvent;

import spark.components.VideoPlayer;
import spark.components.mediaClasses.ScrubBar;
import spark.components.mediaClasses.VolumeBar;
import spark.components.supportClasses.ButtonBase;
import spark.components.supportClasses.ToggleButtonBase;
import spark.events.SkinPartEvent;

public class VideoPlayerAccImpl extends AccImpl {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static const VIDEOPLAYER_PLAYPAUSEBUTTON: uint = 1;

    private static const VIDEOPLAYER_SCRUBBAR: uint = 2;

    private static const VIDEOPLAYER_CURRENTTIMEDISPLAY: uint = 3;

    private static const VIDEOPLAYER_MUTEBUTTON: uint = 4;

    private static const VIDEOPLAYER_VOLUMEBAR: uint = 5;

    private static const VIDEOPLAYER_FULLSCREENBUTTON: uint = 6;

    private static const VIDEOPLAYER_NUM_ACCESSIBLE_COMPONENTS: uint = 6;


    public function VideoPlayerAccImpl(param1: UIComponent) {
        super(param1);
        role = AccConst.ROLE_SYSTEM_PANE;
        var _loc2_: ToggleButtonBase = VideoPlayer(param1).playPauseButton;
        if (_loc2_) {
            _loc2_.addEventListener(Event.CHANGE, this.eventHandler);
            if (VideoPlayer(param1).tabIndex > 0 && _loc2_.tabIndex == -1) {
                _loc2_.tabIndex = VideoPlayer(param1).tabIndex;
            }
        }
        var _loc3_: VolumeBar = VideoPlayer(param1).volumeBar;
        if (_loc3_) {
            _loc3_.addEventListener(Event.CHANGE, this.eventHandler);
            _loc3_.addEventListener(FlexEvent.MUTED_CHANGE, this.eventHandler);
            if (VideoPlayer(param1).tabIndex > 0 && _loc3_.tabIndex == -1) {
                _loc3_.tabIndex = VideoPlayer(param1).tabIndex;
            }
        }
        if (VideoPlayer(param1).scrubBar) {
            if (VideoPlayer(param1).tabIndex > 0 && VideoPlayer(param1).scrubBar.tabIndex == -1) {
                VideoPlayer(param1).scrubBar.tabIndex = VideoPlayer(param1).tabIndex;
            }
        }
        if (VideoPlayer(param1).fullScreenButton) {
            if (VideoPlayer(param1).tabIndex > 0 && VideoPlayer(param1).fullScreenButton.tabIndex == -1) {
                VideoPlayer(param1).fullScreenButton.tabIndex = VideoPlayer(param1).tabIndex;
            }
        }
    }

    public static function enableAccessibility(): void {
        VideoPlayer.mx_internal::createAccessibilityImplementation = mx_internal::createAccessibilityImplementation;
    }

    mx_internal static function createAccessibilityImplementation(param1: UIComponent): void {
        param1.accessibilityImplementation = new VideoPlayerAccImpl(param1);
    }

    override protected function get eventsToHandle(): Array {
        return super.eventsToHandle.concat([MouseEvent.CLICK, FocusEvent.FOCUS_IN, TimeEvent.CURRENT_TIME_CHANGE, SkinPartEvent.PART_ADDED, SkinPartEvent.PART_REMOVED]);
    }

    override public function accLocation(param1: uint): * {
        var _loc2_: VideoPlayer = VideoPlayer(master);
        switch (param1) {
            case VIDEOPLAYER_PLAYPAUSEBUTTON:
                return !!_loc2_.playPauseButton ? _loc2_.playPauseButton : null;
            case VIDEOPLAYER_SCRUBBAR:
                return !!_loc2_.scrubBar ? _loc2_.scrubBar : null;
            case VIDEOPLAYER_CURRENTTIMEDISPLAY:
                return !!_loc2_.currentTimeDisplay ? _loc2_.currentTimeDisplay : null;
            case VIDEOPLAYER_MUTEBUTTON:
                return !!_loc2_.volumeBar ? _loc2_.volumeBar : null;
            case VIDEOPLAYER_VOLUMEBAR:
                return Boolean(_loc2_.volumeBar) && Boolean(_loc2_.volumeBar.dropDown) ? _loc2_.volumeBar.dropDown : null;
            case VIDEOPLAYER_FULLSCREENBUTTON:
                return !!_loc2_.fullScreenButton ? _loc2_.fullScreenButton : null;
            default:
                return;
        }
    }

    override public function getChildIDArray(): Array {
        return createChildIDArray(VIDEOPLAYER_NUM_ACCESSIBLE_COMPONENTS);
    }

    override public function get_accRole(param1: uint): uint {
        var _loc2_: * = 0;
        switch (param1) {
            case 0:
                _loc2_ = role;
                break;
            case VIDEOPLAYER_PLAYPAUSEBUTTON:
                if (!VideoPlayer(master).playPauseButton) {
                    break;
                }
                _loc2_ = 0;
                break;
            case VIDEOPLAYER_SCRUBBAR:
                if (!VideoPlayer(master).scrubBar) {
                    break;
                }
                _loc2_ = 0;
                break;
            case VIDEOPLAYER_CURRENTTIMEDISPLAY:
                if (!VideoPlayer(master).currentTimeDisplay) {
                    break;
                }
                _loc2_ = 0;
                break;
            case VIDEOPLAYER_MUTEBUTTON:
                if (!VideoPlayer(master).volumeBar) {
                    break;
                }
                _loc2_ = 0;
                break;
            case VIDEOPLAYER_VOLUMEBAR:
                if (!VideoPlayer(master).volumeBar) {
                    break;
                }
                _loc2_ = 0;
                break;
            case VIDEOPLAYER_FULLSCREENBUTTON:
                if (!VideoPlayer(master).fullScreenButton) {
                    break;
                }
                _loc2_ = 0;
                break;
        }
        return _loc2_;
    }

    override public function get_accState(param1: uint): uint {
        var _loc2_: * = 0;
        var _loc3_: uint = this.get_accFocus();
        var _loc4_: VideoPlayer = VideoPlayer(master);
        _loc2_ |= getState(param1);
        if (!_loc4_.enabled) {
            return _loc2_ | 0;
        }
        if (!_loc4_.volumeBar || param1 == VIDEOPLAYER_VOLUMEBAR && !_loc4_.volumeBar.isDropDownOpen) {
            return _loc2_ | 0;
        }
        if (param1 == VIDEOPLAYER_PLAYPAUSEBUTTON && !_loc4_.playPauseButton || param1 == VIDEOPLAYER_PLAYPAUSEBUTTON && !_loc4_.playPauseButton.enabled || (param1 == VIDEOPLAYER_SCRUBBAR && !_loc4_.scrubBar || param1 == VIDEOPLAYER_SCRUBBAR && !_loc4_.scrubBar.enabled) || (param1 == VIDEOPLAYER_CURRENTTIMEDISPLAY && !_loc4_.currentTimeDisplay || param1 == VIDEOPLAYER_CURRENTTIMEDISPLAY && !(_loc4_.currentTimeDisplay is UIComponent && Boolean(UIComponent(_loc4_.currentTimeDisplay).enabled))) || (param1 == VIDEOPLAYER_MUTEBUTTON && !_loc4_.volumeBar || param1 == VIDEOPLAYER_MUTEBUTTON && !_loc4_.volumeBar.enabled) || (param1 == VIDEOPLAYER_VOLUMEBAR && !_loc4_.volumeBar || param1 == VIDEOPLAYER_VOLUMEBAR && !_loc4_.volumeBar.enabled) || (param1 == VIDEOPLAYER_FULLSCREENBUTTON && !_loc4_.fullScreenButton || param1 == VIDEOPLAYER_FULLSCREENBUTTON && !_loc4_.fullScreenButton.enabled)) {
            return _loc2_ | 0;
        }
        if (param1 != VIDEOPLAYER_CURRENTTIMEDISPLAY) {
            _loc2_ |= 0;
        }
        if (param1 == _loc3_) {
            _loc2_ |= 0;
        }
        return _loc2_;
    }

    override public function get_accDefaultAction(param1: uint): String {
        var _loc2_: String = "";
        switch (param1) {
            case VIDEOPLAYER_PLAYPAUSEBUTTON:
                if (!VideoPlayer(master).playPauseButton) {
                    break;
                }
                _loc2_ = "Toggle";
                break;
            case VIDEOPLAYER_MUTEBUTTON:
                if (!VideoPlayer(master).volumeBar) {
                    break;
                }
                _loc2_ = "Press";
                break;
            case VIDEOPLAYER_FULLSCREENBUTTON:
                if (!VideoPlayer(master).fullScreenButton) {
                    break;
                }
                _loc2_ = "Press";
                break;
        }
        return _loc2_;
    }

    override public function get_accFocus(): uint {
        var _loc1_: VideoPlayer = VideoPlayer(master);
        var _loc2_: Number = 0;
        return this.elementToChildID(_loc1_.getFocus());
    }

    override public function accDoDefaultAction(param1: uint): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc2_: VideoPlayer = VideoPlayer(master);
        if (false) {
            if (param1 == VIDEOPLAYER_PLAYPAUSEBUTTON && Boolean(_loc2_.playPauseButton)) {
                _loc3_ = new MouseEvent(MouseEvent.CLICK);
                _loc2_.playPauseButton.dispatchEvent(_loc3_);
            } else if (param1 == VIDEOPLAYER_MUTEBUTTON && Boolean(_loc2_.volumeBar)) {
                _loc2_.volumeBar.muted = !_loc2_.volumeBar.muted;
                _loc4_ = new FlexEvent(FlexEvent.MUTED_CHANGE);
                _loc2_.volumeBar.dispatchEvent(_loc4_);
            } else if (param1 == VIDEOPLAYER_FULLSCREENBUTTON && Boolean(_loc2_.fullScreenButton)) {
                _loc3_ = new MouseEvent(MouseEvent.CLICK);
                _loc2_.fullScreenButton.dispatchEvent(_loc3_);
            }
        }
    }

    override public function get_accValue(param1: uint): String {
        var _loc2_: VideoPlayer = VideoPlayer(master);
        var _loc3_: String = "";
        if (param1 == VIDEOPLAYER_SCRUBBAR && Boolean(_loc2_.currentTimeDisplay)) {
            _loc3_ = _loc2_.currentTimeDisplay.text;
        } else if (param1 == VIDEOPLAYER_VOLUMEBAR && Boolean(_loc2_.volumeBar)) {
            _loc3_ = String(Math.floor(_loc2_.volumeBar.value * 100));
        }
        return _loc3_;
    }

    override public function accSelect(param1: uint, param2: uint): void {
        var _loc3_: VideoPlayer = VideoPlayer(master);
        if (param1 == AccConst.SELFLAG_TAKEFOCUS) {
            switch (param2) {
                case VIDEOPLAYER_PLAYPAUSEBUTTON:
                    if (_loc3_.playPauseButton) {
                        _loc3_.playPauseButton.setFocus();
                        break;
                    }
                    break;
                case VIDEOPLAYER_SCRUBBAR:
                    if (_loc3_.scrubBar) {
                        _loc3_.scrubBar.setFocus();
                        break;
                    }
                    break;
                case VIDEOPLAYER_MUTEBUTTON:
                    if (_loc3_.volumeBar) {
                        _loc3_.volumeBar.setFocus();
                        break;
                    }
                    break;
                case VIDEOPLAYER_VOLUMEBAR:
                    if (_loc3_.volumeBar) {
                        _loc3_.volumeBar.setFocus();
                        break;
                    }
                    break;
                case VIDEOPLAYER_FULLSCREENBUTTON:
                    if (_loc3_.fullScreenButton) {
                        _loc3_.fullScreenButton.setFocus();
                        break;
                    }
            }
        }
    }

    override protected function getName(param1: uint): String {
        var _loc4_: * = null;
        var _loc2_: VideoPlayer = VideoPlayer(master);
        var _loc3_: IResourceManager = ResourceManager.getInstance();
        var _loc5_: String = "";
        var _loc6_: String = "";
        switch (param1) {
            case 0:
                _loc4_ = !!_loc2_.accessibilityName ? _loc2_.accessibilityName : _loc3_.getString("components", "videoPlayerVideoDisplayAccName");
                break;
            case VIDEOPLAYER_PLAYPAUSEBUTTON:
                if (!_loc2_.playPauseButton) {
                    break;
                }
                if (!(_loc4_ = !!_loc2_.playPauseButton.accessibilityProperties ? _loc2_.playPauseButton.accessibilityName : "")) {
                    _loc4_ = _loc3_.getString("components", "videoPlayerPlayButtonAccName");
                }
                if (_loc4_.indexOf(",") >= 0) {
                    _loc5_ = _loc4_.split(",", 2)[0];
                    _loc6_ = _loc4_.split(",", 2)[1];
                } else {
                    _loc5_ = _loc6_ = _loc4_;
                }
                _loc4_ = _loc2_.playing ? _loc6_ : _loc5_;
                break;
            case VIDEOPLAYER_SCRUBBAR:
                if (!_loc2_.scrubBar) {
                    break;
                }
                _loc4_ = !!_loc2_.scrubBar.accessibilityName ? _loc2_.scrubBar.accessibilityName : _loc3_.getString("components", "videoPlayerScrubBarAccName");
                break;
            case VIDEOPLAYER_CURRENTTIMEDISPLAY:
                if (!_loc2_.currentTimeDisplay || !_loc2_.durationDisplay) {
                    break;
                }
                _loc4_ = _loc2_.currentTimeDisplay.text + "/" + _loc2_.durationDisplay.text;
                break;
            case VIDEOPLAYER_MUTEBUTTON:
                if (!_loc2_.volumeBar || !_loc2_.volumeBar.muteButton) {
                    break;
                }
                if (!(_loc4_ = !!_loc2_.volumeBar.muteButton.accessibilityProperties ? _loc2_.volumeBar.muteButton.accessibilityName : "")) {
                    _loc4_ = _loc3_.getString("components", "videoPlayerMuteButtonAccName");
                }
                if (_loc4_.indexOf(",") >= 0) {
                    _loc5_ = _loc4_.split(",", 2)[0];
                    _loc6_ = _loc4_.split(",", 2)[1];
                } else {
                    _loc5_ = _loc6_ = _loc4_;
                }
                _loc4_ = _loc2_.volumeBar.muted ? _loc6_ : _loc5_;
                break;
            case VIDEOPLAYER_VOLUMEBAR:
                if (!_loc2_.volumeBar) {
                    break;
                }
                _loc4_ = !!_loc2_.volumeBar.accessibilityName ? _loc2_.volumeBar.accessibilityName : _loc3_.getString("components", "videoPlayerVolumeBarAccName");
                break;
            case VIDEOPLAYER_FULLSCREENBUTTON:
                if (!_loc2_.fullScreenButton) {
                    break;
                }
                _loc4_ = !!_loc2_.fullScreenButton.accessibilityName ? _loc2_.fullScreenButton.accessibilityName : _loc3_.getString("components", "videoPlayerFullScreenButtonAccName");
                break;
        }
        return _loc4_;
    }

    private function elementToChildID(param1: Object): Number {
        var _loc2_: Number = 0;
        var _loc3_: String = String(param1);
        if (_loc3_.search("playPauseButton") > 0) {
            _loc2_ = VIDEOPLAYER_PLAYPAUSEBUTTON;
        } else if (_loc3_.search("scrubBar") > 0) {
            _loc2_ = VIDEOPLAYER_SCRUBBAR;
        } else if (_loc3_.search("durationDisplay") > 0) {
            _loc2_ = VIDEOPLAYER_CURRENTTIMEDISPLAY;
        } else if (_loc3_.search("volumeBar") > 0) {
            _loc2_ = VIDEOPLAYER_VOLUMEBAR;
        } else if (_loc3_.search("fullScreenButton") > 0) {
            _loc2_ = VIDEOPLAYER_FULLSCREENBUTTON;
        }
        return _loc2_;
    }

    override protected function eventHandler(param1: Event): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: Number = 0;
        $eventHandler(param1);
        var _loc2_: Number = this.elementToChildID(param1.target);
        switch (param1.type) {
            case MouseEvent.CLICK:
                Accessibility.sendEvent(master, 0, AccConst.EVENT_OBJECT_STATECHANGE);
                Accessibility.updateProperties();
                break;
            case FocusEvent.FOCUS_IN:
                Accessibility.sendEvent(master, this.get_accFocus(), AccConst.EVENT_OBJECT_FOCUS);
                Accessibility.updateProperties();
                break;
            case Event.CHANGE:
                _loc7_ = 0;
                if (_loc2_ == VIDEOPLAYER_PLAYPAUSEBUTTON || _loc2_ == VIDEOPLAYER_MUTEBUTTON || _loc2_ == VIDEOPLAYER_FULLSCREENBUTTON) {
                    _loc7_ = 0;
                } else if (_loc2_ == VIDEOPLAYER_SCRUBBAR || _loc2_ == VIDEOPLAYER_VOLUMEBAR) {
                    _loc7_ = 0;
                }
                if (_loc2_ != VIDEOPLAYER_CURRENTTIMEDISPLAY && _loc2_ != 0) {
                    Accessibility.sendEvent(master, _loc2_, _loc7_);
                    Accessibility.updateProperties();
                    break;
                }
            case FlexEvent.MUTED_CHANGE:
                Accessibility.sendEvent(master, VIDEOPLAYER_MUTEBUTTON, AccConst.EVENT_OBJECT_NAMECHANGE);
                Accessibility.updateProperties();
                break;
            case TimeEvent.CURRENT_TIME_CHANGE:
                Accessibility.sendEvent(master, VIDEOPLAYER_SCRUBBAR, AccConst.EVENT_OBJECT_VALUECHANGE);
                Accessibility.sendEvent(master, VIDEOPLAYER_CURRENTTIMEDISPLAY, AccConst.EVENT_OBJECT_NAMECHANGE);
                Accessibility.updateProperties();
                break;
            case SkinPartEvent.PART_ADDED:
                _loc3_ = VideoPlayer(master).playPauseButton;
                if (SkinPartEvent(param1).instance == _loc3_) {
                    _loc3_.addEventListener(Event.CHANGE, this.eventHandler);
                    if (VideoPlayer(master).tabIndex > 0 && _loc3_.tabIndex == -1) {
                        _loc3_.tabIndex = VideoPlayer(master).tabIndex;
                    }
                }
                _loc4_ = VideoPlayer(master).volumeBar;
                if (SkinPartEvent(param1).instance == _loc4_) {
                    _loc4_.addEventListener(Event.CHANGE, this.eventHandler);
                    _loc4_.addEventListener(FlexEvent.MUTED_CHANGE, this.eventHandler);
                    if (VideoPlayer(master).tabIndex > 0 && _loc4_.tabIndex == -1) {
                        _loc4_.tabIndex = VideoPlayer(master).tabIndex;
                    }
                }
                _loc5_ = VideoPlayer(master).scrubBar;
                if (SkinPartEvent(param1).instance == _loc5_) {
                    if (VideoPlayer(master).tabIndex > 0 && _loc5_.tabIndex == -1) {
                        _loc5_.tabIndex = VideoPlayer(master).tabIndex;
                    }
                }
                _loc6_ = VideoPlayer(master).fullScreenButton;
                if (SkinPartEvent(param1).instance == _loc6_) {
                    if (VideoPlayer(master).tabIndex > 0 && _loc6_.tabIndex == -1) {
                        _loc6_.tabIndex = VideoPlayer(master).tabIndex;
                        break;
                    }
                    break;
                }
                break;
            case SkinPartEvent.PART_REMOVED:
                _loc3_ = VideoPlayer(master).playPauseButton;
                if (SkinPartEvent(param1).instance == _loc3_) {
                    _loc3_.removeEventListener(Event.CHANGE, this.eventHandler);
                }
                _loc4_ = VideoPlayer(master).volumeBar;
                if (SkinPartEvent(param1).instance == _loc4_) {
                    _loc4_.removeEventListener(Event.CHANGE, this.eventHandler);
                    _loc4_.removeEventListener(FlexEvent.MUTED_CHANGE, this.eventHandler);
                    break;
                }
        }
    }
}
}
