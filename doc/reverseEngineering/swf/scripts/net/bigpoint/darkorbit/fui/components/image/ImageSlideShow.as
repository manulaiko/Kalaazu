package net.bigpoint.darkorbit.fui.components.image {

import flash.display.Graphics;
import flash.events.Event;

import net.bigpoint.darkorbit.fui.components.core.Container;
import net.bigpoint.darkorbit.fui.components.core.InvalidationType;

public class ImageSlideShow extends Container {


    protected var _repeat: Boolean = false;

    protected var _playlist: Vector.<ImageSlideShowElement>;

    protected var _playlistIndex: uint;

    protected var _currentPlaybackElement: ImageSlideShowElement;

    protected var _nextPlaybackElement: ImageSlideShowElement;

    public function ImageSlideShow() {
        super();
    }

    override protected function draw(): void {
        super.draw();
    }

    override public function dispose(): void {
        this.removeAllSlideshowElements();
        super.dispose();
    }

    protected function removeAllSlideshowElements(): void {
        var _loc2_: * = null;
        if (this._playlist == null) {
            return;
        }
        var _loc1_: int = 0;
        while (_loc1_ < this._playlist.length) {
            _loc2_ = this._playlist[_loc1_];
            if (_loc2_) {
                this.removeImageSlideShowElementEventListeners(_loc2_);
                _loc2_.dispose();
                if (contains(_loc2_)) {
                    this.removeChild(_loc2_);
                }
                this._playlist[_loc1_] = null;
                delete this._playlist[_loc1_];
            }
            _loc1_++;
        }
    }

    public function start(param1: uint = 0): void {
        if (param1 >= this._playlist.length) {
            param1 = this._playlist.length - 1;
        }
        this._playlistIndex = param1;
        this.playbackElement();
    }

    protected function playbackElement(): void {
        var _loc1_: ImageSlideShowElement = this.getCurrentPlaybackElement();
        this.addImageSlideShowElementEventListeners(_loc1_);
        _loc1_.play(this.shouldContinue());
        if (this.contains(_loc1_) == false) {
            addChild(_loc1_);
        }
        this._currentPlaybackElement = _loc1_;
    }

    protected function shouldContinue(): Boolean {
        if (this._playlistIndex == this._playlist.length - 1) {
            if (this._repeat) {
                return true;
            }
            return false;
        }
        return true;
    }

    protected function getCurrentPlaybackElement(): ImageSlideShowElement {
        return this._playlist[this._playlistIndex];
    }

    protected function pursuePlaylistIndex(): void {
        var _loc1_: * = this._playlistIndex;
        var _loc2_: uint = this._playlist.length - 1;
        if (this._playlistIndex == _loc2_) {
            _loc1_ = 0;
        } else {
            _loc1_++;
        }
        this._playlistIndex = _loc1_;
    }

    protected function handlePlaybackTimeCompleteEvent(param1: Event): void {
        this.pursuePlaylistIndex();
        this.playbackElement();
    }

    protected function handleElementFadedOutEvent(param1: Event): void {
        var _loc2_: ImageSlideShowElement = param1.target as ImageSlideShowElement;
        removeChild(_loc2_.target);
    }

    protected function addImageSlideShowElementEventListeners(param1: ImageSlideShowElement): void {
        param1.addEventListener(ImageSlideShowElementEvent.PLAYBACKTIME_OVER, this.handlePlaybackTimeCompleteEvent);
        param1.addEventListener(ImageSlideShowElementEvent.FADED_OUT, this.handleElementFadedOutEvent);
    }

    protected function removeImageSlideShowElementEventListeners(param1: ImageSlideShowElement): void {
        param1.removeEventListener(ImageSlideShowElementEvent.PLAYBACKTIME_OVER, this.handlePlaybackTimeCompleteEvent);
        param1.removeEventListener(ImageSlideShowElementEvent.FADED_OUT, this.handleElementFadedOutEvent);
    }

    public function set playlist(param1: Vector.<ImageSlideShowElement>): void {
        this.removeAllSlideshowElements();
        this._playlist = param1;
        invalidate(InvalidationType.POSITION);
        invalidate(InvalidationType.SIZE);
    }

    public function get playlist(): Vector.<ImageSlideShowElement> {
        return this._playlist;
    }

    public function set repeat(param1: Boolean): void {
        this._repeat = param1;
    }

    override protected function drawDebugBorder(): void {
        var _loc1_: Graphics = this.graphics;
        _loc1_.clear();
        _loc1_.lineStyle(4, 16711680, 0.4);
        _loc1_.beginFill(3355596, 0);
        _loc1_.drawRect(0, 0, getCalculatedWidth(), getCalculatedHeight());
        _loc1_.endFill();
    }
}
}
