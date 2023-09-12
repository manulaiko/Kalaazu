package org.osmf.net.httpstreaming.f4f {

class F4FConstants {

    static const BOX_TYPE_UUID: String = "uuid";

    static const BOX_TYPE_ABST: String = "abst";

    static const BOX_TYPE_ASRT: String = "asrt";

    static const BOX_TYPE_AFRT: String = "afrt";

    static const BOX_TYPE_AFRA: String = "afra";

    static const BOX_TYPE_MDAT: String = "mdat";

    static const BOX_TYPE_MOOF: String = "moof";

    static const EXTENDED_TYPE: String = "uuid";

    static const FIELD_SIZE_LENGTH: uint = 4;

    static const FIELD_TYPE_LENGTH: uint = 4;

    static const FIELD_LARGE_SIZE_LENGTH: uint = 8;

    static const FIELD_EXTENDED_TYPE_LENGTH: uint = 16;

    static const FLAG_USE_LARGE_SIZE: uint = 1;


    function F4FConstants() {
        super();
    }
}
}
