package {

import mx.resources.ResourceBundle;

public class en_US$formatters_properties extends ResourceBundle {


    public function en_US$formatters_properties() {
        super("en_US", "formatters");
    }

    override protected function getContent(): Object {
        return {
            "defaultInvalidValueError": "Invalid value",
            "areaCodeFormat": "(###)",
            "numberFormatterPrecision": "-1",
            "rounding": "none",
            "dayNamesShort": "Sun,Mon,Tue,Wed,Thu,Fri,Sat",
            "useNegativeSignInNumber": "true",
            "currencyFormatterPrecision": "-1",
            "am": "AM",
            "useThousandsSeparator": "true",
            "areaCode": "-1",
            "zipCodeFormat": "#####",
            "validPatternChars": "+()#- .",
            "defaultInvalidFormatError": "Invalid format",
            "phoneNumberFormat": "(###) ###-####",
            "monthNamesShort": "Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec",
            "useNegativeSignInCurrency": "true",
            "pm": "PM"
        };
    }
}
}
