package spark.core {

public interface ISoftKeyboardHintClient {


    function set autoCapitalize(param1: String): void;

    function get autoCapitalize(): String;

    function get autoCorrect(): Boolean;

    function set autoCorrect(param1: Boolean): void;

    function get returnKeyLabel(): String;

    function set returnKeyLabel(param1: String): void;

    function get softKeyboardType(): String;

    function set softKeyboardType(param1: String): void;
}
}
