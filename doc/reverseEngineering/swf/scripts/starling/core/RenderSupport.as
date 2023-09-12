package starling.core {

import com.adobe.utils.AGALMiniAssembler;

import flash.display3D.Context3D;
import flash.display3D.Context3DProgramType;
import flash.display3D.Context3DTextureFormat;
import flash.display3D.Program3D;
import flash.geom.Matrix;
import flash.geom.Matrix3D;
import flash.geom.Point;
import flash.geom.Rectangle;

import starling.display.BlendMode;
import starling.display.DisplayObject;
import starling.display.Quad;
import starling.display.QuadBatch;
import starling.errors.MissingContextError;
import starling.textures.Texture;
import starling.textures.TextureSmoothing;
import starling.utils.Color;
import starling.utils.MatrixUtil;
import starling.utils.RectangleUtil;

public class RenderSupport {

    private static var sPoint: Point = new Point();

    private static var sClipRect: Rectangle = new Rectangle();

    private static var sBufferRect: Rectangle = new Rectangle();

    private static var sScissorRect: Rectangle = new Rectangle();

    private static var sAssembler: AGALMiniAssembler = new AGALMiniAssembler();


    private var mProjectionMatrix: Matrix;

    private var mModelViewMatrix: Matrix;

    private var mMvpMatrix: Matrix;

    private var mMvpMatrix3D: Matrix3D;

    private var mMatrixStack: Vector.<Matrix>;

    private var mMatrixStackSize: int;

    private var mDrawCount: int;

    private var mBlendMode: String;

    private var mRenderTarget: Texture;

    private var mClipRectStack: Vector.<Rectangle>;

    private var mClipRectStackSize: int;

    private var mQuadBatches: Vector.<QuadBatch>;

    private var mCurrentQuadBatchID: int;

    public function RenderSupport() {
        super();
        this.mProjectionMatrix = new Matrix();
        this.mModelViewMatrix = new Matrix();
        this.mMvpMatrix = new Matrix();
        this.mMvpMatrix3D = new Matrix3D();
        this.mMatrixStack = new Vector.<Matrix>(0);
        this.mMatrixStackSize = 0;
        this.mDrawCount = 0;
        this.mRenderTarget = null;
        this.mBlendMode = BlendMode.NORMAL;
        this.mClipRectStack = new Vector.<Rectangle>(0);
        this.mCurrentQuadBatchID = 0;
        this.mQuadBatches = new <QuadBatch>[new QuadBatch()];
        this.loadIdentity();
        this.setOrthographicProjection(0, 0, 400, 300);
    }

    public static function transformMatrixForObject(param1: Matrix, param2: DisplayObject): void {
        MatrixUtil.prependMatrix(param1, param2.transformationMatrix);
    }

    public static function setDefaultBlendFactors(param1: Boolean): void {
        setBlendFactors(param1);
    }

    public static function setBlendFactors(param1: Boolean, param2: String = "normal"): void {
        var _loc3_: Array = BlendMode.getBlendFactors(param2, param1);
        Starling.context.setBlendFactors(_loc3_[0], _loc3_[1]);
    }

    public static function clear(param1: uint = 0, param2: Number = 0): void {
        Starling.context.clear(Color.getRed(param1) / 255, Color.getGreen(param1) / 255, Color.getBlue(param1) / 255, param2);
    }

    public static function assembleAgal(param1: String, param2: String, param3: Program3D = null): Program3D {
        var _loc4_: * = null;
        if (param3 == null) {
            if ((_loc4_ = Starling.context) == null) {
                throw new MissingContextError();
            }
            param3 = _loc4_.createProgram();
        }
        param3.upload(sAssembler.assemble(Context3DProgramType.VERTEX, param1), sAssembler.assemble(Context3DProgramType.FRAGMENT, param2));
        return param3;
    }

    public static function getTextureLookupFlags(param1: String, param2: Boolean, param3: Boolean = false, param4: String = "bilinear"): String {
        var _loc5_: Array = ["2d", param3 ? "repeat" : "clamp"];
        if (param1 == Context3DTextureFormat.COMPRESSED) {
            _loc5_.push("dxt1");
        } else if (param1 == "compressedAlpha") {
            _loc5_.push("dxt5");
        }
        if (param4 == TextureSmoothing.NONE) {
            _loc5_.push("nearest", param2 ? "mipnearest" : "mipnone");
        } else if (param4 == TextureSmoothing.BILINEAR) {
            _loc5_.push("linear", param2 ? "mipnearest" : "mipnone");
        } else {
            _loc5_.push("linear", param2 ? "miplinear" : "mipnone");
        }
        return "<" + _loc5_.join() + ">";
    }

    public function dispose(): void {
        var _loc1_: * = null;
        for each(_loc1_ in this.mQuadBatches) {
            _loc1_.dispose();
        }
    }

    public function setOrthographicProjection(param1: Number, param2: Number, param3: Number, param4: Number): void {
        this.mProjectionMatrix.setTo(2 / param3, 0, 0, -2 / param4, -(2 * param1 + param3) / param3, (2 * param2 + param4) / param4);
        this.applyClipRect();
    }

    public function loadIdentity(): void {
        this.mModelViewMatrix.identity();
    }

    public function translateMatrix(param1: Number, param2: Number): void {
        MatrixUtil.prependTranslation(this.mModelViewMatrix, param1, param2);
    }

    public function rotateMatrix(param1: Number): void {
        MatrixUtil.prependRotation(this.mModelViewMatrix, param1);
    }

    public function scaleMatrix(param1: Number, param2: Number): void {
        MatrixUtil.prependScale(this.mModelViewMatrix, param1, param2);
    }

    public function prependMatrix(param1: Matrix): void {
        MatrixUtil.prependMatrix(this.mModelViewMatrix, param1);
    }

    public function transformMatrix(param1: DisplayObject): void {
        MatrixUtil.prependMatrix(this.mModelViewMatrix, param1.transformationMatrix);
    }

    public function pushMatrix(): void {
        if (this.mMatrixStack.length < this.mMatrixStackSize + 1) {
            this.mMatrixStack.push(new Matrix());
        }
        this.mMatrixStack[int(this.mMatrixStackSize++)].copyFrom(this.mModelViewMatrix);
    }

    public function popMatrix(): void {
        this.mModelViewMatrix.copyFrom(this.mMatrixStack[int(--this.mMatrixStackSize)]);
    }

    public function resetMatrix(): void {
        this.mMatrixStackSize = 0;
        this.loadIdentity();
    }

    public function get mvpMatrix(): Matrix {
        this.mMvpMatrix.copyFrom(this.mModelViewMatrix);
        this.mMvpMatrix.concat(this.mProjectionMatrix);
        return this.mMvpMatrix;
    }

    public function get mvpMatrix3D(): Matrix3D {
        return MatrixUtil.convertTo3D(this.mvpMatrix, this.mMvpMatrix3D);
    }

    public function get modelViewMatrix(): Matrix {
        return this.mModelViewMatrix;
    }

    public function get projectionMatrix(): Matrix {
        return this.mProjectionMatrix;
    }

    public function set projectionMatrix(param1: Matrix): void {
        this.mProjectionMatrix.copyFrom(param1);
        this.applyClipRect();
    }

    public function applyBlendMode(param1: Boolean): void {
        setBlendFactors(param1, this.mBlendMode);
    }

    public function get blendMode(): String {
        return this.mBlendMode;
    }

    public function set blendMode(param1: String): void {
        if (param1 != BlendMode.AUTO) {
            this.mBlendMode = param1;
        }
    }

    public function get renderTarget(): Texture {
        return this.mRenderTarget;
    }

    public function set renderTarget(param1: Texture): void {
        this.setRenderTarget(param1);
    }

    public function setRenderTarget(param1: Texture, param2: int = 0): void {
        this.mRenderTarget = param1;
        this.applyClipRect();
        if (param1) {
            Starling.context.setRenderToTexture(param1.base, false, param2);
        } else {
            Starling.context.setRenderToBackBuffer();
        }
    }

    public function pushClipRect(param1: Rectangle): Rectangle {
        if (this.mClipRectStack.length < this.mClipRectStackSize + 1) {
            this.mClipRectStack.push(new Rectangle());
        }
        this.mClipRectStack[this.mClipRectStackSize].copyFrom(param1);
        param1 = this.mClipRectStack[this.mClipRectStackSize];
        if (this.mClipRectStackSize > 0) {
            RectangleUtil.intersect(param1, this.mClipRectStack[this.mClipRectStackSize - 1], param1);
        }
        ++this.mClipRectStackSize;
        this.applyClipRect();
        return param1;
    }

    public function popClipRect(): void {
        if (this.mClipRectStackSize > 0) {
            --this.mClipRectStackSize;
            this.applyClipRect();
        }
    }

    public function applyClipRect(): void {
        var _loc2_: int = 0;
        var _loc3_: int = 0;
        var _loc4_: * = null;
        this.finishQuadBatch();
        var _loc1_: Context3D = Starling.context;
        if (_loc1_ == null) {
            return;
        }
        if (this.mClipRectStackSize > 0) {
            _loc4_ = this.mClipRectStack[this.mClipRectStackSize - 1];
            if (this.mRenderTarget) {
                _loc2_ = this.mRenderTarget.root.nativeWidth;
                _loc3_ = this.mRenderTarget.root.nativeHeight;
            } else {
                _loc2_ = Starling.current.backBufferWidth;
                _loc3_ = Starling.current.backBufferHeight;
            }
            MatrixUtil.transformCoords(this.mProjectionMatrix, _loc4_.x, _loc4_.y, sPoint);
            sClipRect.x = 0.5 * _loc2_;
            sClipRect.y = 0.5 * _loc3_;
            MatrixUtil.transformCoords(this.mProjectionMatrix, _loc4_.right, _loc4_.bottom, sPoint);
            sClipRect.right = 0.5 * _loc2_;
            sClipRect.bottom = 0.5 * _loc3_;
            sBufferRect.setTo(0, 0, _loc2_, _loc3_);
            RectangleUtil.intersect(sClipRect, sBufferRect, sScissorRect);
            if (true || true) {
                sScissorRect.setTo(0, 0, 1, 1);
            }
            _loc1_.setScissorRectangle(sScissorRect);
        } else {
            _loc1_.setScissorRectangle(null);
        }
    }

    public function batchQuad(param1: Quad, param2: Number, param3: Texture = null, param4: String = null): void {
        if (this.mQuadBatches[this.mCurrentQuadBatchID].isStateChange(param1.tinted, param2, param3, param4, this.mBlendMode)) {
            this.finishQuadBatch();
        }
        this.mQuadBatches[this.mCurrentQuadBatchID].addQuad(param1, param2, param3, param4, this.mModelViewMatrix, this.mBlendMode);
    }

    public function batchQuadBatch(param1: QuadBatch, param2: Number): void {
        if (this.mQuadBatches[this.mCurrentQuadBatchID].isStateChange(param1.tinted, param2, param1.texture, param1.smoothing, this.mBlendMode)) {
            this.finishQuadBatch();
        }
        this.mQuadBatches[this.mCurrentQuadBatchID].addQuadBatch(param1, param2, this.mModelViewMatrix, this.mBlendMode);
    }

    public function finishQuadBatch(): void {
        var _loc1_: QuadBatch = this.mQuadBatches[this.mCurrentQuadBatchID];
        if (_loc1_.numQuads != 0) {
            _loc1_.renderCustom(this.mProjectionMatrix);
            _loc1_.reset();
            ++this.mCurrentQuadBatchID;
            ++this.mDrawCount;
            if (this.mQuadBatches.length <= this.mCurrentQuadBatchID) {
                this.mQuadBatches.push(new QuadBatch());
            }
        }
    }

    public function nextFrame(): void {
        this.resetMatrix();
        this.trimQuadBatches();
        this.mCurrentQuadBatchID = 0;
        this.mBlendMode = BlendMode.NORMAL;
        this.mDrawCount = 0;
    }

    private function trimQuadBatches(): void {
        var _loc3_: int = 0;
        var _loc4_: int = 0;
        var _loc1_: int = this.mCurrentQuadBatchID + 1;
        var _loc2_: int = this.mQuadBatches.length;
        if (_loc2_ >= 16 && _loc2_ > 2 * _loc1_) {
            _loc3_ = _loc2_ - _loc1_;
            _loc4_ = 0;
            while (_loc4_ < _loc3_) {
                this.mQuadBatches.pop().dispose();
                _loc4_++;
            }
        }
    }

    public function clear(param1: uint = 0, param2: Number = 0): void {
        RenderSupport.clear(param1, param2);
    }

    public function raiseDrawCount(param1: uint = 1): void {
        this.mDrawCount += param1;
    }

    public function get drawCount(): int {
        return this.mDrawCount;
    }
}
}
