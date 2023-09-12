package starling.filters {

import flash.display3D.Context3D;
import flash.display3D.Context3DProgramType;
import flash.display3D.Context3DVertexBufferFormat;
import flash.display3D.IndexBuffer3D;
import flash.display3D.Program3D;
import flash.display3D.VertexBuffer3D;
import flash.errors.IllegalOperationError;
import flash.geom.Matrix;
import flash.geom.Rectangle;
import flash.system.Capabilities;
import flash.utils.getQualifiedClassName;

import starling.core.RenderSupport;
import starling.core.Starling;
import starling.core.starling_internal;
import starling.display.BlendMode;
import starling.display.DisplayObject;
import starling.display.Image;
import starling.display.QuadBatch;
import starling.display.Stage;
import starling.errors.AbstractClassError;
import starling.errors.MissingContextError;
import starling.events.Event;
import starling.textures.Texture;
import starling.utils.MatrixUtil;
import starling.utils.RectangleUtil;
import starling.utils.VertexData;
import starling.utils.getNextPowerOfTwo;

public class FragmentFilter {

    private static var sBounds: Rectangle = new Rectangle();

    private static var sBoundsPot: Rectangle = new Rectangle();

    private static var sStageBounds: Rectangle = new Rectangle();

    private static var sTransformationMatrix: Matrix = new Matrix();


    private const MIN_TEXTURE_SIZE: int = 64;

    protected const PMA: Boolean = true;

    protected const STD_VERTEX_SHADER: String = "m44 op, va0, vc0 \nmov v0, va1      \n";

    protected const STD_FRAGMENT_SHADER: String = "tex oc, v0, fs0 <2d, clamp, linear, mipnone>";

    private var mVertexPosAtID: int = 0;

    private var mTexCoordsAtID: int = 1;

    private var mBaseTextureID: int = 0;

    private var mMvpConstantID: int = 0;

    private var mNumPasses: int;

    private var mPassTextures: Vector.<Texture>;

    private var mMode: String;

    private var mResolution: Number;

    private var mMarginX: Number;

    private var mMarginY: Number;

    private var mOffsetX: Number;

    private var mOffsetY: Number;

    private var mVertexData: VertexData;

    private var mVertexBuffer: VertexBuffer3D;

    private var mIndexData: Vector.<uint>;

    private var mIndexBuffer: IndexBuffer3D;

    private var mCacheRequested: Boolean;

    private var mCache: QuadBatch;

    private var mProjMatrix: Matrix;

    public function FragmentFilter(param1: int = 1, param2: Number = 1) {
        this.mProjMatrix = new Matrix();
        super();
        if (false && getQualifiedClassName(this) == "starling.filters::FragmentFilter") {
            throw new AbstractClassError();
        }
        if (param1 < 1) {
            throw new ArgumentError("At least one pass is required.");
        }
        this.mNumPasses = param1;
        this.mMarginX = this.mMarginY = 0;
        this.mOffsetX = this.mOffsetY = 0;
        this.mResolution = param2;
        this.mMode = FragmentFilterMode.REPLACE;
        this.mVertexData = new VertexData(4);
        this.mVertexData.setTexCoords(0, 0, 0);
        this.mVertexData.setTexCoords(1, 1, 0);
        this.mVertexData.setTexCoords(2, 0, 1);
        this.mVertexData.setTexCoords(3, 1, 1);
        this.mIndexData = new <uint>[0, 1, 2, 1, 3, 2];
        this.mIndexData.fixed = true;
        this.createPrograms();
        Starling.current.stage3D.addEventListener(Event.CONTEXT3D_CREATE, this.onContextCreated, false, 0, true);
    }

    public function dispose(): void {
        Starling.current.stage3D.removeEventListener(Event.CONTEXT3D_CREATE, this.onContextCreated);
        if (this.mVertexBuffer) {
            this.mVertexBuffer.dispose();
        }
        if (this.mIndexBuffer) {
            this.mIndexBuffer.dispose();
        }
        this.disposePassTextures();
        this.disposeCache();
    }

    private function onContextCreated(param1: Object): void {
        this.mVertexBuffer = null;
        this.mIndexBuffer = null;
        this.mPassTextures = null;
        this.createPrograms();
        if (this.mCache) {
            this.cache();
        }
    }

    public function render(param1: DisplayObject, param2: RenderSupport, param3: Number): void {
        if (this.mode == FragmentFilterMode.ABOVE) {
            param1.render(param2, param3);
        }
        if (this.mCacheRequested) {
            this.mCacheRequested = false;
            this.mCache = this.renderPasses(param1, param2, 1, true);
            this.disposePassTextures();
        }
        if (this.mCache) {
            this.mCache.render(param2, param3);
        } else {
            this.renderPasses(param1, param2, param3, false);
        }
        if (this.mode == FragmentFilterMode.BELOW) {
            param1.render(param2, param3);
        }
    }

    private function renderPasses(param1: DisplayObject, param2: RenderSupport, param3: Number, param4: Boolean = false): QuadBatch {
        var _loc5_: * = null;
        var _loc12_: * = null;
        var _loc13_: * = null;
        var _loc6_: * = null;
        var _loc7_: Stage = param1.stage;
        var _loc8_: Context3D = Starling.context;
        var _loc9_: Number = Starling.current.contentScaleFactor;
        if (_loc7_ == null) {
            throw new Error("Filtered object must be on the stage.");
        }
        if (_loc8_ == null) {
            throw new MissingContextError();
        }
        this.calculateBounds(param1, _loc7_, this.mResolution * _loc9_, !param4, sBounds, sBoundsPot);
        if (sBounds.isEmpty()) {
            this.disposePassTextures();
            return param4 ? new QuadBatch() : null;
        }
        this.updateBuffers(_loc8_, sBoundsPot);
        this.updatePassTextures(sBoundsPot.width, sBoundsPot.height, this.mResolution * _loc9_);
        param2.finishQuadBatch();
        param2.raiseDrawCount(this.mNumPasses);
        param2.pushMatrix();
        this.mProjMatrix.copyFrom(param2.projectionMatrix);
        var _loc10_: Texture;
        if (_loc10_ = param2.renderTarget) {
            throw new IllegalOperationError("It\'s currently not possible to stack filters! This limitation will be removed in a future Stage3D version.");
        }
        if (param4) {
            _loc6_ = Texture.empty(sBoundsPot.width, sBoundsPot.height, true, false, true, this.mResolution * _loc9_);
        }
        param2.renderTarget = this.mPassTextures[0];
        param2.clear();
        param2.blendMode = BlendMode.NORMAL;
        param2.setOrthographicProjection(sBounds.x, sBounds.y, sBoundsPot.width, sBoundsPot.height);
        param1.render(param2, param3);
        param2.finishQuadBatch();
        RenderSupport.setBlendFactors(true);
        param2.loadIdentity();
        param2.pushClipRect(sBounds);
        _loc8_.setVertexBufferAt(this.mVertexPosAtID, this.mVertexBuffer, VertexData.POSITION_OFFSET, Context3DVertexBufferFormat.FLOAT_2);
        _loc8_.setVertexBufferAt(this.mTexCoordsAtID, this.mVertexBuffer, VertexData.TEXCOORD_OFFSET, Context3DVertexBufferFormat.FLOAT_2);
        var _loc11_: int = 0;
        while (_loc11_ < this.mNumPasses) {
            if (_loc11_ < this.mNumPasses - 1) {
                param2.renderTarget = this.getPassTexture(_loc11_ + 1);
                param2.clear();
            } else if (param4) {
                param2.renderTarget = _loc6_;
                param2.clear();
            } else {
                param2.projectionMatrix = this.mProjMatrix;
                param2.renderTarget = _loc10_;
                param2.translateMatrix(this.mOffsetX, this.mOffsetY);
                param2.blendMode = param1.blendMode;
                param2.applyBlendMode(true);
            }
            _loc5_ = this.getPassTexture(_loc11_);
            _loc8_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX, this.mMvpConstantID, param2.mvpMatrix3D, true);
            _loc8_.setTextureAt(this.mBaseTextureID, _loc5_.base);
            this.activate(_loc11_, _loc8_, _loc5_);
            _loc8_.drawTriangles(this.mIndexBuffer, 0, 2);
            this.deactivate(_loc11_, _loc8_, _loc5_);
            _loc11_++;
        }
        _loc8_.setVertexBufferAt(this.mVertexPosAtID, null);
        _loc8_.setVertexBufferAt(this.mTexCoordsAtID, null);
        _loc8_.setTextureAt(this.mBaseTextureID, null);
        param2.popMatrix();
        param2.popClipRect();
        if (param4) {
            param2.renderTarget = _loc10_;
            param2.projectionMatrix.copyFrom(this.mProjMatrix);
            _loc12_ = new QuadBatch();
            _loc13_ = new Image(_loc6_);
            _loc7_.getTransformationMatrix(param1, sTransformationMatrix);
            MatrixUtil.prependTranslation(sTransformationMatrix, sBounds.x + this.mOffsetX, sBounds.y + this.mOffsetY);
            _loc12_.addImage(_loc13_, 1, sTransformationMatrix);
            return _loc12_;
        }
        return null;
    }

    private function updateBuffers(param1: Context3D, param2: Rectangle): void {
        this.mVertexData.setPosition(0, param2.x, param2.y);
        this.mVertexData.setPosition(1, param2.right, param2.y);
        this.mVertexData.setPosition(2, param2.x, param2.bottom);
        this.mVertexData.setPosition(3, param2.right, param2.bottom);
        if (this.mVertexBuffer == null) {
            this.mVertexBuffer = param1.createVertexBuffer(4, VertexData.ELEMENTS_PER_VERTEX);
            this.mIndexBuffer = param1.createIndexBuffer(6);
            this.mIndexBuffer.uploadFromVector(this.mIndexData, 0, 6);
        }
        this.mVertexBuffer.uploadFromVector(this.mVertexData.rawData, 0, 4);
    }

    private function updatePassTextures(param1: int, param2: int, param3: Number): void {
        var _loc6_: int = 0;
        var _loc7_: * = null;
        var _loc4_: int = this.mNumPasses > 1 ? 2 : 1;
        var _loc5_: Boolean;
        if (_loc5_ = this.mPassTextures == null || this.mPassTextures.length != _loc4_ || this.mPassTextures[0].width != param1 || this.mPassTextures[0].height != param2) {
            if (this.mPassTextures) {
                for each(_loc7_ in this.mPassTextures) {
                    _loc7_.dispose();
                }
                this.mPassTextures.length = _loc4_;
            } else {
                this.mPassTextures = new Vector.<Texture>(_loc4_);
            }
            _loc6_ = 0;
            while (_loc6_ < _loc4_) {
                this.mPassTextures[_loc6_] = Texture.empty(param1, param2, true, false, true, param3);
                _loc6_++;
            }
        }
    }

    private function getPassTexture(param1: int): Texture {
        return this.mPassTextures[param1 % 2];
    }

    private function calculateBounds(param1: DisplayObject, param2: Stage, param3: Number, param4: Boolean, param5: Rectangle, param6: Rectangle): void {
        var _loc7_: Number = NaN;
        var _loc8_: Number = NaN;
        var _loc9_: int = 0;
        var _loc10_: Number = NaN;
        var _loc11_: Number = NaN;
        if (param1 == param2 || param1 == Starling.current.root) {
            _loc8_ = 0;
            _loc7_ = 0;
            param5.setTo(0, 0, param2.stageWidth, param2.stageHeight);
        } else {
            _loc7_ = this.mMarginX;
            _loc8_ = this.mMarginY;
            param1.getBounds(param2, param5);
        }
        if (param4) {
            sStageBounds.setTo(0, 0, param2.stageWidth, param2.stageHeight);
            RectangleUtil.intersect(param5, sStageBounds, param5);
        }
        if (!param5.isEmpty()) {
            param5.inflate(_loc7_, _loc8_);
            _loc9_ = 64 / param3;
            _loc10_ = param5.width > _loc9_ ? param5.width : _loc9_;
            _loc11_ = param5.height > _loc9_ ? param5.height : _loc9_;
            param6.setTo(param5.x, param5.y, getNextPowerOfTwo(_loc10_ * param3) / param3, getNextPowerOfTwo(_loc11_ * param3) / param3);
        }
    }

    private function disposePassTextures(): void {
        var _loc1_: * = null;
        for each(_loc1_ in this.mPassTextures) {
            _loc1_.dispose();
        }
        this.mPassTextures = null;
    }

    private function disposeCache(): void {
        if (this.mCache) {
            if (this.mCache.texture) {
                this.mCache.texture.dispose();
            }
            this.mCache.dispose();
            this.mCache = null;
        }
    }

    protected function createPrograms(): void {
        throw new Error("Method has to be implemented in subclass!");
    }

    protected function activate(param1: int, param2: Context3D, param3: Texture): void {
        throw new Error("Method has to be implemented in subclass!");
    }

    protected function deactivate(param1: int, param2: Context3D, param3: Texture): void {
    }

    protected function assembleAgal(param1: String = null, param2: String = null): Program3D {
        if (param1 == null) {
            param1 = "tex oc, v0, fs0 <2d, clamp, linear, mipnone>";
        }
        if (param2 == null) {
            param2 = this.STD_VERTEX_SHADER;
        }
        return RenderSupport.assembleAgal(param2, param1);
    }

    public function cache(): void {
        this.mCacheRequested = true;
        this.disposeCache();
    }

    public function clearCache(): void {
        this.mCacheRequested = false;
        this.disposeCache();
    }

    starling_internal function compile(param1: DisplayObject): QuadBatch {
        var _loc2_: * = null;
        var _loc3_: * = null;
        if (this.mCache) {
            return this.mCache;
        }
        _loc3_ = param1.stage;
        if (_loc3_ == null) {
            throw new Error("Filtered object must be on the stage.");
        }
        _loc2_ = new RenderSupport();
        param1.getTransformationMatrix(_loc3_, _loc2_.modelViewMatrix);
        return this.renderPasses(param1, _loc2_, 1, true);
    }

    public function get isCached(): Boolean {
        return this.mCache != null || this.mCacheRequested;
    }

    public function get resolution(): Number {
        return this.mResolution;
    }

    public function set resolution(param1: Number): void {
        if (param1 <= 0) {
            throw new ArgumentError("Resolution must be > 0");
        }
        this.mResolution = param1;
    }

    public function get mode(): String {
        return this.mMode;
    }

    public function set mode(param1: String): void {
        this.mMode = param1;
    }

    public function get offsetX(): Number {
        return this.mOffsetX;
    }

    public function set offsetX(param1: Number): void {
        this.mOffsetX = param1;
    }

    public function get offsetY(): Number {
        return this.mOffsetY;
    }

    public function set offsetY(param1: Number): void {
        this.mOffsetY = param1;
    }

    protected function get marginX(): Number {
        return this.mMarginX;
    }

    protected function set marginX(param1: Number): void {
        this.mMarginX = param1;
    }

    protected function get marginY(): Number {
        return this.mMarginY;
    }

    protected function set marginY(param1: Number): void {
        this.mMarginY = param1;
    }

    protected function set numPasses(param1: int): void {
        this.mNumPasses = param1;
    }

    protected function get numPasses(): int {
        return this.mNumPasses;
    }

    protected final function get vertexPosAtID(): int {
        return this.mVertexPosAtID;
    }

    protected final function set vertexPosAtID(param1: int): void {
        this.mVertexPosAtID = param1;
    }

    protected final function get texCoordsAtID(): int {
        return this.mTexCoordsAtID;
    }

    protected final function set texCoordsAtID(param1: int): void {
        this.mTexCoordsAtID = param1;
    }

    protected final function get baseTextureID(): int {
        return this.mBaseTextureID;
    }

    protected final function set baseTextureID(param1: int): void {
        this.mBaseTextureID = param1;
    }

    protected final function get mvpConstantID(): int {
        return this.mMvpConstantID;
    }

    protected final function set mvpConstantID(param1: int): void {
        this.mMvpConstantID = param1;
    }
}
}
