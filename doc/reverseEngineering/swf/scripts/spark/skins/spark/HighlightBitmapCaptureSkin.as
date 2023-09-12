package spark.skins.spark {

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.IBitmapDrawable;
import flash.events.Event;
import flash.geom.ColorTransform;
import flash.geom.Matrix;
import flash.geom.Matrix3D;
import flash.geom.Rectangle;

import mx.core.UIComponent;
import mx.core.mx_internal;
import mx.events.FlexEvent;

import spark.components.supportClasses.SkinnableComponent;
import spark.skins.IHighlightBitmapCaptureClient;

public class HighlightBitmapCaptureSkin extends UIComponent {

    mx_internal static const VERSION: String = "4.6.0.23201";

    private static var capturingBitmap: Boolean = false;

    private static var colorTransform: ColorTransform = new ColorTransform(1.01, 1.01, 1.01, 2);

    private static var rect: Rectangle = new Rectangle();


    protected var bitmap: Bitmap;

    private var _target: SkinnableComponent;

    public function HighlightBitmapCaptureSkin() {
        super();
    }

    public function get target(): SkinnableComponent {
        return this._target;
    }

    public function set target(param1: SkinnableComponent): void {
        this._target = param1;
        if (this._target.skin) {
            this._target.skin.addEventListener(FlexEvent.UPDATE_COMPLETE, this.skin_updateCompleteHandler, false, 0, true);
        }
    }

    protected function get borderWeight(): Number {
        return 1;
    }

    override protected function updateDisplayList(param1: Number, param2: Number): void {
        var m: Matrix;
        var transform3D: Matrix3D;
        var bitmapCaptureClient: IHighlightBitmapCaptureClient;
        var var_499: BitmapData = null;
        var needUpdate: Boolean = false;
        var fillRect: Rectangle = null;
        var skin: DisplayObject = null;
        var unscaledWidth: Number = param1;
        var unscaledHeight: Number = param2;
        if (!this.target) {
            return;
        }
        var_499 = new BitmapData(this.target.width + this.borderWeight * 2, this.target.height + this.borderWeight * 2, true, 0);
        m = new Matrix();
        capturingBitmap = true;
        transform3D = null;
        if (this.target.mx_internal::$transform.matrix3D) {
            transform3D = this.target.mx_internal::$transform.matrix3D;
            this.target.mx_internal::$transform.matrix3D = null;
        }
        if (this.target.mx_internal::focusObj) {
            this.target.mx_internal::focusObj.visible = false;
        }
        bitmapCaptureClient = this.target.skin as IHighlightBitmapCaptureClient;
        if (bitmapCaptureClient) {
            needUpdate = bitmapCaptureClient.beginHighlightBitmapCapture();
            if (needUpdate) {
                bitmapCaptureClient.validateNow();
            }
        }
        m.tx = this.borderWeight;
        m.ty = this.borderWeight;
        try {
            var_499.draw(this.target as IBitmapDrawable, m);
        } catch (e: SecurityError) {
            skin = target.skin;
            if (skin) {
                fillRect = new Rectangle(skin.x, skin.y, skin.width, skin.height);
            } else {
                fillRect = new Rectangle(target.x, target.y, target.width, target.height);
            }
            var_499.fillRect(fillRect, 0);
        }
        if (bitmapCaptureClient) {
            needUpdate = bitmapCaptureClient.endHighlightBitmapCapture();
            if (needUpdate) {
                bitmapCaptureClient.validateNow();
            }
        }
        if (this.target.mx_internal::focusObj) {
            this.target.mx_internal::focusObj.visible = true;
        }
        rect.x = rect.y = this.borderWeight;
        rect.width = this.target.width;
        rect.height = this.target.height;
        var_499.colorTransform(rect, colorTransform);
        if (!this.bitmap) {
            this.bitmap = new Bitmap();
            addChild(this.bitmap);
        }
        var _loc4_: * = -this.borderWeight;
        this.bitmap.y = -this.borderWeight;
        this.bitmap.x = _loc4_;
        this.bitmap.bitmapData = var_499;
        this.processBitmap();
        if (transform3D) {
            this.target.mx_internal::$transform.matrix3D = transform3D;
        }
        capturingBitmap = false;
    }

    protected function processBitmap(): void {
    }

    private function skin_updateCompleteHandler(param1: Event): void {
        if (!capturingBitmap) {
            invalidateDisplayList();
        }
    }
}
}
