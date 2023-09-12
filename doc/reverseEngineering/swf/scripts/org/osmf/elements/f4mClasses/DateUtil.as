package org.osmf.elements.f4mClasses {

class DateUtil {


    function DateUtil() {
        super();
    }

    public static function parseW3CDTF(param1: String): Date {
        var finalDate: Date = null;
        var dateStr: String = null;
        var timeStr: String = null;
        var dateArr: Array = null;
        var year: Number = NaN;
        var month: Number = NaN;
        var date: Number = NaN;
        var multiplier: Number = NaN;
        var offsetHours: Number = NaN;
        var offsetMinutes: Number = NaN;
        var offsetStr: String = null;
        var timeArr: Array = null;
        var hour: Number = NaN;
        var minutes: Number = NaN;
        var secondsArr: Array = null;
        var seconds: Number = NaN;
        var milliseconds: Number = NaN;
        var utc: Number = NaN;
        var offset: Number = NaN;
        var eStr: String = null;
        var str: String = param1;
        try {
            dateStr = str.substring(0, str.indexOf("T"));
            timeStr = str.substring(str.indexOf("T") + 1, str.length);
            dateArr = dateStr.split("-");
            year = Number(dateArr.shift());
            month = Number(dateArr.shift());
            date = Number(dateArr.shift());
            if (timeStr.indexOf("Z") != -1) {
                multiplier = 1;
                offsetHours = 0;
                offsetMinutes = 0;
                timeStr = timeStr.replace("Z", "");
            } else if (timeStr.indexOf("+") != -1) {
                multiplier = 1;
                offsetStr = timeStr.substring(timeStr.indexOf("+") + 1, timeStr.length);
                offsetHours = Number(offsetStr.substring(0, offsetStr.indexOf(":")));
                offsetMinutes = Number(offsetStr.substring(offsetStr.indexOf(":") + 1, offsetStr.length));
                timeStr = timeStr.substring(0, timeStr.indexOf("+"));
            } else {
                multiplier = -1;
                offsetStr = timeStr.substring(timeStr.indexOf("-") + 1, timeStr.length);
                offsetHours = Number(offsetStr.substring(0, offsetStr.indexOf(":")));
                offsetMinutes = Number(offsetStr.substring(offsetStr.indexOf(":") + 1, offsetStr.length));
                timeStr = timeStr.substring(0, timeStr.indexOf("-"));
            }
            timeArr = timeStr.split(":");
            hour = Number(timeArr.shift());
            minutes = Number(timeArr.shift());
            secondsArr = timeArr.length > 0 ? String(timeArr.shift()).split(".") : null;
            seconds = secondsArr != null && secondsArr.length > 0 ? Number(secondsArr.shift()) : 0;
            milliseconds = secondsArr != null && secondsArr.length > 0 ? Number(secondsArr.shift()) : 0;
            utc = Date.UTC(year, month - 1, date, hour, minutes, seconds, milliseconds);
            offset = (offsetHours * 3600000 + offsetMinutes * 60000) * multiplier;
            finalDate = new Date(utc - offset);
            if (finalDate.toString() == "Invalid Date") {
                throw new Error("This date does not conform to W3CDTF.");
            }
        } catch (e: Error) {
            eStr = "Unable to parse the string [" + str + "] into a date. ";
            eStr += "The internal error was: " + e.toString();
            throw new Error(eStr);
        }
        return finalDate;
    }
}
}
