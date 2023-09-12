package package_302 {

import flash.display.BlendMode;

import package_307.class_1772;

import package_308.class_1773;

import package_369.class_2116;

public class POIZoneMaterial extends class_1772 implements class_1773 {


    private var var_686: POIZoneMaterialPass;

    public function POIZoneMaterial(param1: class_2116) {
        super();
        this.var_686 = new POIZoneMaterialPass();
        method_5388(this.var_686);
        this.texture = param1;
    }

    override public function set blendMode(param1: String): void {
        super.blendMode = param1;
        this.var_686.method_4125(blendMode == BlendMode.NORMAL && Boolean(this.method_4490) ? "null" : blendMode);
    }

    override public function get method_4490(): Boolean {
        return true;
    }

    public function get texture(): class_2116 {
        return this.var_686.diffuse;
    }

    public function set texture(param1: class_2116): void {
        this.var_686.diffuse = param1;
    }

    public function set scaling(param1: Number): void {
        this.var_686.scaling = param1;
    }

    public function set offsetX(param1: Number): void {
        this.var_686.offsetX = param1;
    }

    public function set movingSpeedX(param1: Number): void {
        this.var_686.movingSpeedX = param1;
    }

    public function set movingSpeedY(param1: Number): void {
        this.var_686.movingSpeedY = param1;
    }

    public function set rotationSpeed(param1: Number): void {
        this.var_686.rotationSpeed = param1;
    }

    public function set pulseSpeed(param1: Number): void {
        this.var_686.pulseSpeed = param1;
    }
}
}

import away3d.arcane;

import flash.display3D.Context3D;
import flash.display3D.Context3DBlendFactor;
import flash.display3D.Context3DCompareMode;
import flash.display3D.Context3DProgramType;
import flash.geom.Matrix3D;
import flash.geom.Vector3D;
import flash.utils.getTimer;

import package_198.class_1208;

import package_294.class_2133;

import package_305.class_1767;

import package_309.class_1774;

import package_369.class_2116;

class POIZoneMaterialPass extends class_1774 {


    private var _matrix: Matrix3D;

    private var _rotationMatrix: Matrix3D;

    private var _texture: class_2116;

    private var _scaling: Number = 0.002;

    private var _offsetX: Number = 0;

    private var _offsetY: Number = 0;

    private var _movingSpeedX: Number = 0;

    private var _movingSpeedY: Number = 0;

    private var _rotationSpeed: Number = 3;

    private var _vertexData: Vector.<Number>;

    private var _fragmentData: Vector.<Number>;

    private var _delta: Number = 0;

    private var _pulseTimer: Number = 0;

    private var _pulseSpeed: Number = 0;

    private var _startTime: Number = 0;

    function POIZoneMaterialPass() {
        this._matrix = new Matrix3D();
        this._rotationMatrix = new Matrix3D();
        super();
        this._vertexData = new Vector.<Number>(4);
        this._fragmentData = new Vector.<Number>(4);
        this._fragmentData[0] = 1;
        this._startTime = getTimer();
    }

    public function get diffuse(): class_2116 {
        return this._texture;
    }

    public function set diffuse(param1: class_2116): void {
        if (Boolean(param1) != Boolean(this._texture) || param1 && this._texture && (param1.method_5818 != this._texture.method_5818 || param1.format != this._texture.format)) {
            arcane::method_220();
        }
        this._texture = param1;
    }

    override arcane function getVertexCode(): String {
        var _loc1_: String = "";
        return _loc1_ + "m44 op, va0, vc0\nm44 vt0, va0, vc4\nmul vt0, vt0, vc12.xxxx\nadd vt1, vt0, vc12.yzzz\nm44 v0, vt1, vc8\n";
    }

    override arcane function getFragmentCode(param1: String): String {
        var _loc2_: * = "";
        _loc2_ += "mov ft0, v0.xzzz\n";
        _loc2_ += "tex ft1, ft0, fs0 <2d, linear, repeat>\n";
        _loc2_ += "mul ft1.xyz, ft1.xyz, fc0.x\n";
        return _loc2_ + "mov oc, ft1\n";
    }

    override arcane function activate(param1: class_1208, param2: class_1767): void {
        super.arcane::activate(param1, param2);
        param1.arcane::var_4582.setBlendFactors(Context3DBlendFactor.ONE, Context3DBlendFactor.ONE_MINUS_SOURCE_ALPHA);
        param1.arcane::var_4582.setDepthTest(false, Context3DCompareMode.LESS_EQUAL);
        param1.arcane::var_4582.setTextureAt(0, this._texture.method_6425(param1));
    }

    override arcane function render(param1: class_2133, param2: class_1208, param3: class_1767, param4: Matrix3D): void {
        var _loc5_: Context3D = param2.arcane::var_4582;
        var _loc6_: Number = getTimer();
        this._delta = (_loc6_ - Number(this._startTime)) * 0.001;
        if (this._pulseSpeed > 0) {
            this._pulseTimer += Number(this._delta) * Number(this._pulseSpeed);
            if (this._pulseTimer >= 0) {
                this._pulseTimer = 0;
            }
            this._fragmentData[0] = Math.min(1, 1 + Math.sin(this._pulseTimer) * 0.5);
        }
        this._vertexData[0] = 1 / Number(this._scaling);
        this._vertexData[1] = this._offsetX;
        this._vertexData[2] = this._offsetY;
        this._offsetX += Number(this._delta) * Number(this._movingSpeedX);
        this._offsetY += Number(this._delta) * Number(this._movingSpeedY);
        this._rotationMatrix.appendRotation(Number(this._delta) * Number(this._rotationSpeed), Vector3D.Y_AXIS, param1.sceneTransform.position);
        this._startTime = getTimer();
        this._matrix.copyFrom(param1.sceneTransform);
        this._matrix.append(param3.method_2785);
        _loc5_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX, 0, this._matrix, true);
        _loc5_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX, 4, param1.sceneTransform, true);
        _loc5_.setProgramConstantsFromMatrix(Context3DProgramType.VERTEX, 8, this._rotationMatrix, true);
        _loc5_.setProgramConstantsFromVector(Context3DProgramType.VERTEX, 12, this._vertexData);
        _loc5_.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT, 0, this._fragmentData);
        param1.method_748(0, param2);
        _loc5_.drawTriangles(param1.method_612(param2), 0, param1.name_42);
    }

    override arcane function deactivate(param1: class_1208): void {
        super.arcane::deactivate(param1);
        var _loc2_: Context3D = param1.arcane::var_4582;
        _loc2_.setTextureAt(0, null);
        _loc2_.setVertexBufferAt(1, null);
        _loc2_.setDepthTest(true, Context3DCompareMode.LESS_EQUAL);
        _loc2_.setBlendFactors(Context3DBlendFactor.ONE, Context3DBlendFactor.ZERO);
    }

    public function set scaling(param1: Number): void {
        this._scaling = param1;
    }

    public function set offsetX(param1: Number): void {
        this._offsetX = param1;
    }

    public function set offsetY(param1: Number): void {
        this._offsetY = param1;
    }

    public function set movingSpeedX(param1: Number): void {
        this._movingSpeedX = param1;
    }

    public function set movingSpeedY(param1: Number): void {
        this._movingSpeedY = param1;
    }

    public function set rotationSpeed(param1: Number): void {
        this._rotationSpeed = param1;
    }

    public function set pulseSpeed(param1: Number): void {
        this._pulseSpeed = param1;
    }
}
