package package_369 {

import flash.display.BitmapData;
import flash.display3D.Context3D;
import flash.display3D.Context3DTextureFormat;
import flash.display3D.textures.TextureBase;

import package_434.class_2413;

import package_441.class_2432;

public class class_2574 extends class_2570 {


    public function class_2574(param1: Number) {
        super();
        setSize(param1, param1);
    }

    public function set size(param1: int): void {
        if (param1 == _width) {
            return;
        }
        if (!class_2413.method_5589(param1)) {
            throw new Error("Invalid size: Width and height must be power of 2 and cannot exceed 2048");
        }
        method_1112();
        setSize(param1, param1);
    }

    override protected function method_24(param1: TextureBase): void {
        var _loc2_: BitmapData = new BitmapData(_width, _height, false, 0);
        var _loc3_: int = 0;
        while (_loc3_ < 6) {
            class_2432.generateMipMaps(_loc2_, param1, null, false, _loc3_);
            _loc3_++;
        }
        _loc2_.dispose();
    }

    override protected function createTexture(param1: Context3D): TextureBase {
        return param1.createCubeTexture(_width, Context3DTextureFormat.BGRA, true);
    }
}
}
