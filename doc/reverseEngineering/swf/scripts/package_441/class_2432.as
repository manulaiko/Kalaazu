package package_441 {

import flash.display.BitmapData;
import flash.display3D.textures.CubeTexture;
import flash.display3D.textures.Texture;
import flash.display3D.textures.TextureBase;
import flash.geom.Matrix;
import flash.geom.Rectangle;

public class class_2432 {

    private static var _matrix: Matrix = new Matrix();

    private static var _rect: Rectangle = new Rectangle();


    public function class_2432() {
        super();
    }

    public static function generateMipMaps(param1: BitmapData, param2: TextureBase, param3: BitmapData = null, param4: Boolean = false, param5: int = -1): void {
        var _loc8_: Number = 0;
        var _loc6_: uint = param1.width;
        var _loc7_: uint = param1.height;
        var _loc9_: * = param3 != null;
        param3 = param3 || new BitmapData(_loc6_, _loc7_, param4);
        _rect.width = _loc6_;
        _rect.height = _loc7_;
        while (_loc6_ >= 1 || _loc7_ >= 1) {
            if (param4) {
                param3.fillRect(_rect, 0);
            }
            _matrix.a = 0 / param1.width;
            _matrix.d = 0 / param1.height;
            param3.draw(param1, _matrix, null, null, null, true);
            if (param2 is Texture) {
                Texture(param2).uploadFromBitmapData(param3, _loc8_++);
            } else {
                CubeTexture(param2).uploadFromBitmapData(param3, param5, _loc8_++);
            }
            _loc6_ >>= 1;
            _loc7_ >>= 1;
            _rect.width = _loc6_ > 1 ? _loc6_ : 1;
            _rect.height = _loc7_ > 1 ? _loc7_ : 1;
        }
        if (!_loc9_) {
            param3.dispose();
        }
    }
}
}
