package package_369 {

import flash.display.BitmapData;
import flash.display3D.Context3D;
import flash.display3D.Context3DTextureFormat;
import flash.display3D.textures.TextureBase;

import package_434.class_2413;

import package_441.class_2432;

public class class_2572 extends class_2116 {


    public function class_2572(param1: Number, param2: Number) {
        super();
        setSize(param1, param2);
    }

    public function set width(param1: int): void {
        if (param1 == _width) {
            return;
        }
        if (!class_2413.method_5589(param1)) {
            throw new Error("Invalid size: Width and height must be power of 2 and cannot exceed 2048");
        }
        method_1112();
        setSize(param1, _height);
    }

    public function set height(param1: int): void {
        if (param1 == _height) {
            return;
        }
        if (!class_2413.method_5589(param1)) {
            throw new Error("Invalid size: Width and height must be power of 2 and cannot exceed 2048");
        }
        method_1112();
        setSize(_width, param1);
    }

    override protected function method_24(param1: TextureBase): void {
        var _loc2_: BitmapData = new BitmapData(width, height, false, 16711680);
        class_2432.generateMipMaps(_loc2_, param1);
        _loc2_.dispose();
    }

    override protected function createTexture(param1: Context3D): TextureBase {
        return param1.createTexture(width, height, Context3DTextureFormat.BGRA, true);
    }
}
}
