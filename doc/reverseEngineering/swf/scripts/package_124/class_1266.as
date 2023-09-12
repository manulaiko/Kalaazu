package package_124 {

import com.hurlant.crypto.rsa.RSAKey;
import com.hurlant.math.BigInteger;

import flash.utils.ByteArray;

import net.bigpoint.darkorbit.net.class_53;

import package_37.class_170;

import package_38.class_127;
import package_38.class_700;

public class class_1266 extends class_170 {


    public function class_1266() {
        super();
    }

    public static function run(param1: class_700): void {
        var _loc3_: * = null;
        var _loc4_: * = null;
        var _loc5_: * = null;
        var _loc6_: * = null;
        var _loc7_: * = null;
        var _loc8_: * = null;
        var _loc2_: RSAKey = new RSAKey(new BigInteger("84c16e0a5860d56409207e6b542f168de24e434198e68b363dec817b77a594a17f968f177e871bfd626d139099cb3af0070cf2a03b46d1404503dc95d5a72f7c61e36b61967be50bd6bdf8d3376171b00fce65c521bc3267cdf7e6b0c3d725c9"), 65537);
        try {
            _loc3_ = new ByteArray();
            _loc2_.verify(param1.var_3379, _loc3_, param1.var_3379.length);
            _loc3_.position = 0;
            _loc4_ = new BigInteger(_loc3_);
            _loc6_ = (_loc5_ = var_574.method_6154()).method_2939();
            _loc7_ = _loc4_.modPow(_loc6_, class_127.const_1433);
            _loc8_ = new ByteArray();
            _loc7_.toByteArray().readBytes(_loc8_, 0, 16);
            _loc5_.method_1182(_loc8_);
            _loc5_.method_403();
            _loc5_.method_2171();
            _loc5_.method_1030(class_53.var_775);
            _loc5_.var_362 = true;
            _loc5_.method_4227();
        } catch (error: Error) {
        }
    }
}
}
