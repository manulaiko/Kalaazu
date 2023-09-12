package org.osmf.layout {

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.errors.IllegalOperationError;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.geom.Point;
import flash.geom.Rectangle;
import flash.utils.Dictionary;

import org.osmf.events.DisplayObjectEvent;
import org.osmf.metadata.Metadata;
import org.osmf.metadata.MetadataWatcher;
import org.osmf.utils.OSMFStrings;

public class LayoutRendererBase extends EventDispatcher {

    private static var dispatcher: DisplayObject = new Sprite();

    private static var cleaningRenderers: Boolean;

    private static var dirtyRenderers: Vector.<LayoutRendererBase> = new Vector.<LayoutRendererBase>();


    private var _parent: LayoutRendererBase;

    private var _container: ILayoutTarget;

    private var layoutMetadata: LayoutMetadata;

    private var layoutTargets: Vector.<ILayoutTarget>;

    private var stagedDisplayObjects: Dictionary;

    private var _measuredWidth: Number;

    private var _measuredHeight: Number;

    private var dirty: Boolean;

    private var cleaning: Boolean;

    private var metaDataWatchers: Dictionary;

    public function LayoutRendererBase() {
        this.layoutTargets = new Vector.<ILayoutTarget>();
        this.stagedDisplayObjects = new Dictionary(true);
        this.metaDataWatchers = new Dictionary();
        super();
    }

    private static function flagDirty(param1: LayoutRendererBase): void {
        if (param1 == null || dirtyRenderers.indexOf(param1) != -1) {
            return;
        }
        dirtyRenderers.push(param1);
        if (cleaningRenderers == false) {
            dispatcher.addEventListener(Event.EXIT_FRAME, onExitFrame);
        }
    }

    private static function flagClean(param1: LayoutRendererBase): void {
        var _loc2_: Number = dirtyRenderers.indexOf(param1);
        if (_loc2_ != -1) {
            dirtyRenderers.splice(_loc2_, 1);
        }
    }

    private static function onExitFrame(param1: Event): void {
        var _loc2_: * = null;
        dispatcher.removeEventListener(Event.EXIT_FRAME, onExitFrame);
        cleaningRenderers = true;
        while (true) {
            _loc2_ = dirtyRenderers.shift();
            if (_loc2_.parent == null) {
                _loc2_.validateNow();
            } else {
                _loc2_.dirty = false;
            }
        }
        cleaningRenderers = false;
    }

    public final function get parent(): LayoutRendererBase {
        return this._parent;
    }

    final function setParent(param1: LayoutRendererBase): void {
        this._parent = param1;
        this.processParentChange(this._parent);
    }

    public final function get container(): ILayoutTarget {
        return this._container;
    }

    public final function set container(param1: ILayoutTarget): void {
        var _loc2_: * = null;
        if (param1 != this._container) {
            _loc2_ = this._container;
            if (_loc2_ != null) {
                this.reset();
                _loc2_.dispatchEvent(new LayoutTargetEvent(LayoutTargetEvent.UNSET_AS_LAYOUT_RENDERER_CONTAINER, false, false, this));
                _loc2_.removeEventListener(DisplayObjectEvent.MEDIA_SIZE_CHANGE, this.invalidatingEventHandler);
            }
            this._container = param1;
            if (this._container) {
                this.layoutMetadata = this._container.layoutMetadata;
                this._container.addEventListener(DisplayObjectEvent.MEDIA_SIZE_CHANGE, this.invalidatingEventHandler, false, 0, true);
                this._container.dispatchEvent(new LayoutTargetEvent(LayoutTargetEvent.SET_AS_LAYOUT_RENDERER_CONTAINER, false, false, this));
                this.invalidate();
            }
            this.processContainerChange(_loc2_, param1);
        }
    }

    public final function addTarget(param1: ILayoutTarget): ILayoutTarget {
        var _loc4_: * = null;
        var _loc5_: * = null;
        if (param1 == null) {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
        }
        if (this.layoutTargets.indexOf(param1) != -1) {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
        }
        param1.dispatchEvent(new LayoutTargetEvent(LayoutTargetEvent.ADD_TO_LAYOUT_RENDERER, false, false, this));
        var _loc2_: int = Math.abs(BinarySearch.search(this.layoutTargets, this.compareTargets, param1));
        this.layoutTargets.splice(_loc2_, 0, param1);
        var _loc3_: Array = this.metaDataWatchers[param1] = new Array();
        for each(_loc4_ in this.usedMetadatas) {
            (_loc5_ = new MetadataWatcher(param1.layoutMetadata, _loc4_, null, this.targetMetadataChangeCallback)).watch();
            _loc3_.push(_loc5_);
        }
        param1.addEventListener(DisplayObjectEvent.DISPLAY_OBJECT_CHANGE, this.invalidatingEventHandler);
        param1.addEventListener(DisplayObjectEvent.MEDIA_SIZE_CHANGE, this.invalidatingEventHandler);
        param1.addEventListener(LayoutTargetEvent.ADD_TO_LAYOUT_RENDERER, this.onTargetAddedToRenderer);
        param1.addEventListener(LayoutTargetEvent.SET_AS_LAYOUT_RENDERER_CONTAINER, this.onTargetSetAsContainer);
        this.invalidate();
        this.processTargetAdded(param1);
        return param1;
    }

    public final function removeTarget(param1: ILayoutTarget): ILayoutTarget {
        var _loc2_: * = null;
        var _loc4_: * = null;
        if (param1 == null) {
            throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.NULL_PARAM));
        }
        var _loc3_: Number = this.layoutTargets.indexOf(param1);
        if (_loc3_ != -1) {
            this.removeFromStage(param1);
            _loc2_ = this.layoutTargets.splice(_loc3_, 1)[0];
            param1.removeEventListener(DisplayObjectEvent.DISPLAY_OBJECT_CHANGE, this.invalidatingEventHandler);
            param1.removeEventListener(DisplayObjectEvent.MEDIA_SIZE_CHANGE, this.invalidatingEventHandler);
            param1.removeEventListener(LayoutTargetEvent.ADD_TO_LAYOUT_RENDERER, this.onTargetAddedToRenderer);
            param1.removeEventListener(LayoutTargetEvent.SET_AS_LAYOUT_RENDERER_CONTAINER, this.onTargetSetAsContainer);
            for each(_loc4_ in this.metaDataWatchers[param1]) {
                _loc4_.unwatch();
            }
            delete this.metaDataWatchers[param1];
            this.processTargetRemoved(param1);
            param1.dispatchEvent(new LayoutTargetEvent(LayoutTargetEvent.REMOVE_FROM_LAYOUT_RENDERER, false, false, this));
            this.invalidate();
            return _loc2_;
        }
        throw new IllegalOperationError(OSMFStrings.getString(OSMFStrings.INVALID_PARAM));
    }

    public final function hasTarget(param1: ILayoutTarget): Boolean {
        return this.layoutTargets.indexOf(param1) != -1;
    }

    public final function get measuredWidth(): Number {
        return this._measuredWidth;
    }

    public final function get measuredHeight(): Number {
        return this._measuredHeight;
    }

    public final function invalidate(): void {
        if (this.cleaning == false && this.dirty == false) {
            this.dirty = true;
            if (this._parent != null) {
                this._parent.invalidate();
            } else {
                flagDirty(this);
            }
        }
    }

    public final function validateNow(): void {
        if (this._container == null || this.cleaning == true) {
            return;
        }
        if (this._parent) {
            this._parent.validateNow();
            return;
        }
        this.cleaning = true;
        this.measure();
        this.layout(this._measuredWidth, this._measuredHeight);
        this.cleaning = false;
    }

    function measure(): void {
        var _loc1_: * = null;
        var _loc2_: * = null;
        this.prepareTargets();
        for each(_loc1_ in this.layoutTargets) {
            _loc1_.measure(true);
        }
        _loc2_ = this.calculateContainerSize(this.layoutTargets);
        this._measuredWidth = _loc2_.x;
        this._measuredHeight = _loc2_.y;
        this._container.measure(false);
    }

    function layout(param1: Number, param2: Number): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        this.processUpdateMediaDisplayBegin(this.layoutTargets);
        this._container.layout(param1, param2, false);
        for each(_loc3_ in this.layoutTargets) {
            _loc4_ = this.calculateTargetBounds(_loc3_, param1, param2);
            _loc3_.layout(_loc4_.width, _loc4_.height, true);
            if (_loc5_ = _loc3_.displayObject) {
                _loc5_.x = _loc4_.x;
                _loc5_.y = _loc4_.y;
            }
        }
        this.dirty = false;
        this.processUpdateMediaDisplayEnd();
    }

    protected function get usedMetadatas(): Vector.<String> {
        return new Vector.<String>();
    }

    protected function compareTargets(param1: ILayoutTarget, param2: ILayoutTarget): Number {
        return 0;
    }

    protected function processContainerChange(param1: ILayoutTarget, param2: ILayoutTarget): void {
    }

    protected function processTargetAdded(param1: ILayoutTarget): void {
    }

    protected function processTargetRemoved(param1: ILayoutTarget): void {
    }

    protected function processStagedTarget(param1: ILayoutTarget): void {
    }

    protected function processUnstagedTarget(param1: ILayoutTarget): void {
    }

    protected function processUpdateMediaDisplayBegin(param1: Vector.<ILayoutTarget>): void {
    }

    protected function processUpdateMediaDisplayEnd(): void {
    }

    protected function updateTargetOrder(param1: ILayoutTarget): void {
        var _loc2_: int = this.layoutTargets.indexOf(param1);
        if (_loc2_ != -1) {
            this.layoutTargets.splice(_loc2_, 1);
            _loc2_ = Math.abs(BinarySearch.search(this.layoutTargets, this.compareTargets, param1));
            this.layoutTargets.splice(_loc2_, 0, param1);
        }
    }

    protected function calculateTargetBounds(param1: ILayoutTarget, param2: Number, param3: Number): Rectangle {
        return new Rectangle();
    }

    protected function calculateContainerSize(param1: Vector.<ILayoutTarget>): Point {
        return new Point();
    }

    protected function processParentChange(param1: LayoutRendererBase): void {
    }

    private function reset(): void {
        var _loc1_: * = null;
        for each(_loc1_ in this.layoutTargets) {
            this.removeTarget(_loc1_);
        }
        if (this._container) {
            this._container.removeEventListener(DisplayObjectEvent.MEDIA_SIZE_CHANGE, this.invalidatingEventHandler);
            this.validateNow();
        }
        this._container = null;
        this.layoutMetadata = null;
    }

    private function targetMetadataChangeCallback(param1: Metadata): void {
        this.invalidate();
    }

    private function invalidatingEventHandler(param1: Event): void {
        this.invalidate();
    }

    private function onTargetAddedToRenderer(param1: LayoutTargetEvent): void {
        var _loc2_: * = null;
        if (param1.layoutRenderer != this) {
            _loc2_ = param1.target as ILayoutTarget;
            if (this.hasTarget(_loc2_)) {
                this.removeTarget(_loc2_);
            }
        }
    }

    private function onTargetSetAsContainer(param1: LayoutTargetEvent): void {
        var _loc2_: * = null;
        if (param1.layoutRenderer != this) {
            _loc2_ = param1.target as ILayoutTarget;
            if (this.container == _loc2_) {
                this.container = null;
            }
        }
    }

    private function prepareTargets(): void {
        var _loc2_: * = null;
        var _loc3_: * = null;
        var _loc1_: int = 0;
        for each(_loc2_ in this.layoutTargets) {
            _loc3_ = _loc2_.displayObject;
            if (_loc3_) {
                this.addToStage(_loc2_, _loc2_.displayObject, _loc1_);
                _loc1_++;
            } else {
                this.removeFromStage(_loc2_);
            }
        }
    }

    private function addToStage(param1: ILayoutTarget, param2: DisplayObject, param3: Number): void {
        var _loc4_: DisplayObject;
        if ((_loc4_ = this.stagedDisplayObjects[param1]) == param2) {
            this._container.dispatchEvent(new LayoutTargetEvent(LayoutTargetEvent.SET_CHILD_INDEX, false, false, this, param1, _loc4_, param3));
        } else {
            if (_loc4_ != null) {
                this._container.dispatchEvent(new LayoutTargetEvent(LayoutTargetEvent.REMOVE_CHILD, false, false, this, param1, _loc4_));
            }
            this.stagedDisplayObjects[param1] = param2;
            this._container.dispatchEvent(new LayoutTargetEvent(LayoutTargetEvent.ADD_CHILD_AT, false, false, this, param1, param2, param3));
            if (_loc4_ == null) {
                this.processStagedTarget(param1);
            }
        }
    }

    private function removeFromStage(param1: ILayoutTarget): void {
        var _loc2_: DisplayObject = this.stagedDisplayObjects[param1];
        if (_loc2_ != null) {
            delete this.stagedDisplayObjects[param1];
            this._container.dispatchEvent(new LayoutTargetEvent(LayoutTargetEvent.REMOVE_CHILD, false, false, this, param1, _loc2_));
        }
    }
}
}
