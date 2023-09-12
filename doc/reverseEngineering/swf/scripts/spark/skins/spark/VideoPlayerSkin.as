package spark.skins.spark {

import flash.events.FocusEvent;
import flash.utils.getDefinitionByName;

import mx.binding.Binding;
import mx.binding.BindingManager;
import mx.binding.IBindingClient;
import mx.binding.IWatcherSetupUtil2;
import mx.core.DeferredInstanceFromFunction;
import mx.core.IFlexModuleFactory;
import mx.core.IStateClient2;
import mx.core.mx_internal;
import mx.events.PropertyChangeEvent;
import mx.graphics.GradientEntry;
import mx.graphics.LinearGradient;
import mx.graphics.LinearGradientStroke;
import mx.graphics.SolidColor;
import mx.graphics.SolidColorStroke;
import mx.states.AddItems;
import mx.states.SetProperty;
import mx.states.SetStyle;
import mx.states.State;

import spark.components.Button;
import spark.components.Group;
import spark.components.Label;
import spark.components.ToggleButton;
import spark.components.VideoDisplay;
import spark.components.VideoPlayer;
import spark.components.mediaClasses.ScrubBar;
import spark.components.mediaClasses.VolumeBar;
import spark.layouts.HorizontalLayout;
import spark.primitives.Rect;
import spark.primitives.RectangularDropShadow;
import spark.skins.SparkSkin;
import spark.skins.spark.mediaClasses.fullScreen.FullScreenButtonSkin;
import spark.skins.spark.mediaClasses.fullScreen.PlayPauseButtonSkin;
import spark.skins.spark.mediaClasses.fullScreen.ScrubBarSkin;
import spark.skins.spark.mediaClasses.fullScreen.VolumeBarSkin;
import spark.skins.spark.mediaClasses.normal.FullScreenButtonSkin;
import spark.skins.spark.mediaClasses.normal.PlayPauseButtonSkin;
import spark.skins.spark.mediaClasses.normal.ScrubBarSkin;
import spark.skins.spark.mediaClasses.normal.VolumeBarSkin;

public class VideoPlayerSkin extends SparkSkin implements IBindingClient, IStateClient2 {

    private static const exclusions: Array = ["videoDisplay", "playPauseButton", "scrubBar", "currentTimeDisplay", "timeDivider", "durationDisplay", "volumeBar", "fullScreenButton"];

    private static var _watcherSetupUtil: IWatcherSetupUtil2;


    private var _1025130540_VideoPlayerSkin_GradientEntry1: GradientEntry;

    private var _1025130539_VideoPlayerSkin_GradientEntry2: GradientEntry;

    private var _1025130538_VideoPlayerSkin_GradientEntry3: GradientEntry;

    private var _1025130537_VideoPlayerSkin_GradientEntry4: GradientEntry;

    private var _1726228760_VideoPlayerSkin_Group2: Group;

    private var _1726228761_VideoPlayerSkin_Group3: Group;

    private var _1726228763_VideoPlayerSkin_Group5: Group;

    private var _1035275944_VideoPlayerSkin_Rect1: Rect;

    public var _VideoPlayerSkin_Rect2: Rect;

    public var _VideoPlayerSkin_Rect3: Rect;

    public var _VideoPlayerSkin_Rect9: Rect;

    private var _1071235516_VideoPlayerSkin_SolidColorStroke1: SolidColorStroke;

    private var _631637504clippedGroup: Group;

    private var _1594163708currentTimeDisplay: Label;

    private var _906978543dropShadow: RectangularDropShadow;

    private var _775506802durationDisplay: Label;

    private var _1661397741fullScreenButton: Button;

    private var _1996635380playPauseButton: ToggleButton;

    private var _70898871playerControls: Group;

    private var _396961948scrubBar: ScrubBar;

    private var _1916860532timeDivider: Label;

    private var _1524607943videoDisplay: VideoDisplay;

    private var _2128310631volumeBar: VolumeBar;

    private var __moduleFactoryInitialized: Boolean = false;

    mx_internal var _bindings: Array;

    mx_internal var _watchers: Array;

    mx_internal var _bindingsByDestination: Object;

    mx_internal var _bindingsBeginWithWord: Object;

    private var _213507019hostComponent: VideoPlayer;

    public function VideoPlayerSkin() {
        var watchers: Array;
        var _VideoPlayerSkin_Rect3_factory: DeferredInstanceFromFunction;
        var _VideoPlayerSkin_Rect9_factory: DeferredInstanceFromFunction;
        var _VideoPlayerSkin_RectangularDropShadow1_factory: DeferredInstanceFromFunction;
        var var_1: uint;
        var bindings: Array = null;
        var target: Object = null;
        var watcherSetupUtilClass: Object = null;
        this.mx_internal::_bindings = [];
        this.mx_internal::_watchers = [];
        this.mx_internal::_bindingsByDestination = {};
        this.mx_internal::_bindingsBeginWithWord = {};
        super();
        mx_internal::_document = this;
        bindings = this._VideoPlayerSkin_bindingsSetup();
        watchers = [];
        target = this;
        if (_watcherSetupUtil == null) {
            watcherSetupUtilClass = getDefinitionByName("_spark_skins_spark_VideoPlayerSkinWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
        }
        _watcherSetupUtil.setup(this, function (param1: String): * {
            return target[param1];
        }, function (param1: String): * {
            return VideoPlayerSkin[param1];
        }, bindings, watchers);
        mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
        mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
        this.mxmlContent = [this._VideoPlayerSkin_Group1_i()];
        this.currentState = "uninitialized";
        _VideoPlayerSkin_Rect3_factory = new DeferredInstanceFromFunction(this._VideoPlayerSkin_Rect3_i);
        _VideoPlayerSkin_Rect9_factory = new DeferredInstanceFromFunction(this._VideoPlayerSkin_Rect9_i);
        _VideoPlayerSkin_RectangularDropShadow1_factory = new DeferredInstanceFromFunction(this._VideoPlayerSkin_RectangularDropShadow1_i);
        states = [new State({
            "name": "uninitialized",
            "stateGroups": ["normalStates", "uninitializedStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_Rect9_factory,
                "destination": "_VideoPlayerSkin_Group2",
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_VideoPlayerSkin_Group3"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_Rect3_factory,
                "destination": "_VideoPlayerSkin_Group5",
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_VideoPlayerSkin_Rect2"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_RectangularDropShadow1_factory,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "first"
            })]
        }), new State({
            "name": "loading",
            "stateGroups": ["normalStates", "loadingStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_Rect9_factory,
                "destination": "_VideoPlayerSkin_Group2",
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_VideoPlayerSkin_Group3"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_Rect3_factory,
                "destination": "_VideoPlayerSkin_Group5",
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_VideoPlayerSkin_Rect2"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_RectangularDropShadow1_factory,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "first"
            })]
        }), new State({
            "name": "ready",
            "stateGroups": ["normalStates", "readyStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_Rect9_factory,
                "destination": "_VideoPlayerSkin_Group2",
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_VideoPlayerSkin_Group3"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_Rect3_factory,
                "destination": "_VideoPlayerSkin_Group5",
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_VideoPlayerSkin_Rect2"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_RectangularDropShadow1_factory,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "first"
            })]
        }), new State({
            "name": "playing",
            "stateGroups": ["playingStates", "normalStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_Rect9_factory,
                "destination": "_VideoPlayerSkin_Group2",
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_VideoPlayerSkin_Group3"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_Rect3_factory,
                "destination": "_VideoPlayerSkin_Group5",
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_VideoPlayerSkin_Rect2"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_RectangularDropShadow1_factory,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "first"
            })]
        }), new State({
            "name": "paused",
            "stateGroups": ["normalStates", "pausedStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_Rect9_factory,
                "destination": "_VideoPlayerSkin_Group2",
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_VideoPlayerSkin_Group3"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_Rect3_factory,
                "destination": "_VideoPlayerSkin_Group5",
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_VideoPlayerSkin_Rect2"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_RectangularDropShadow1_factory,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "first"
            })]
        }), new State({
            "name": "buffering",
            "stateGroups": ["normalStates", "bufferingStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_Rect9_factory,
                "destination": "_VideoPlayerSkin_Group2",
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_VideoPlayerSkin_Group3"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_Rect3_factory,
                "destination": "_VideoPlayerSkin_Group5",
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_VideoPlayerSkin_Rect2"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_RectangularDropShadow1_factory,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "first"
            })]
        }), new State({
            "name": "playbackError",
            "stateGroups": ["normalStates", "playbackErrorStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_Rect9_factory,
                "destination": "_VideoPlayerSkin_Group2",
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_VideoPlayerSkin_Group3"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_Rect3_factory,
                "destination": "_VideoPlayerSkin_Group5",
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_VideoPlayerSkin_Rect2"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_RectangularDropShadow1_factory,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "first"
            })]
        }), new State({
            "name": "disabled",
            "stateGroups": ["disabledStates", "normalStates"],
            "overrides": [new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_Rect9_factory,
                "destination": "_VideoPlayerSkin_Group2",
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_VideoPlayerSkin_Group3"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_Rect3_factory,
                "destination": "_VideoPlayerSkin_Group5",
                "propertyName": "mxmlContent",
                "position": "after",
                "relativeTo": ["_VideoPlayerSkin_Rect2"]
            }), new AddItems().initializeFromObject({
                "itemsFactory": _VideoPlayerSkin_RectangularDropShadow1_factory,
                "destination": null,
                "propertyName": "mxmlContent",
                "position": "first"
            }), new SetProperty().initializeFromObject({
                "name": "alpha",
                "value": 0.5
            })]
        }), new State({
            "name": "uninitializedAndFullScreen",
            "stateGroups": ["uninitializedStates", "fullScreenStates"],
            "overrides": [new SetStyle().initializeFromObject({
                "name": "chromeColor",
                "value": 13421772
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "bottom",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "left",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "right",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "top",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "bottom",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "left",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "right",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "top",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Group3",
                "name": "bottom",
                "value": 150
            }), new SetProperty().initializeFromObject({
                "target": "playerControls",
                "name": "maxWidth",
                "value": 755
            }), new SetStyle().initializeFromObject({
                "target": "playPauseButton",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.PlayPauseButtonSkin
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry1",
                "name": "color",
                "value": 5789784
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry1",
                "name": "alpha",
                "value": 0.55
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry2",
                "name": "color",
                "value": 1973790
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry2",
                "name": "alpha",
                "value": 0.55
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry3",
                "name": "color",
                "value": 16777215
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry3",
                "name": "alpha",
                "value": 0.12
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry4",
                "name": "color",
                "value": 16777215
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry4",
                "name": "alpha",
                "value": 0.09
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_SolidColorStroke1",
                "name": "color",
                "value": 2236962
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_SolidColorStroke1",
                "name": "alpha",
                "value": 0.66
            }), new SetStyle().initializeFromObject({
                "target": "scrubBar",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.ScrubBarSkin
            }), new SetStyle().initializeFromObject({
                "target": "currentTimeDisplay",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "timeDivider",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "durationDisplay",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "volumeBar",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.VolumeBarSkin
            }), new SetStyle().initializeFromObject({
                "target": "fullScreenButton",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.FullScreenButtonSkin
            })]
        }), new State({
            "name": "loadingAndFullScreen",
            "stateGroups": ["loadingStates", "fullScreenStates"],
            "overrides": [new SetStyle().initializeFromObject({
                "name": "chromeColor",
                "value": 13421772
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "bottom",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "left",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "right",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "top",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "bottom",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "left",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "right",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "top",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Group3",
                "name": "bottom",
                "value": 150
            }), new SetProperty().initializeFromObject({
                "target": "playerControls",
                "name": "maxWidth",
                "value": 755
            }), new SetStyle().initializeFromObject({
                "target": "playPauseButton",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.PlayPauseButtonSkin
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry1",
                "name": "color",
                "value": 5789784
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry1",
                "name": "alpha",
                "value": 0.55
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry2",
                "name": "color",
                "value": 1973790
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry2",
                "name": "alpha",
                "value": 0.55
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry3",
                "name": "color",
                "value": 16777215
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry3",
                "name": "alpha",
                "value": 0.12
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry4",
                "name": "color",
                "value": 16777215
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry4",
                "name": "alpha",
                "value": 0.09
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_SolidColorStroke1",
                "name": "color",
                "value": 2236962
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_SolidColorStroke1",
                "name": "alpha",
                "value": 0.66
            }), new SetStyle().initializeFromObject({
                "target": "scrubBar",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.ScrubBarSkin
            }), new SetStyle().initializeFromObject({
                "target": "currentTimeDisplay",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "timeDivider",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "durationDisplay",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "volumeBar",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.VolumeBarSkin
            }), new SetStyle().initializeFromObject({
                "target": "fullScreenButton",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.FullScreenButtonSkin
            })]
        }), new State({
            "name": "readyAndFullScreen",
            "stateGroups": ["readyStates", "fullScreenStates"],
            "overrides": [new SetStyle().initializeFromObject({
                "name": "chromeColor",
                "value": 13421772
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "bottom",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "left",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "right",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "top",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "bottom",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "left",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "right",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "top",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Group3",
                "name": "bottom",
                "value": 150
            }), new SetProperty().initializeFromObject({
                "target": "playerControls",
                "name": "maxWidth",
                "value": 755
            }), new SetStyle().initializeFromObject({
                "target": "playPauseButton",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.PlayPauseButtonSkin
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry1",
                "name": "color",
                "value": 5789784
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry1",
                "name": "alpha",
                "value": 0.55
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry2",
                "name": "color",
                "value": 1973790
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry2",
                "name": "alpha",
                "value": 0.55
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry3",
                "name": "color",
                "value": 16777215
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry3",
                "name": "alpha",
                "value": 0.12
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry4",
                "name": "color",
                "value": 16777215
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry4",
                "name": "alpha",
                "value": 0.09
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_SolidColorStroke1",
                "name": "color",
                "value": 2236962
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_SolidColorStroke1",
                "name": "alpha",
                "value": 0.66
            }), new SetStyle().initializeFromObject({
                "target": "scrubBar",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.ScrubBarSkin
            }), new SetStyle().initializeFromObject({
                "target": "currentTimeDisplay",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "timeDivider",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "durationDisplay",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "volumeBar",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.VolumeBarSkin
            }), new SetStyle().initializeFromObject({
                "target": "fullScreenButton",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.FullScreenButtonSkin
            })]
        }), new State({
            "name": "playingAndFullScreen",
            "stateGroups": ["playingStates", "fullScreenStates"],
            "overrides": [new SetStyle().initializeFromObject({
                "name": "chromeColor",
                "value": 13421772
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "bottom",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "left",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "right",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "top",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "bottom",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "left",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "right",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "top",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Group3",
                "name": "bottom",
                "value": 150
            }), new SetProperty().initializeFromObject({
                "target": "playerControls",
                "name": "maxWidth",
                "value": 755
            }), new SetStyle().initializeFromObject({
                "target": "playPauseButton",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.PlayPauseButtonSkin
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry1",
                "name": "color",
                "value": 5789784
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry1",
                "name": "alpha",
                "value": 0.55
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry2",
                "name": "color",
                "value": 1973790
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry2",
                "name": "alpha",
                "value": 0.55
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry3",
                "name": "color",
                "value": 16777215
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry3",
                "name": "alpha",
                "value": 0.12
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry4",
                "name": "color",
                "value": 16777215
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry4",
                "name": "alpha",
                "value": 0.09
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_SolidColorStroke1",
                "name": "color",
                "value": 2236962
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_SolidColorStroke1",
                "name": "alpha",
                "value": 0.66
            }), new SetStyle().initializeFromObject({
                "target": "scrubBar",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.ScrubBarSkin
            }), new SetStyle().initializeFromObject({
                "target": "currentTimeDisplay",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "timeDivider",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "durationDisplay",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "volumeBar",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.VolumeBarSkin
            }), new SetStyle().initializeFromObject({
                "target": "fullScreenButton",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.FullScreenButtonSkin
            })]
        }), new State({
            "name": "pausedAndFullScreen",
            "stateGroups": ["pausedStates", "fullScreenStates"],
            "overrides": [new SetStyle().initializeFromObject({
                "name": "chromeColor",
                "value": 13421772
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "bottom",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "left",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "right",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "top",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "bottom",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "left",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "right",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "top",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Group3",
                "name": "bottom",
                "value": 150
            }), new SetProperty().initializeFromObject({
                "target": "playerControls",
                "name": "maxWidth",
                "value": 755
            }), new SetStyle().initializeFromObject({
                "target": "playPauseButton",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.PlayPauseButtonSkin
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry1",
                "name": "color",
                "value": 5789784
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry1",
                "name": "alpha",
                "value": 0.55
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry2",
                "name": "color",
                "value": 1973790
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry2",
                "name": "alpha",
                "value": 0.55
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry3",
                "name": "color",
                "value": 16777215
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry3",
                "name": "alpha",
                "value": 0.12
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry4",
                "name": "color",
                "value": 16777215
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry4",
                "name": "alpha",
                "value": 0.09
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_SolidColorStroke1",
                "name": "color",
                "value": 2236962
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_SolidColorStroke1",
                "name": "alpha",
                "value": 0.66
            }), new SetStyle().initializeFromObject({
                "target": "scrubBar",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.ScrubBarSkin
            }), new SetStyle().initializeFromObject({
                "target": "currentTimeDisplay",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "timeDivider",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "durationDisplay",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "volumeBar",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.VolumeBarSkin
            }), new SetStyle().initializeFromObject({
                "target": "fullScreenButton",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.FullScreenButtonSkin
            })]
        }), new State({
            "name": "bufferingAndFullScreen",
            "stateGroups": ["bufferingStates", "fullScreenStates"],
            "overrides": [new SetStyle().initializeFromObject({
                "name": "chromeColor",
                "value": 13421772
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "bottom",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "left",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "right",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "top",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "bottom",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "left",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "right",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "top",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Group3",
                "name": "bottom",
                "value": 150
            }), new SetProperty().initializeFromObject({
                "target": "playerControls",
                "name": "maxWidth",
                "value": 755
            }), new SetStyle().initializeFromObject({
                "target": "playPauseButton",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.PlayPauseButtonSkin
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry1",
                "name": "color",
                "value": 5789784
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry1",
                "name": "alpha",
                "value": 0.55
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry2",
                "name": "color",
                "value": 1973790
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry2",
                "name": "alpha",
                "value": 0.55
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry3",
                "name": "color",
                "value": 16777215
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry3",
                "name": "alpha",
                "value": 0.12
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry4",
                "name": "color",
                "value": 16777215
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry4",
                "name": "alpha",
                "value": 0.09
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_SolidColorStroke1",
                "name": "color",
                "value": 2236962
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_SolidColorStroke1",
                "name": "alpha",
                "value": 0.66
            }), new SetStyle().initializeFromObject({
                "target": "scrubBar",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.ScrubBarSkin
            }), new SetStyle().initializeFromObject({
                "target": "currentTimeDisplay",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "timeDivider",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "durationDisplay",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "volumeBar",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.VolumeBarSkin
            }), new SetStyle().initializeFromObject({
                "target": "fullScreenButton",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.FullScreenButtonSkin
            })]
        }), new State({
            "name": "playbackErrorAndFullScreen",
            "stateGroups": ["playbackErrorStates", "fullScreenStates"],
            "overrides": [new SetStyle().initializeFromObject({
                "name": "chromeColor",
                "value": 13421772
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "bottom",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "left",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "right",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "top",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "bottom",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "left",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "right",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "top",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Group3",
                "name": "bottom",
                "value": 150
            }), new SetProperty().initializeFromObject({
                "target": "playerControls",
                "name": "maxWidth",
                "value": 755
            }), new SetStyle().initializeFromObject({
                "target": "playPauseButton",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.PlayPauseButtonSkin
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry1",
                "name": "color",
                "value": 5789784
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry1",
                "name": "alpha",
                "value": 0.55
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry2",
                "name": "color",
                "value": 1973790
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry2",
                "name": "alpha",
                "value": 0.55
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry3",
                "name": "color",
                "value": 16777215
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry3",
                "name": "alpha",
                "value": 0.12
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry4",
                "name": "color",
                "value": 16777215
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry4",
                "name": "alpha",
                "value": 0.09
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_SolidColorStroke1",
                "name": "color",
                "value": 2236962
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_SolidColorStroke1",
                "name": "alpha",
                "value": 0.66
            }), new SetStyle().initializeFromObject({
                "target": "scrubBar",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.ScrubBarSkin
            }), new SetStyle().initializeFromObject({
                "target": "currentTimeDisplay",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "timeDivider",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "durationDisplay",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "volumeBar",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.VolumeBarSkin
            }), new SetStyle().initializeFromObject({
                "target": "fullScreenButton",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.FullScreenButtonSkin
            })]
        }), new State({
            "name": "disabledAndFullScreen",
            "stateGroups": ["disabledStates", "fullScreenStates"],
            "overrides": [new SetProperty().initializeFromObject({
                "name": "alpha",
                "value": 0.5
            }), new SetStyle().initializeFromObject({
                "name": "chromeColor",
                "value": 13421772
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "bottom",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "left",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "right",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Rect1",
                "name": "top",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "bottom",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "left",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "right",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "videoDisplay",
                "name": "top",
                "value": 0
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_Group3",
                "name": "bottom",
                "value": 150
            }), new SetProperty().initializeFromObject({
                "target": "playerControls",
                "name": "maxWidth",
                "value": 755
            }), new SetStyle().initializeFromObject({
                "target": "playPauseButton",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.PlayPauseButtonSkin
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry1",
                "name": "color",
                "value": 5789784
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry1",
                "name": "alpha",
                "value": 0.55
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry2",
                "name": "color",
                "value": 1973790
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry2",
                "name": "alpha",
                "value": 0.55
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry3",
                "name": "color",
                "value": 16777215
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry3",
                "name": "alpha",
                "value": 0.12
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry4",
                "name": "color",
                "value": 16777215
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_GradientEntry4",
                "name": "alpha",
                "value": 0.09
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_SolidColorStroke1",
                "name": "color",
                "value": 2236962
            }), new SetProperty().initializeFromObject({
                "target": "_VideoPlayerSkin_SolidColorStroke1",
                "name": "alpha",
                "value": 0.66
            }), new SetStyle().initializeFromObject({
                "target": "scrubBar",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.ScrubBarSkin
            }), new SetStyle().initializeFromObject({
                "target": "currentTimeDisplay",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "timeDivider",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "durationDisplay",
                "name": "color",
                "value": 16777215
            }), new SetStyle().initializeFromObject({
                "target": "volumeBar",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.VolumeBarSkin
            }), new SetStyle().initializeFromObject({
                "target": "fullScreenButton",
                "name": "skinClass",
                "value": spark.skins.spark.mediaClasses.fullScreen.FullScreenButtonSkin
            })]
        })];
        var_1 = 0;
        while (var_1 < bindings.length) {
            Binding(bindings[var_1]).execute();
            var_1++;
        }
    }

    public static function set watcherSetupUtil(param1: IWatcherSetupUtil2): void {
        VideoPlayerSkin._watcherSetupUtil = param1;
    }

    override public function set moduleFactory(param1: IFlexModuleFactory): void {
        super.moduleFactory = param1;
        if (this.__moduleFactoryInitialized) {
            return;
        }
        this.__moduleFactoryInitialized = true;
    }

    override public function initialize(): void {
        super.initialize();
    }

    override protected function initializationComplete(): void {
        useChromeColor = true;
        super.initializationComplete();
    }

    override public function get colorizeExclusions(): Array {
        return exclusions;
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        this.dropShadow.visible = getStyle("dropShadowVisible");
        super.updateDisplayList(param1, param2);
    }

    private function _VideoPlayerSkin_RectangularDropShadow1_i(): RectangularDropShadow {
        var _loc1_: RectangularDropShadow = new RectangularDropShadow();
        _loc1_.blurX = 17;
        _loc1_.blurY = 17;
        _loc1_.alpha = 0.32;
        _loc1_.distance = 4;
        _loc1_.angle = 90;
        _loc1_.color = 1250067;
        _loc1_.left = 0;
        _loc1_.top = 0;
        _loc1_.right = 0;
        _loc1_.bottom = 0;
        _loc1_.id = "dropShadow";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.dropShadow = _loc1_;
        BindingManager.executeBindings(this, "dropShadow", this.dropShadow);
        return _loc1_;
    }

    private function _VideoPlayerSkin_Group1_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.clipAndEnableScrolling = true;
        _loc1_.left = 0;
        _loc1_.top = 0;
        _loc1_.right = 0;
        _loc1_.bottom = 0;
        _loc1_.mxmlContent = [this._VideoPlayerSkin_Group2_i()];
        _loc1_.id = "clippedGroup";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.clippedGroup = _loc1_;
        BindingManager.executeBindings(this, "clippedGroup", this.clippedGroup);
        return _loc1_;
    }

    private function _VideoPlayerSkin_Group2_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.minWidth = 263;
        _loc1_.minHeight = 184;
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.mxmlContent = [this._VideoPlayerSkin_Rect1_i(), this._VideoPlayerSkin_VideoDisplay1_i(), this._VideoPlayerSkin_Group3_i()];
        _loc1_.id = "_VideoPlayerSkin_Group2";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._VideoPlayerSkin_Group2 = _loc1_;
        BindingManager.executeBindings(this, "_VideoPlayerSkin_Group2", this._VideoPlayerSkin_Group2);
        return _loc1_;
    }

    private function _VideoPlayerSkin_Rect1_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.bottom = 1;
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.fill = this._VideoPlayerSkin_SolidColor1_c();
        _loc1_.initialized(this, "_VideoPlayerSkin_Rect1");
        this._VideoPlayerSkin_Rect1 = _loc1_;
        BindingManager.executeBindings(this, "_VideoPlayerSkin_Rect1", this._VideoPlayerSkin_Rect1);
        return _loc1_;
    }

    private function _VideoPlayerSkin_SolidColor1_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 0;
        return _loc1_;
    }

    private function _VideoPlayerSkin_VideoDisplay1_i(): VideoDisplay {
        var _loc1_: VideoDisplay = new VideoDisplay();
        _loc1_.bottom = 24;
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.id = "videoDisplay";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.videoDisplay = _loc1_;
        BindingManager.executeBindings(this, "videoDisplay", this.videoDisplay);
        return _loc1_;
    }

    private function _VideoPlayerSkin_Group3_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.height = 24;
        _loc1_.bottom = 0;
        _loc1_.mxmlContent = [this._VideoPlayerSkin_Group4_i()];
        _loc1_.id = "_VideoPlayerSkin_Group3";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._VideoPlayerSkin_Group3 = _loc1_;
        BindingManager.executeBindings(this, "_VideoPlayerSkin_Group3", this._VideoPlayerSkin_Group3);
        return _loc1_;
    }

    private function _VideoPlayerSkin_Group4_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.bottom = 0;
        _loc1_.horizontalCenter = 0;
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.mxmlContent = [this._VideoPlayerSkin_ToggleButton1_i(), this._VideoPlayerSkin_Group5_i(), this._VideoPlayerSkin_VolumeBar1_i(), this._VideoPlayerSkin_Button1_i()];
        _loc1_.id = "playerControls";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.playerControls = _loc1_;
        BindingManager.executeBindings(this, "playerControls", this.playerControls);
        return _loc1_;
    }

    private function _VideoPlayerSkin_ToggleButton1_i(): ToggleButton {
        var _loc1_: ToggleButton = new ToggleButton();
        _loc1_.left = 0;
        _loc1_.bottom = 0;
        _loc1_.layoutDirection = "ltr";
        _loc1_.setStyle("skinClass", spark.skins.spark.mediaClasses.normal.PlayPauseButtonSkin);
        _loc1_.addEventListener("focusIn", this.__playPauseButton_focusIn);
        _loc1_.addEventListener("focusOut", this.__playPauseButton_focusOut);
        _loc1_.id = "playPauseButton";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.playPauseButton = _loc1_;
        BindingManager.executeBindings(this, "playPauseButton", this.playPauseButton);
        return _loc1_;
    }

    public function __playPauseButton_focusIn(param1: FocusEvent): void {
        param1.target.depth = 1;
    }

    public function __playPauseButton_focusOut(param1: FocusEvent): void {
        param1.target.depth = 0;
    }

    private function _VideoPlayerSkin_Group5_i(): Group {
        var _loc1_: Group = new Group();
        _loc1_.left = 39;
        _loc1_.right = 75;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.mxmlContent = [this._VideoPlayerSkin_Rect2_i(), this._VideoPlayerSkin_Rect4_c(), this._VideoPlayerSkin_Rect5_c(), this._VideoPlayerSkin_Group6_c()];
        _loc1_.id = "_VideoPlayerSkin_Group5";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this._VideoPlayerSkin_Group5 = _loc1_;
        BindingManager.executeBindings(this, "_VideoPlayerSkin_Group5", this._VideoPlayerSkin_Group5);
        return _loc1_;
    }

    private function _VideoPlayerSkin_Rect2_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.fill = this._VideoPlayerSkin_LinearGradient1_c();
        _loc1_.initialized(this, "_VideoPlayerSkin_Rect2");
        this._VideoPlayerSkin_Rect2 = _loc1_;
        BindingManager.executeBindings(this, "_VideoPlayerSkin_Rect2", this._VideoPlayerSkin_Rect2);
        return _loc1_;
    }

    private function _VideoPlayerSkin_LinearGradient1_c(): LinearGradient {
        var _loc1_: LinearGradient = new LinearGradient();
        _loc1_.rotation = 90;
        _loc1_.entries = [this._VideoPlayerSkin_GradientEntry1_i(), this._VideoPlayerSkin_GradientEntry2_i()];
        return _loc1_;
    }

    private function _VideoPlayerSkin_GradientEntry1_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16777215;
        this._VideoPlayerSkin_GradientEntry1 = _loc1_;
        BindingManager.executeBindings(this, "_VideoPlayerSkin_GradientEntry1", this._VideoPlayerSkin_GradientEntry1);
        return _loc1_;
    }

    private function _VideoPlayerSkin_GradientEntry2_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 14474460;
        this._VideoPlayerSkin_GradientEntry2 = _loc1_;
        BindingManager.executeBindings(this, "_VideoPlayerSkin_GradientEntry2", this._VideoPlayerSkin_GradientEntry2);
        return _loc1_;
    }

    private function _VideoPlayerSkin_Rect3_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.height = 11;
        _loc1_.fill = this._VideoPlayerSkin_SolidColor2_c();
        _loc1_.initialized(this, "_VideoPlayerSkin_Rect3");
        this._VideoPlayerSkin_Rect3 = _loc1_;
        BindingManager.executeBindings(this, "_VideoPlayerSkin_Rect3", this._VideoPlayerSkin_Rect3);
        return _loc1_;
    }

    private function _VideoPlayerSkin_SolidColor2_c(): SolidColor {
        var _loc1_: SolidColor = new SolidColor();
        _loc1_.color = 16777215;
        _loc1_.alpha = 0.3;
        return _loc1_;
    }

    private function _VideoPlayerSkin_Rect4_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 1;
        _loc1_.right = 1;
        _loc1_.top = 1;
        _loc1_.bottom = 1;
        _loc1_.stroke = this._VideoPlayerSkin_LinearGradientStroke1_c();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _VideoPlayerSkin_LinearGradientStroke1_c(): LinearGradientStroke {
        var _loc1_: LinearGradientStroke = new LinearGradientStroke();
        _loc1_.weight = 1;
        _loc1_.rotation = 90;
        _loc1_.entries = [this._VideoPlayerSkin_GradientEntry3_i(), this._VideoPlayerSkin_GradientEntry4_i()];
        return _loc1_;
    }

    private function _VideoPlayerSkin_GradientEntry3_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 16711422;
        this._VideoPlayerSkin_GradientEntry3 = _loc1_;
        BindingManager.executeBindings(this, "_VideoPlayerSkin_GradientEntry3", this._VideoPlayerSkin_GradientEntry3);
        return _loc1_;
    }

    private function _VideoPlayerSkin_GradientEntry4_i(): GradientEntry {
        var _loc1_: GradientEntry = new GradientEntry();
        _loc1_.color = 15395562;
        this._VideoPlayerSkin_GradientEntry4 = _loc1_;
        BindingManager.executeBindings(this, "_VideoPlayerSkin_GradientEntry4", this._VideoPlayerSkin_GradientEntry4);
        return _loc1_;
    }

    private function _VideoPlayerSkin_Rect5_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = -1;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.stroke = this._VideoPlayerSkin_SolidColorStroke1_i();
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _VideoPlayerSkin_SolidColorStroke1_i(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.color = 1250067;
        this._VideoPlayerSkin_SolidColorStroke1 = _loc1_;
        BindingManager.executeBindings(this, "_VideoPlayerSkin_SolidColorStroke1", this._VideoPlayerSkin_SolidColorStroke1);
        return _loc1_;
    }

    private function _VideoPlayerSkin_Group6_c(): Group {
        var _loc1_: Group = new Group();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.height = 23;
        _loc1_.bottom = 0;
        _loc1_.layout = this._VideoPlayerSkin_HorizontalLayout1_c();
        _loc1_.mxmlContent = [this._VideoPlayerSkin_Rect6_c(), this._VideoPlayerSkin_ScrubBar1_i(), this._VideoPlayerSkin_Rect7_c(), this._VideoPlayerSkin_Label1_i(), this._VideoPlayerSkin_Label2_i(), this._VideoPlayerSkin_Label3_i(), this._VideoPlayerSkin_Rect8_c()];
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        return _loc1_;
    }

    private function _VideoPlayerSkin_HorizontalLayout1_c(): HorizontalLayout {
        var _loc1_: HorizontalLayout = new HorizontalLayout();
        _loc1_.verticalAlign = "middle";
        _loc1_.gap = 1;
        return _loc1_;
    }

    private function _VideoPlayerSkin_Rect6_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.width = 7;
        _loc1_.height = 1;
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _VideoPlayerSkin_ScrubBar1_i(): ScrubBar {
        var _loc1_: ScrubBar = new ScrubBar();
        _loc1_.percentWidth = 100;
        _loc1_.setStyle("liveDragging", true);
        _loc1_.setStyle("skinClass", spark.skins.spark.mediaClasses.normal.ScrubBarSkin);
        _loc1_.id = "scrubBar";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.scrubBar = _loc1_;
        BindingManager.executeBindings(this, "scrubBar", this.scrubBar);
        return _loc1_;
    }

    private function _VideoPlayerSkin_Rect7_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.width = 8;
        _loc1_.height = 1;
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _VideoPlayerSkin_Label1_i(): Label {
        var _loc1_: Label = new Label();
        _loc1_.id = "currentTimeDisplay";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.currentTimeDisplay = _loc1_;
        BindingManager.executeBindings(this, "currentTimeDisplay", this.currentTimeDisplay);
        return _loc1_;
    }

    private function _VideoPlayerSkin_Label2_i(): Label {
        var _loc1_: Label = new Label();
        _loc1_.text = "/";
        _loc1_.id = "timeDivider";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.timeDivider = _loc1_;
        BindingManager.executeBindings(this, "timeDivider", this.timeDivider);
        return _loc1_;
    }

    private function _VideoPlayerSkin_Label3_i(): Label {
        var _loc1_: Label = new Label();
        _loc1_.id = "durationDisplay";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.durationDisplay = _loc1_;
        BindingManager.executeBindings(this, "durationDisplay", this.durationDisplay);
        return _loc1_;
    }

    private function _VideoPlayerSkin_Rect8_c(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.width = 8;
        _loc1_.height = 1;
        _loc1_.initialized(this, null);
        return _loc1_;
    }

    private function _VideoPlayerSkin_VolumeBar1_i(): VolumeBar {
        var _loc1_: VolumeBar = new VolumeBar();
        _loc1_.snapInterval = 0.01;
        _loc1_.stepSize = 0.01;
        _loc1_.right = 37;
        _loc1_.bottom = 0;
        _loc1_.layoutDirection = "ltr";
        _loc1_.setStyle("liveDragging", true);
        _loc1_.setStyle("skinClass", spark.skins.spark.mediaClasses.normal.VolumeBarSkin);
        _loc1_.addEventListener("focusIn", this.__volumeBar_focusIn);
        _loc1_.addEventListener("focusOut", this.__volumeBar_focusOut);
        _loc1_.id = "volumeBar";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.volumeBar = _loc1_;
        BindingManager.executeBindings(this, "volumeBar", this.volumeBar);
        return _loc1_;
    }

    public function __volumeBar_focusIn(param1: FocusEvent): void {
        param1.target.depth = 1;
    }

    public function __volumeBar_focusOut(param1: FocusEvent): void {
        param1.target.depth = 0;
    }

    private function _VideoPlayerSkin_Button1_i(): Button {
        var _loc1_: Button = new Button();
        _loc1_.right = 0;
        _loc1_.bottom = 0;
        _loc1_.label = "Fullscreen";
        _loc1_.setStyle("skinClass", spark.skins.spark.mediaClasses.normal.FullScreenButtonSkin);
        _loc1_.addEventListener("focusIn", this.__fullScreenButton_focusIn);
        _loc1_.addEventListener("focusOut", this.__fullScreenButton_focusOut);
        _loc1_.id = "fullScreenButton";
        if (!_loc1_.document) {
            _loc1_.document = this;
        }
        this.fullScreenButton = _loc1_;
        BindingManager.executeBindings(this, "fullScreenButton", this.fullScreenButton);
        return _loc1_;
    }

    public function __fullScreenButton_focusIn(param1: FocusEvent): void {
        param1.target.depth = 1;
    }

    public function __fullScreenButton_focusOut(param1: FocusEvent): void {
        param1.target.depth = 0;
    }

    private function _VideoPlayerSkin_Rect9_i(): Rect {
        var _loc1_: Rect = new Rect();
        _loc1_.left = 0;
        _loc1_.right = 0;
        _loc1_.top = 0;
        _loc1_.bottom = 0;
        _loc1_.stroke = this._VideoPlayerSkin_SolidColorStroke2_c();
        _loc1_.initialized(this, "_VideoPlayerSkin_Rect9");
        this._VideoPlayerSkin_Rect9 = _loc1_;
        BindingManager.executeBindings(this, "_VideoPlayerSkin_Rect9", this._VideoPlayerSkin_Rect9);
        return _loc1_;
    }

    private function _VideoPlayerSkin_SolidColorStroke2_c(): SolidColorStroke {
        var _loc1_: SolidColorStroke = new SolidColorStroke();
        _loc1_.color = 1250067;
        return _loc1_;
    }

    private function _VideoPlayerSkin_bindingsSetup(): Array {
        var var_5: Array = [];
        var_5[0] = new Binding(this, function (): Number {
            return Math.max(0, 184);
        }, null, "clippedGroup.verticalScrollPosition");
        return var_5;
    }

    [Bindable(event="propertyChange")]
    public function get _VideoPlayerSkin_GradientEntry1(): GradientEntry {
        return this._1025130540_VideoPlayerSkin_GradientEntry1;
    }

    public function set _VideoPlayerSkin_GradientEntry1(param1: GradientEntry): void {
        var _loc2_: Object = this._1025130540_VideoPlayerSkin_GradientEntry1;
        if (_loc2_ !== param1) {
            this._1025130540_VideoPlayerSkin_GradientEntry1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_VideoPlayerSkin_GradientEntry1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _VideoPlayerSkin_GradientEntry2(): GradientEntry {
        return this._1025130539_VideoPlayerSkin_GradientEntry2;
    }

    public function set _VideoPlayerSkin_GradientEntry2(param1: GradientEntry): void {
        var _loc2_: Object = this._1025130539_VideoPlayerSkin_GradientEntry2;
        if (_loc2_ !== param1) {
            this._1025130539_VideoPlayerSkin_GradientEntry2 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_VideoPlayerSkin_GradientEntry2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _VideoPlayerSkin_GradientEntry3(): GradientEntry {
        return this._1025130538_VideoPlayerSkin_GradientEntry3;
    }

    public function set _VideoPlayerSkin_GradientEntry3(param1: GradientEntry): void {
        var _loc2_: Object = this._1025130538_VideoPlayerSkin_GradientEntry3;
        if (_loc2_ !== param1) {
            this._1025130538_VideoPlayerSkin_GradientEntry3 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_VideoPlayerSkin_GradientEntry3", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _VideoPlayerSkin_GradientEntry4(): GradientEntry {
        return this._1025130537_VideoPlayerSkin_GradientEntry4;
    }

    public function set _VideoPlayerSkin_GradientEntry4(param1: GradientEntry): void {
        var _loc2_: Object = this._1025130537_VideoPlayerSkin_GradientEntry4;
        if (_loc2_ !== param1) {
            this._1025130537_VideoPlayerSkin_GradientEntry4 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_VideoPlayerSkin_GradientEntry4", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _VideoPlayerSkin_Group2(): Group {
        return this._1726228760_VideoPlayerSkin_Group2;
    }

    public function set _VideoPlayerSkin_Group2(param1: Group): void {
        var _loc2_: Object = this._1726228760_VideoPlayerSkin_Group2;
        if (_loc2_ !== param1) {
            this._1726228760_VideoPlayerSkin_Group2 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_VideoPlayerSkin_Group2", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _VideoPlayerSkin_Group3(): Group {
        return this._1726228761_VideoPlayerSkin_Group3;
    }

    public function set _VideoPlayerSkin_Group3(param1: Group): void {
        var _loc2_: Object = this._1726228761_VideoPlayerSkin_Group3;
        if (_loc2_ !== param1) {
            this._1726228761_VideoPlayerSkin_Group3 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_VideoPlayerSkin_Group3", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _VideoPlayerSkin_Group5(): Group {
        return this._1726228763_VideoPlayerSkin_Group5;
    }

    public function set _VideoPlayerSkin_Group5(param1: Group): void {
        var _loc2_: Object = this._1726228763_VideoPlayerSkin_Group5;
        if (_loc2_ !== param1) {
            this._1726228763_VideoPlayerSkin_Group5 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_VideoPlayerSkin_Group5", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _VideoPlayerSkin_Rect1(): Rect {
        return this._1035275944_VideoPlayerSkin_Rect1;
    }

    public function set _VideoPlayerSkin_Rect1(param1: Rect): void {
        var _loc2_: Object = this._1035275944_VideoPlayerSkin_Rect1;
        if (_loc2_ !== param1) {
            this._1035275944_VideoPlayerSkin_Rect1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_VideoPlayerSkin_Rect1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get _VideoPlayerSkin_SolidColorStroke1(): SolidColorStroke {
        return this._1071235516_VideoPlayerSkin_SolidColorStroke1;
    }

    public function set _VideoPlayerSkin_SolidColorStroke1(param1: SolidColorStroke): void {
        var _loc2_: Object = this._1071235516_VideoPlayerSkin_SolidColorStroke1;
        if (_loc2_ !== param1) {
            this._1071235516_VideoPlayerSkin_SolidColorStroke1 = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_VideoPlayerSkin_SolidColorStroke1", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get clippedGroup(): Group {
        return this._631637504clippedGroup;
    }

    public function set clippedGroup(param1: Group): void {
        var _loc2_: Object = this._631637504clippedGroup;
        if (_loc2_ !== param1) {
            this._631637504clippedGroup = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clippedGroup", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get currentTimeDisplay(): Label {
        return this._1594163708currentTimeDisplay;
    }

    public function set currentTimeDisplay(param1: Label): void {
        var _loc2_: Object = this._1594163708currentTimeDisplay;
        if (_loc2_ !== param1) {
            this._1594163708currentTimeDisplay = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "currentTimeDisplay", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get dropShadow(): RectangularDropShadow {
        return this._906978543dropShadow;
    }

    public function set dropShadow(param1: RectangularDropShadow): void {
        var _loc2_: Object = this._906978543dropShadow;
        if (_loc2_ !== param1) {
            this._906978543dropShadow = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dropShadow", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get durationDisplay(): Label {
        return this._775506802durationDisplay;
    }

    public function set durationDisplay(param1: Label): void {
        var _loc2_: Object = this._775506802durationDisplay;
        if (_loc2_ !== param1) {
            this._775506802durationDisplay = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "durationDisplay", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get fullScreenButton(): Button {
        return this._1661397741fullScreenButton;
    }

    public function set fullScreenButton(param1: Button): void {
        var _loc2_: Object = this._1661397741fullScreenButton;
        if (_loc2_ !== param1) {
            this._1661397741fullScreenButton = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fullScreenButton", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get playPauseButton(): ToggleButton {
        return this._1996635380playPauseButton;
    }

    public function set playPauseButton(param1: ToggleButton): void {
        var _loc2_: Object = this._1996635380playPauseButton;
        if (_loc2_ !== param1) {
            this._1996635380playPauseButton = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playPauseButton", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get playerControls(): Group {
        return this._70898871playerControls;
    }

    public function set playerControls(param1: Group): void {
        var _loc2_: Object = this._70898871playerControls;
        if (_loc2_ !== param1) {
            this._70898871playerControls = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "playerControls", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get scrubBar(): ScrubBar {
        return this._396961948scrubBar;
    }

    public function set scrubBar(param1: ScrubBar): void {
        var _loc2_: Object = this._396961948scrubBar;
        if (_loc2_ !== param1) {
            this._396961948scrubBar = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scrubBar", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get timeDivider(): Label {
        return this._1916860532timeDivider;
    }

    public function set timeDivider(param1: Label): void {
        var _loc2_: Object = this._1916860532timeDivider;
        if (_loc2_ !== param1) {
            this._1916860532timeDivider = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeDivider", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get videoDisplay(): VideoDisplay {
        return this._1524607943videoDisplay;
    }

    public function set videoDisplay(param1: VideoDisplay): void {
        var _loc2_: Object = this._1524607943videoDisplay;
        if (_loc2_ !== param1) {
            this._1524607943videoDisplay = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "videoDisplay", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get volumeBar(): VolumeBar {
        return this._2128310631volumeBar;
    }

    public function set volumeBar(param1: VolumeBar): void {
        var _loc2_: Object = this._2128310631volumeBar;
        if (_loc2_ !== param1) {
            this._2128310631volumeBar = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "volumeBar", _loc2_, param1));
            }
        }
    }

    [Bindable(event="propertyChange")]
    public function get hostComponent(): VideoPlayer {
        return this._213507019hostComponent;
    }

    public function set hostComponent(param1: VideoPlayer): void {
        var _loc2_: Object = this._213507019hostComponent;
        if (_loc2_ !== param1) {
            this._213507019hostComponent = param1;
            if (this.hasEventListener("propertyChange")) {
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hostComponent", _loc2_, param1));
            }
        }
    }
}
}
