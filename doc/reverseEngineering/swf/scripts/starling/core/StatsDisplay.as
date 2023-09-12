package starling.core {

import flash.system.System;

import starling.display.BlendMode;
import starling.display.Quad;
import starling.display.Sprite;
import starling.events.EnterFrameEvent;
import starling.events.Event;
import starling.text.BitmapFont;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

class StatsDisplay extends Sprite {


    private const UPDATE_INTERVAL: Number = 0.5;

    private var mBackground: Quad;

    private var mTextField: TextField;

    private var mFrameCount: int = 0;

    private var mTotalTime: Number = 0;

    private var mFps: Number = 0;

    private var mMemory: Number = 0;

    private var mDrawCount: int = 0;

    function StatsDisplay() {
        super();
        this.mBackground = new Quad(50, 25, 0);
        this.mTextField = new TextField(48, 25, "", BitmapFont.MINI, BitmapFont.NATIVE_SIZE, 16777215);
        this.mTextField.x = 2;
        this.mTextField.hAlign = HAlign.LEFT;
        this.mTextField.vAlign = VAlign.TOP;
        addChild(this.mBackground);
        addChild(this.mTextField);
        blendMode = BlendMode.NONE;
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }

    private function onAddedToStage(): void {
        addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
        this.mFrameCount = 0;
        this.mTotalTime = 0;
        this.update();
    }

    private function onRemovedFromStage(): void {
        removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function onEnterFrame(param1: EnterFrameEvent): void {
        this.mTotalTime += param1.passedTime;
        ++this.mFrameCount;
        if (this.mTotalTime > 0.5) {
            this.update();
            this.mFrameCount = this.mTotalTime = 0;
        }
    }

    public function update(): void {
        this.mFps = this.mTotalTime > 0 ? this.mFrameCount / this.mTotalTime : 0;
        this.mMemory = 0;
        this.mTextField.text = "FPS: " + this.mFps.toFixed(this.mFps < 100 ? 1 : 0) + "\nMEM: " + this.mMemory.toFixed(this.mMemory < 100 ? 1 : 0) + "\nDRW: " + (this.mTotalTime > 0 ? this.mDrawCount - 2 : this.mDrawCount);
    }

    override public function render(param1: RenderSupport, param2: Number): void {
        param1.finishQuadBatch();
        super.render(param1, param2);
    }

    public function get drawCount(): int {
        return this.mDrawCount;
    }

    public function set drawCount(param1: int): void {
        this.mDrawCount = param1;
    }

    public function get fps(): Number {
        return this.mFps;
    }

    public function set fps(param1: Number): void {
        this.mFps = param1;
    }

    public function get memory(): Number {
        return this.mMemory;
    }

    public function set memory(param1: Number): void {
        this.mMemory = param1;
    }
}
}
