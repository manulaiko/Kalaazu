package {

import mx.resources.ResourceBundle;

public class en_US$controls_properties extends ResourceBundle {


    public function en_US$controls_properties() {
        super("en_US", "controls");
    }

    override protected function getContent(): Object {
        return {
            "noLabel": "No",
            "dayNamesShortest": "S,M,T,W,T,F,S",
            "missingAttributeSrc": "URL: \'{0}\' Attribute src is required in \'{1}\' tag.",
            "unknownInput": "Unknown inputType \'{0}\'.",
            "tagNotFound": "URL: \'{0}\' At least one video of ref tag is required.",
            "badArgs": "Bad args to _play.",
            "undefinedArray": "CuePoint.array undefined.",
            "wrongDisabled": "Disabled must be number.",
            "wrongTimeName": "Time must be number and/or name must not be undefined or null.",
            "wrongIndex": "CuePoint.index must be number between -1 and cuePoint.array.length.",
            "nullURL": "Null URL sent to VideoPlayer.load.",
            "yesLabel": "Yes",
            "wrongFormat": "Unexpected cuePoint parameter format.",
            "incorrectType": "Type must be 0, 1 or 2.",
            "requiredField": "Required Field",
            "unexpectedEnd": "Unexpected end of cuePoint param string.",
            "wrongNumParams": "Num params must be number.",
            "invalidCall": "Cannot call reconnect on an http connection.",
            "cancelLabel": "Cancel",
            "errWrongType": "ERROR: The dataProvider of \'{0}\' must be String, ViewStack, Array, or IList.",
            "notfpad": "URL: \'{0}\' Root node not fpad.",
            "wrongTime": "Time must be number.",
            "errWrongContainer": "ERROR: The dataProvider of \'{0}\' must not contain objects of type flash.display.DisplayObject.",
            "label": "LOADING %3%%",
            "unsupportedMode": "IMEMode \'{0}\' not supported.",
            "notImplemented": "\'{0}\' not implemented yet.",
            "errorMessages": "Unable to make connection to server or to find FLV on server.,No matching cue point found.,Illegal cue point.,Invalid seek.,Invalid contentPath.,Invalid XML.,No bitrate match; must be no default FLV.,Cannot delete default VideoPlayer.",
            "missingRoot": "URL: \'{0}\' No root node found; if URL is for an FLV, it must have a .flv extension and take no parameters.",
            "notLoadable": "Unable to load \'{0}\'.",
            "missingAttributes": "URL: \'{0}\' Tag \'{1}\' requires attributes id, width, and height. Width and height must be numbers greater than or equal to 0.",
            "rootNotSMIL": "URL: \'{0}\' Root node not smil: \'{1}\'.",
            "wrongType": "Type must be number.",
            "firstDayOfWeek": "0",
            "wrongName": "Name cannot be undefined or null.",
            "undefinedParameter": "CuePoint parameter undefined.",
            "yearSymbol": "",
            "cannotDisable": "Cannot disable actionscript cue points.",
            "missingProxy": "URL: \'{0}\' fpad xml requires proxy tag.",
            "okLabel": "OK",
            "rootNotFound": "URL: \'{0}\' No root node found; if file is an flv, it must have a .flv extension."
        };
    }
}
}
