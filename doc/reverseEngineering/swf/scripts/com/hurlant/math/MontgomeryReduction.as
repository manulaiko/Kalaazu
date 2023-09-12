package com.hurlant.math {

class MontgomeryReduction implements IReduction {


    private var um: int;

    private var mp: int;

    private var mph: int;

    private var mpl: int;

    private var mt2: int;

    private var m: BigInteger;

    function MontgomeryReduction(param1: BigInteger) {
        super();
        this.m = param1;
        mp = param1.bi_internal::invDigit();
        mpl = mp & 32767;
        mph = mp >> 15;
        um = 131071;
        mt2 = 2 * param1.t;
    }

    public function mulTo(param1: BigInteger, param2: BigInteger, param3: BigInteger): void {
        param1.bi_internal::multiplyTo(param2, param3);
        reduce(param3);
    }

    public function revert(param1: BigInteger): BigInteger {
        var _loc2_: * = null;
        _loc2_ = new BigInteger();
        param1.bi_internal::copyTo(_loc2_);
        reduce(_loc2_);
        return _loc2_;
    }

    public function convert(param1: BigInteger): BigInteger {
        var _loc2_: * = null;
        _loc2_ = new BigInteger();
        param1.abs().bi_internal::dlShiftTo(m.t, _loc2_);
        _loc2_.bi_internal::divRemTo(m, null, _loc2_);
        if (param1.bi_internal::s < 0 && _loc2_.compareTo(BigInteger.ZERO) > 0) {
            m.bi_internal::subTo(_loc2_, _loc2_);
        }
        return _loc2_;
    }

    public function reduce(param1: BigInteger): void {
        /*
         * Error de decompilación
         * El código puede estar ofuscado
         * La desofuscación está activada pero la decompilación aún falla. Si el archivo NO está ofuscado, desactive "Desofuscación automática" para obtener mejores resultados.
         * Tipo de error: NullPointerException (null)
         */
        throw new flash.errors.IllegalOperationError("No decompilado debido a un error");
    }

    public function sqrTo(param1: BigInteger, param2: BigInteger): void {
        param1.bi_internal::squareTo(param2);
        reduce(param2);
    }
}
}
