package spark.globalization {

import flash.globalization.CollatorMode;

import mx.core.mx_internal;

import spark.globalization.supportClasses.CollatorBase;

public class SortingCollator extends CollatorBase {

    mx_internal static const VERSION: String = "4.6.0.23201";


    public function SortingCollator() {
        super(CollatorMode.SORTING);
    }
}
}
