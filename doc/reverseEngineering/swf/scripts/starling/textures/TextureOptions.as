package starling.textures {

import starling.core.Starling;

public class TextureOptions {


    private var mScale: Number;

    private var mFormat: String;

    private var mMipMapping: Boolean;

    private var mOptimizeForRenderToTexture: Boolean = false;

    private var mOnReady: Function = null;

    private var mRepeat: Boolean = false;

    public function TextureOptions(param1: Number = 1, param2: Boolean = false, param3: String = "bgra", param4: Boolean = false) {
        super();
        this.mScale = param1;
        this.mFormat = param3;
        this.mMipMapping = param2;
        this.mRepeat = param4;
    }

    public function clone(): TextureOptions {
        var _loc1_: TextureOptions = new TextureOptions(this.mScale, this.mMipMapping, this.mFormat, this.mRepeat);
        _loc1_.mOptimizeForRenderToTexture = this.mOptimizeForRenderToTexture;
        _loc1_.mOnReady = this.mOnReady;
        return _loc1_;
    }

    public function get scale(): Number {
        return this.mScale;
    }

    public function set scale(param1: Number): void {
        this.mScale = param1 > 0 ? param1 : Starling.contentScaleFactor;
    }

    public function get format(): String {
        return this.mFormat;
    }

    public function set format(param1: String): void {
        this.mFormat = param1;
    }

    public function get mipMapping(): Boolean {
        return this.mMipMapping;
    }

    public function set mipMapping(param1: Boolean): void {
        this.mMipMapping = param1;
    }

    public function get optimizeForRenderToTexture(): Boolean {
        return this.mOptimizeForRenderToTexture;
    }

    public function set optimizeForRenderToTexture(param1: Boolean): void {
        this.mOptimizeForRenderToTexture = param1;
    }

    public function get repeat(): Boolean {
        return this.mRepeat;
    }

    public function set repeat(param1: Boolean): void {
        this.mRepeat = param1;
    }

    public function get onReady(): Function {
        return this.mOnReady;
    }

    public function set onReady(param1: Function): void {
        this.mOnReady = param1;
    }
}
}
